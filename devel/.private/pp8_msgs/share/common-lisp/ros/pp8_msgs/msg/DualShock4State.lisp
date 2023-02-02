; Auto-generated. Do not edit!


(cl:in-package pp8_msgs-msg)


;//! \htmlinclude DualShock4State.msg.html

(cl:defclass <DualShock4State> (roslisp-msg-protocol:ros-message)
  ((btn_state
    :reader btn_state
    :initarg :btn_state
    :type pp8_msgs-msg:DualShock4ButtonState
    :initform (cl:make-instance 'pp8_msgs-msg:DualShock4ButtonState))
   (hat_state
    :reader hat_state
    :initarg :hat_state
    :type pp8_msgs-msg:DualShock4HatState
    :initform (cl:make-instance 'pp8_msgs-msg:DualShock4HatState))
   (joy_state
    :reader joy_state
    :initarg :joy_state
    :type pp8_msgs-msg:DualShock4JoyStickState
    :initform (cl:make-instance 'pp8_msgs-msg:DualShock4JoyStickState)))
)

(cl:defclass DualShock4State (<DualShock4State>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DualShock4State>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DualShock4State)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pp8_msgs-msg:<DualShock4State> is deprecated: use pp8_msgs-msg:DualShock4State instead.")))

(cl:ensure-generic-function 'btn_state-val :lambda-list '(m))
(cl:defmethod btn_state-val ((m <DualShock4State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8_msgs-msg:btn_state-val is deprecated.  Use pp8_msgs-msg:btn_state instead.")
  (btn_state m))

(cl:ensure-generic-function 'hat_state-val :lambda-list '(m))
(cl:defmethod hat_state-val ((m <DualShock4State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8_msgs-msg:hat_state-val is deprecated.  Use pp8_msgs-msg:hat_state instead.")
  (hat_state m))

(cl:ensure-generic-function 'joy_state-val :lambda-list '(m))
(cl:defmethod joy_state-val ((m <DualShock4State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8_msgs-msg:joy_state-val is deprecated.  Use pp8_msgs-msg:joy_state instead.")
  (joy_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DualShock4State>) ostream)
  "Serializes a message object of type '<DualShock4State>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'btn_state) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'hat_state) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'joy_state) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DualShock4State>) istream)
  "Deserializes a message object of type '<DualShock4State>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'btn_state) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'hat_state) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'joy_state) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DualShock4State>)))
  "Returns string type for a message object of type '<DualShock4State>"
  "pp8_msgs/DualShock4State")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DualShock4State)))
  "Returns string type for a message object of type 'DualShock4State"
  "pp8_msgs/DualShock4State")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DualShock4State>)))
  "Returns md5sum for a message object of type '<DualShock4State>"
  "08f8aed0947cf8d575dabd0bffafc913")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DualShock4State)))
  "Returns md5sum for a message object of type 'DualShock4State"
  "08f8aed0947cf8d575dabd0bffafc913")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DualShock4State>)))
  "Returns full string definition for message of type '<DualShock4State>"
  (cl:format cl:nil "#DualShock4 State message~%DualShock4ButtonState btn_state~%DualShock4HatState hat_state~%DualShock4JoyStickState joy_state~%~%================================================================================~%MSG: pp8_msgs/DualShock4ButtonState~%#DualShock4 Button State message~%std_msgs/Bool square~%std_msgs/Bool cross~%std_msgs/Bool circle~%std_msgs/Bool triangle~%std_msgs/Bool L1~%std_msgs/Bool L2~%std_msgs/Bool R1~%std_msgs/Bool R2~%std_msgs/Bool option~%~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%================================================================================~%MSG: pp8_msgs/DualShock4HatState~%#DualShock4 Hat State message~%int8 hat_x~%int8 hat_y~%~%================================================================================~%MSG: pp8_msgs/DualShock4JoyStickState~%#DualShock4 JoyStick State message~%float64 l_x~%float64 l_y~%float64 r_x~%float64 r_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DualShock4State)))
  "Returns full string definition for message of type 'DualShock4State"
  (cl:format cl:nil "#DualShock4 State message~%DualShock4ButtonState btn_state~%DualShock4HatState hat_state~%DualShock4JoyStickState joy_state~%~%================================================================================~%MSG: pp8_msgs/DualShock4ButtonState~%#DualShock4 Button State message~%std_msgs/Bool square~%std_msgs/Bool cross~%std_msgs/Bool circle~%std_msgs/Bool triangle~%std_msgs/Bool L1~%std_msgs/Bool L2~%std_msgs/Bool R1~%std_msgs/Bool R2~%std_msgs/Bool option~%~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%================================================================================~%MSG: pp8_msgs/DualShock4HatState~%#DualShock4 Hat State message~%int8 hat_x~%int8 hat_y~%~%================================================================================~%MSG: pp8_msgs/DualShock4JoyStickState~%#DualShock4 JoyStick State message~%float64 l_x~%float64 l_y~%float64 r_x~%float64 r_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DualShock4State>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'btn_state))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'hat_state))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'joy_state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DualShock4State>))
  "Converts a ROS message object to a list"
  (cl:list 'DualShock4State
    (cl:cons ':btn_state (btn_state msg))
    (cl:cons ':hat_state (hat_state msg))
    (cl:cons ':joy_state (joy_state msg))
))
