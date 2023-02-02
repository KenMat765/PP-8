#!/usr/bin/env python

import rospy
from std_msgs.msg import Float32MultiArray
from std_msgs.msg import String
from std_msgs.msg import UInt16
from std_msgs.msg import Empty
from std_msgs.msg import Bool

node_name = "PP8_Core"
rospy.init_node(node_name)

pub_wheel = rospy.Publisher("/servo/wheel_vel", Float32MultiArray, queue_size=1)
pub_arm = rospy.Publisher("/servo/arm_pos", Float32MultiArray, queue_size=1)
pub_lcd = rospy.Publisher("/lcd_display", String, queue_size=1)
pub_max_vel = rospy.Publisher("/status/max_vel", UInt16, queue_size=1)
pub_max_pos = rospy.Publisher("/status/max_pos", UInt16, queue_size=1)
pub_init_arm = rospy.Publisher("/controll/init_arm", Empty, queue_size=1)
pub_ctrl_arm = rospy.Publisher("/controll/ctrl_arm", Bool, queue_size=1)

print("{} Ready.".format(node_name))

while not rospy.is_shutdown():
    pass
