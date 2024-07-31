#!/usr/bin/env python

from enum import Enum
from my_utilities import *
import rospy
from std_msgs.msg import Float32MultiArray, Bool
from pp8.msg import DualShock4State

AXIS_THRESH = 0.3

class PP8_MODE(Enum):
    WHEEL = 0
    ARM = 1
pp8_l_mode = PP8_MODE.WHEEL
pp8_r_mode = PP8_MODE.WHEEL

l_wheel_vel = 0.0   # -1.0 ~ 1.0
r_wheel_vel = 0.0   # -1.0 ~ 1.0
l_arm_pos = 0.0     # -1.0 ~ 1.0
r_arm_pos = 0.0     # -1.0 ~ 1.0

hat_x = 0
hat_y = 0

l_break = False
r_break = False

max_vel = 5
max_ang = 90

def controller_cb(msg):
    global pp8_l_mode, pp8_r_mode, l_break, r_break, l_wheel_vel, r_wheel_vel, l_arm_pos, r_arm_pos, max_vel, max_ang

    # Mode Select.
    if msg.btn_state.L2.data:
        print("L2 pressed.")
        pp8_l_mode = PP8_MODE.ARM
    else:
        pp8_l_mode = PP8_MODE.WHEEL
    if msg.btn_state.R2.data:
        print("R2 pressed.")
        pp8_r_mode = PP8_MODE.ARM
    else:
        pp8_r_mode = PP8_MODE.WHEEL

    # Break.
    l_break = msg.btn_state.L1.data
    r_break = msg.btn_state.R1.data

    # Initialize
    if msg.btn_state.option.data:
        print("Option button pressed.")
        l_wheel_vel = 0.0
        r_wheel_vel = 0.0
        l_arm_pos = 0.0
        r_arm_pos = 0.0

    # Controll Arm
    if msg.btn_state.circle.data:
        ctrl = Bool(True)
        pub_ctrl_arm.publish(ctrl)
    elif msg.btn_state.cross.data:
        ctrl = Bool(False)
        pub_ctrl_arm.publish(ctrl)

    # Hat
    hat_x = msg.hat_state.hat_x   # -1 or 0 or 1
    hat_y = msg.hat_state.hat_y   # -1 or 0 or 1
    if l_break:
        l_wheel_vel = 0.0
    elif pp8_l_mode == PP8_MODE.WHEEL:
        l_wheel_vel = clamp(hat_y + hat_x, -1, 1)
    else:
        l_wheel_vel = 0.0
    if r_break:
        r_wheel_vel = 0.0
    elif pp8_l_mode == PP8_MODE.WHEEL:
        r_wheel_vel = clamp(hat_y - hat_x, -1, 1)
    else:
        r_wheel_vel = 0.0

    # JoyStick
    if (not abs(hat_x)) and (not abs(hat_y)):
        l_y = msg.joy_state.l_y  #-1.0 ~ 1.0
        r_y = msg.joy_state.r_y  #-1.0 ~ 1.0

        if pp8_l_mode == PP8_MODE.WHEEL:
            if l_break:
                l_wheel_vel = 0.0
            else:
                l_wheel_vel = (l_y * max_vel) if (abs(l_y) > AXIS_THRESH) else 0.0
        elif pp8_l_mode == PP8_MODE.ARM:
            l_wheel_vel = 0.0
            l_arm_pos = (l_y * max_ang) if (abs(l_y) > AXIS_THRESH) else 0.0

        if pp8_r_mode == PP8_MODE.WHEEL:
            if r_break:
                r_wheel_vel = 0.0
            else:
                r_wheel_vel = (r_y * max_vel) if (abs(r_y) > AXIS_THRESH) else 0.0
        elif pp8_r_mode == PP8_MODE.ARM:
            r_wheel_vel = 0.0
            r_arm_pos = (r_y * max_ang) if (abs(r_y) > AXIS_THRESH) else 0.0

    # Publish wheel_vel & arm_pos
    wheel_vel_msg = Float32MultiArray(data=[l_wheel_vel, r_wheel_vel])
    arm_pos_msg = Float32MultiArray(data=[l_arm_pos, r_arm_pos])
    pub_wheel.publish(wheel_vel_msg)
    pub_arm.publish(arm_pos_msg)


# ROS
node_name = "DualShock4_Teleop"
rospy.init_node(node_name)
pub_wheel = rospy.Publisher("/servo/wheel_vel", Float32MultiArray, queue_size=1)
pub_arm = rospy.Publisher("/servo/arm_ang", Float32MultiArray, queue_size=1)
pub_ctrl_arm = rospy.Publisher("/servo/arm_ctrl", Bool, queue_size=1)
sub_dualshock4 = rospy.Subscriber("/dualshock4/controller_state", DualShock4State, controller_cb)
print("{} Ready.".format(node_name))

rate = rospy.Rate(10)
rospy.spin()
