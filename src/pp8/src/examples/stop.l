#!/usr/bin/env roseus

(ros::load-ros-manifest "roseus")
(ros::roseus "stop")

(ros::advertise "/servo/wheel_vel" std_msgs::Float32MultiArray 1)
(ros::advertise "/servo/arm_ctrl" std_msgs::Bool 1)
(setq msg1 (instance std_msgs::Float32MultiArray :init))
(setq msg2 (instance std_msgs::Bool :init))

(unix::sleep 1)

(send msg1 :data #f(0 0))
(send msg2 :data nil)
(ros::publish "/servo/wheel_vel" msg1)
(ros::publish "/servo/arm_ctrl" msg2)

(ros::exit)
