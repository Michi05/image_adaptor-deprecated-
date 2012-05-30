; Auto-generated. Do not edit!


(cl:in-package image_adaptor-srv)


;//! \htmlinclude setFloat-request.msg.html

(cl:defclass <setFloat-request> (roslisp-msg-protocol:ros-message)
  ((topicName
    :reader topicName
    :initarg :topicName
    :type cl:string
    :initform "")
   (newValue
    :reader newValue
    :initarg :newValue
    :type cl:float
    :initform 0.0))
)

(cl:defclass setFloat-request (<setFloat-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setFloat-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setFloat-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<setFloat-request> is deprecated: use image_adaptor-srv:setFloat-request instead.")))

(cl:ensure-generic-function 'topicName-val :lambda-list '(m))
(cl:defmethod topicName-val ((m <setFloat-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:topicName-val is deprecated.  Use image_adaptor-srv:topicName instead.")
  (topicName m))

(cl:ensure-generic-function 'newValue-val :lambda-list '(m))
(cl:defmethod newValue-val ((m <setFloat-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:newValue-val is deprecated.  Use image_adaptor-srv:newValue instead.")
  (newValue m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setFloat-request>) ostream)
  "Serializes a message object of type '<setFloat-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'topicName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'topicName))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'newValue))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setFloat-request>) istream)
  "Deserializes a message object of type '<setFloat-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'topicName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'topicName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'newValue) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setFloat-request>)))
  "Returns string type for a service object of type '<setFloat-request>"
  "image_adaptor/setFloatRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setFloat-request)))
  "Returns string type for a service object of type 'setFloat-request"
  "image_adaptor/setFloatRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setFloat-request>)))
  "Returns md5sum for a message object of type '<setFloat-request>"
  "534d71573526d91e225c2160dfe4b29d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setFloat-request)))
  "Returns md5sum for a message object of type 'setFloat-request"
  "534d71573526d91e225c2160dfe4b29d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setFloat-request>)))
  "Returns full string definition for message of type '<setFloat-request>"
  (cl:format cl:nil "string topicName~%float64 newValue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setFloat-request)))
  "Returns full string definition for message of type 'setFloat-request"
  (cl:format cl:nil "string topicName~%float64 newValue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setFloat-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'topicName))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setFloat-request>))
  "Converts a ROS message object to a list"
  (cl:list 'setFloat-request
    (cl:cons ':topicName (topicName msg))
    (cl:cons ':newValue (newValue msg))
))
;//! \htmlinclude setFloat-response.msg.html

(cl:defclass <setFloat-response> (roslisp-msg-protocol:ros-message)
  ((setAnswer
    :reader setAnswer
    :initarg :setAnswer
    :type cl:float
    :initform 0.0))
)

(cl:defclass setFloat-response (<setFloat-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setFloat-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setFloat-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<setFloat-response> is deprecated: use image_adaptor-srv:setFloat-response instead.")))

(cl:ensure-generic-function 'setAnswer-val :lambda-list '(m))
(cl:defmethod setAnswer-val ((m <setFloat-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:setAnswer-val is deprecated.  Use image_adaptor-srv:setAnswer instead.")
  (setAnswer m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setFloat-response>) ostream)
  "Serializes a message object of type '<setFloat-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'setAnswer))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setFloat-response>) istream)
  "Deserializes a message object of type '<setFloat-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'setAnswer) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setFloat-response>)))
  "Returns string type for a service object of type '<setFloat-response>"
  "image_adaptor/setFloatResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setFloat-response)))
  "Returns string type for a service object of type 'setFloat-response"
  "image_adaptor/setFloatResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setFloat-response>)))
  "Returns md5sum for a message object of type '<setFloat-response>"
  "534d71573526d91e225c2160dfe4b29d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setFloat-response)))
  "Returns md5sum for a message object of type 'setFloat-response"
  "534d71573526d91e225c2160dfe4b29d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setFloat-response>)))
  "Returns full string definition for message of type '<setFloat-response>"
  (cl:format cl:nil "float64 setAnswer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setFloat-response)))
  "Returns full string definition for message of type 'setFloat-response"
  (cl:format cl:nil "float64 setAnswer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setFloat-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setFloat-response>))
  "Converts a ROS message object to a list"
  (cl:list 'setFloat-response
    (cl:cons ':setAnswer (setAnswer msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'setFloat)))
  'setFloat-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'setFloat)))
  'setFloat-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setFloat)))
  "Returns string type for a service object of type '<setFloat>"
  "image_adaptor/setFloat")