#!/usr/bin/env python

import pygame
from dualshock4_constants import *
import rospy
from std_msgs.msg import Bool
from pp8.msg import DualShock4ButtonState, DualShock4HatState, DualShock4JoyStickState, DualShock4State

# ROS
node_name = "DualShock4"
rospy.init_node(node_name)
pub_button = rospy.Publisher("/dualshock4/button_state", DualShock4ButtonState, queue_size=1)
pub_hat = rospy.Publisher("/dualshock4/hat_state", DualShock4HatState, queue_size=1)
pub_joystick = rospy.Publisher("/dualshock4/joystick_state", DualShock4JoyStickState, queue_size=1)
pub_dualshock = rospy.Publisher("/dualshock4/controller_state", DualShock4State, queue_size=1)
print("Node : \"{}\" Ready.".format(node_name))

# Pygame
pygame.init()
joy = pygame.joystick.Joystick(0)
joy.init()
print("DualShock4 Ready.")

rate = rospy.Rate(10)
while not rospy.is_shutdown():
    pygame.event.get()

    button_state = DualShock4ButtonState()
    button_state.square = Bool(joy.get_button(SQUARE))
    button_state.cross = Bool(joy.get_button(CROSS))
    button_state.circle = Bool(joy.get_button(CIRCLE))
    button_state.triangle = Bool(joy.get_button(TRIANGLE))
    button_state.L1 = Bool(joy.get_button(L1))
    button_state.L2 = Bool(joy.get_button(L2))
    button_state.R1 = Bool(joy.get_button(R1))
    button_state.R2 = Bool(joy.get_button(R2))
    button_state.option = Bool(joy.get_button(OPTION))

    hat_state = DualShock4HatState()
    hat_state.hat_x = int(joy.get_hat(0)[HAT_X])
    hat_state.hat_y = int(joy.get_hat(0)[HAT_Y])

    joystick_state = DualShock4JoyStickState()
    joystick_state.l_x = joy.get_axis(LEFT_X)
    joystick_state.l_y = -joy.get_axis(LEFT_Y)
    joystick_state.r_x = joy.get_axis(RIGHT_X)
    joystick_state.r_y = -joy.get_axis(RIGHT_Y)

    controller_state = DualShock4State()
    controller_state.btn_state = button_state
    controller_state.hat_state = hat_state
    controller_state.joy_state = joystick_state

    pub_button.publish(button_state)
    pub_hat.publish(hat_state)
    pub_joystick.publish(joystick_state)
    pub_dualshock.publish(controller_state)

    rate.sleep()