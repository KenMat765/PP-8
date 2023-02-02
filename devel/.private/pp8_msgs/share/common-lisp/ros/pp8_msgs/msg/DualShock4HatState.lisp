; Auto-generated. Do not edit!


(cl:in-package pp8_msgs-msg)


;//! \htmlinclude DualShock4HatState.msg.html

(cl:defclass <DualShock4HatState> (roslisp-msg-protocol:ros-message)
  ((hat_x
    :reader hat_x
    :initarg :hat_x
    :type cl:fixnum
    :initform 0)
   (hat_y
    :reader hat_y
    :initarg :hat_y
    :type cl:fixnum
    :initform 0))
)

(cl:defclass DualShock4HatState (<DualShock4HatState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DualShock4HatState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DualShock4HatState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pp8_msgs-msg:<DualShock4HatState> is deprecated: use pp8_msgs-msg:DualShock4HatState instead.")))

(cl:ensure-generic-function 'hat_x-val :lambda-list '(m))
(cl:defmethod hat_x-val ((m <DualShock4HatState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8_msgs-msg:hat_x-val is deprecated.  Use pp8_msgs-msg:hat_x instead.")
  (hat_x m))

(cl:ensure-generic-function 'hat_y-val :lambda-list '(m))
(cl:defmethod hat_y-val ((m <DualShock4HatState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8_msgs-msg:hat_y-val is deprecated.  Use pp8_msgs-msg:hat_y instead.")
  (hat_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DualShock4HatState>) ostream)
  "Serializes a message object of type '<DualShock4HatState>"
  (cl:let* ((signed (cl:slot-value msg 'hat_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'hat_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DualShock4HatState>) istream)
  "Deserializes a message object of type '<DualShock4HatState>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hat_x) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hat_y) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DualShock4HatState>)))
  "Returns string type for a message object of type '<DualShock4HatState>"
  "pp8_msgs/DualShock4HatState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DualShock4HatState)))
  "Returns string type for a message object of type 'DualShock4HatState"
  "pp8_msgs/DualShock4HatState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DualShock4HatState>)))
  "Returns md5sum for a message object of type '<DualShock4HatState>"
  "3e853de77a9549fef8a730a59484d6a2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DualShock4HatState)))
  "Returns md5sum for a message object of type 'DualShock4HatState"
  "3e853de77a9549fef8a730a59484d6a2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DualShock4HatState>)))
  "Returns full string definition for message of type '<DualShock4HatState>"
  (cl:format cl:nil "#DualShock4 Hat State message~%int8 hat_x~%int8 hat_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DualShock4HatState)))
  "Returns full string definition for message of type 'DualShock4HatState"
  (cl:format cl:nil "#DualShock4 Hat State message~%int8 hat_x~%int8 hat_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DualShock4HatState>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DualShock4HatState>))
  "Converts a ROS message object to a list"
  (cl:list 'DualShock4HatState
    (cl:cons ':hat_x (hat_x msg))
    (cl:cons ':hat_y (hat_y msg))
))
