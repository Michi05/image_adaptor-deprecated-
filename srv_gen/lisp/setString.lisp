; Auto-generated. Do not edit!


(cl:in-package image_adaptor-srv)


;//! \htmlinclude setString-request.msg.html

(cl:defclass <setString-request> (roslisp-msg-protocol:ros-message)
  ((topicName
    :reader topicName
    :initarg :topicName
    :type cl:string
    :initform "")
   (newValue
    :reader newValue
    :initarg :newValue
    :type cl:string
    :initform ""))
)

(cl:defclass setString-request (<setString-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setString-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setString-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<setString-request> is deprecated: use image_adaptor-srv:setString-request instead.")))

(cl:ensure-generic-function 'topicName-val :lambda-list '(m))
(cl:defmethod topicName-val ((m <setString-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:topicName-val is deprecated.  Use image_adaptor-srv:topicName instead.")
  (topicName m))

(cl:ensure-generic-function 'newValue-val :lambda-list '(m))
(cl:defmethod newValue-val ((m <setString-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:newValue-val is deprecated.  Use image_adaptor-srv:newValue instead.")
  (newValue m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setString-request>) ostream)
  "Serializes a message object of type '<setString-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'topicName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'topicName))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'newValue))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'newValue))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setString-request>) istream)
  "Deserializes a message object of type '<setString-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'topicName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'topicName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'newValue) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'newValue) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setString-request>)))
  "Returns string type for a service object of type '<setString-request>"
  "image_adaptor/setStringRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setString-request)))
  "Returns string type for a service object of type 'setString-request"
  "image_adaptor/setStringRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setString-request>)))
  "Returns md5sum for a message object of type '<setString-request>"
  "b2a8e6a2c24eb6eee63e7e22c2a299fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setString-request)))
  "Returns md5sum for a message object of type 'setString-request"
  "b2a8e6a2c24eb6eee63e7e22c2a299fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setString-request>)))
  "Returns full string definition for message of type '<setString-request>"
  (cl:format cl:nil "string topicName~%string newValue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setString-request)))
  "Returns full string definition for message of type 'setString-request"
  (cl:format cl:nil "string topicName~%string newValue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setString-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'topicName))
     4 (cl:length (cl:slot-value msg 'newValue))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setString-request>))
  "Converts a ROS message object to a list"
  (cl:list 'setString-request
    (cl:cons ':topicName (topicName msg))
    (cl:cons ':newValue (newValue msg))
))
;//! \htmlinclude setString-response.msg.html

(cl:defclass <setString-response> (roslisp-msg-protocol:ros-message)
  ((setAnswer
    :reader setAnswer
    :initarg :setAnswer
    :type cl:string
    :initform ""))
)

(cl:defclass setString-response (<setString-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setString-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setString-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<setString-response> is deprecated: use image_adaptor-srv:setString-response instead.")))

(cl:ensure-generic-function 'setAnswer-val :lambda-list '(m))
(cl:defmethod setAnswer-val ((m <setString-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:setAnswer-val is deprecated.  Use image_adaptor-srv:setAnswer instead.")
  (setAnswer m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setString-response>) ostream)
  "Serializes a message object of type '<setString-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'setAnswer))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'setAnswer))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setString-response>) istream)
  "Deserializes a message object of type '<setString-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'setAnswer) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'setAnswer) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setString-response>)))
  "Returns string type for a service object of type '<setString-response>"
  "image_adaptor/setStringResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setString-response)))
  "Returns string type for a service object of type 'setString-response"
  "image_adaptor/setStringResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setString-response>)))
  "Returns md5sum for a message object of type '<setString-response>"
  "b2a8e6a2c24eb6eee63e7e22c2a299fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setString-response)))
  "Returns md5sum for a message object of type 'setString-response"
  "b2a8e6a2c24eb6eee63e7e22c2a299fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setString-response>)))
  "Returns full string definition for message of type '<setString-response>"
  (cl:format cl:nil "string setAnswer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setString-response)))
  "Returns full string definition for message of type 'setString-response"
  (cl:format cl:nil "string setAnswer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setString-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'setAnswer))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setString-response>))
  "Converts a ROS message object to a list"
  (cl:list 'setString-response
    (cl:cons ':setAnswer (setAnswer msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'setString)))
  'setString-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'setString)))
  'setString-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setString)))
  "Returns string type for a service object of type '<setString>"
  "image_adaptor/setString")