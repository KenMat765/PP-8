#!/usr/bin/env python

import rospy
from std_msgs.msg import Float32MultiArray
from std_msgs.msg import String
from std_msgs.msg import UInt16
from std_msgs.msg import Bool
from std_msgs.msg import Empty

node_name = "PP8_Core"
rospy.init_node(node_name)

pub_wheel = rospy.Publisher("/servo/wheel_vel", Float32MultiArray, queue_size=1)
pub_arm = rospy.Publisher("/servo/arm_ang", Float32MultiArray, queue_size=1)
pub_max_vel = rospy.Publisher("/servo/max_wheel_vel", UInt16, queue_size=1)
pub_max_pos = rospy.Publisher("/servo/max_arm_ang", UInt16, queue_size=1)
pub_ctrl_arm = rospy.Publisher("/servo/arm_ctrl", Bool, queue_size=1)
pub_lcd = rospy.Publisher("/display", String, queue_size=1)
pub_aqt = rospy.Publisher("/speaker", String, queue_size=1)
pub_mpu_calib = rospy.Publisher("/mpu_calib", Empty, queue_size=1)

print("{} Ready.".format(node_name))

while not rospy.is_shutdown():
    pass
