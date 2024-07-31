#!/usr/bin/env roseus

(ros::load-ros-manifest "roseus")
(ros::roseus "speak")

(ros::advertise "/speaker" std_msgs::String 1)

(unix::sleep 1)

(setq msg (instance std_msgs::String :init))
(send msg :data "sukoshi,kowa'ikamo+shi'remasennga")
(ros::publish "/speaker" msg)

(ros::exit)
