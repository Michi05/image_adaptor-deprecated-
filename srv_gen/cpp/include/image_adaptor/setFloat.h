/* Auto-generated by genmsg_cpp for file /home/super/ros_workspace/image_adaptor/srv/setFloat.srv */
#ifndef IMAGE_ADAPTOR_SERVICE_SETFLOAT_H
#define IMAGE_ADAPTOR_SERVICE_SETFLOAT_H
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
struct setFloatRequest_ {
  typedef setFloatRequest_<ContainerAllocator> Type;

  setFloatRequest_()
  : topicName()
  , newValue(0.0)
  {
  }

  setFloatRequest_(const ContainerAllocator& _alloc)
  : topicName(_alloc)
  , newValue(0.0)
  {
  }

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _topicName_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  topicName;

  typedef double _newValue_type;
  double newValue;


private:
  static const char* __s_getDataType_() { return "image_adaptor/setFloatRequest"; }
public:
  ROS_DEPRECATED static const std::string __s_getDataType() { return __s_getDataType_(); }

  ROS_DEPRECATED const std::string __getDataType() const { return __s_getDataType_(); }

private:
  static const char* __s_getMD5Sum_() { return "b1ab60507dc5afd1d1e54139f9ee670c"; }
public:
  ROS_DEPRECATED static const std::string __s_getMD5Sum() { return __s_getMD5Sum_(); }

  ROS_DEPRECATED const std::string __getMD5Sum() const { return __s_getMD5Sum_(); }

private:
  static const char* __s_getServerMD5Sum_() { return "534d71573526d91e225c2160dfe4b29d"; }
public:
  ROS_DEPRECATED static const std::string __s_getServerMD5Sum() { return __s_getServerMD5Sum_(); }

  ROS_DEPRECATED const std::string __getServerMD5Sum() const { return __s_getServerMD5Sum_(); }

private:
  static const char* __s_getMessageDefinition_() { return "string topicName\n\
float64 newValue\n\
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

  typedef boost::shared_ptr< ::image_adaptor::setFloatRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::image_adaptor::setFloatRequest_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct setFloatRequest
typedef  ::image_adaptor::setFloatRequest_<std::allocator<void> > setFloatRequest;

typedef boost::shared_ptr< ::image_adaptor::setFloatRequest> setFloatRequestPtr;
typedef boost::shared_ptr< ::image_adaptor::setFloatRequest const> setFloatRequestConstPtr;


template <class ContainerAllocator>
struct setFloatResponse_ {
  typedef setFloatResponse_<ContainerAllocator> Type;

  setFloatResponse_()
  : setAnswer(0.0)
  {
  }

  setFloatResponse_(const ContainerAllocator& _alloc)
  : setAnswer(0.0)
  {
  }

  typedef double _setAnswer_type;
  double setAnswer;


private:
  static const char* __s_getDataType_() { return "image_adaptor/setFloatResponse"; }
public:
  ROS_DEPRECATED static const std::string __s_getDataType() { return __s_getDataType_(); }

  ROS_DEPRECATED const std::string __getDataType() const { return __s_getDataType_(); }

private:
  static const char* __s_getMD5Sum_() { return "ba18d35a4d3cea370e755997f303d718"; }
public:
  ROS_DEPRECATED static const std::string __s_getMD5Sum() { return __s_getMD5Sum_(); }

  ROS_DEPRECATED const std::string __getMD5Sum() const { return __s_getMD5Sum_(); }

private:
  static const char* __s_getServerMD5Sum_() { return "534d71573526d91e225c2160dfe4b29d"; }
public:
  ROS_DEPRECATED static const std::string __s_getServerMD5Sum() { return __s_getServerMD5Sum_(); }

  ROS_DEPRECATED const std::string __getServerMD5Sum() const { return __s_getServerMD5Sum_(); }

private:
  static const char* __s_getMessageDefinition_() { return "float64 setAnswer\n\
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

  typedef boost::shared_ptr< ::image_adaptor::setFloatResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::image_adaptor::setFloatResponse_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct setFloatResponse
typedef  ::image_adaptor::setFloatResponse_<std::allocator<void> > setFloatResponse;

typedef boost::shared_ptr< ::image_adaptor::setFloatResponse> setFloatResponsePtr;
typedef boost::shared_ptr< ::image_adaptor::setFloatResponse const> setFloatResponseConstPtr;

struct setFloat
{

typedef setFloatRequest Request;
typedef setFloatResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;
}; // struct setFloat
} // namespace image_adaptor

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::image_adaptor::setFloatRequest_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::image_adaptor::setFloatRequest_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::image_adaptor::setFloatRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "b1ab60507dc5afd1d1e54139f9ee670c";
  }

  static const char* value(const  ::image_adaptor::setFloatRequest_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xb1ab60507dc5afd1ULL;
  static const uint64_t static_value2 = 0xd1e54139f9ee670cULL;
};

template<class ContainerAllocator>
struct DataType< ::image_adaptor::setFloatRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "image_adaptor/setFloatRequest";
  }

  static const char* value(const  ::image_adaptor::setFloatRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::image_adaptor::setFloatRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "string topicName\n\
float64 newValue\n\
\n\
";
  }

  static const char* value(const  ::image_adaptor::setFloatRequest_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros


namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::image_adaptor::setFloatResponse_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::image_adaptor::setFloatResponse_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::image_adaptor::setFloatResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "ba18d35a4d3cea370e755997f303d718";
  }

  static const char* value(const  ::image_adaptor::setFloatResponse_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xba18d35a4d3cea37ULL;
  static const uint64_t static_value2 = 0x0e755997f303d718ULL;
};

template<class ContainerAllocator>
struct DataType< ::image_adaptor::setFloatResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "image_adaptor/setFloatResponse";
  }

  static const char* value(const  ::image_adaptor::setFloatResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::image_adaptor::setFloatResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "float64 setAnswer\n\
\n\
\n\
";
  }

  static const char* value(const  ::image_adaptor::setFloatResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::image_adaptor::setFloatResponse_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::image_adaptor::setFloatRequest_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.topicName);
    stream.next(m.newValue);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct setFloatRequest_
} // namespace serialization
} // namespace ros


namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::image_adaptor::setFloatResponse_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.setAnswer);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct setFloatResponse_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace service_traits
{
template<>
struct MD5Sum<image_adaptor::setFloat> {
  static const char* value() 
  {
    return "534d71573526d91e225c2160dfe4b29d";
  }

  static const char* value(const image_adaptor::setFloat&) { return value(); } 
};

template<>
struct DataType<image_adaptor::setFloat> {
  static const char* value() 
  {
    return "image_adaptor/setFloat";
  }

  static const char* value(const image_adaptor::setFloat&) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<image_adaptor::setFloatRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "534d71573526d91e225c2160dfe4b29d";
  }

  static const char* value(const image_adaptor::setFloatRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<image_adaptor::setFloatRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "image_adaptor/setFloat";
  }

  static const char* value(const image_adaptor::setFloatRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<image_adaptor::setFloatResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "534d71573526d91e225c2160dfe4b29d";
  }

  static const char* value(const image_adaptor::setFloatResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<image_adaptor::setFloatResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "image_adaptor/setFloat";
  }

  static const char* value(const image_adaptor::setFloatResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace service_traits
} // namespace ros

#endif // IMAGE_ADAPTOR_SERVICE_SETFLOAT_H

