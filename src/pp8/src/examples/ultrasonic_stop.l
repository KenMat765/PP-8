#!/usr/bin/env roseus

(ros::load-ros-manifest "roseus")
(ros::roseus "ultrasonic_stop")

(setq *dist-thresh* 20)
(defun ultrasonic-cb (msg)
  (when (< (send msg :data) *dist-thresh*)
    (format nil "object near robot")
    (send msg2 :data #f(0 0))
    (ros::publish "/servo/wheel_vel" msg2)
    )
  )

(ros::advertise "/servo/arm_ctrl" std_msgs::Bool 1)
(ros::advertise "/servo/wheel_vel" std_msgs::Float32MultiArray 1)
(ros::subscribe "/right_arm/ultrasonic_sensor" std_msgs::Int64 #'ultrasonic-cb)
(setq msg1 (instance std_msgs::Bool :init))
(setq msg2 (instance std_msgs::Float32MultiArray :init))

(unix::sleep 1)

(send msg1 :data t)
(ros::publish "/servo/arm_ctrl" msg1)
(format nil "arm controll ON")

(send msg2 :data #f(5 5))
(ros::publish "/servo/wheel_vel" msg2)
(format nil "published wheel velocity")

(ros::spin)
(ros::exit)
