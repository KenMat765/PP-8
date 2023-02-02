; Auto-generated. Do not edit!


(cl:in-package pp8-msg)


;//! \htmlinclude PP8_Status.msg.html

(cl:defclass <PP8_Status> (roslisp-msg-protocol:ros-message)
  ((max_vel
    :reader max_vel
    :initarg :max_vel
    :type cl:fixnum
    :initform 0)
   (max_pos
    :reader max_pos
    :initarg :max_pos
    :type cl:fixnum
    :initform 0))
)

(cl:defclass PP8_Status (<PP8_Status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PP8_Status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PP8_Status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pp8-msg:<PP8_Status> is deprecated: use pp8-msg:PP8_Status instead.")))

(cl:ensure-generic-function 'max_vel-val :lambda-list '(m))
(cl:defmethod max_vel-val ((m <PP8_Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8-msg:max_vel-val is deprecated.  Use pp8-msg:max_vel instead.")
  (max_vel m))

(cl:ensure-generic-function 'max_pos-val :lambda-list '(m))
(cl:defmethod max_pos-val ((m <PP8_Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp8-msg:max_pos-val is deprecated.  Use pp8-msg:max_pos instead.")
  (max_pos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PP8_Status>) ostream)
  "Serializes a message object of type '<PP8_Status>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'max_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'max_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'max_pos)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'max_pos)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PP8_Status>) istream)
  "Deserializes a message object of type '<PP8_Status>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'max_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'max_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'max_pos)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'max_pos)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PP8_Status>)))
  "Returns string type for a message object of type '<PP8_Status>"
  "pp8/PP8_Status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PP8_Status)))
  "Returns string type for a message object of type 'PP8_Status"
  "pp8/PP8_Status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PP8_Status>)))
  "Returns md5sum for a message object of type '<PP8_Status>"
  "6cca4ef09711a7f41b34ac1b1e5c99e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PP8_Status)))
  "Returns md5sum for a message object of type 'PP8_Status"
  "6cca4ef09711a7f41b34ac1b1e5c99e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PP8_Status>)))
  "Returns full string definition for message of type '<PP8_Status>"
  (cl:format cl:nil "# PP8 Status message~%uint16 max_vel~%uint16 max_pos~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PP8_Status)))
  "Returns full string definition for message of type 'PP8_Status"
  (cl:format cl:nil "# PP8 Status message~%uint16 max_vel~%uint16 max_pos~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PP8_Status>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PP8_Status>))
  "Converts a ROS message object to a list"
  (cl:list 'PP8_Status
    (cl:cons ':max_vel (max_vel msg))
    (cl:cons ':max_pos (max_pos msg))
))
