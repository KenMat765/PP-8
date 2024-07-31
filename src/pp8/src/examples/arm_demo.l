#!/usr/bin/env roseus

(ros::load-ros-manifest "roseus")
(ros::roseus "arm-demo")

(ros::advertise "/servo/arm_ang" std_msgs::Float32MultiArray 1)

(unix::sleep 1)

(setq msg (instance std_msgs::Float32MultiArray :init))

(send msg :data #f(0 90))
(ros::publish "/servo/arm_ang" msg)

(unix::sleep 1)

(send msg :data #f(0 0))
(ros::publish "/servo/arm_ang" msg)

(unix::sleep 1)

(send msg :data #f(90 0))
(ros::publish "/servo/arm_ang" msg)

(unix::sleep 1)

(send msg :data #f(0 0))
(ros::publish "/servo/arm_ang" msg)

(unix::sleep 1)

(send msg :data #f(90 90))
(ros::publish "/servo/arm_ang" msg)

(unix::sleep 1)

(send msg :data #f(0 0))
(ros::publish "/servo/arm_ang" msg)

(unix::sleep 1)

(send msg :data #f(-90 -90))
(ros::publish "/servo/arm_ang" msg)

(unix::sleep 1)

(send msg :data #f(0 0))
(ros::publish "/servo/arm_ang" msg)

(ros::exit)
