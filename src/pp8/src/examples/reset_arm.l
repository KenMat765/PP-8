#!/usr/bin/env roseus

(ros::load-ros-manifest "roseus")
(ros::roseus "reset-arm")

(ros::advertise "/left_arm/switch" std_msgs::Bool 1)
(ros::advertise "/right_arm/switch" std_msgs::Bool 1)

(setq left-msg (instance std_msgs::Bool :init))
(setq right-msg (instance std_msgs::Bool :init))

(unix::sleep 1)

(send left-msg :data nil)
(ros::publish "/left_arm/switch" left-msg)
(send right-msg :data nil)
(ros::publish "/right_arm/switch" right-msg)

(unix::sleep 1)

(send left-msg :data t)
(ros::publish "/left_arm/switch" left-msg)
(send right-msg :data t)
(ros::publish "/right_arm/switch" right-msg)

(ros::exit)
