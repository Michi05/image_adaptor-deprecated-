; Auto-generated. Do not edit!


(cl:in-package image_adaptor-srv)


;//! \htmlinclude requestTopic-request.msg.html

(cl:defclass <requestTopic-request> (roslisp-msg-protocol:ros-message)
  ((nImages
    :reader nImages
    :initarg :nImages
    :type cl:integer
    :initform 0)
   (sourceTopic
    :reader sourceTopic
    :initarg :sourceTopic
    :type cl:string
    :initform "")
   (responseTopic
    :reader responseTopic
    :initarg :responseTopic
    :type cl:string
    :initform ""))
)

(cl:defclass requestTopic-request (<requestTopic-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <requestTopic-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'requestTopic-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<requestTopic-request> is deprecated: use image_adaptor-srv:requestTopic-request instead.")))

(cl:ensure-generic-function 'nImages-val :lambda-list '(m))
(cl:defmethod nImages-val ((m <requestTopic-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:nImages-val is deprecated.  Use image_adaptor-srv:nImages instead.")
  (nImages m))

(cl:ensure-generic-function 'sourceTopic-val :lambda-list '(m))
(cl:defmethod sourceTopic-val ((m <requestTopic-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:sourceTopic-val is deprecated.  Use image_adaptor-srv:sourceTopic instead.")
  (sourceTopic m))

(cl:ensure-generic-function 'responseTopic-val :lambda-list '(m))
(cl:defmethod responseTopic-val ((m <requestTopic-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:responseTopic-val is deprecated.  Use image_adaptor-srv:responseTopic instead.")
  (responseTopic m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <requestTopic-request>) ostream)
  "Serializes a message object of type '<requestTopic-request>"
  (cl:let* ((signed (cl:slot-value msg 'nImages)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sourceTopic))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sourceTopic))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'responseTopic))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'responseTopic))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <requestTopic-request>) istream)
  "Deserializes a message object of type '<requestTopic-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nImages) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sourceTopic) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sourceTopic) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'responseTopic) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'responseTopic) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<requestTopic-request>)))
  "Returns string type for a service object of type '<requestTopic-request>"
  "image_adaptor/requestTopicRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'requestTopic-request)))
  "Returns string type for a service object of type 'requestTopic-request"
  "image_adaptor/requestTopicRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<requestTopic-request>)))
  "Returns md5sum for a message object of type '<requestTopic-request>"
  "b817ce56db2701eab6ea62d45b0f064b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'requestTopic-request)))
  "Returns md5sum for a message object of type 'requestTopic-request"
  "b817ce56db2701eab6ea62d45b0f064b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<requestTopic-request>)))
  "Returns full string definition for message of type '<requestTopic-request>"
  (cl:format cl:nil "int64 nImages~%string sourceTopic~%string responseTopic~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'requestTopic-request)))
  "Returns full string definition for message of type 'requestTopic-request"
  (cl:format cl:nil "int64 nImages~%string sourceTopic~%string responseTopic~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <requestTopic-request>))
  (cl:+ 0
     8
     4 (cl:length (cl:slot-value msg 'sourceTopic))
     4 (cl:length (cl:slot-value msg 'responseTopic))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <requestTopic-request>))
  "Converts a ROS message object to a list"
  (cl:list 'requestTopic-request
    (cl:cons ':nImages (nImages msg))
    (cl:cons ':sourceTopic (sourceTopic msg))
    (cl:cons ':responseTopic (responseTopic msg))
))
;//! \htmlinclude requestTopic-response.msg.html

(cl:defclass <requestTopic-response> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type cl:string
    :initform ""))
)

(cl:defclass requestTopic-response (<requestTopic-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <requestTopic-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'requestTopic-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<requestTopic-response> is deprecated: use image_adaptor-srv:requestTopic-response instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <requestTopic-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:response-val is deprecated.  Use image_adaptor-srv:response instead.")
  (response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <requestTopic-response>) ostream)
  "Serializes a message object of type '<requestTopic-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'response))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'response))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <requestTopic-response>) istream)
  "Deserializes a message object of type '<requestTopic-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'response) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'response) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<requestTopic-response>)))
  "Returns string type for a service object of type '<requestTopic-response>"
  "image_adaptor/requestTopicResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'requestTopic-response)))
  "Returns string type for a service object of type 'requestTopic-response"
  "image_adaptor/requestTopicResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<requestTopic-response>)))
  "Returns md5sum for a message object of type '<requestTopic-response>"
  "b817ce56db2701eab6ea62d45b0f064b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'requestTopic-response)))
  "Returns md5sum for a message object of type 'requestTopic-response"
  "b817ce56db2701eab6ea62d45b0f064b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<requestTopic-response>)))
  "Returns full string definition for message of type '<requestTopic-response>"
  (cl:format cl:nil "string response~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'requestTopic-response)))
  "Returns full string definition for message of type 'requestTopic-response"
  (cl:format cl:nil "string response~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <requestTopic-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'response))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <requestTopic-response>))
  "Converts a ROS message object to a list"
  (cl:list 'requestTopic-response
    (cl:cons ':response (response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'requestTopic)))
  'requestTopic-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'requestTopic)))
  'requestTopic-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'requestTopic)))
  "Returns string type for a service object of type '<requestTopic>"
  "image_adaptor/requestTopic")