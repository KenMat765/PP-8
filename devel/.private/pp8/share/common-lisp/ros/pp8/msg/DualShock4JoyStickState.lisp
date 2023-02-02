; Auto-generated. Do not edit!


(cl:in-package pp8-msg)


;//! \htmlinclude DualShock4JoyStickState.msg.html

(cl:defclass <DualShock4JoyStickState> (roslisp-msg-protocol:ros-message)
  ((l_x
    :reader l_x
    :initarg :l_x
    :type cl:float
    :initform 0.0)
   (l_y
    :reader l_y
    :initarg :l_y
    :type cl:float
    :initform 0.0)
   (r_x
    :reader r_x
    :initarg :r_x
    :type cl:float
    :initform 0.0)
   (r_y
    :reader r_y
    :initarg :r_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass DualShock4JoyStickState (<DualShock4JoyStickState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DualShock4JoyStickState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DualShock4JoyStickState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pp8-msg:<DualShock4JoyStickState> is deprecated: use pp8-msg:DualShock4JoyStickState instead.")))

(cl:ensure-generic-function 'l_x-val :lambda-list '(m))
(cl:defmethod l_x-val ((m <DualShock4JoyStickState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8-msg:l_x-val is deprecated.  Use pp8-msg:l_x instead.")
  (l_x m))

(cl:ensure-generic-function 'l_y-val :lambda-list '(m))
(cl:defmethod l_y-val ((m <DualShock4JoyStickState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8-msg:l_y-val is deprecated.  Use pp8-msg:l_y instead.")
  (l_y m))

(cl:ensure-generic-function 'r_x-val :lambda-list '(m))
(cl:defmethod r_x-val ((m <DualShock4JoyStickState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8-msg:r_x-val is deprecated.  Use pp8-msg:r_x instead.")
  (r_x m))

(cl:ensure-generic-function 'r_y-val :lambda-list '(m))
(cl:defmethod r_y-val ((m <DualShock4JoyStickState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8-msg:r_y-val is deprecated.  Use pp8-msg:r_y instead.")
  (r_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DualShock4JoyStickState>) ostream)
  "Serializes a message object of type '<DualShock4JoyStickState>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'l_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'l_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'r_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'r_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DualShock4JoyStickState>) istream)
  "Deserializes a message object of type '<DualShock4JoyStickState>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'l_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'l_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DualShock4JoyStickState>)))
  "Returns string type for a message object of type '<DualShock4JoyStickState>"
  "pp8/DualShock4JoyStickState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DualShock4JoyStickState)))
  "Returns string type for a message object of type 'DualShock4JoyStickState"
  "pp8/DualShock4JoyStickState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DualShock4JoyStickState>)))
  "Returns md5sum for a message object of type '<DualShock4JoyStickState>"
  "d1dc4bb1b4a2956e5a2e9cdf4c2d8004")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DualShock4JoyStickState)))
  "Returns md5sum for a message object of type 'DualShock4JoyStickState"
  "d1dc4bb1b4a2956e5a2e9cdf4c2d8004")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DualShock4JoyStickState>)))
  "Returns full string definition for message of type '<DualShock4JoyStickState>"
  (cl:format cl:nil "#DualShock4 JoyStick State message~%float64 l_x~%float64 l_y~%float64 r_x~%float64 r_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DualShock4JoyStickState)))
  "Returns full string definition for message of type 'DualShock4JoyStickState"
  (cl:format cl:nil "#DualShock4 JoyStick State message~%float64 l_x~%float64 l_y~%float64 r_x~%float64 r_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DualShock4JoyStickState>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DualShock4JoyStickState>))
  "Converts a ROS message object to a list"
  (cl:list 'DualShock4JoyStickState
    (cl:cons ':l_x (l_x msg))
    (cl:cons ':l_y (l_y msg))
    (cl:cons ':r_x (r_x msg))
    (cl:cons ':r_y (r_y msg))
))
