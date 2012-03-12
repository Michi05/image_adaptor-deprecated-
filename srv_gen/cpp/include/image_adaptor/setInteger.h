/* Auto-generated by genmsg_cpp for file /home/super/ros_workspace/image_adaptor/srv/setInteger.srv */
#ifndef IMAGE_ADAPTOR_SERVICE_SETINTEGER_H
#define IMAGE_ADAPTOR_SERVICE_SETINTEGER_H
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
struct setIntegerRequest_ {
  typedef setIntegerRequest_<ContainerAllocator> Type;

  setIntegerRequest_()
  : topicName()
  , newValue(0)
  {
  }

  setIntegerRequest_(const ContainerAllocator& _alloc)
  : topicName(_alloc)
  , newValue(0)
  {
  }

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _topicName_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  topicName;

  typedef int64_t _newValue_type;
  int64_t newValue;


private:
  static const char* __s_getDataType_() { return "image_adaptor/setIntegerRequest"; }
public:
  ROS_DEPRECATED static const std::string __s_getDataType() { return __s_getDataType_(); }

  ROS_DEPRECATED const std::string __getDataType() const { return __s_getDataType_(); }

private:
  static const char* __s_getMD5Sum_() { return "63fa479b4ed38f09f65f376abd1efadc"; }
public:
  ROS_DEPRECATED static const std::string __s_getMD5Sum() { return __s_getMD5Sum_(); }

  ROS_DEPRECATED const std::string __getMD5Sum() const { return __s_getMD5Sum_(); }

private:
  static const char* __s_getServerMD5Sum_() { return "5e7c73c54dceb5dacb1b73908f3afdcb"; }
public:
  ROS_DEPRECATED static const std::string __s_getServerMD5Sum() { return __s_getServerMD5Sum_(); }

  ROS_DEPRECATED const std::string __getServerMD5Sum() const { return __s_getServerMD5Sum_(); }

private:
  static const char* __s_getMessageDefinition_() { return "string topicName\n\
int64 newValue\n\
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

  typedef boost::shared_ptr< ::image_adaptor::setIntegerRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::image_adaptor::setIntegerRequest_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct setIntegerRequest
typedef  ::image_adaptor::setIntegerRequest_<std::allocator<void> > setIntegerRequest;

typedef boost::shared_ptr< ::image_adaptor::setIntegerRequest> setIntegerRequestPtr;
typedef boost::shared_ptr< ::image_adaptor::setIntegerRequest const> setIntegerRequestConstPtr;


template <class ContainerAllocator>
struct setIntegerResponse_ {
  typedef setIntegerResponse_<ContainerAllocator> Type;

  setIntegerResponse_()
  : setAnswer()
  {
  }

  setIntegerResponse_(const ContainerAllocator& _alloc)
  : setAnswer(_alloc)
  {
  }

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _setAnswer_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  setAnswer;


private:
  static const char* __s_getDataType_() { return "image_adaptor/setIntegerResponse"; }
public:
  ROS_DEPRECATED static const std::string __s_getDataType() { return __s_getDataType_(); }

  ROS_DEPRECATED const std::string __getDataType() const { return __s_getDataType_(); }

private:
  static const char* __s_getMD5Sum_() { return "29ec6205a21c6c9d10f6202c509b169a"; }
public:
  ROS_DEPRECATED static const std::string __s_getMD5Sum() { return __s_getMD5Sum_(); }

  ROS_DEPRECATED const std::string __getMD5Sum() const { return __s_getMD5Sum_(); }

private:
  static const char* __s_getServerMD5Sum_() { return "5e7c73c54dceb5dacb1b73908f3afdcb"; }
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

  typedef boost::shared_ptr< ::image_adaptor::setIntegerResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::image_adaptor::setIntegerResponse_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct setIntegerResponse
typedef  ::image_adaptor::setIntegerResponse_<std::allocator<void> > setIntegerResponse;

typedef boost::shared_ptr< ::image_adaptor::setIntegerResponse> setIntegerResponsePtr;
typedef boost::shared_ptr< ::image_adaptor::setIntegerResponse const> setIntegerResponseConstPtr;

struct setInteger
{

typedef setIntegerRequest Request;
typedef setIntegerResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;
}; // struct setInteger
} // namespace image_adaptor

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::image_adaptor::setIntegerRequest_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::image_adaptor::setIntegerRequest_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::image_adaptor::setIntegerRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "63fa479b4ed38f09f65f376abd1efadc";
  }

  static const char* value(const  ::image_adaptor::setIntegerRequest_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x63fa479b4ed38f09ULL;
  static const uint64_t static_value2 = 0xf65f376abd1efadcULL;
};

template<class ContainerAllocator>
struct DataType< ::image_adaptor::setIntegerRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "image_adaptor/setIntegerRequest";
  }

  static const char* value(const  ::image_adaptor::setIntegerRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::image_adaptor::setIntegerRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "string topicName\n\
int64 newValue\n\
\n\
";
  }

  static const char* value(const  ::image_adaptor::setIntegerRequest_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros


namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::image_adaptor::setIntegerResponse_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::image_adaptor::setIntegerResponse_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::image_adaptor::setIntegerResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "29ec6205a21c6c9d10f6202c509b169a";
  }

  static const char* value(const  ::image_adaptor::setIntegerResponse_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x29ec6205a21c6c9dULL;
  static const uint64_t static_value2 = 0x10f6202c509b169aULL;
};

template<class ContainerAllocator>
struct DataType< ::image_adaptor::setIntegerResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "image_adaptor/setIntegerResponse";
  }

  static const char* value(const  ::image_adaptor::setIntegerResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::image_adaptor::setIntegerResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "string setAnswer\n\
\n\
\n\
";
  }

  static const char* value(const  ::image_adaptor::setIntegerResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::image_adaptor::setIntegerRequest_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.topicName);
    stream.next(m.newValue);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct setIntegerRequest_
} // namespace serialization
} // namespace ros


namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::image_adaptor::setIntegerResponse_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.setAnswer);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct setIntegerResponse_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace service_traits
{
template<>
struct MD5Sum<image_adaptor::setInteger> {
  static const char* value() 
  {
    return "5e7c73c54dceb5dacb1b73908f3afdcb";
  }

  static const char* value(const image_adaptor::setInteger&) { return value(); } 
};

template<>
struct DataType<image_adaptor::setInteger> {
  static const char* value() 
  {
    return "image_adaptor/setInteger";
  }

  static const char* value(const image_adaptor::setInteger&) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<image_adaptor::setIntegerRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "5e7c73c54dceb5dacb1b73908f3afdcb";
  }

  static const char* value(const image_adaptor::setIntegerRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<image_adaptor::setIntegerRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "image_adaptor/setInteger";
  }

  static const char* value(const image_adaptor::setIntegerRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<image_adaptor::setIntegerResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "5e7c73c54dceb5dacb1b73908f3afdcb";
  }

  static const char* value(const image_adaptor::setIntegerResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<image_adaptor::setIntegerResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "image_adaptor/setInteger";
  }

  static const char* value(const image_adaptor::setIntegerResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace service_traits
} // namespace ros

#endif // IMAGE_ADAPTOR_SERVICE_SETINTEGER_H
