#!/usr/bin/env python

import sys
from enum import Enum
from my_utilities import *
import pygame
from dualshock4_constants import *
import rospy
from std_msgs.msg import Float32MultiArray

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

try:
    # ROS
    node_name = "PS4"
    rospy.init_node(node_name)
    pub_wheel = rospy.Publisher("/wheel_vel", Float32MultiArray, queue_size=1)
    pub_arm = rospy.Publisher("/arm_pos", Float32MultiArray, queue_size=1)
    print("Node : \"{}\" Ready.".format(node_name))

    # Pygame
    pygame.init()
    joy = pygame.joystick.Joystick(0)
    joy.init()
    print("PS4 Controller Ready.")

    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        pygame.event.get()

        # Mode Select.
        if joy.get_button(L2):
            print("L2 pressed.")
            pp8_l_mode = PP8_MODE.ARM
        else:
            pp8_l_mode = PP8_MODE.WHEEL

        if joy.get_button(R2):
            print("R2 pressed.")
            pp8_r_mode = PP8_MODE.ARM
        else:
            pp8_r_mode = PP8_MODE.WHEEL

        # Cross Button.
        hat_x = joy.get_hat(0)[HAT_X]   # -1 or 0 or 1
        hat_y = joy.get_hat(0)[HAT_Y]   # -1 or 0 or 1
        l_wheel_vel = clamp(hat_y + hat_x, -1, 1) if (pp8_l_mode == PP8_MODE.WHEEL) else 0.0
        r_wheel_vel = clamp(hat_y - hat_x, -1, 1) if (pp8_r_mode == PP8_MODE.WHEEL) else 0.0
        wheel_vel_msg = Float32MultiArray(data=[l_wheel_vel, r_wheel_vel])
        pub_wheel.publish(wheel_vel_msg)

        # Joy Stick.
        if (not hat_x) and (not hat_y):
            l_axis_y = -joy.get_axis(LEFT_Y)     #-1.0 ~ 1.0
            r_axis_y = -joy.get_axis(RIGHT_Y)    #-1.0 ~ 1.0
            if pp8_l_mode == PP8_MODE.WHEEL:
                l_wheel_vel = l_axis_y if (abs(l_axis_y) > AXIS_THRESH) else 0.0
            elif pp8_l_mode == PP8_MODE.ARM:
                l_wheel_vel = 0.0
                l_arm_pos = l_axis_y if (abs(l_axis_y) > AXIS_THRESH) else 0.0
            if pp8_r_mode == PP8_MODE.WHEEL:
                r_wheel_vel = r_axis_y if (abs(r_axis_y) > AXIS_THRESH) else 0.0
            elif pp8_r_mode == PP8_MODE.ARM:
                r_wheel_vel = 0.0
                r_arm_pos = r_axis_y if (abs(r_axis_y) > AXIS_THRESH) else 0.0

        # Break.
        if joy.get_button(L1):
            l_wheel_vel = 0.0
        if joy.get_button(R1):
            r_wheel_vel = 0.0

        # Initialize arm pos.
        if joy.get_button(OPTION):
            print("Option button pressed.")
            l_arm_pos = 0.0
            r_arm_pos = 0.0

        # Publish wheel & arm
        wheel_vel_msg = Float32MultiArray(data=[l_wheel_vel, r_wheel_vel])
        arm_pos_msg = Float32MultiArray(data=[l_arm_pos, r_arm_pos])
        pub_wheel.publish(wheel_vel_msg)
        pub_arm.publish(arm_pos_msg)

        rate.sleep()

except KeyboardInterrupt:
    print("\nFinishing PS4 Controller ...")
    joy.quit()
    sys.exit()
