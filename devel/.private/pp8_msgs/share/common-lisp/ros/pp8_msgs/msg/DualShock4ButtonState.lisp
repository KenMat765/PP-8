; Auto-generated. Do not edit!


(cl:in-package pp8_msgs-msg)


;//! \htmlinclude DualShock4ButtonState.msg.html

(cl:defclass <DualShock4ButtonState> (roslisp-msg-protocol:ros-message)
  ((square
    :reader square
    :initarg :square
    :type std_msgs-msg:Bool
    :initform (cl:make-instance 'std_msgs-msg:Bool))
   (cross
    :reader cross
    :initarg :cross
    :type std_msgs-msg:Bool
    :initform (cl:make-instance 'std_msgs-msg:Bool))
   (circle
    :reader circle
    :initarg :circle
    :type std_msgs-msg:Bool
    :initform (cl:make-instance 'std_msgs-msg:Bool))
   (triangle
    :reader triangle
    :initarg :triangle
    :type std_msgs-msg:Bool
    :initform (cl:make-instance 'std_msgs-msg:Bool))
   (L1
    :reader L1
    :initarg :L1
    :type std_msgs-msg:Bool
    :initform (cl:make-instance 'std_msgs-msg:Bool))
   (L2
    :reader L2
    :initarg :L2
    :type std_msgs-msg:Bool
    :initform (cl:make-instance 'std_msgs-msg:Bool))
   (R1
    :reader R1
    :initarg :R1
    :type std_msgs-msg:Bool
    :initform (cl:make-instance 'std_msgs-msg:Bool))
   (R2
    :reader R2
    :initarg :R2
    :type std_msgs-msg:Bool
    :initform (cl:make-instance 'std_msgs-msg:Bool))
   (option
    :reader option
    :initarg :option
    :type std_msgs-msg:Bool
    :initform (cl:make-instance 'std_msgs-msg:Bool)))
)

(cl:defclass DualShock4ButtonState (<DualShock4ButtonState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DualShock4ButtonState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DualShock4ButtonState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pp8_msgs-msg:<DualShock4ButtonState> is deprecated: use pp8_msgs-msg:DualShock4ButtonState instead.")))

(cl:ensure-generic-function 'square-val :lambda-list '(m))
(cl:defmethod square-val ((m <DualShock4ButtonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8_msgs-msg:square-val is deprecated.  Use pp8_msgs-msg:square instead.")
  (square m))

(cl:ensure-generic-function 'cross-val :lambda-list '(m))
(cl:defmethod cross-val ((m <DualShock4ButtonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8_msgs-msg:cross-val is deprecated.  Use pp8_msgs-msg:cross instead.")
  (cross m))

(cl:ensure-generic-function 'circle-val :lambda-list '(m))
(cl:defmethod circle-val ((m <DualShock4ButtonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8_msgs-msg:circle-val is deprecated.  Use pp8_msgs-msg:circle instead.")
  (circle m))

(cl:ensure-generic-function 'triangle-val :lambda-list '(m))
(cl:defmethod triangle-val ((m <DualShock4ButtonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8_msgs-msg:triangle-val is deprecated.  Use pp8_msgs-msg:triangle instead.")
  (triangle m))

(cl:ensure-generic-function 'L1-val :lambda-list '(m))
(cl:defmethod L1-val ((m <DualShock4ButtonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8_msgs-msg:L1-val is deprecated.  Use pp8_msgs-msg:L1 instead.")
  (L1 m))

(cl:ensure-generic-function 'L2-val :lambda-list '(m))
(cl:defmethod L2-val ((m <DualShock4ButtonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8_msgs-msg:L2-val is deprecated.  Use pp8_msgs-msg:L2 instead.")
  (L2 m))

(cl:ensure-generic-function 'R1-val :lambda-list '(m))
(cl:defmethod R1-val ((m <DualShock4ButtonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8_msgs-msg:R1-val is deprecated.  Use pp8_msgs-msg:R1 instead.")
  (R1 m))

(cl:ensure-generic-function 'R2-val :lambda-list '(m))
(cl:defmethod R2-val ((m <DualShock4ButtonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8_msgs-msg:R2-val is deprecated.  Use pp8_msgs-msg:R2 instead.")
  (R2 m))

(cl:ensure-generic-function 'option-val :lambda-list '(m))
(cl:defmethod option-val ((m <DualShock4ButtonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8_msgs-msg:option-val is deprecated.  Use pp8_msgs-msg:option instead.")
  (option m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DualShock4ButtonState>) ostream)
  "Serializes a message object of type '<DualShock4ButtonState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'square) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cross) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'circle) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'triangle) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'L1) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'L2) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'R1) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'R2) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'option) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DualShock4ButtonState>) istream)
  "Deserializes a message object of type '<DualShock4ButtonState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'square) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cross) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'circle) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'triangle) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'L1) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'L2) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'R1) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'R2) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'option) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DualShock4ButtonState>)))
  "Returns string type for a message object of type '<DualShock4ButtonState>"
  "pp8_msgs/DualShock4ButtonState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DualShock4ButtonState)))
  "Returns string type for a message object of type 'DualShock4ButtonState"
  "pp8_msgs/DualShock4ButtonState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DualShock4ButtonState>)))
  "Returns md5sum for a message object of type '<DualShock4ButtonState>"
  "0c13d9931152581a8101d288caaba285")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DualShock4ButtonState)))
  "Returns md5sum for a message object of type 'DualShock4ButtonState"
  "0c13d9931152581a8101d288caaba285")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DualShock4ButtonState>)))
  "Returns full string definition for message of type '<DualShock4ButtonState>"
  (cl:format cl:nil "#DualShock4 Button State message~%std_msgs/Bool square~%std_msgs/Bool cross~%std_msgs/Bool circle~%std_msgs/Bool triangle~%std_msgs/Bool L1~%std_msgs/Bool L2~%std_msgs/Bool R1~%std_msgs/Bool R2~%std_msgs/Bool option~%~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DualShock4ButtonState)))
  "Returns full string definition for message of type 'DualShock4ButtonState"
  (cl:format cl:nil "#DualShock4 Button State message~%std_msgs/Bool square~%std_msgs/Bool cross~%std_msgs/Bool circle~%std_msgs/Bool triangle~%std_msgs/Bool L1~%std_msgs/Bool L2~%std_msgs/Bool R1~%std_msgs/Bool R2~%std_msgs/Bool option~%~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DualShock4ButtonState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'square))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cross))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'circle))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'triangle))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'L1))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'L2))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'R1))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'R2))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'option))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DualShock4ButtonState>))
  "Converts a ROS message object to a list"
  (cl:list 'DualShock4ButtonState
    (cl:cons ':square (square msg))
    (cl:cons ':cross (cross msg))
    (cl:cons ':circle (circle msg))
    (cl:cons ':triangle (triangle msg))
    (cl:cons ':L1 (L1 msg))
    (cl:cons ':L2 (L2 msg))
    (cl:cons ':R1 (R1 msg))
    (cl:cons ':R2 (R2 msg))
    (cl:cons ':option (option msg))
))
