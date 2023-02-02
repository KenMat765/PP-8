#!/usr/bin/env python

import rospy
from std_msgs.msg import Float32MultiArray

node_name = "Sample_Arm"
rospy.init_node(node_name)

pub_arm = rospy.Publisher("/arm_pos", Float32MultiArray, queue_size=1)

print("{} Ready.".format(node_name))

while not rospy.is_shutdown():
    arm_pos_msg = Float32MultiArray(data=[1, 0])
    pub_arm.publish(arm_pos_msg)
    pass
