; Auto-generated. Do not edit!


(cl:in-package image_adaptor-srv)


;//! \htmlinclude floatValue-request.msg.html

(cl:defclass <floatValue-request> (roslisp-msg-protocol:ros-message)
  ((topicName
    :reader topicName
    :initarg :topicName
    :type cl:float
    :initform 0.0))
)

(cl:defclass floatValue-request (<floatValue-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <floatValue-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'floatValue-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<floatValue-request> is deprecated: use image_adaptor-srv:floatValue-request instead.")))

(cl:ensure-generic-function 'topicName-val :lambda-list '(m))
(cl:defmethod topicName-val ((m <floatValue-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:topicName-val is deprecated.  Use image_adaptor-srv:topicName instead.")
  (topicName m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <floatValue-request>) ostream)
  "Serializes a message object of type '<floatValue-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'topicName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <floatValue-request>) istream)
  "Deserializes a message object of type '<floatValue-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'topicName) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<floatValue-request>)))
  "Returns string type for a service object of type '<floatValue-request>"
  "image_adaptor/floatValueRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'floatValue-request)))
  "Returns string type for a service object of type 'floatValue-request"
  "image_adaptor/floatValueRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<floatValue-request>)))
  "Returns md5sum for a message object of type '<floatValue-request>"
  "8d0cfd91e471fc5abc16032475606a03")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'floatValue-request)))
  "Returns md5sum for a message object of type 'floatValue-request"
  "8d0cfd91e471fc5abc16032475606a03")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<floatValue-request>)))
  "Returns full string definition for message of type '<floatValue-request>"
  (cl:format cl:nil "float64 topicName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'floatValue-request)))
  "Returns full string definition for message of type 'floatValue-request"
  (cl:format cl:nil "float64 topicName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <floatValue-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <floatValue-request>))
  "Converts a ROS message object to a list"
  (cl:list 'floatValue-request
    (cl:cons ':topicName (topicName msg))
))
;//! \htmlinclude floatValue-response.msg.html

(cl:defclass <floatValue-response> (roslisp-msg-protocol:ros-message)
  ((topicValue
    :reader topicValue
    :initarg :topicValue
    :type cl:float
    :initform 0.0))
)

(cl:defclass floatValue-response (<floatValue-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <floatValue-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'floatValue-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<floatValue-response> is deprecated: use image_adaptor-srv:floatValue-response instead.")))

(cl:ensure-generic-function 'topicValue-val :lambda-list '(m))
(cl:defmethod topicValue-val ((m <floatValue-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:topicValue-val is deprecated.  Use image_adaptor-srv:topicValue instead.")
  (topicValue m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <floatValue-response>) ostream)
  "Serializes a message object of type '<floatValue-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'topicValue))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <floatValue-response>) istream)
  "Deserializes a message object of type '<floatValue-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'topicValue) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<floatValue-response>)))
  "Returns string type for a service object of type '<floatValue-response>"
  "image_adaptor/floatValueResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'floatValue-response)))
  "Returns string type for a service object of type 'floatValue-response"
  "image_adaptor/floatValueResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<floatValue-response>)))
  "Returns md5sum for a message object of type '<floatValue-response>"
  "8d0cfd91e471fc5abc16032475606a03")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'floatValue-response)))
  "Returns md5sum for a message object of type 'floatValue-response"
  "8d0cfd91e471fc5abc16032475606a03")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<floatValue-response>)))
  "Returns full string definition for message of type '<floatValue-response>"
  (cl:format cl:nil "float64 topicValue~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'floatValue-response)))
  "Returns full string definition for message of type 'floatValue-response"
  (cl:format cl:nil "float64 topicValue~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <floatValue-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <floatValue-response>))
  "Converts a ROS message object to a list"
  (cl:list 'floatValue-response
    (cl:cons ':topicValue (topicValue msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'floatValue)))
  'floatValue-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'floatValue)))
  'floatValue-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'floatValue)))
  "Returns string type for a service object of type '<floatValue>"
  "image_adaptor/floatValue")