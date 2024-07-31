#!/usr/bin/env roseus

(ros::load-ros-manifest "roseus")
(ros::roseus "collision-detection")

(ros::advertise "/left_arm/switch" std_msgs::Bool 1)
(setq left-switch-msg (instance std_msgs::Bool :init))

(ros::advertise "/right_arm/switch" std_msgs::Bool 1)
(setq right-switch-msg (instance std_msgs::Bool :init))

(unix::sleep 1)

(send left-switch-msg :data t)
(send right-switch-msg :data t)
(ros::publish "/left_arm/switch" left-switch-msg)
(ros::publish "/right_arm/switch" right-switch-msg)
