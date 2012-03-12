
//=============================================================================
//  *****    GENERAL INCLUDES (c++ libraries and functionalities)    *****
//=============================================================================
#include "ros/ros.h"
#include <cstdlib>
#include <regex>



//=============================================================================
//  *****    ROS INCLUDES (services, messages, ROS libraries, etc)    *****
//=============================================================================
//  *****    Headers for Services    *****
//  *****   *****   *****   *****   *****   *****   *****   *****   *****
//TODO: This could be a single "includeServices.h" header, right?
#include "image_adaptor/booleanValue.h"
#include "image_adaptor/floatValue.h"
#include "image_adaptor/intValue.h"
#include "image_adaptor/stringValue.h"

#include "image_adaptor/disparityImage.h"
#include "image_adaptor/normalImage.h"

#include "image_adaptor/setBoolean.h"
#include "image_adaptor/setFloat.h"
#include "image_adaptor/setInteger.h"
#include "image_adaptor/setString.h"

//  *****    Headers for Messages    *****
//  *****   *****   *****   *****   *****   *****   *****   *****   *****
/*
#include "std_msgs/setBoolean.h"
#include "stereo_msgs/setFloat.h"
#include "sensor_msgs/setInteger.h"

#include "image_adaptor_msgs/integer.h"
*/
/*
from std_msgs.msg import *
from stereo_msgs.msg import *
from sensor_msgs.msg import *
*/

//  *****    ROS libraries for functionalities    *****
//  *****   *****   *****   *****   *****   *****   *****   *****   *****
#include <dynamic_reconfigure/server.h>
//****Client not yet implemented for C++****//

//  *****    dynamic reconfigure configuration    *****
//  *****   *****   *****   *****   *****   *****   *****   *****   *****
#include <image_adaptor/PropertiesConfig.h>


//=============================================================================
//    *****    NAMESPACE definition and inclusions
//=============================================================================

using std::vector;
namespace image_interface {



//=============================================================================
//    *****    DEFINED CONSTANTS    *****
//=============================================================================
#define PACKAGE_NAME 'image_adaptor'
#define NODE_NAME "img_cpp_iface"
#define NAMESPACE "/" //TODO: #define NAMESPACE vble_NAMESPACE; vble_NAMESPACE = rospy.get_namespace()
#define DEFAULT_TIMEOUT 3




//=============================================================================
//  *****    OTHER DEFINITIONS (enum of properties, types, etc...    *****
//=============================================================================

enum ppty
{
    PPTY_REF = 0,
    PPTY_TYPE = 1,
    PPTY_KIND = 2
}

//remoteType = {str: String, int: UInt16, float: Float64, bool: Bool}
//kindOfProperty = set(["dynParam", "outParam", "publishedTopic", "subscriberTopic", "topic", "topicName", "virtual"])





//=============================================================================
//  *****    PUBLIC FREE FUNCTION DEFINITIONS    *****
//=============================================================================

// 'add' function to compute the response for the AddTwoInts example service
bool add(beginner_tutorials::AddTwoInts::Request  &req,
         beginner_tutorials::AddTwoInts::Response &res )
{
    res.sum = req.a + req.b;
    ROS_INFO("request: x=%ld, y=%ld", (long int)req.a, (long int)req.b);
    ROS_INFO("sending back response: [%ld]", (long int)res.sum);
    return true;
}


// 'callback' function for the dynamic_reconfigure server example callback
void callback(dynamic_tutorials::TutorialsConfig &config, uint32_t level) {
    ROS_INFO("Reconfigure Request: %d %f %s %s %d", 
            config.int_param, config.double_param, 
            config.str_param.c_str(), 
            config.bool_param?"True":"False", 
            config.size);
}



//=============================================================================
//  *****    CLASS DEFINITIONS    *****
//=============================================================================


// class ImageIfaceNode: ## This is the LISTENER for the layer ABOVE
// class PropertyTranslator:
// class Manager3D: ## This is the MANAGER for the layer below


//=============================================================================
//  *****    MAIN FUNCTION DEFINITION    *****
//=============================================================================

int main(int argc, char **argv)
{
    print "Initializing node"
    ros::init(argc, argv, NODE_NAME);
    if (argc != 3)
    {
        ROS_INFO("usage: add_two_ints_client X Y");
        return 1;
    }
    ros::NodeHandle n;

//=============================================================================
// Dynamic_reconfigure server set up and launch
//***************************************************************************
        // Declare the Dynamic Reconfigure Server according to the "PropertiesConfig" config
    dynamic_reconfigure::Server<image_adaptor::PropertiesConfig> dyn_server;
        // Declare a callbackType variable for storing the binding
    dynamic_reconfigure::Server<image_adaptor::PropertiesConfig>::CallbackType dyn_server_callback_type;
        // Create a binding with the callback function
    dyn_server_callback_type = boost::bind(&callback, _1, _2);
        // Asign the callback function binding to the created server
    dyn_server.setCallback(dyn_server_callback_type);

    ROS_INFO("Spinning node");

//=============================================================================
// Service code from the SERVER part
//***************************************************************************
    ros::ServiceServer service = n.advertiseService("img_cpp_iface", add);
    ROS_INFO("Ready to add two ints.");

//=============================================================================
// Service code from the CLIENT part
//***************************************************************************
    ros::ServiceClient client = n.serviceClient<beginner_tutorials::AddTwoInts>("img_cpp_iface");
    beginner_tutorials::AddTwoInts srv;
    srv.request.a = atoll(argv[1]);
    srv.request.b = atoll(argv[2]);
    if (client.call(srv))
    {
        ROS_INFO("Sum: %ld", (long int)srv.response.sum);
    }
    else
    {
        ROS_ERROR("Failed to call service add_two_ints");
        return 1;
    }

//=============================================================================
// The code should stop here and just answer to events
//***************************************************************************
    ros::spin();

    return 0;
}
//=============================================================================


//=============================================================================
} //namespace
//=============================================================================

