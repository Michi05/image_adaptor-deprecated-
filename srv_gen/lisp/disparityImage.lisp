; Auto-generated. Do not edit!


(cl:in-package image_adaptor-srv)


;//! \htmlinclude disparityImage-request.msg.html

(cl:defclass <disparityImage-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass disparityImage-request (<disparityImage-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <disparityImage-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'disparityImage-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<disparityImage-request> is deprecated: use image_adaptor-srv:disparityImage-request instead.")))

(cl:ensure-generic-function 'topicName-val :lambda-list '(m))
(cl:defmethod topicName-val ((m <disparityImage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:topicName-val is deprecated.  Use image_adaptor-srv:topicName instead.")
  (topicName m))

(cl:ensure-generic-function 'nImages-val :lambda-list '(m))
(cl:defmethod nImages-val ((m <disparityImage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:nImages-val is deprecated.  Use image_adaptor-srv:nImages instead.")
  (nImages m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <disparityImage-request>) ostream)
  "Serializes a message object of type '<disparityImage-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <disparityImage-request>) istream)
  "Deserializes a message object of type '<disparityImage-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<disparityImage-request>)))
  "Returns string type for a service object of type '<disparityImage-request>"
  "image_adaptor/disparityImageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'disparityImage-request)))
  "Returns string type for a service object of type 'disparityImage-request"
  "image_adaptor/disparityImageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<disparityImage-request>)))
  "Returns md5sum for a message object of type '<disparityImage-request>"
  "bfcb2e11f547d8ad6e76efe895d5f9e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'disparityImage-request)))
  "Returns md5sum for a message object of type 'disparityImage-request"
  "bfcb2e11f547d8ad6e76efe895d5f9e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<disparityImage-request>)))
  "Returns full string definition for message of type '<disparityImage-request>"
  (cl:format cl:nil "string topicName~%int64 nImages~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'disparityImage-request)))
  "Returns full string definition for message of type 'disparityImage-request"
  (cl:format cl:nil "string topicName~%int64 nImages~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <disparityImage-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'topicName))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <disparityImage-request>))
  "Converts a ROS message object to a list"
  (cl:list 'disparityImage-request
    (cl:cons ':topicName (topicName msg))
    (cl:cons ':nImages (nImages msg))
))
;//! \htmlinclude disparityImage-response.msg.html

(cl:defclass <disparityImage-response> (roslisp-msg-protocol:ros-message)
  ((images
    :reader images
    :initarg :images
    :type (cl:vector stereo_msgs-msg:DisparityImage)
   :initform (cl:make-array 0 :element-type 'stereo_msgs-msg:DisparityImage :initial-element (cl:make-instance 'stereo_msgs-msg:DisparityImage))))
)

(cl:defclass disparityImage-response (<disparityImage-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <disparityImage-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'disparityImage-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_adaptor-srv:<disparityImage-response> is deprecated: use image_adaptor-srv:disparityImage-response instead.")))

(cl:ensure-generic-function 'images-val :lambda-list '(m))
(cl:defmethod images-val ((m <disparityImage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_adaptor-srv:images-val is deprecated.  Use image_adaptor-srv:images instead.")
  (images m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <disparityImage-response>) ostream)
  "Serializes a message object of type '<disparityImage-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'images))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'images))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <disparityImage-response>) istream)
  "Deserializes a message object of type '<disparityImage-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'images) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'images)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'stereo_msgs-msg:DisparityImage))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<disparityImage-response>)))
  "Returns string type for a service object of type '<disparityImage-response>"
  "image_adaptor/disparityImageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'disparityImage-response)))
  "Returns string type for a service object of type 'disparityImage-response"
  "image_adaptor/disparityImageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<disparityImage-response>)))
  "Returns md5sum for a message object of type '<disparityImage-response>"
  "bfcb2e11f547d8ad6e76efe895d5f9e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'disparityImage-response)))
  "Returns md5sum for a message object of type 'disparityImage-response"
  "bfcb2e11f547d8ad6e76efe895d5f9e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<disparityImage-response>)))
  "Returns full string definition for message of type '<disparityImage-response>"
  (cl:format cl:nil "stereo_msgs/DisparityImage[] images~%~%~%~%================================================================================~%MSG: stereo_msgs/DisparityImage~%# Separate header for compatibility with current TimeSynchronizer.~%# Likely to be removed in a later release, use image.header instead.~%Header header~%~%# Floating point disparity image. The disparities are pre-adjusted for any~%# x-offset between the principal points of the two cameras (in the case~%# that they are verged). That is: d = x_l - x_r - (cx_l - cx_r)~%sensor_msgs/Image image~%~%# Stereo geometry. For disparity d, the depth from the camera is Z = fT/d.~%float32 f # Focal length, pixels~%float32 T # Baseline, world units~%~%# Subwindow of (potentially) valid disparity values.~%sensor_msgs/RegionOfInterest valid_window~%~%# The range of disparities searched.~%# In the disparity image, any disparity less than min_disparity is invalid.~%# The disparity search range defines the horopter, or 3D volume that the~%# stereo algorithm can \"see\". Points with Z outside of:~%#     Z_min = fT / max_disparity~%#     Z_max = fT / min_disparity~%# could not be found.~%float32 min_disparity~%float32 max_disparity~%~%# Smallest allowed disparity increment. The smallest achievable depth range~%# resolution is delta_Z = (Z^2/fT)*delta_d.~%float32 delta_d~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in src/image_encodings.cpp~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: sensor_msgs/RegionOfInterest~%# This message is used to specify a region of interest within an image.~%#~%# When used to specify the ROI setting of the camera when the image was~%# taken, the height and width fields should either match the height and~%# width fields for the associated image; or height = width = 0~%# indicates that the full resolution image was captured.~%~%uint32 x_offset  # Leftmost pixel of the ROI~%                 # (0 if the ROI includes the left edge of the image)~%uint32 y_offset  # Topmost pixel of the ROI~%                 # (0 if the ROI includes the top edge of the image)~%uint32 height    # Height of ROI~%uint32 width     # Width of ROI~%~%# True if a distinct rectified ROI should be calculated from the \"raw\"~%# ROI in this message. Typically this should be False if the full image~%# is captured (ROI not used), and True if a subwindow is captured (ROI~%# used).~%bool do_rectify~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'disparityImage-response)))
  "Returns full string definition for message of type 'disparityImage-response"
  (cl:format cl:nil "stereo_msgs/DisparityImage[] images~%~%~%~%================================================================================~%MSG: stereo_msgs/DisparityImage~%# Separate header for compatibility with current TimeSynchronizer.~%# Likely to be removed in a later release, use image.header instead.~%Header header~%~%# Floating point disparity image. The disparities are pre-adjusted for any~%# x-offset between the principal points of the two cameras (in the case~%# that they are verged). That is: d = x_l - x_r - (cx_l - cx_r)~%sensor_msgs/Image image~%~%# Stereo geometry. For disparity d, the depth from the camera is Z = fT/d.~%float32 f # Focal length, pixels~%float32 T # Baseline, world units~%~%# Subwindow of (potentially) valid disparity values.~%sensor_msgs/RegionOfInterest valid_window~%~%# The range of disparities searched.~%# In the disparity image, any disparity less than min_disparity is invalid.~%# The disparity search range defines the horopter, or 3D volume that the~%# stereo algorithm can \"see\". Points with Z outside of:~%#     Z_min = fT / max_disparity~%#     Z_max = fT / min_disparity~%# could not be found.~%float32 min_disparity~%float32 max_disparity~%~%# Smallest allowed disparity increment. The smallest achievable depth range~%# resolution is delta_Z = (Z^2/fT)*delta_d.~%float32 delta_d~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in src/image_encodings.cpp~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: sensor_msgs/RegionOfInterest~%# This message is used to specify a region of interest within an image.~%#~%# When used to specify the ROI setting of the camera when the image was~%# taken, the height and width fields should either match the height and~%# width fields for the associated image; or height = width = 0~%# indicates that the full resolution image was captured.~%~%uint32 x_offset  # Leftmost pixel of the ROI~%                 # (0 if the ROI includes the left edge of the image)~%uint32 y_offset  # Topmost pixel of the ROI~%                 # (0 if the ROI includes the top edge of the image)~%uint32 height    # Height of ROI~%uint32 width     # Width of ROI~%~%# True if a distinct rectified ROI should be calculated from the \"raw\"~%# ROI in this message. Typically this should be False if the full image~%# is captured (ROI not used), and True if a subwindow is captured (ROI~%# used).~%bool do_rectify~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <disparityImage-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'images) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <disparityImage-response>))
  "Converts a ROS message object to a list"
  (cl:list 'disparityImage-response
    (cl:cons ':images (images msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'disparityImage)))
  'disparityImage-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'disparityImage)))
  'disparityImage-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'disparityImage)))
  "Returns string type for a service object of type '<disparityImage>"
  "image_adaptor/disparityImage")