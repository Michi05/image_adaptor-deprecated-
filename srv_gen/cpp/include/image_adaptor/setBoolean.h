/* Auto-generated by genmsg_cpp for file /home/super/ros_workspace/image_adaptor/srv/setBoolean.srv */
#ifndef IMAGE_ADAPTOR_SERVICE_SETBOOLEAN_H
#define IMAGE_ADAPTOR_SERVICE_SETBOOLEAN_H
#include <string>
#include <vector>
#include <map>
#include <ostream>
#include "ros/serialization.h"
#include "ros/builtin_message_traits.h"
#include "ros/message_operations.h"
#include "ros/time.h"

#include "ros/macros.h"

#include "ros/assert.h"

#include "ros/service_traits.h"




namespace image_adaptor
{
template <class ContainerAllocator>
struct setBooleanRequest_ {
  typedef setBooleanRequest_<ContainerAllocator> Type;

  setBooleanRequest_()
  : topicName()
  , newValue(false)
  {
  }

  setBooleanRequest_(const ContainerAllocator& _alloc)
  : topicName(_alloc)
  , newValue(false)
  {
  }

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _topicName_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  topicName;

  typedef uint8_t _newValue_type;
  uint8_t newValue;


private:
  static const char* __s_getDataType_() { return "image_adaptor/setBooleanRequest"; }
public:
  ROS_DEPRECATED static const std::string __s_getDataType() { return __s_getDataType_(); }

  ROS_DEPRECATED const std::string __getDataType() const { return __s_getDataType_(); }

private:
  static const char* __s_getMD5Sum_() { return "ea7f36159508c763698feeeea10ee2bc"; }
public:
  ROS_DEPRECATED static const std::string __s_getMD5Sum() { return __s_getMD5Sum_(); }

  ROS_DEPRECATED const std::string __getMD5Sum() const { return __s_getMD5Sum_(); }

private:
  static const char* __s_getServerMD5Sum_() { return "3033c2979f4e4675025fc2914d653e07"; }
public:
  ROS_DEPRECATED static const std::string __s_getServerMD5Sum() { return __s_getServerMD5Sum_(); }

  ROS_DEPRECATED const std::string __getServerMD5Sum() const { return __s_getServerMD5Sum_(); }

private:
  static const char* __s_getMessageDefinition_() { return "string topicName\n\
bool newValue\n\
\n\
"; }
public:
  ROS_DEPRECATED static const std::string __s_getMessageDefinition() { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED const std::string __getMessageDefinition() const { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED virtual uint8_t *serialize(uint8_t *write_ptr, uint32_t seq) const
  {
    ros::serialization::OStream stream(write_ptr, 1000000000);
    ros::serialization::serialize(stream, topicName);
    ros::serialization::serialize(stream, newValue);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint8_t *deserialize(uint8_t *read_ptr)
  {
    ros::serialization::IStream stream(read_ptr, 1000000000);
    ros::serialization::deserialize(stream, topicName);
    ros::serialization::deserialize(stream, newValue);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint32_t serializationLength() const
  {
    uint32_t size = 0;
    size += ros::serialization::serializationLength(topicName);
    size += ros::serialization::serializationLength(newValue);
    return size;
  }

  typedef boost::shared_ptr< ::image_adaptor::setBooleanRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::image_adaptor::setBooleanRequest_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct setBooleanRequest
typedef  ::image_adaptor::setBooleanRequest_<std::allocator<void> > setBooleanRequest;

typedef boost::shared_ptr< ::image_adaptor::setBooleanRequest> setBooleanRequestPtr;
typedef boost::shared_ptr< ::image_adaptor::setBooleanRequest const> setBooleanRequestConstPtr;


template <class ContainerAllocator>
struct setBooleanResponse_ {
  typedef setBooleanResponse_<ContainerAllocator> Type;

  setBooleanResponse_()
  : setAnswer()
  {
  }

  setBooleanResponse_(const ContainerAllocator& _alloc)
  : setAnswer(_alloc)
  {
  }

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _setAnswer_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  setAnswer;


private:
  static const char* __s_getDataType_() { return "image_adaptor/setBooleanResponse"; }
public:
  ROS_DEPRECATED static const std::string __s_getDataType() { return __s_getDataType_(); }

  ROS_DEPRECATED const std::string __getDataType() const { return __s_getDataType_(); }

private:
  static const char* __s_getMD5Sum_() { return "29ec6205a21c6c9d10f6202c509b169a"; }
public:
  ROS_DEPRECATED static const std::string __s_getMD5Sum() { return __s_getMD5Sum_(); }

  ROS_DEPRECATED const std::string __getMD5Sum() const { return __s_getMD5Sum_(); }

private:
  static const char* __s_getServerMD5Sum_() { return "3033c2979f4e4675025fc2914d653e07"; }
public:
  ROS_DEPRECATED static const std::string __s_getServerMD5Sum() { return __s_getServerMD5Sum_(); }

  ROS_DEPRECATED const std::string __getServerMD5Sum() const { return __s_getServerMD5Sum_(); }

private:
  static const char* __s_getMessageDefinition_() { return "string setAnswer\n\
\n\
\n\
"; }
public:
  ROS_DEPRECATED static const std::string __s_getMessageDefinition() { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED const std::string __getMessageDefinition() const { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED virtual uint8_t *serialize(uint8_t *write_ptr, uint32_t seq) const
  {
    ros::serialization::OStream stream(write_ptr, 1000000000);
    ros::serialization::serialize(stream, setAnswer);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint8_t *deserialize(uint8_t *read_ptr)
  {
    ros::serialization::IStream stream(read_ptr, 1000000000);
    ros::serialization::deserialize(stream, setAnswer);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint32_t serializationLength() const
  {
    uint32_t size = 0;
    size += ros::serialization::serializationLength(setAnswer);
    return size;
  }

  typedef boost::shared_ptr< ::image_adaptor::setBooleanResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::image_adaptor::setBooleanResponse_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct setBooleanResponse
typedef  ::image_adaptor::setBooleanResponse_<std::allocator<void> > setBooleanResponse;

typedef boost::shared_ptr< ::image_adaptor::setBooleanResponse> setBooleanResponsePtr;
typedef boost::shared_ptr< ::image_adaptor::setBooleanResponse const> setBooleanResponseConstPtr;

struct setBoolean
{

typedef setBooleanRequest Request;
typedef setBooleanResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;
}; // struct setBoolean
} // namespace image_adaptor

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::image_adaptor::setBooleanRequest_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::image_adaptor::setBooleanRequest_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::image_adaptor::setBooleanRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "ea7f36159508c763698feeeea10ee2bc";
  }

  static const char* value(const  ::image_adaptor::setBooleanRequest_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xea7f36159508c763ULL;
  static const uint64_t static_value2 = 0x698feeeea10ee2bcULL;
};

template<class ContainerAllocator>
struct DataType< ::image_adaptor::setBooleanRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "image_adaptor/setBooleanRequest";
  }

  static const char* value(const  ::image_adaptor::setBooleanRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::image_adaptor::setBooleanRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "string topicName\n\
bool newValue\n\
\n\
";
  }

  static const char* value(const  ::image_adaptor::setBooleanRequest_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros


namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::image_adaptor::setBooleanResponse_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::image_adaptor::setBooleanResponse_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::image_adaptor::setBooleanResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "29ec6205a21c6c9d10f6202c509b169a";
  }

  static const char* value(const  ::image_adaptor::setBooleanResponse_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x29ec6205a21c6c9dULL;
  static const uint64_t static_value2 = 0x10f6202c509b169aULL;
};

template<class ContainerAllocator>
struct DataType< ::image_adaptor::setBooleanResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "image_adaptor/setBooleanResponse";
  }

  static const char* value(const  ::image_adaptor::setBooleanResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::image_adaptor::setBooleanResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "string setAnswer\n\
\n\
\n\
";
  }

  static const char* value(const  ::image_adaptor::setBooleanResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::image_adaptor::setBooleanRequest_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.topicName);
    stream.next(m.newValue);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct setBooleanRequest_
} // namespace serialization
} // namespace ros


namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::image_adaptor::setBooleanResponse_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.setAnswer);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct setBooleanResponse_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace service_traits
{
template<>
struct MD5Sum<image_adaptor::setBoolean> {
  static const char* value() 
  {
    return "3033c2979f4e4675025fc2914d653e07";
  }

  static const char* value(const image_adaptor::setBoolean&) { return value(); } 
};

template<>
struct DataType<image_adaptor::setBoolean> {
  static const char* value() 
  {
    return "image_adaptor/setBoolean";
  }

  static const char* value(const image_adaptor::setBoolean&) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<image_adaptor::setBooleanRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "3033c2979f4e4675025fc2914d653e07";
  }

  static const char* value(const image_adaptor::setBooleanRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<image_adaptor::setBooleanRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "image_adaptor/setBoolean";
  }

  static const char* value(const image_adaptor::setBooleanRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<image_adaptor::setBooleanResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "3033c2979f4e4675025fc2914d653e07";
  }

  static const char* value(const image_adaptor::setBooleanResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<image_adaptor::setBooleanResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "image_adaptor/setBoolean";
  }

  static const char* value(const image_adaptor::setBooleanResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace service_traits
} // namespace ros

#endif // IMAGE_ADAPTOR_SERVICE_SETBOOLEAN_H
