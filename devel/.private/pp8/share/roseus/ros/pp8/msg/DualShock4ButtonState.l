;; Auto-generated. Do not edit!


(when (boundp 'pp8::DualShock4ButtonState)
  (if (not (find-package "PP8"))
    (make-package "PP8"))
  (shadow 'DualShock4ButtonState (find-package "PP8")))
(unless (find-package "PP8::DUALSHOCK4BUTTONSTATE")
  (make-package "PP8::DUALSHOCK4BUTTONSTATE"))

(in-package "ROS")
;;//! \htmlinclude DualShock4ButtonState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pp8::DualShock4ButtonState
  :super ros::object
  :slots (_square _cross _circle _triangle _L1 _L2 _R1 _R2 _option ))

(defmethod pp8::DualShock4ButtonState
  (:init
   (&key
    ((:square __square) (instance std_msgs::Bool :init))
    ((:cross __cross) (instance std_msgs::Bool :init))
    ((:circle __circle) (instance std_msgs::Bool :init))
    ((:triangle __triangle) (instance std_msgs::Bool :init))
    ((:L1 __L1) (instance std_msgs::Bool :init))
    ((:L2 __L2) (instance std_msgs::Bool :init))
    ((:R1 __R1) (instance std_msgs::Bool :init))
    ((:R2 __R2) (instance std_msgs::Bool :init))
    ((:option __option) (instance std_msgs::Bool :init))
    )
   (send-super :init)
   (setq _square __square)
   (setq _cross __cross)
   (setq _circle __circle)
   (setq _triangle __triangle)
   (setq _L1 __L1)
   (setq _L2 __L2)
   (setq _R1 __R1)
   (setq _R2 __R2)
   (setq _option __option)
   self)
  (:square
   (&rest __square)
   (if (keywordp (car __square))
       (send* _square __square)
     (progn
       (if __square (setq _square (car __square)))
       _square)))
  (:cross
   (&rest __cross)
   (if (keywordp (car __cross))
       (send* _cross __cross)
     (progn
       (if __cross (setq _cross (car __cross)))
       _cross)))
  (:circle
   (&rest __circle)
   (if (keywordp (car __circle))
       (send* _circle __circle)
     (progn
       (if __circle (setq _circle (car __circle)))
       _circle)))
  (:triangle
   (&rest __triangle)
   (if (keywordp (car __triangle))
       (send* _triangle __triangle)
     (progn
       (if __triangle (setq _triangle (car __triangle)))
       _triangle)))
  (:L1
   (&rest __L1)
   (if (keywordp (car __L1))
       (send* _L1 __L1)
     (progn
       (if __L1 (setq _L1 (car __L1)))
       _L1)))
  (:L2
   (&rest __L2)
   (if (keywordp (car __L2))
       (send* _L2 __L2)
     (progn
       (if __L2 (setq _L2 (car __L2)))
       _L2)))
  (:R1
   (&rest __R1)
   (if (keywordp (car __R1))
       (send* _R1 __R1)
     (progn
       (if __R1 (setq _R1 (car __R1)))
       _R1)))
  (:R2
   (&rest __R2)
   (if (keywordp (car __R2))
       (send* _R2 __R2)
     (progn
       (if __R2 (setq _R2 (car __R2)))
       _R2)))
  (:option
   (&rest __option)
   (if (keywordp (car __option))
       (send* _option __option)
     (progn
       (if __option (setq _option (car __option)))
       _option)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Bool _square
    (send _square :serialization-length)
    ;; std_msgs/Bool _cross
    (send _cross :serialization-length)
    ;; std_msgs/Bool _circle
    (send _circle :serialization-length)
    ;; std_msgs/Bool _triangle
    (send _triangle :serialization-length)
    ;; std_msgs/Bool _L1
    (send _L1 :serialization-length)
    ;; std_msgs/Bool _L2
    (send _L2 :serialization-length)
    ;; std_msgs/Bool _R1
    (send _R1 :serialization-length)
    ;; std_msgs/Bool _R2
    (send _R2 :serialization-length)
    ;; std_msgs/Bool _option
    (send _option :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Bool _square
       (send _square :serialize s)
     ;; std_msgs/Bool _cross
       (send _cross :serialize s)
     ;; std_msgs/Bool _circle
       (send _circle :serialize s)
     ;; std_msgs/Bool _triangle
       (send _triangle :serialize s)
     ;; std_msgs/Bool _L1
       (send _L1 :serialize s)
     ;; std_msgs/Bool _L2
       (send _L2 :serialize s)
     ;; std_msgs/Bool _R1
       (send _R1 :serialize s)
     ;; std_msgs/Bool _R2
       (send _R2 :serialize s)
     ;; std_msgs/Bool _option
       (send _option :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Bool _square
     (send _square :deserialize buf ptr-) (incf ptr- (send _square :serialization-length))
   ;; std_msgs/Bool _cross
     (send _cross :deserialize buf ptr-) (incf ptr- (send _cross :serialization-length))
   ;; std_msgs/Bool _circle
     (send _circle :deserialize buf ptr-) (incf ptr- (send _circle :serialization-length))
   ;; std_msgs/Bool _triangle
     (send _triangle :deserialize buf ptr-) (incf ptr- (send _triangle :serialization-length))
   ;; std_msgs/Bool _L1
     (send _L1 :deserialize buf ptr-) (incf ptr- (send _L1 :serialization-length))
   ;; std_msgs/Bool _L2
     (send _L2 :deserialize buf ptr-) (incf ptr- (send _L2 :serialization-length))
   ;; std_msgs/Bool _R1
     (send _R1 :deserialize buf ptr-) (incf ptr- (send _R1 :serialization-length))
   ;; std_msgs/Bool _R2
     (send _R2 :deserialize buf ptr-) (incf ptr- (send _R2 :serialization-length))
   ;; std_msgs/Bool _option
     (send _option :deserialize buf ptr-) (incf ptr- (send _option :serialization-length))
   ;;
   self)
  )

(setf (get pp8::DualShock4ButtonState :md5sum-) "0c13d9931152581a8101d288caaba285")
(setf (get pp8::DualShock4ButtonState :datatype-) "pp8/DualShock4ButtonState")
(setf (get pp8::DualShock4ButtonState :definition-)
      "# DualShock4 Button State message
std_msgs/Bool square
std_msgs/Bool cross
std_msgs/Bool circle
std_msgs/Bool triangle
std_msgs/Bool L1
std_msgs/Bool L2
std_msgs/Bool R1
std_msgs/Bool R2
std_msgs/Bool option


================================================================================
MSG: std_msgs/Bool
bool data
")



(provide :pp8/DualShock4ButtonState "0c13d9931152581a8101d288caaba285")


