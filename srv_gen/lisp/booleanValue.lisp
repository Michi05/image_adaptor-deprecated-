; Auto-generated. Do not edit!


(cl:in-package image_adaptor-srv)


;//! \htmlinclude booleanValue-request.msg.html

(cl:defclass <booleanValue-request> (roslisp-msg-protocol:ros-message)
  ((topicName
    :reader topicName
    :initarg :topicName
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass booleanValue-request (<booleanValue-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <booleanValue-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'booleanValue-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<booleanValue-request> is deprecated: use image_adaptor-srv:booleanValue-request instead.")))

(cl:ensure-generic-function 'topicName-val :lambda-list '(m))
(cl:defmethod topicName-val ((m <booleanValue-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:topicName-val is deprecated.  Use image_adaptor-srv:topicName instead.")
  (topicName m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <booleanValue-request>) ostream)
  "Serializes a message object of type '<booleanValue-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'topicName) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <booleanValue-request>) istream)
  "Deserializes a message object of type '<booleanValue-request>"
    (cl:setf (cl:slot-value msg 'topicName) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<booleanValue-request>)))
  "Returns string type for a service object of type '<booleanValue-request>"
  "image_adaptor/booleanValueRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'booleanValue-request)))
  "Returns string type for a service object of type 'booleanValue-request"
  "image_adaptor/booleanValueRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<booleanValue-request>)))
  "Returns md5sum for a message object of type '<booleanValue-request>"
  "43f2cc5af874b3c674474abd3ca5e9d8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'booleanValue-request)))
  "Returns md5sum for a message object of type 'booleanValue-request"
  "43f2cc5af874b3c674474abd3ca5e9d8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<booleanValue-request>)))
  "Returns full string definition for message of type '<booleanValue-request>"
  (cl:format cl:nil "bool topicName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'booleanValue-request)))
  "Returns full string definition for message of type 'booleanValue-request"
  (cl:format cl:nil "bool topicName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <booleanValue-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <booleanValue-request>))
  "Converts a ROS message object to a list"
  (cl:list 'booleanValue-request
    (cl:cons ':topicName (topicName msg))
))
;//! \htmlinclude booleanValue-response.msg.html

(cl:defclass <booleanValue-response> (roslisp-msg-protocol:ros-message)
  ((topicValue
    :reader topicValue
    :initarg :topicValue
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass booleanValue-response (<booleanValue-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <booleanValue-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'booleanValue-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<booleanValue-response> is deprecated: use image_adaptor-srv:booleanValue-response instead.")))

(cl:ensure-generic-function 'topicValue-val :lambda-list '(m))
(cl:defmethod topicValue-val ((m <booleanValue-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:topicValue-val is deprecated.  Use image_adaptor-srv:topicValue instead.")
  (topicValue m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <booleanValue-response>) ostream)
  "Serializes a message object of type '<booleanValue-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'topicValue) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <booleanValue-response>) istream)
  "Deserializes a message object of type '<booleanValue-response>"
    (cl:setf (cl:slot-value msg 'topicValue) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<booleanValue-response>)))
  "Returns string type for a service object of type '<booleanValue-response>"
  "image_adaptor/booleanValueResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'booleanValue-response)))
  "Returns string type for a service object of type 'booleanValue-response"
  "image_adaptor/booleanValueResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<booleanValue-response>)))
  "Returns md5sum for a message object of type '<booleanValue-response>"
  "43f2cc5af874b3c674474abd3ca5e9d8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'booleanValue-response)))
  "Returns md5sum for a message object of type 'booleanValue-response"
  "43f2cc5af874b3c674474abd3ca5e9d8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<booleanValue-response>)))
  "Returns full string definition for message of type '<booleanValue-response>"
  (cl:format cl:nil "bool topicValue~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'booleanValue-response)))
  "Returns full string definition for message of type 'booleanValue-response"
  (cl:format cl:nil "bool topicValue~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <booleanValue-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <booleanValue-response>))
  "Converts a ROS message object to a list"
  (cl:list 'booleanValue-response
    (cl:cons ':topicValue (topicValue msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'booleanValue)))
  'booleanValue-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'booleanValue)))
  'booleanValue-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'booleanValue)))
  "Returns string type for a service object of type '<booleanValue>"
  "image_adaptor/booleanValue")