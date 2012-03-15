#!/usr/bin/env python

## Initially needed constants    
globals()["PROP_CONFIG_FILENAME"] = "propertyConfigFile"
globals()["PACKAGE_NAME"] = 'image_adaptor'
globals()["NODE_NAME"] = 'img_adaptor'
globals()["dynParamServer"] = None

import roslib; roslib.load_manifest(PACKAGE_NAME)
import rospy
import sys

#from dynamic_reconfigure.encoding import Config as dynReconfConfig
# January23 - Including services
from image_adaptor.srv import *
# January 24 - Including ALL the standard types
#(I think they'll all be necessary at some point)
from std_msgs.msg import *
# January31 - Dynamic Reconfigure
from dynamic_reconfigure.client import Client as DynamicReconfigureClient
from dynamic_reconfigure.server import Server as DynamicReconfigureServer
from image_adaptor.cfg import PropertiesConfig
# February02 - Regular expressions
import re
# February14 - For line commands:
#os.system("rosrun dynamic_reconfigure...)
import os
from stereo_msgs.msg import *
from sensor_msgs.msg import *
# March12 - For argument evaluation:
import ast

# # # Self agreement:
        # "None" values mean that some Error was already reported
        # "False", negative or empty strings (depending on the place) mean that there was an error but still unknown
    #Reasons:
            #In case an error is not really taken into account; "None" will produce a second error that will be noticeable
            #Some structures haven't got any "empty" element to return but in the lowest level is sometimes possible to just
        #check if something is possible; read whatever the return value is (can be external) and answer whatever
            #In the lowest level, it should be possible to ask to check something: "if isThatThingWorking():" and get True
        #or False as the answer: but it's not an error that the answer is False, the error is finding that it shouldn't!

# # # This file is divided in three parts;
  # # # - 3D Data manager (communicate with layer below)
  # # # - 3D Data interface node (comm with layer above)
  # # # - 3D Property translator

# *********************************************    
#To avoid getting stuck in config updates...
#BAD AND DANGEROUS SOLUTION
#avoidSelfReconf = 0
#avoidRemoteReconf = 0
# These vbles are bypasses; they are incremented as many times as expected to avoid and if below 1,
#then there are unexpected reconfigures, ergo, they don't avoid handling
# *********************************************

## Assigning values to constants:
globals()["DEFAULT_TIMEOUT"] = 3
remoteType = {str: String, int: UInt16, float: Float64, bool: Bool}
kindOfProperty = set(["dynParam", "outParam", "publishedTopic", "subscriberTopic", "topic", "topicName", "virtual"])
ppty = {"reference":0, "type":1, "kind":2}
PPTY_REF = ppty["reference"]
PPTY_TYPE = ppty["type"]
PPTY_KIND = ppty["kind"]

class img_interface_node: ## This is the LISTENER for the layer ABOVE
## Static Data
    ## Services
    listOf_services = {}

## Constructor
    def __init__(self):
        self.avoidRemoteReconf = 0
        try:
            ## Dynamic Reconfigure
            self.avoidRemoteReconf = self.avoidRemoteReconf + 1
            self.dynServer = DynamicReconfigureServer(PropertiesConfig, self.dynServerCallback)
            ## Topics
            # ** EMPTY ** #
            print "Interface for requests created"
        except:
            print "Error while trying to initialize dynamic parameter server"
            raise
        return

##Methods:
#   Main function in order to remain listening
    def listenToRequests(self):
        self.listOf_services['getStringProperty'] = rospy.Service('getStringProperty', stringValue, self.getStringProperty)
        self.listOf_services['getIntProperty'] = rospy.Service('getIntProperty', intValue, self.getIntProperty)
        self.listOf_services['getFloatProperty'] = rospy.Service('getFloatProperty', floatValue, self.getFloatProperty)
        self.listOf_services['getBoolProperty'] = rospy.Service('getBoolProperty', booleanValue, self.getBoolProperty)

##MICHI: 14Feb2012
        self.listOf_services['getDispImage'] = rospy.Service('getDispImage', disparityImage, self.getDispImage)
        self.listOf_services['getImage'] = rospy.Service('getImage', normalImage, self.getImage)
        
        self.listOf_services['setStrProperty'] = rospy.Service('setStrProperty', setString, self.setStrProperty)
        self.listOf_services['setIntProperty'] = rospy.Service('setIntProperty', setInteger, self.setIntProperty)
        self.listOf_services['setFloatProperty'] = rospy.Service('setFloatProperty', setFloat, self.setFloatProperty)
        self.listOf_services['setBoolProperty'] = rospy.Service('setBoolProperty', setBoolean, self.setBoolProperty)
        print "Ready to answer service requests."

    # Dynamic Reconfigure handler
    #Must return a configuration in the same format as received
    def dynServerCallback(self, dynConfiguration, levelCode):
        if self.avoidRemoteReconf > 0:
            print "LOCAL config was changed by self"
            self.avoidRemoteReconf = self.avoidRemoteReconf - 1
        elif levelCode != 0:
            print ("LOCAL configuration changed.".rjust(100, '_'))
            for elem in dynConfiguration:
                if properties.canSet(elem):
                    success = self.setAnyProperty(elem, dynConfiguration[elem])
                    if success == False or success == None:
                        print '|__> ...error... while setting property "%s"'%elem
                        print "Changing %s failed with %s..."%(elem,dynConfiguration[elem])
                        dynConfiguration[elem] = self.getAnyProperty(elem)
                        print "...%s used"%(dynConfiguration[elem])
                    else:
                        pass
        return dynConfiguration

    def changeSelfParameters(self, dynConfiguration, falling = False):
        chgReconf = DynamicReconfigureClient(rospy.get_name(), DEFAULT_TIMEOUT, (lambda *_, **__: None))
        if chgReconf == None:
            return False
        
        newConfig = {}
        for elem in dynConfiguration:
            paramName = properties.reverseInterpret(elem)
            if paramName != "":
                newValue = dynConfiguration[elem]
                newConfig[paramName] = newValue
            else:
                print "Error while retrieving reverse translation"

        requestResult = True
        self.avoidRemoteReconf = self.avoidRemoteReconf + 1
        if falling == True:
            print "rosrun dynamic_reconfigure dynparam set %s %s %s"%(rospy.get_name(), paramName, newValue)
            os.system("rosrun dynamic_reconfigure dynparam set %s %s %s"%(rospy.get_name(), paramName, newValue))
##TODO: reconsider the things above
        else:
            requestResult = chgReconf.update_configuration(newConfig)
        if requestResult != None:
            return True
        return False

# Generic handlers for the requests:
# Getter and Setter handlers
	# Generic setter in order to redirect to the appropriate method
    def setAnyProperty(self, propertyName, newValue):
        propertyData = properties.interpret(propertyName)
        if propertyData == None:
            return None
        #else:
        if (propertyData[PPTY_TYPE].lower()).find("string") >= 0:
#            if type(newValue) != str:
#                print "Error: value '%s' seems to be %s instead of '%s' which is needed"%(newValue, type(newValue), propertyData[PPTY_TYPE])
#                return None
            valueType = str
        elif (propertyData[PPTY_TYPE].lower()).find("int") >= 0:
            valueType = int
        elif (propertyData[PPTY_TYPE].lower()).find("double") >= 0 or (propertyData[PPTY_TYPE].lower()).find("float") >= 0:
            valueType = float
        elif (propertyData[PPTY_TYPE].lower()).find("bool") >= 0:
            valueType = bool
        else:
            print "Error: non registered value type"
            return None
        return self.setFixedTypeProperty(propertyName, newValue, valueType)

    #Specific fixed type property setters
    def setStrProperty(self, setStrMsg):
        return self.setFixedTypeProperty(setStrMsg.topicName, setStrMsg.newValue, str)
    def setIntProperty(self, setIntMsg):
        return self.setFixedTypeProperty(setStrMsg.topicName, setStrMsg.newValue, int)
    def setFloatProperty(self, setIntMsg):
        return self.setFixedTypeProperty(setStrMsg.topicName, setStrMsg.newValue, float)
    def setBoolProperty(self, setIntMsg):
        return self.setFixedTypeProperty(setStrMsg.topicName, setStrMsg.newValue, bool)

    def setFixedTypeProperty(self, propertyName, newValue, valueType):
        propertyData = properties.interpret(propertyName)
        if propertyData == None:
            print "Error: trying to set not found property."
            return None
        else:
            print "Obtained %s = %s."%(propertyName, propertyData[PPTY_REF])
        #TODO: Any type checking here?
        
        print "PropertyKind = ", propertyData[PPTY_KIND]
        print "Path: "
        print properties.get_param_basename(propertyData[PPTY_REF])
        print rospy.get_namespace() + propertyData[PPTY_REF]
        print "Basename: ", properties.get_param_basename(propertyData[PPTY_REF])
        #else:
        resp1 = True
        if propertyData[PPTY_KIND] == "dynParam":
            resp1 = driverMgr.setParameter(properties.get_param_basename(propertyData[PPTY_REF]), newValue)
        elif propertyData[PPTY_KIND] == "subscriberTopic" or propertyData[PPTY_KIND] == "topic":
            driverMgr.sendByTopic(rospy.get_namespace() + propertyData[PPTY_REF], newValue, remoteType[valueType])
        else:
            resp1 = False
            print "Error: unable to set property %s of kind: '%s'"%(propertyName, propertyData[PPTY_KIND])
        return resp1


# Getter and getter handlers
    # Generic setter in order to redirect to the appropriate method
    def getAnyProperty(self, propertyName):
        propertyData = properties.interpret(propertyName)
        if propertyData == None:
            return None
        #else:
        if propertyData[PPTY_TYPE].find("string") >= 0:
            valueType = str
        elif (propertyData[PPTY_TYPE].lower()).find("int") >= 0:
            valueType = int
        elif (propertyData[PPTY_TYPE].lower()).find("double") >= 0 or (propertyData[PPTY_TYPE].lower()).find("float") >= 0:
            valueType = float
        elif (propertyData[PPTY_TYPE].lower()).find("bool") >= 0:
            valueType = bool
        else:
            print "Error: non registered value type"
            return None
        return self.getFixedTypeProperty(propertyName, valueType)

    # Generic getter in order to redirect to the appropriate method
    #Specific fixed type property getters
    def getStringProperty(self, srvMsg):
        return self.getFixedTypeProperty(srvMsg.topicName, str)
    def getIntProperty(self, srvMsg):
        return self.getFixedTypeProperty(srvMsg.topicName, int)
    def getFloatProperty(self, srvMsg):
        return self.getFixedTypeProperty(srvMsg.topicName, float)
    def getBoolProperty(self, srvMsg):
        return self.getFixedTypeProperty(srvMsg.topicName, bool)
    def getDispImage(self, srvMsg):
        respImages = []
        while len(respImages) < srvMsg.nImages:
            respImages.append(self.getFixedTypeProperty(srvMsg.topicName, None))
        for image in respImages:
            driverMgr.sendByTopic("testImages", image, DisparityImage)
        return respImages
    def getImage(self, srvMsg):
        respImages = []
        while len(respImages) < srvMsg.nImages:
            respImages.append(self.getFixedTypeProperty(srvMsg.topicName, None))
##****************************** Temporary for Testing: ******************************
        propertyData = properties.interpret(srvMsg.topicName)
        for image in respImages:
            driverMgr.sendByTopic("testImages", image, Image)
            rospy.Rate(10).sleep()
##****************************** ********************** ******************************
        return respImages
##TODO: I could add timestamp (time[] timestamp) if needed
##Watch out; setStrMsg.topicName is from setStrMsg.srv and the ppty kind is called the same

    def getFixedTypeProperty(self, propertyName, valueType):
        propertyData = properties.interpret(propertyName)
        if propertyData == None:
            return None
        #else:
        if propertyData[PPTY_KIND] == "dynParam" or propertyData[PPTY_KIND] == "outParam":
            resp1 = driverMgr.getParameter(properties.get_param_basename(propertyData[PPTY_REF]))
        elif propertyData[PPTY_KIND] == "publishedTopic" or propertyData[PPTY_KIND] == "topic":
            resp1 = driverMgr.getTopic(propertyData[PPTY_REF], valueType)
        elif propertyData[PPTY_KIND] == "topicName":
##MICHI: 14Feb2012
            if valueType == str:
                resp1 = str(propertyData[PPTY_REF])
            else:
                valueType2 = DisparityImage
                if propertyData[PPTY_TYPE].find("Disparity") < 0:
                    valueType2 = Image
                resp1 = driverMgr.getTopic(propertyData[PPTY_REF], valueType2)
        else:
            print "Error: unable to get property %s of kind %s"%(propertyName, propertyData[PPTY_TYPE])
            resp1 = None
        print "I read %s and %s..."%(propertyData[PPTY_REF], resp1)
        return resp1


    # Method to request the complete list of properties
    def get_property_list(self):
        return properties.get_property_list()


class propertyTranslator:
    ## Data
## Watch out: these are static!!
    PropertyDictionary = {}
    ReversePropDict = {}    #what if the ReverseDict had only the names and not the properties?
    property_config_file = None
##Constructor
    def __init__(self,config_filename):
        try:
            property_config_file = config_filename
            self.PropertyDictionary = self.readPropertyConfig(file_name = config_filename)
            for elem in self.PropertyDictionary:
                self.ReversePropDict[self.PropertyDictionary[elem][0]] = elem
                self.ReversePropDict[self.PropertyDictionary[elem][0].split("/")[-1]] = elem
            print "Property configuration loaded"
        except:
            print "Error while reading property configuration from file"
            raise
        return

##Methods
    def reverseInterpret(self, reverseProperty):
        if reverseProperty in self.ReversePropDict:
            result = self.ReversePropDict[reverseProperty]
        elif str(dynParamServer + reverseProperty) in self.ReversePropDict:
            result = self.ReversePropDict[str(dynParamServer + reverseProperty)]
        else:
            print "not %s nor %s found in the property list."%(reverseProperty, str(dynParamServer + reverseProperty), self.ReversePropDict)
            return ""
        return result

    def canSet(self, propertyName):
        
        kindsToSet = set (["dynParam", "subscriberTopic", "topic"])
        if propertyName in self.PropertyDictionary:
            return ( self.PropertyDictionary[propertyName][PPTY_KIND] in kindsToSet )
        return False
    def canGet(self, propertyName):
        kindsToGet = set (["dynParam", "outParam", "publishedTopic", "topic"])
        if propertyName in self.PropertyDictionary:
            return ( self.PropertyDictionary[propertyName][PPTY_KIND] in kindsToSet )
        return False

    # Receives the fixed name of the property and
    #translates it into the needed data to read it
    def interpret(self, propertyName): # or translate? which is better name? (A)
        if propertyName in self.PropertyDictionary:
            resp1 = self.PropertyDictionary[propertyName]
#        dataString = rospy.get_param(rospy.search_param(propertyName))
        else:
            print "Property '%s' not found."%propertyName
            resp1 = None
        return resp1

    def get_param_basename(self, parameter):
        if len(parameter) < 1:
            return ""
        if len(parameter.split("/")[-1]) > 0:
            parameter = parameter.split("/")[-1]
        else:
            parameter = parameter.split("/")[-2]
        # Cleaning '~' in private names
        parameter = parameter[parameter.find('~')+1:]
        return parameter
    
    # Receives a file_name in which to read the properties
    #and answers with True if and only if the reading was ok
    def readPropertyConfig(self, file_name):
        tempDictionary = {}
        fd = open( file_name )
        if fd != None:
            content = fd.readline()
            while (content != "" ): ## A blank line still has \n
                if content.find('#') < 0:
                    # The next lines remove all the beginning and ending blanks and
                    #also the blanks near ':' and then splits using ':'
                    without_blanks01 = re.sub('(^([\t ]*)|([\t ]*)$)', "", content.replace( "\n", "" ).replace( "\r", "" ))
                    without_blanks02 = re.sub('( |\t)*,[\t ]*', ',', without_blanks01)
                    dataRead = re.sub('( |\t)*:[\t ]*', ':', without_blanks02).split(':')
                    if len(dataRead) == 2 and dataRead[0] != "" and dataRead[1] != "":
                        tempDictionary[dataRead[0]] = dataRead[1].split(',')
                content = fd.readline()
        print "_Translation Configuration read from YAML file:"
        for elem in tempDictionary:
            print elem, "\t:\t", tempDictionary[elem]
        return tempDictionary


    # Method to request the complete list of properties
    def get_property_list(self):
        paramList = {}
        for elem in PropertyDictionary:
            paramList[elem] = PropertyDictionary[elem][0]
        return properties.get_property_list()


class manager3D: ## This is the MANAGER for the layer below
## Static Data
    dynSrvTimeout = DEFAULT_TIMEOUT
## Constructor
    def __init__(self):
        self.avoidSelfReconf = 0
        try:
            ## TODO: BE VERY CAREFUL  with this; I don't know if "dynamic servers <=> set_parameters service"
            rospy.loginfo("Creating Dynamic Reconfigure Client; waiting for server in %s."%(rospy.get_namespace() + dynParamServer))
            rospy.wait_for_service(dynParamServer + "set_parameters") #, timeout=DEFAULT_TIMEOUT)
            self.avoidSelfReconf = self.avoidSelfReconf + 1
            self.dynClient = DynamicReconfigureClient(dynParamServer, self.dynSrvTimeout, self.dynClientCallback)
            print "Driver manager initialized"
        except:
            print "Error while trying to connect to remote parameter server"
            raise
        return

## Getters and Setters
    # Parameter getters and setters for any type
    def getParameter(self, paramName):
        if self.dynClient == None:
            return None
        currentConfig = self.dynClient.get_configuration(self.dynSrvTimeout)
        print "Read parameter %s=%s"%(paramName, currentConfig[paramName])
        return currentConfig[paramName]

    def setParameter(self, paramName, newValue):
        if self.dynClient == None:
            return False
        newConfig = {paramName:newValue}
        self.avoidSelfReconf = self.avoidSelfReconf + 1
        requestResult = self.dynClient.update_configuration(newConfig)
#        print "Parameter %s sent with result %s"%(newConfig, requestResult)
        if requestResult[paramName] == newValue:
            return True
        else:
            print "Error while updating dynamic server; falling down to other configuration"
            newConfig = {paramName: requestResult[paramName]}
            ifcNode.changeSelfParameters(newConfig)
        return False

    # Topic getter for different types
    def getTopic(self, topicName, data_type = str):
        print "Requesting %s with type %s"%(topicName, data_type)
        rcvdMsg = rospy.wait_for_message(topicName, data_type, DEFAULT_TIMEOUT)
        return rcvdMsg

        # 'sendByTopic' publishes a given value just once and then exits.
        #If no connections listening, the method waits up to a second before publishing
        #and then publishes in either case.
    def sendByTopic(self, topic, value, data_type = UInt16):
# (Watch out; I don't really trust this yet; needs testing)
        attemptedTimes = 0
        pub = rospy.Publisher(topic, data_type)
        while pub.get_num_connections() < 1 and attemptedTimes < 10:
            rospy.Rate(10).sleep() # Sleep 10 times/sec (10Hz)
        pub.publish(value)
        return True

        # 'retransmitTopic' is meant to be executed in a different thread in order
        # to repeat a number of messages received from a topic in another one.
    def retransmitTopic(self, times, source_topic, output_topic, data_type = UInt16):
        if source_topic in rospy.get_published_topics(namespace='/') == False:
            print "Unable to find %s topic in %s in order to retransmit it"%(source_topic, rospy.get_published_topics(namespace='/'))
            return False
        print "Trying to retransmit %s in %s."%(source_topic, output_topic)
        rcvd_msg = rospy.wait_for_message(source_topic, data_type, DEFAULT_TIMEOUT)
        publisher_topic = rospy.Publisher(output_topic, data_type)
        try:
            for i in xrange(0, times):
                publisher_topic.publish(rospy.wait_for_message(source_topic, data_type, DEFAULT_TIMEOUT))
        except exception as e:
            print "Failed while trying to retransmit %s topic in %s."
        return True

## General methods
    def dynClientCallback(self, dynConfiguration):
        if self.avoidSelfReconf < 1:
            print ("Remote configuration changed.".rjust(100, '-'))
            self.handleClientReconfiguration(dynConfiguration)
        if self.avoidSelfReconf > 0:
#            print ("dynServer confirmation".rjust(100, '-'))
            self.avoidSelfReconf = self.avoidSelfReconf - 1
        return dynConfiguration
    
    def handleClientReconfiguration(self, dynConfiguration):
        ifcNode.changeSelfParameters(dynConfiguration)
        return dynConfiguration

    # Service callers
    def callService(service, arguments, valueType = stringValue):
        try:
            rospy.wait_for_service(service, timeout = DEFAULT_TIMEOUT * 10)
            remoteFunction = rospy.ServiceProxy(service, valueType)
            resp1 = remoteFunction(arguments)
            print "Service call response is %s"%resp1
        except rospy.ServiceException as service_exception:
            resp1 = None
            print "Service call failed: %s"%(service_exception)
        except Exception as e:
            resp1 = None
            print "Exception while calling service: %s"%(e)
        return resp1

 ## '...' class for retransmitting from one topic to another for a certain amount of data or time
 # Objects from this class should be instantiated or executed in separated threads to avoid
 # stopping the node when retransmitting.
class testClassForRetransmission:
## Static Data
    dynSrvTimeout = DEFAULT_TIMEOUT
    timesLeft = 0
    publisher_topic = None
## Constructor
    def __init__(self, times, source_topic, output_topic, data_type = UInt16):
        self.timesLeft = times
#        if not source_topic in rospy.get_published_topics(namespace='/'):
#            print "Unable to find %s topic in order to retransmit it"%(source_topic)
#            return False
        self.publisher_topic = rospy.Publisher(output_topic, data_type)
        rospy.Subscriber(source_topic, data_type, callback)
##TODO: Watch out; this is dangerous and it will probably go crazy when executed as the callback won't finish before being called again.
        while timesLeft > 0:
            pass
        return

    def callback(data):
        self.publisher_topic.publish(data)
        self.timesLeft = self.timesLeft - 1

        # 'launchRetransmission' is an ALTERNATIVE to retransmitTopic in order
        # to repeat a number of messages received from a topic in another one.
    def launchRetransmission(self, times, source_topic, output_topic, data_type = UInt16):
        try:
            rospy.Subscriber("chatter", String, callback)
        except Exception as e:
            print "Unable to begin retransmission of %s topic."%(source_topic)
        print "Trying to retransmit %s in %s."%(source_topic, output_topic)
        rcvd_msg = rospy.wait_for_message(source_topic, data_type, DEFAULT_TIMEOUT)
        publisher_topic = rospy.Publisher(output_topic, data_type)
        try:
            for i in xrange(0, times):
                publisher_topic.publish(rospy.wait_for_message(source_topic, data_type, DEFAULT_TIMEOUT))
        except exception as e:
            print "Failed while trying to retransmit %s topic in %s."
        return True
        rospy.spin()
        
        
        
def getParam(param_name):
    location = rospy.search_param(param_name)
    if location == None:
        rospy.sleep(10)
        raise Exception("ERROR: Mandatory '%s' parameter not found."%(param_name))
    return rospy.get_param(location)


def mainFunction():
    try:
##TODO: when the launchers are bound add this:    
# *********************
#        controlVble = 1
#        while searchParam("~driver" + str(controlVble).zfill(2) != None:
#            list.add(getParam("~driver" + str(controlVble).zfill(2))
# *********************
    ## Reading from arguments:
        print "Initializing node"
        rospy.init_node(NODE_NAME)

        globals()["dynParamServer"] = getParam("driver01")

    except Exception as e:
        print "Exception:", e
        sys.exit(0)
        raise

    while not rospy.is_shutdown():
        try:
## Initializing the 3 layers from the lower one
#since each one shouldn't ever depend on the ones above
            globals()["driverMgr"] = manager3D()
            globals()["properties"] = propertyTranslator(getParam(PROP_CONFIG_FILENAME))
            globals()["ifcNode"] = img_interface_node()
            ## Finally launch everything and wait:
            globals()["ifcNode"].listenToRequests()
                
        except KeyboardInterrupt:
            sys.exit(0)
        except:
            print "Unexpected error:", sys.exc_info()[1]
            raise
            print "Error while trying to Initialize node. Waiting 10s"
            try:
        ## If there was any error I delete the objects and begin from scratch
        # I could just use a try/except for each initialization but I don't see real improvement on that
                del globals()["driverMgr"]
                del globals()["properties"]
                del globals()["ifcNode"]
            except:
                pass
            rospy.sleep(10)
            print "Reinitializing Node"
#        cv.DestroyAllWindows()
#            rospy.signal_shutdown("byebye")
        else:
            try:
                print "...Image Adaptor initialized..."
                driverMgr.retransmitTopic(150, "/robot1/kinect1/camera/depth/disparity", "/robot1/kinect1/alt_camera", DisparityImage)
            except KeyboardInterrupt:
                print "Shutting node."
            else:
                rospy.spin()
    return

 ##MICHI TODO: call "start" from this main with a "try" and then a symbolic "stop" maybe?
if __name__ == '__main__':
    try:
        basename = sys.argv[0].split('/')[-1]
        if basename == "":
            sys.argv[0].split('/')[-2]
        print "My name is %s"%(re.sub('(\.py)$', "", basename).replace(".",""))
        mainFunction()
    except Exception as e:
        print "WHOLE-SCOPE EXCEPTION - NODE SHUTTING DOWN" ##TODO: I don't like whole-scope try/except blocks
        print (("Error: %s."%e).center(100, '*'))
    finally:
        rospy.signal_shutdown("testing shutdown")
