; Auto-generated. Do not edit!


(cl:in-package image_adaptor-srv)


;//! \htmlinclude stringValue-request.msg.html

(cl:defclass <stringValue-request> (roslisp-msg-protocol:ros-message)
  ((topicName
    :reader topicName
    :initarg :topicName
    :type cl:string
    :initform ""))
)

(cl:defclass stringValue-request (<stringValue-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stringValue-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stringValue-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<stringValue-request> is deprecated: use image_adaptor-srv:stringValue-request instead.")))

(cl:ensure-generic-function 'topicName-val :lambda-list '(m))
(cl:defmethod topicName-val ((m <stringValue-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:topicName-val is deprecated.  Use image_adaptor-srv:topicName instead.")
  (topicName m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stringValue-request>) ostream)
  "Serializes a message object of type '<stringValue-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'topicName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'topicName))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stringValue-request>) istream)
  "Deserializes a message object of type '<stringValue-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stringValue-request>)))
  "Returns string type for a service object of type '<stringValue-request>"
  "image_adaptor/stringValueRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stringValue-request)))
  "Returns string type for a service object of type 'stringValue-request"
  "image_adaptor/stringValueRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stringValue-request>)))
  "Returns md5sum for a message object of type '<stringValue-request>"
  "ffd40ef407c7d58ba811620839ced3cf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stringValue-request)))
  "Returns md5sum for a message object of type 'stringValue-request"
  "ffd40ef407c7d58ba811620839ced3cf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stringValue-request>)))
  "Returns full string definition for message of type '<stringValue-request>"
  (cl:format cl:nil "string topicName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stringValue-request)))
  "Returns full string definition for message of type 'stringValue-request"
  (cl:format cl:nil "string topicName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stringValue-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'topicName))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stringValue-request>))
  "Converts a ROS message object to a list"
  (cl:list 'stringValue-request
    (cl:cons ':topicName (topicName msg))
))
;//! \htmlinclude stringValue-response.msg.html

(cl:defclass <stringValue-response> (roslisp-msg-protocol:ros-message)
  ((topicValue
    :reader topicValue
    :initarg :topicValue
    :type cl:string
    :initform ""))
)

(cl:defclass stringValue-response (<stringValue-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stringValue-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stringValue-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<stringValue-response> is deprecated: use image_adaptor-srv:stringValue-response instead.")))

(cl:ensure-generic-function 'topicValue-val :lambda-list '(m))
(cl:defmethod topicValue-val ((m <stringValue-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:topicValue-val is deprecated.  Use image_adaptor-srv:topicValue instead.")
  (topicValue m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stringValue-response>) ostream)
  "Serializes a message object of type '<stringValue-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'topicValue))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'topicValue))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stringValue-response>) istream)
  "Deserializes a message object of type '<stringValue-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'topicValue) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'topicValue) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stringValue-response>)))
  "Returns string type for a service object of type '<stringValue-response>"
  "image_adaptor/stringValueResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stringValue-response)))
  "Returns string type for a service object of type 'stringValue-response"
  "image_adaptor/stringValueResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stringValue-response>)))
  "Returns md5sum for a message object of type '<stringValue-response>"
  "ffd40ef407c7d58ba811620839ced3cf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stringValue-response)))
  "Returns md5sum for a message object of type 'stringValue-response"
  "ffd40ef407c7d58ba811620839ced3cf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stringValue-response>)))
  "Returns full string definition for message of type '<stringValue-response>"
  (cl:format cl:nil "string topicValue~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stringValue-response)))
  "Returns full string definition for message of type 'stringValue-response"
  (cl:format cl:nil "string topicValue~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stringValue-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'topicValue))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stringValue-response>))
  "Converts a ROS message object to a list"
  (cl:list 'stringValue-response
    (cl:cons ':topicValue (topicValue msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'stringValue)))
  'stringValue-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'stringValue)))
  'stringValue-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stringValue)))
  "Returns string type for a service object of type '<stringValue>"
  "image_adaptor/stringValue")