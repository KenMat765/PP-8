;; Auto-generated. Do not edit!


(when (boundp 'pp8_msgs::DualShock4State)
  (if (not (find-package "PP8_MSGS"))
    (make-package "PP8_MSGS"))
  (shadow 'DualShock4State (find-package "PP8_MSGS")))
(unless (find-package "PP8_MSGS::DUALSHOCK4STATE")
  (make-package "PP8_MSGS::DUALSHOCK4STATE"))

(in-package "ROS")
;;//! \htmlinclude DualShock4State.msg.html


(defclass pp8_msgs::DualShock4State
  :super ros::object
  :slots (_btn_state _hat_state _joy_state ))

(defmethod pp8_msgs::DualShock4State
  (:init
   (&key
    ((:btn_state __btn_state) (instance pp8_msgs::DualShock4ButtonState :init))
    ((:hat_state __hat_state) (instance pp8_msgs::DualShock4HatState :init))
    ((:joy_state __joy_state) (instance pp8_msgs::DualShock4JoyStickState :init))
    )
   (send-super :init)
   (setq _btn_state __btn_state)
   (setq _hat_state __hat_state)
   (setq _joy_state __joy_state)
   self)
  (:btn_state
   (&rest __btn_state)
   (if (keywordp (car __btn_state))
       (send* _btn_state __btn_state)
     (progn
       (if __btn_state (setq _btn_state (car __btn_state)))
       _btn_state)))
  (:hat_state
   (&rest __hat_state)
   (if (keywordp (car __hat_state))
       (send* _hat_state __hat_state)
     (progn
       (if __hat_state (setq _hat_state (car __hat_state)))
       _hat_state)))
  (:joy_state
   (&rest __joy_state)
   (if (keywordp (car __joy_state))
       (send* _joy_state __joy_state)
     (progn
       (if __joy_state (setq _joy_state (car __joy_state)))
       _joy_state)))
  (:serialization-length
   ()
   (+
    ;; pp8_msgs/DualShock4ButtonState _btn_state
    (send _btn_state :serialization-length)
    ;; pp8_msgs/DualShock4HatState _hat_state
    (send _hat_state :serialization-length)
    ;; pp8_msgs/DualShock4JoyStickState _joy_state
    (send _joy_state :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; pp8_msgs/DualShock4ButtonState _btn_state
       (send _btn_state :serialize s)
     ;; pp8_msgs/DualShock4HatState _hat_state
       (send _hat_state :serialize s)
     ;; pp8_msgs/DualShock4JoyStickState _joy_state
       (send _joy_state :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; pp8_msgs/DualShock4ButtonState _btn_state
     (send _btn_state :deserialize buf ptr-) (incf ptr- (send _btn_state :serialization-length))
   ;; pp8_msgs/DualShock4HatState _hat_state
     (send _hat_state :deserialize buf ptr-) (incf ptr- (send _hat_state :serialization-length))
   ;; pp8_msgs/DualShock4JoyStickState _joy_state
     (send _joy_state :deserialize buf ptr-) (incf ptr- (send _joy_state :serialization-length))
   ;;
   self)
  )

(setf (get pp8_msgs::DualShock4State :md5sum-) "08f8aed0947cf8d575dabd0bffafc913")
(setf (get pp8_msgs::DualShock4State :datatype-) "pp8_msgs/DualShock4State")
(setf (get pp8_msgs::DualShock4State :definition-)
      "#DualShock4 State message
DualShock4ButtonState btn_state
DualShock4HatState hat_state
DualShock4JoyStickState joy_state

================================================================================
MSG: pp8_msgs/DualShock4ButtonState
#DualShock4 Button State message
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
================================================================================
MSG: pp8_msgs/DualShock4HatState
#DualShock4 Hat State message
int8 hat_x
int8 hat_y

================================================================================
MSG: pp8_msgs/DualShock4JoyStickState
#DualShock4 JoyStick State message
float64 l_x
float64 l_y
float64 r_x
float64 r_y

")



(provide :pp8_msgs/DualShock4State "08f8aed0947cf8d575dabd0bffafc913")


