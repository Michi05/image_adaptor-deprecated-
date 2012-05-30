; Auto-generated. Do not edit!


(cl:in-package image_adaptor-srv)


;//! \htmlinclude setInteger-request.msg.html

(cl:defclass <setInteger-request> (roslisp-msg-protocol:ros-message)
  ((topicName
    :reader topicName
    :initarg :topicName
    :type cl:string
    :initform "")
   (newValue
    :reader newValue
    :initarg :newValue
    :type cl:integer
    :initform 0))
)

(cl:defclass setInteger-request (<setInteger-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setInteger-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setInteger-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<setInteger-request> is deprecated: use image_adaptor-srv:setInteger-request instead.")))

(cl:ensure-generic-function 'topicName-val :lambda-list '(m))
(cl:defmethod topicName-val ((m <setInteger-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:topicName-val is deprecated.  Use image_adaptor-srv:topicName instead.")
  (topicName m))

(cl:ensure-generic-function 'newValue-val :lambda-list '(m))
(cl:defmethod newValue-val ((m <setInteger-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:newValue-val is deprecated.  Use image_adaptor-srv:newValue instead.")
  (newValue m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setInteger-request>) ostream)
  "Serializes a message object of type '<setInteger-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'topicName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'topicName))
  (cl:let* ((signed (cl:slot-value msg 'newValue)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setInteger-request>) istream)
  "Deserializes a message object of type '<setInteger-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'topicName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'topicName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'newValue) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setInteger-request>)))
  "Returns string type for a service object of type '<setInteger-request>"
  "image_adaptor/setIntegerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setInteger-request)))
  "Returns string type for a service object of type 'setInteger-request"
  "image_adaptor/setIntegerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setInteger-request>)))
  "Returns md5sum for a message object of type '<setInteger-request>"
  "f1188add3dec534dc11668e3b8036077")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setInteger-request)))
  "Returns md5sum for a message object of type 'setInteger-request"
  "f1188add3dec534dc11668e3b8036077")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setInteger-request>)))
  "Returns full string definition for message of type '<setInteger-request>"
  (cl:format cl:nil "string topicName~%int64 newValue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setInteger-request)))
  "Returns full string definition for message of type 'setInteger-request"
  (cl:format cl:nil "string topicName~%int64 newValue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setInteger-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'topicName))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setInteger-request>))
  "Converts a ROS message object to a list"
  (cl:list 'setInteger-request
    (cl:cons ':topicName (topicName msg))
    (cl:cons ':newValue (newValue msg))
))
;//! \htmlinclude setInteger-response.msg.html

(cl:defclass <setInteger-response> (roslisp-msg-protocol:ros-message)
  ((setAnswer
    :reader setAnswer
    :initarg :setAnswer
    :type cl:integer
    :initform 0))
)

(cl:defclass setInteger-response (<setInteger-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setInteger-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setInteger-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<setInteger-response> is deprecated: use image_adaptor-srv:setInteger-response instead.")))

(cl:ensure-generic-function 'setAnswer-val :lambda-list '(m))
(cl:defmethod setAnswer-val ((m <setInteger-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:setAnswer-val is deprecated.  Use image_adaptor-srv:setAnswer instead.")
  (setAnswer m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setInteger-response>) ostream)
  "Serializes a message object of type '<setInteger-response>"
  (cl:let* ((signed (cl:slot-value msg 'setAnswer)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setInteger-response>) istream)
  "Deserializes a message object of type '<setInteger-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'setAnswer) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setInteger-response>)))
  "Returns string type for a service object of type '<setInteger-response>"
  "image_adaptor/setIntegerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setInteger-response)))
  "Returns string type for a service object of type 'setInteger-response"
  "image_adaptor/setIntegerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setInteger-response>)))
  "Returns md5sum for a message object of type '<setInteger-response>"
  "f1188add3dec534dc11668e3b8036077")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setInteger-response)))
  "Returns md5sum for a message object of type 'setInteger-response"
  "f1188add3dec534dc11668e3b8036077")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setInteger-response>)))
  "Returns full string definition for message of type '<setInteger-response>"
  (cl:format cl:nil "int64 setAnswer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setInteger-response)))
  "Returns full string definition for message of type 'setInteger-response"
  (cl:format cl:nil "int64 setAnswer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setInteger-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setInteger-response>))
  "Converts a ROS message object to a list"
  (cl:list 'setInteger-response
    (cl:cons ':setAnswer (setAnswer msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'setInteger)))
  'setInteger-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'setInteger)))
  'setInteger-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setInteger)))
  "Returns string type for a service object of type '<setInteger>"
  "image_adaptor/setInteger")