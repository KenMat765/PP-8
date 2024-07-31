#!/usr/bin/env roseus

(ros::load-ros-manifest "roseus")
(ros::roseus "ultrasonic-ultrasonic-avoid")


(setq *dist-thresh* 20)
(setq *too-close* 8)

(setq *left-dist* 1000)
(setq *right-dist* 1000)

(setq *counter* 0)
(setq *avoiding* nil)
(setq *left-turn* nil)

(setq *lin-spd* 8)
(setq *ang-spd* 5)

(defun left-arm-cb (msg) (setq *left-dist* (send msg :data)))
(defun right-arm-cb (msg) (setq *right-dist* (send msg :data)))


(ros::advertise "/servo/arm_ctrl" std_msgs::Bool 1)
(ros::advertise "/servo/wheel_vel" std_msgs::Float32MultiArray 1)
(ros::subscribe "/left_arm/ultrasonic_sensor" std_msgs::Int64 #'left-arm-cb)
(ros::subscribe "/right_arm/ultrasonic_sensor" std_msgs::Int64 #'right-arm-cb)
(setq arm-ctrl-msg (instance std_msgs::Bool :init))
(setq wheel-msg (instance std_msgs::Float32MultiArray :init))


(unix::sleep 1)


(send arm-ctrl-msg :data t)
(ros::publish "/servo/arm_ctrl" arm-ctrl-msg)

(send wheel-msg :data #f(5 5))
(ros::publish "/servo/wheel_vel" wheel-msg)


(print "")
(print "Start!!")


(ros::rate 10)
(while (ros::ok)
  (ros::spin-once)

  (if *avoiding*

      ;; When trying to avoid something. (= rotating)
      (progn
	(if (and (> *left-dist* (* 1.5 *dist-thresh*)) (> *right-dist* (* 1.5 *dist-thresh*)))
	    (progn
	      (setq *avoiding* nil)
	      (send wheel-msg :data #f(0 0))
	      (ros::publish "/servo/wheel_vel" wheel-msg)
	      (unix::sleep 2)
	      (send wheel-msg :data (float-vector *lin-spd* *lin-spd*))
	      (ros::publish "/servo/wheel_vel" wheel-msg)
	      )
	  (progn

	    ;; If object in front is too close.
	    (if (or (< *left-dist* *too-close*) (< *right-dist* *too-close*))
		(progn
		  (send wheel-msg :data #f(0 0))
		  (ros::publish "/servo/wheel_vel" wheel-msg)
		  (unix::sleep 2)
		  (send wheel-msg :data (float-vector (* -1 *lin-spd*) (* -1 *lin-spd*)))
		  (ros::publish "/servo/wheel_vel" wheel-msg)
		  (unix::sleep 2)
		  (send wheel-msg :data #f(0 0))
		  (ros::publish "/servo/wheel_vel" wheel-msg)
		  (unix::sleep 2)
		  (if *left-turn*
		      (send wheel-msg :data (float-vector *ang-spd* (* -1 *ang-spd*)))
		    (send wheel-msg :data (float-vector (* -1 *ang-spd*) *ang-spd*))
		    )
		  )
	      (progn
		(ros::publish "/servo/wheel_vel" wheel-msg)
		)
	      )
	    )
	  )
	)

    ;; When moving forward.
    (progn
      
      ;; === Object detection === ;;
      
      ;; When object is in front of left hand.
      (if (< *left-dist* *dist-thresh*)	  
	  (progn
	    (incf *counter* 1)
	    (when (> *counter* 2)
	      (setq *counter* 0)
	      (setq *avoiding* t)
	      (setq *left-turn* t)
	      (send wheel-msg :data #f(0 0))
	      (ros::publish "/servo/wheel_vel" wheel-msg)
	      (unix::sleep 2)
	      (send wheel-msg :data (float-vector *ang-spd* (* -1 *ang-spd*)))
	      )
	    )
	
	(progn
	  
	  ;; When object is in front of right hand.
	  (if (< *right-dist* *dist-thresh*)
	      (progn
		(incf *counter* 1)
		(when (> *counter* 2)
		  (setq *counter* 0)
		  (setq *avoiding* t)
		  (setq *left-turn* nil)
		  (send wheel-msg :data #f(0 0))
		  (ros::publish "/servo/wheel_vel" wheel-msg)
		  (unix::sleep 2)
		  (send wheel-msg :data (float-vector (* -1 *ang-spd*) *ang-spd*))
		  )
		)
	    
	    ;; When nothing is in front.
	    (progn
	      (setq *counter* 0)
	      (setq *avoiding* nil)
	      (send wheel-msg :data (float-vector *lin-spd* *lin-spd*))
	      (ros::publish "/servo/wheel_vel" wheel-msg)
	      )
	    ) 
	  )
	)      
      )
    )
  
  (ros::sleep)
  )

