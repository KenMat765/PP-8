#!/usr/bin/env roseus

(ros::load-ros-manifest "roseus")
(ros::roseus "turn")

(ros::advertise "/servo/wheel_vel" std_msgs::Float32MultiArray 1)
(setq msg (instance std_msgs::Float32MultiArray :init))

(unix::sleep 1)

(send msg :data #f(7 -7))
(ros::publish "/servo/wheel_vel" msg)

(unix::sleep 2)

(send msg :data #f(0 0))
(ros::publish "/servo/wheel_vel" msg)

(ros::exit)

