;; Auto-generated. Do not edit!


(when (boundp 'pp8_msgs::DualShock4JoyStickState)
  (if (not (find-package "PP8_MSGS"))
    (make-package "PP8_MSGS"))
  (shadow 'DualShock4JoyStickState (find-package "PP8_MSGS")))
(unless (find-package "PP8_MSGS::DUALSHOCK4JOYSTICKSTATE")
  (make-package "PP8_MSGS::DUALSHOCK4JOYSTICKSTATE"))

(in-package "ROS")
;;//! \htmlinclude DualShock4JoyStickState.msg.html


(defclass pp8_msgs::DualShock4JoyStickState
  :super ros::object
  :slots (_l_x _l_y _r_x _r_y ))

(defmethod pp8_msgs::DualShock4JoyStickState
  (:init
   (&key
    ((:l_x __l_x) 0.0)
    ((:l_y __l_y) 0.0)
    ((:r_x __r_x) 0.0)
    ((:r_y __r_y) 0.0)
    )
   (send-super :init)
   (setq _l_x (float __l_x))
   (setq _l_y (float __l_y))
   (setq _r_x (float __r_x))
   (setq _r_y (float __r_y))
   self)
  (:l_x
   (&optional __l_x)
   (if __l_x (setq _l_x __l_x)) _l_x)
  (:l_y
   (&optional __l_y)
   (if __l_y (setq _l_y __l_y)) _l_y)
  (:r_x
   (&optional __r_x)
   (if __r_x (setq _r_x __r_x)) _r_x)
  (:r_y
   (&optional __r_y)
   (if __r_y (setq _r_y __r_y)) _r_y)
  (:serialization-length
   ()
   (+
    ;; float64 _l_x
    8
    ;; float64 _l_y
    8
    ;; float64 _r_x
    8
    ;; float64 _r_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _l_x
       (sys::poke _l_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _l_y
       (sys::poke _l_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _r_x
       (sys::poke _r_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _r_y
       (sys::poke _r_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _l_x
     (setq _l_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _l_y
     (setq _l_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _r_x
     (setq _r_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _r_y
     (setq _r_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get pp8_msgs::DualShock4JoyStickState :md5sum-) "d1dc4bb1b4a2956e5a2e9cdf4c2d8004")
(setf (get pp8_msgs::DualShock4JoyStickState :datatype-) "pp8_msgs/DualShock4JoyStickState")
(setf (get pp8_msgs::DualShock4JoyStickState :definition-)
      "#DualShock4 JoyStick State message
float64 l_x
float64 l_y
float64 r_x
float64 r_y

")



(provide :pp8_msgs/DualShock4JoyStickState "d1dc4bb1b4a2956e5a2e9cdf4c2d8004")


