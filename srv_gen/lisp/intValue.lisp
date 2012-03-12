; Auto-generated. Do not edit!


(cl:in-package image_adaptor-srv)


;//! \htmlinclude intValue-request.msg.html

(cl:defclass <intValue-request> (roslisp-msg-protocol:ros-message)
  ((topicName
    :reader topicName
    :initarg :topicName
    :type cl:string
    :initform ""))
)

(cl:defclass intValue-request (<intValue-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <intValue-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'intValue-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<intValue-request> is deprecated: use image_adaptor-srv:intValue-request instead.")))

(cl:ensure-generic-function 'topicName-val :lambda-list '(m))
(cl:defmethod topicName-val ((m <intValue-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:topicName-val is deprecated.  Use image_adaptor-srv:topicName instead.")
  (topicName m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <intValue-request>) ostream)
  "Serializes a message object of type '<intValue-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'topicName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'topicName))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <intValue-request>) istream)
  "Deserializes a message object of type '<intValue-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'topicName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'topicName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<intValue-request>)))
  "Returns string type for a service object of type '<intValue-request>"
  "image_adaptor/intValueRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'intValue-request)))
  "Returns string type for a service object of type 'intValue-request"
  "image_adaptor/intValueRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<intValue-request>)))
  "Returns md5sum for a message object of type '<intValue-request>"
  "b4ff20cbbd0167fab6a2a28f981b5e97")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'intValue-request)))
  "Returns md5sum for a message object of type 'intValue-request"
  "b4ff20cbbd0167fab6a2a28f981b5e97")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<intValue-request>)))
  "Returns full string definition for message of type '<intValue-request>"
  (cl:format cl:nil "string topicName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'intValue-request)))
  "Returns full string definition for message of type 'intValue-request"
  (cl:format cl:nil "string topicName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <intValue-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'topicName))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <intValue-request>))
  "Converts a ROS message object to a list"
  (cl:list 'intValue-request
    (cl:cons ':topicName (topicName msg))
))
;//! \htmlinclude intValue-response.msg.html

(cl:defclass <intValue-response> (roslisp-msg-protocol:ros-message)
  ((topicValue
    :reader topicValue
    :initarg :topicValue
    :type cl:integer
    :initform 0))
)

(cl:defclass intValue-response (<intValue-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <intValue-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'intValue-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<intValue-response> is deprecated: use image_adaptor-srv:intValue-response instead.")))

(cl:ensure-generic-function 'topicValue-val :lambda-list '(m))
(cl:defmethod topicValue-val ((m <intValue-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:topicValue-val is deprecated.  Use image_adaptor-srv:topicValue instead.")
  (topicValue m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <intValue-response>) ostream)
  "Serializes a message object of type '<intValue-response>"
  (cl:let* ((signed (cl:slot-value msg 'topicValue)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <intValue-response>) istream)
  "Deserializes a message object of type '<intValue-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'topicValue) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<intValue-response>)))
  "Returns string type for a service object of type '<intValue-response>"
  "image_adaptor/intValueResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'intValue-response)))
  "Returns string type for a service object of type 'intValue-response"
  "image_adaptor/intValueResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<intValue-response>)))
  "Returns md5sum for a message object of type '<intValue-response>"
  "b4ff20cbbd0167fab6a2a28f981b5e97")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'intValue-response)))
  "Returns md5sum for a message object of type 'intValue-response"
  "b4ff20cbbd0167fab6a2a28f981b5e97")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<intValue-response>)))
  "Returns full string definition for message of type '<intValue-response>"
  (cl:format cl:nil "int64 topicValue~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'intValue-response)))
  "Returns full string definition for message of type 'intValue-response"
  (cl:format cl:nil "int64 topicValue~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <intValue-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <intValue-response>))
  "Converts a ROS message object to a list"
  (cl:list 'intValue-response
    (cl:cons ':topicValue (topicValue msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'intValue)))
  'intValue-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'intValue)))
  'intValue-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'intValue)))
  "Returns string type for a service object of type '<intValue>"
  "image_adaptor/intValue")