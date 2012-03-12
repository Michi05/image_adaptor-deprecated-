; Auto-generated. Do not edit!


(cl:in-package image_adaptor-srv)


;//! \htmlinclude setBoolean-request.msg.html

(cl:defclass <setBoolean-request> (roslisp-msg-protocol:ros-message)
  ((topicName
    :reader topicName
    :initarg :topicName
    :type cl:string
    :initform "")
   (newValue
    :reader newValue
    :initarg :newValue
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass setBoolean-request (<setBoolean-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setBoolean-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setBoolean-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<setBoolean-request> is deprecated: use image_adaptor-srv:setBoolean-request instead.")))

(cl:ensure-generic-function 'topicName-val :lambda-list '(m))
(cl:defmethod topicName-val ((m <setBoolean-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:topicName-val is deprecated.  Use image_adaptor-srv:topicName instead.")
  (topicName m))

(cl:ensure-generic-function 'newValue-val :lambda-list '(m))
(cl:defmethod newValue-val ((m <setBoolean-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:newValue-val is deprecated.  Use image_adaptor-srv:newValue instead.")
  (newValue m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setBoolean-request>) ostream)
  "Serializes a message object of type '<setBoolean-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'topicName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'topicName))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'newValue) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setBoolean-request>) istream)
  "Deserializes a message object of type '<setBoolean-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'topicName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'topicName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'newValue) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setBoolean-request>)))
  "Returns string type for a service object of type '<setBoolean-request>"
  "image_adaptor/setBooleanRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setBoolean-request)))
  "Returns string type for a service object of type 'setBoolean-request"
  "image_adaptor/setBooleanRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setBoolean-request>)))
  "Returns md5sum for a message object of type '<setBoolean-request>"
  "3033c2979f4e4675025fc2914d653e07")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setBoolean-request)))
  "Returns md5sum for a message object of type 'setBoolean-request"
  "3033c2979f4e4675025fc2914d653e07")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setBoolean-request>)))
  "Returns full string definition for message of type '<setBoolean-request>"
  (cl:format cl:nil "string topicName~%bool newValue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setBoolean-request)))
  "Returns full string definition for message of type 'setBoolean-request"
  (cl:format cl:nil "string topicName~%bool newValue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setBoolean-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'topicName))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setBoolean-request>))
  "Converts a ROS message object to a list"
  (cl:list 'setBoolean-request
    (cl:cons ':topicName (topicName msg))
    (cl:cons ':newValue (newValue msg))
))
;//! \htmlinclude setBoolean-response.msg.html

(cl:defclass <setBoolean-response> (roslisp-msg-protocol:ros-message)
  ((setAnswer
    :reader setAnswer
    :initarg :setAnswer
    :type cl:string
    :initform ""))
)

(cl:defclass setBoolean-response (<setBoolean-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setBoolean-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setBoolean-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<setBoolean-response> is deprecated: use image_adaptor-srv:setBoolean-response instead.")))

(cl:ensure-generic-function 'setAnswer-val :lambda-list '(m))
(cl:defmethod setAnswer-val ((m <setBoolean-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:setAnswer-val is deprecated.  Use image_adaptor-srv:setAnswer instead.")
  (setAnswer m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setBoolean-response>) ostream)
  "Serializes a message object of type '<setBoolean-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'setAnswer))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'setAnswer))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setBoolean-response>) istream)
  "Deserializes a message object of type '<setBoolean-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setBoolean-response>)))
  "Returns string type for a service object of type '<setBoolean-response>"
  "image_adaptor/setBooleanResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setBoolean-response)))
  "Returns string type for a service object of type 'setBoolean-response"
  "image_adaptor/setBooleanResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setBoolean-response>)))
  "Returns md5sum for a message object of type '<setBoolean-response>"
  "3033c2979f4e4675025fc2914d653e07")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setBoolean-response)))
  "Returns md5sum for a message object of type 'setBoolean-response"
  "3033c2979f4e4675025fc2914d653e07")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setBoolean-response>)))
  "Returns full string definition for message of type '<setBoolean-response>"
  (cl:format cl:nil "string setAnswer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setBoolean-response)))
  "Returns full string definition for message of type 'setBoolean-response"
  (cl:format cl:nil "string setAnswer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setBoolean-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'setAnswer))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setBoolean-response>))
  "Converts a ROS message object to a list"
  (cl:list 'setBoolean-response
    (cl:cons ':setAnswer (setAnswer msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'setBoolean)))
  'setBoolean-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'setBoolean)))
  'setBoolean-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setBoolean)))
  "Returns string type for a service object of type '<setBoolean>"
  "image_adaptor/setBoolean")