#!/usr/bin/env roseus

(ros::load-ros-manifest "roseus")
(ros::roseus "collision-detection")

(setq *acc-thresh* 1.0)

(defun acc-gyro-cb (msg)
  (let (acc-x)
    
    (setq acc-x (elt (send msg :data) 0))
    
    (when (> (abs acc-x) *acc-thresh*)
      (print "acc over thresh")
      (print acc-x)
      
      (send msg :data #f(0 0))
      (ros::publish "/servo/wheel_vel" msg)

      (unix::sleep 1)

      (send msg :data #f(7 -7))
      (ros::publish "/servo/wheel_vel" msg)

      (unix::sleep 1)

      (send msg :data #f(0 0))
      (ros::publish "/servo/wheel_vel" msg)

      (unix::sleep 1)

      (send msg :data #f(5 5))
      (ros::publish "/servo/wheel_vel" msg)

      (unix::sleep 1)
      )
    )
  )

(ros::advertise "/servo/wheel_vel" std_msgs::Float32MultiArray 1)
(ros::subscribe "/acc_gyro" std_msgs::Float32MultiArray #'acc-gyro-cb)
(setq msg (instance std_msgs::Float32MultiArray :init))

(unix::sleep 1)

(send msg :data #f(8 8))
(ros::publish "/servo/wheel_vel" msg)

(unix::sleep 1)

(ros::spin)
