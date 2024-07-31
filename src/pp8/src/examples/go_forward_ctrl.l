#!/usr/bin/env roseus

(ros::load-ros-manifest "roseus")
(ros::roseus "go_forward_ctrl")

(ros::advertise "/servo/wheel_vel" std_msgs::Float32MultiArray 1)
(setq wheel-msg (instance std_msgs::Float32MultiArray :init))

(ros::advertise "/servo/arm_ctrl" std_msgs::Bool 1)
(setq ctrl-msg (instance std_msgs::Bool :init))

(unix::sleep 1)

(send ctrl-msg :data t)
(ros::publish "/servo/arm_ctrl" ctrl-msg)

(unix::sleep 1)

(send wheel-msg :data #f(16 16))
(ros::publish "/servo/wheel_vel" wheel-msg)

(unix::sleep 2)

(send wheel-msg :data #f(0 0))
(ros::publish "/servo/wheel_vel" wheel-msg)

(ros::exit)
