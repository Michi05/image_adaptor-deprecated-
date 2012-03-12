; Auto-generated. Do not edit!


(cl:in-package image_adaptor-srv)


;//! \htmlinclude normalImage-request.msg.html

(cl:defclass <normalImage-request> (roslisp-msg-protocol:ros-message)
  ((topicName
    :reader topicName
    :initarg :topicName
    :type cl:string
    :initform "")
   (nImages
    :reader nImages
    :initarg :nImages
    :type cl:integer
    :initform 0))
)

(cl:defclass normalImage-request (<normalImage-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <normalImage-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'normalImage-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<normalImage-request> is deprecated: use image_adaptor-srv:normalImage-request instead.")))

(cl:ensure-generic-function 'topicName-val :lambda-list '(m))
(cl:defmethod topicName-val ((m <normalImage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:topicName-val is deprecated.  Use image_adaptor-srv:topicName instead.")
  (topicName m))

(cl:ensure-generic-function 'nImages-val :lambda-list '(m))
(cl:defmethod nImages-val ((m <normalImage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:nImages-val is deprecated.  Use image_adaptor-srv:nImages instead.")
  (nImages m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <normalImage-request>) ostream)
  "Serializes a message object of type '<normalImage-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'topicName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'topicName))
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <normalImage-request>) istream)
  "Deserializes a message object of type '<normalImage-request>"
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
      (cl:setf (cl:slot-value msg 'nImages) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<normalImage-request>)))
  "Returns string type for a service object of type '<normalImage-request>"
  "image_adaptor/normalImageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'normalImage-request)))
  "Returns string type for a service object of type 'normalImage-request"
  "image_adaptor/normalImageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<normalImage-request>)))
  "Returns md5sum for a message object of type '<normalImage-request>"
  "b5607901045b06c3620e4e142df98f90")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'normalImage-request)))
  "Returns md5sum for a message object of type 'normalImage-request"
  "b5607901045b06c3620e4e142df98f90")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<normalImage-request>)))
  "Returns full string definition for message of type '<normalImage-request>"
  (cl:format cl:nil "string topicName~%int64 nImages~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'normalImage-request)))
  "Returns full string definition for message of type 'normalImage-request"
  (cl:format cl:nil "string topicName~%int64 nImages~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <normalImage-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'topicName))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <normalImage-request>))
  "Converts a ROS message object to a list"
  (cl:list 'normalImage-request
    (cl:cons ':topicName (topicName msg))
    (cl:cons ':nImages (nImages msg))
))
;//! \htmlinclude normalImage-response.msg.html

(cl:defclass <normalImage-response> (roslisp-msg-protocol:ros-message)
  ((images
    :reader images
    :initarg :images
    :type (cl:vector sensor_msgs-msg:Image)
   :initform (cl:make-array 0 :element-type 'sensor_msgs-msg:Image :initial-element (cl:make-instance 'sensor_msgs-msg:Image))))
)

(cl:defclass normalImage-response (<normalImage-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <normalImage-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'normalImage-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<normalImage-response> is deprecated: use image_adaptor-srv:normalImage-response instead.")))

(cl:ensure-generic-function 'images-val :lambda-list '(m))
(cl:defmethod images-val ((m <normalImage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:images-val is deprecated.  Use image_adaptor-srv:images instead.")
  (images m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <normalImage-response>) ostream)
  "Serializes a message object of type '<normalImage-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'images))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'images))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <normalImage-response>) istream)
  "Deserializes a message object of type '<normalImage-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'images) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'images)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sensor_msgs-msg:Image))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<normalImage-response>)))
  "Returns string type for a service object of type '<normalImage-response>"
  "image_adaptor/normalImageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'normalImage-response)))
  "Returns string type for a service object of type 'normalImage-response"
  "image_adaptor/normalImageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<normalImage-response>)))
  "Returns md5sum for a message object of type '<normalImage-response>"
  "b5607901045b06c3620e4e142df98f90")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'normalImage-response)))
  "Returns md5sum for a message object of type 'normalImage-response"
  "b5607901045b06c3620e4e142df98f90")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<normalImage-response>)))
  "Returns full string definition for message of type '<normalImage-response>"
  (cl:format cl:nil "sensor_msgs/Image[] images~%~%~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in src/image_encodings.cpp~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'normalImage-response)))
  "Returns full string definition for message of type 'normalImage-response"
  (cl:format cl:nil "sensor_msgs/Image[] images~%~%~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in src/image_encodings.cpp~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <normalImage-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'images) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <normalImage-response>))
  "Converts a ROS message object to a list"
  (cl:list 'normalImage-response
    (cl:cons ':images (images msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'normalImage)))
  'normalImage-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'normalImage)))
  'normalImage-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'normalImage)))
  "Returns string type for a service object of type '<normalImage>"
  "image_adaptor/normalImage")