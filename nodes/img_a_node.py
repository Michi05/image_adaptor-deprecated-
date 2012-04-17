#!/usr/bin/env python

"""The following code implements an Adaptor Interface Node written in Python for Robot Operating System.
This module is meant to provide communication between any application able to communicate with this node
and any camera device drivers with the appropriate file configuration in the "translation.yaml" file.
"""



###############################################################################
##  *****     *****    Initially needed constants    *****     *****
###############################################################################
globals()["PROP_CONFIG_FILENAME"] = "propertyConfigFile"
globals()["PACKAGE_NAME"] = 'image_adaptor'



###############################################################################
##  *****     *****    External modules to import    *****     *****
###############################################################################
# ****   Standard Python Utility Modules
#==============================================================================
import roslib; roslib.load_manifest(PACKAGE_NAME)
import rospy
import sys
# February02 - Regular expressions
#import re
# March19 - YAML library for configuration file.
import yaml
# April17 - Command line calls for launching nodes
import subprocess
import shlex



###############################################################################
# ****   ROS-specific objects and definitions to import
#==============================================================================

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
# February14
from stereo_msgs.msg import *
from sensor_msgs.msg import *




###############################################################################
##  *****     *****    This file is divided in three classes:    *****     *****
###############################################################################
# # # - Driver manager (communicate with layer below)
# # # - Interface node (communicate with layer above)
# # # - Property translator




###############################################################################
##  *****     *****    Self agreement:    *****     *****
###############################################################################
# # #  *** ( Not being followed anymore by the moment ) ***
        # "None" values mean that some Error was already reported
        # "False", negative or empty strings (depending on the place) mean that there was an error but still unknown
    #Reasons:
            #In case an error is not really taken into account; "None" will produce a second error that will be noticeable
            #Some structures haven't got any "empty" element to return but in the lowest level is sometimes possible to just
        #check if something is possible; read whatever the return value is (can be external) and answer whatever
            #In the lowest level, it should be possible to ask to check something: "if isThatThingWorking():" and get True
        #or False as the answer: but it's not an error that the answer is False, the error is finding that it shouldn't!





###############################################################################
##  ****     ****    To avoid getting stuck in config updates:    ****     ****
###############################################################################
#avoidSelfReconf = 0
#avoidRemoteReconf = 0
# These vbles are incremented as many times as propagations to avoid. When below 1,
#then there are real callbacks:
 # # avoidSelfReconf ++;
 # # ** UNEXPECTED REAL CALLBACK **
 # # ** real callback call avoided **
 # # update_config(...)
 # # ** second callback updates everything
#==============================================================================




###############################################################################
##  *****     *****    Beginning of the executable code    *****     *****
###############################################################################
# ****   Assigning values to "constants":
#==============================================================================

globals()["DEFAULT_TIMEOUT"] = 3
remoteType = {str: String, int: UInt16, float: Float64, bool: Bool}
kindOfProperty = set(["dynParam", "readOnlyParam", "publishedTopic", "topic", "service", "virtual"])
ppty = {"reference":0, "type":1, "kind":2}
PPTY_REF = ppty["reference"]
PPTY_TYPE = ppty["type"]
PPTY_KIND = ppty["kind"]






###############################################################################
##  *****     *****    img_interface_node Class    *****     *****
###############################################################################

class img_interface_node: ## This is the LISTENER for the layer ABOVE
    """The 'img_interface_node' is the class which communicates to the layer above
    according to this structure. It provides services and dynamic reconfigure server
    and also publishes topics."""



###############################################
##  *****     Static Data Members     *****
###############################################
# ****   Services provided to the above layer
#==================================================
    listOf_services = {}



###############################################
##  *****     Constructor Method     *****
###############################################

    def __init__(self, translator, driverMgr):
        """img_interface_node constructor is meant to launch the dynamic reconfigure server
        until it is called to launch services for listening. It doesn't receive or return
        anything."""
        self.translator = translator
        self.driverMgr = driverMgr
        self.avoidRemoteReconf = 0
        try:
            ## Dynamic Reconfigure
            self.avoidRemoteReconf = self.avoidRemoteReconf + 1
            # Launch self DynamicReconfigure server
            self.dynServer = DynamicReconfigureServer(PropertiesConfig, self.dynServerCallback)
            # Launch request listener services
            self.listenToRequests()
            rospy.loginfo("Interface for requests created.")
        except:
            rospy.logerr("Error while trying to initialize dynamic parameter server.")
            raise
        return





###################################################
##  *****     General Purpose Methods     *****
###################################################
# ****   Launch services for receiving requests
#==================================================

    def listenToRequests(self):
        """Main services creator method in order to remain listening for requests.
        It receives nothing and returns true just for future needs."""
        self.listOf_services['getStringProperty'] = rospy.Service('getStringProperty', stringValue, self.getStringProperty)
        self.listOf_services['getIntProperty'] = rospy.Service('getIntProperty', intValue, self.getIntProperty)
        self.listOf_services['getFloatProperty'] = rospy.Service('getFloatProperty', floatValue, self.getFloatProperty)
        self.listOf_services['getBoolProperty'] = rospy.Service('getBoolProperty', booleanValue, self.getBoolProperty)

##MICHI: 14Feb2012
        self.listOf_services['getDispImage'] = rospy.Service('getDispImage', disparityImage, self.getDispImage)
        self.listOf_services['getImage'] = rospy.Service('getImage', normalImage, self.getImage)
##MICHI: 13Mar2012
        self.listOf_services['publishDispImages'] = rospy.Service('publishDispImages', requestTopic, self.publishDispImages)
        self.listOf_services['publishImages'] = rospy.Service('publishImages', requestTopic, self.publishImages)
##MICHI: 16Apr2012
        self.listOf_services['get/TopicLocation'] = rospy.Service('get/TopicLocation', stringValue, self.getStringProperty)
        self.listOf_services['set/TopicLocation'] = rospy.Service('set/TopicLocation', setString, self.setTopicLocation)

        self.listOf_services['setStrProperty'] = rospy.Service('setStrProperty', setString, self.setStrProperty)
        self.listOf_services['setIntProperty'] = rospy.Service('setIntProperty', setInteger, self.setIntProperty)
        self.listOf_services['setFloatProperty'] = rospy.Service('setFloatProperty', setFloat, self.setFloatProperty)
        self.listOf_services['setBoolProperty'] = rospy.Service('setBoolProperty', setBoolean, self.setBoolProperty)
        rospy.loginfo("Ready to answer service requests.")
        return True



###################################################
# ****   Dynamic Reconfigure related methods
#==================================================

    def dynServerCallback(self, dynConfiguration, levelCode):
        """Handler for the changes in the Dynamic Reconfigure server
        Must return a configuration in the same format as received."""
        if self.avoidRemoteReconf > 0:
            rospy.loginfo("LOCAL config was changed by self (levelCode = %s)"%levelCode)
            self.avoidRemoteReconf = self.avoidRemoteReconf - 1
        elif levelCode != 0:
            rospy.loginfo("LOCAL configuration changed.".rjust(80, '_'))
            for elem in dynConfiguration:
                if self.translator.canSet(elem):
                    success = self.setAnyProperty(elem, dynConfiguration[elem])
                    if success == False or success == None:
                        rospy.logerr('|__> ...error... while setting property "%s"'%elem)
                        rospy.logerr("Changing %s failed with %s..."%(elem,dynConfiguration[elem]))
                        dynConfiguration[elem] = self.getAnyProperty(elem)
                        rospy.logerr("...%s used"%(dynConfiguration[elem]))
        return dynConfiguration

    def changeSelfParameters(self, dynConfiguration, avoidPropagation = True):
        """This method is responsible for changing the node's own dynamic reconfigure parameters
        from its own code ***but avoiding a chain of uncontrolled callbacks!!.
        It returns True if everything went as expected."""
        newConfig = {}
        for elem in dynConfiguration:
            paramName = self.translator.reverseInterpret(elem)
            if paramName != "":
                newValue = dynConfiguration[elem]
                newConfig[paramName] = newValue
            else:
                print "Error while retrieving reverse translation"

        if avoidPropagation == True:
            self.avoidRemoteReconf = self.avoidRemoteReconf + 1
        requestResult = self.dynServer.update_configuration(newConfig)
        if requestResult != None:
            return requestResult
        return False


    def setTopicLocation(self, setStrMsg):
        oldAddress = self.translator.interpret(setStrMsg.topicName)[PPTY_REF]
        if oldAddress != None:
            print "...relocating", oldAddress + "..."
            if self.driverMgr.relocateTopic(oldAddress, setStrMsg.newValue):
                print "...setting new..."
                self.translator.change(setStrMsg.topicName, setStrMsg.newValue)
            else:
                print "...ERROR while relocating!"
        else:
            print "...ERROR, unknown topic!"
        return "Success!"


###################################################
# ****   Generic handlers for getting and setting parameters
#==================================================

    def setAnyProperty(self, propertyName, newValue):
        """Generic setter in order to redirect to the type-specific setter method."""
        propertyData = self.translator.interpret(propertyName)
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


	####################################
	# Specific fixed type property setters
	#===================================
    def setStrProperty(self, setStrMsg):
        return self.setFixedTypeProperty(setStrMsg.topicName, setStrMsg.newValue, str)
    def setIntProperty(self, setIntMsg):
        return self.setFixedTypeProperty(setStrMsg.topicName, setStrMsg.newValue, int)
    def setFloatProperty(self, setIntMsg):
        return self.setFixedTypeProperty(setStrMsg.topicName, setStrMsg.newValue, float)
    def setBoolProperty(self, setIntMsg):
        return self.setFixedTypeProperty(setStrMsg.topicName, setStrMsg.newValue, bool)

    def setFixedTypeProperty(self, propertyName, newValue, valueType):
        """Main property setter receiving the property name, the value to assign and its type
        and returning the response from the "setParameter" method from the low level driver."""
        propertyData = self.translator.interpret(propertyName)
        #TODO: Any type checking here?
        if propertyData == None:
            print "Error: trying to set not found property."
            return None
#        else:
#            print "Obtained %s = %s."%(propertyName, propertyData[PPTY_REF])
        resp1 = True
        if propertyData[PPTY_KIND] == "dynParam":
            resp1 = self.driverMgr.setParameter(propertyTranslator.get_param_basename(propertyData[PPTY_REF]), newValue)
        elif propertyData[PPTY_KIND] == "topic":
            self.driverMgr.sendByTopic(rospy.get_namespace() + propertyData[PPTY_REF], newValue, remoteType[valueType])
        else:
            resp1 = False
            print "Error: unable to set property %s of kind: '%s'"%(propertyName, propertyData[PPTY_KIND])
        return resp1


# Getter and getter handlers
    # Generic setter in order to redirect to the appropriate method
    def getAnyProperty(self, propertyName):
        """Generic getter in order to redirect to the type-specific getter method."""
        propertyData = self.translator.interpret(propertyName)
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
            self.driverMgr.sendByTopic("testImages", image, DisparityImage)
        return respImages
    def getImage(self, srvMsg):
        respImages = []
        while len(respImages) < srvMsg.nImages:
            respImages.append(self.getFixedTypeProperty(srvMsg.topicName, None))
##****************************** Temporary for Testing: ******************************
        propertyData = self.translator.interpret(srvMsg.topicName)
        for image in respImages:
            self.driverMgr.sendByTopic("testImages", image, Image)
            rospy.Rate(10).sleep()
##****************************** ********************** ******************************
        return respImages
##TODO: I could add timestamp (time[] timestamp) if needed
##Watch out; setStrMsg.topicName is from setStrMsg.srv and the ppty kind is called the same

    def getFixedTypeProperty(self, propertyName, valueType):
        """Main property getter receiving the property name and the value type
        and returning the current value from the low level driver."""
        propertyData = self.translator.interpret(propertyName)
        if propertyData == None:
            return None
        #else:
        if propertyData[PPTY_KIND] == "dynParam" or propertyData[PPTY_KIND] == "readOnlyParam": ## TODO: y esto?! y si el parámetro de sólo lectura no es dinámico?!
            paramName = propertyTranslator.get_param_basename(propertyData[PPTY_REF])
            resp1 = self.driverMgr.getParameter(paramName)
        elif propertyData[PPTY_KIND] == "publishedTopic":
            resp1 = self.driverMgr.getTopic(propertyData[PPTY_REF], valueType)
        elif propertyData[PPTY_KIND] == "topic":
##MICHI: 14Feb2012
            if valueType == str:
                resp1 = str(propertyData[PPTY_REF])
            else:
                valueType2 = DisparityImage
                if propertyData[PPTY_TYPE].find("Disparity") < 0:
                    valueType2 = Image
                resp1 = self.driverMgr.getTopic(propertyData[PPTY_REF], valueType2)
        else:
            print "Error: unable to get property %s of kind %s"%(propertyName, propertyData[PPTY_TYPE])
            resp1 = None
        return resp1


    # Method to request the complete list of properties
    def get_property_list(self):
        """Auxiliary method for receiving the list of properties known by the translator."""
        return self.translator.get_property_list()
    
    # Methods related to requesting topics to publish
    def publishDispImages(self, srvMsg):
        """Specific purpose method meant to retransmit a disparity image topic on a specific topic
        path receiving the original path, the new path and the amount of messages. It returns a
        message telling if it worked."""
        topicPath = self.translator.getTopicPath(srvMsg.sourceTopic)
        self.driverMgr.retransmitTopic(srvMsg.nImages, topicPath, srvMsg.responseTopic, DisparityImage)
        "%s images sent from %s topic to %s."%(srvMsg.nImages, srvMsg.sourceTopic, srvMsg.responseTopic)
        return "%s images sent from %s topic to %s."%(srvMsg.nImages, srvMsg.sourceTopic, srvMsg.responseTopic)
    
    def publishImages(self, srvMsg):
        """Specific purpose method meant to retransmit an image topic on a specific topic
        path receiving the original path, the new path and the amount of messages. It returns
        a message telling if it worked."""
        topicPath = self.translator.getTopicPath(srvMsg.sourceTopic)
        self.driverMgr.retransmitTopic(srvMsg.nImages, topicPath, srvMsg.responseTopic, Image)
        "%s images sent from %s topic to %s."%(srvMsg.nImages, srvMsg.sourceTopic, srvMsg.responseTopic)
        return "%s images sent from %s topic to %s."%(srvMsg.nImages, srvMsg.sourceTopic, srvMsg.responseTopic)







###############################################################################
##  *****     *****    propertyTranslator Class    *****     *****
###############################################################################

class propertyTranslator:
    """This 'PropertyTranslator' class is the module to change driver names and paths into
the ones offered by the interface and the other way around. It stores two dictionaries (for
both translations) and several methods for translating."""


###############################################
##  *****     Constructor Method     *****
###############################################
    def __init__(self,config_filename):
        try:
            self.property_config_file = config_filename
            self.translations = self.readYAMLConfig(file_name = config_filename)
            
            self.ReversePropDict = {}
            for dictionary in self.translations[1]:
                for elem in dictionary:
                    self.ReversePropDict[dictionary[elem][0]] = elem
                    self.ReversePropDict[dictionary[elem][0].split("/")[-1]] = elem
            rospy.loginfo("Property configuration loaded:")
        except:
            rospy.logerr("Error while reading property configuration from file.")
            raise
        return




###################################################
##  *****     General Purpose Methods     *****
###################################################
# ****   Interpret and Reverse interpret
#==================================================

    def change (self, propertyName, newValue):
        for dictionary in self.translations[1]:
            if propertyName in dictionary:
                dictionary[propertyName][PPTY_REF] = newValue
                break
        else:
            return None
        return newValue
        
    def interpret(self, propertyName): # TODO: maybe translate is a better name?
        """Receives the fixed name of the property and
        translates it into the needed data to read it."""
        resp1 = None
        for dictionary in self.translations[1]:
            if propertyName in dictionary:
                resp1 = dictionary[propertyName]
                break
        if resp1 == None:
            print "Property '%s' not found."%propertyName
        return resp1

    def reverseInterpret(self, reverseProperty):
        result = ""
        if reverseProperty in self.ReversePropDict:
            result = self.ReversePropDict[reverseProperty]
        else:
            for path in self.translations[0]:
                if str(path + reverseProperty) in self.ReversePropDict: ## TODO: this ain't very robust or reliable...
                    result = self.ReversePropDict[str(path + reverseProperty)]
        if result == "":
            print "not %s nor %s found in the property list."%(reverseProperty, str(path + reverseProperty), self.ReversePropDict)
        return result

    

###################################################
# ****   Method for loading property config
#==================================================

    def readYAMLConfig(self, file_name):
        """This method receives a file_name in which to read the properties.
        Returned Value MUST be a tuple of two lists with strings and
        dictionaries respectively."""
        newDictionaries = ([],[])
        yamlConfig = ""
        cfgFile = file(file_name, 'r')
        if cfgFile != None:
            try:
                yamlConfig = yaml.safe_load_all(cfgFile)
            except yaml.YAMLError, exc:
                if hasattr(exc, 'problem_mark'):
                    mark = exc.problem_mark
                    raise Exception("YAML Error in '%s'::f%s,col%s." % (file_name, mark.line+1, mark.column+1))
                else:
                    raise Exception("Unknown YAML Error in '%s'." % (file_name))
        else:
            raise Exception("Unable to open YAML configuration file '%s'." % (file_name))

        ## Once the config is successfuly loaded:
        for i in yamlConfig:
            if len(i) < 1:
                rospy.logerr("WRONG YAML FORMAT!! Nothing found in this page.")
            if len(i) > 1:
                rospy.logerr("WRONG YAML FORMAT!! More than one dictionary in a single page.")
            for j in i:
# This is suppossed to be only 1 dictionary but
#it can be useful for the future making it with a loop
                newDictionaries[0].append(j)
                newDictionaries[1].append(i[j])
        
        
# Remove all the beginning and ending blanks and also the blanks near ':' and then splits using ':'
#    without_blanks01 = re.sub('(^([\t ]*)|([\t ]*)$)', "", content.replace( "\n", "" ).replace( "\r", "" ))
#    without_blanks02 = re.sub('( |\t)*,[\t ]*', ',', without_blanks01)
#    dataRead = re.sub('( |\t)*:[\t ]*', ':', without_blanks02).split(':')
        print " Translation Configuration read from YAML file:"
        for driver, dictionary in zip(newDictionaries[0], newDictionaries[1]): ## enumerate() if index numbers needed
            print "\r\n\r\nDictionary %s:"%driver
            for elem in dictionary:
                print elem, "\t:\t", dictionary[elem]
        return newDictionaries



###################################################
# ****   Properties Utility Methods
#==================================================

    def canSet(self, propertyName):
        """Receives the name of a property and decides whether if it can be Setted or not."""
        kindsToSet = set (["dynParam", "topic"])
        for dictionary in self.translations[1]:
            if propertyName in dictionary:
                return (dictionary[propertyName][PPTY_KIND] in kindsToSet)
        return False
    def canGet(self, propertyName):
        """Receives the name of a property and decides weather if it can be Getted or not."""
        kindsToGet = set (["dynParam", "readOnlyParam", "publishedTopic", "topic"])
        for dictionary in self.translations[1]:
            if propertyName in dictionary:
                return (dictionary[propertyName][PPTY_KIND] in kindsToGet)
        return False

    def get_param_relative(propName):
        """Translation utility for getting the relative path to a property (without the local namespace)."""
        for path, dictionary in zip(self.translations[0], self.translations[1]):
            if propertyName in dictionary:
                return (path + propertyName)
        return False

    @staticmethod
    def get_param_basename(propName):
        """Static method that receives a name or path and returns the name after the last slash.
        That is: propName = /rootDir/secondary/package/whatever/propName = /propName/ """ 
        if len(propName) < 1:
            return ""
        if len(propName.split("/")[-1]) > 0:
            propName = propName.split("/")[-1]
        else:
            propName = propName.split("/")[-2]
        # Cleaning '~' in private names
        propName = propName[propName.find('~')+1:]
        return propName
    
    def getTopicPath(self, topicName):
        """Method to get the path of a certain topic.
        If the given name exists as a topic; the name is returned,
        otherwise, the name is translated with the dictionary."""
        if manager3D.topicExists(topicName):
            return topicName
        return self.interpret(topicName)

    def get_property_list(self):
        """Method that returns the complete list of properties."""
        propList = {}
        for dictionary in self.translations[1]:
            for elem in dictionary:
                propList[elem] = dictionary[elem]
        return propList

    def list_of_dynamic_servers(self):
        """Method that returns the complete list of servers in
        which the parameters are distributed."""
        dynServers = []
        for dict in xrange(len(self.translations[1])):
            for elem in self.translations[1][dict]:
                if dictionary[elem][PPTY_KIND] == "dynParam":
                    if self.translations[0][dict] == '~':
                        dynServers.append('')
                    else:
                        dynServers.append(self.translations[0][dict])
                    break
        return dynServers






###############################################################################
##  *****     *****    manager3D Class    *****     *****
###############################################################################

class manager3D:
    """Communication module class for handling the low-level driver. That
    is the manager for the layer below, so all the requests should use this module in
    order to observe the structure."""


###############################################
##  *****     Static Data Members     *****
###############################################
    dynSrvTimeout = DEFAULT_TIMEOUT


###############################################
##  *****     Constructor Method     *****
###############################################
    def __init__(self, dynServers): ## , serverList):
        self.createdMuxes = {} # For topic relocations
        self.paramServers = {}
        self.avoidSelfReconf = 0
        try:
            ## It's supposed that every dynamic server has always a "set_parameters" service
            rospy.loginfo("Creating Dynamic Reconfigure Client;")
            self.avoidSelfReconf = self.avoidSelfReconf + 1
            for server in dynServers: ## serverList:
                rospy.loginfo("...waiting for server in %s."%(rospy.get_namespace() + server))
                rospy.wait_for_service(server + "set_parameters")
                self.paramServers[server] = DynamicReconfigureClient(server, self.dynSrvTimeout, self.dynClientCallback)
                self.dynClient = self.paramServers[server]
            rospy.loginfo("Driver manager initialized.")
        except:
            rospy.logerr("Error while trying to connect to remote parameter server.")
            raise
        return



###################################################
##  *****     Getter and Setter Methods     *****
###################################################
# ****   Parameter getters and setters for any type
#==================================================
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
            rospy.logrerr("Error while updating dynamic server; falling down to other configuration")
            newConfig = requestResult
            response = globals()["ifcNode"].changeSelfParameters(newConfig, True)
            if response == None:
                rospy.logrerr("Error while correcting self parameters in dynamic reconfiguration.")
        return False


###################################################
# ****   Topic getter for different types
#==================================================
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

    def retransmitTopic(self, times, source_topic, output_topic, data_type = UInt16):
        """Method meant to be executed in a different thread in order
        to repeat a number of messages received from a topic to another one."""
        # TODO: it should use the interface to send the messages in order to be according to the structure
        # but be careful with moving too much the images or the throughput will die...
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



###################################################
##  *****     General Purpose Methods     *****
###################################################
# ****   Callback for Dynamic Reconfigure Client
#==================================================
    def dynClientCallback(self, dynConfiguration):
        if self.avoidSelfReconf > 0:
            self.avoidSelfReconf = self.avoidSelfReconf - 1
        else:
            rospy.loginfo("Remote configuration changed.".rjust(80, '-'))
            dynConfiguration = globals()["ifcNode"].changeSelfParameters(dynConfiguration, False)
        return dynConfiguration

    def relocateTopic(self, oldAddress, newAddress):
        '''This very important method is meant to change the topics from one name (or address) to another in runtime.
        Since that not possible in a literal way; "mux" tool is used to repeat them under the new name/address.
        
        ## TODO: Watch Out: in the first version, each change becomes a new node
        ##while it should change the existing when possible.
        
        ### Here's a next step when they complete there project >>> callService("rosspawn/start", "")
        '''
        newIndex = len(self.createdMuxes)+1 ## The nodes always remain open... big issue, but I haven't got a solution yet
        self.createdMuxes[oldAddress] = (newIndex, newAddress) ## Maybe the address should be checked first
        myNamespace = '/'.join(rospy.get_namespace().split('/')[:-2]) # TODO: Watch Out! why this??
        print "I will execute:", 'rosnode kill ' + myNamespace + '/mux' + str(newIndex)
        subprocess.Popen(shlex.split('rosnode kill ' + myNamespace + '/mux' + str(newIndex)), close_fds=True)
        print "Relocating from", oldAddress, "to", newAddress
        subprocess.Popen(shlex.split('roslaunch image_adaptor runMultiplexers.launch node_id:="mux' + str(newIndex) + '" args:="' + oldAddress + ' ' + newAddress + '"'), close_fds=True)
        return True


###################################################
# ****   Service Callers
#==================================================
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
    


###################################################
# ****   Static utility methods
#==================================================
    @staticmethod
    def topicExists(topicName):
        for i in rospy.get_published_topics():
            if topicName in i:
                return True
        return False





###############################################################################
##  *****     *****    testClassForRetransmission Class     *****     *****
###############################################################################

class testClassForRetransmission:
    """Class for retransmitting from one topic to another for a certain amount of data or time
	Objects from this class should be instantiated or executed in separated threads to avoid
	stopping the node when retransmitting."""


###############################################
##  *****     Static Data Members     *****
###############################################
    dynSrvTimeout = DEFAULT_TIMEOUT
    timesLeft = 0
    publisher_topic = None


###############################################
##  *****     Constructor Method     *****
###############################################
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


###############################################
##  *****     More Methods     *****
###############################################
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





###############################################################################
##  *****     *****    SINGLE UTILITY FUNCTIONS     *****     *****
###############################################################################
#  *****    Get Parameters from Parameter Server    *****
#==============================================================================
        
def getParam(param_name):
    location = rospy.search_param(param_name)
    if location == None:
        rospy.sleep(10)
        raise Exception("ERROR: Mandatory '%s' parameter not found."%(param_name))
    return rospy.get_param(location)






###############################################################################
##  *****     *****    MAIN FUNCTION OF THE CODE     *****     *****
###############################################################################


def mainFunction(basename):
    ## Reading from arguments:
    rospy.loginfo("Initializing node")
    rospy.init_node(basename)

    dynParamServerPath = getParam("driver01") # TODO 1: make this generic!


    while not rospy.is_shutdown():
        try:
## Initializing the 3 layers trying to avoid dependency problems
            mainTranslator = propertyTranslator(getParam(PROP_CONFIG_FILENAME))
            
            
            
            #list_of_dynamic_servers(self)
            
            mainDriverManager = manager3D(dynServers = [dynParamServerPath]) # TODO: mainTranslator.getDRServers();
            globals()["ifcNode"] = img_interface_node(translator = mainTranslator, driverMgr = mainDriverManager)
            ## TODO 2: Integrate self dynamicReconf client in the driver or do whatever is better with that.
            ## TODO 3: change the img_interface class using singleton
        except KeyboardInterrupt:
            sys.exit(0)
        except:
#            print "Unexpected error:", sys.exc_info()[1]
#            raise
            rospy.logerr("Error while trying to Initialize node. Waiting 10s")
            try:
        ## If there was any error I delete the objects and begin from scratch
        # I could just use a try/except for each initialization but I don't see real improvement on that
                del mainTranslator
                del mainDriverManager
                del globals()["ifcNode"]
            except:
                pass
            rospy.sleep(10)
            rospy.loginfo("Reinitializing Node")
#           rospy.signal_shutdown("byebye")
        else:
            ## Everything is initialized and ready. Wait for requests:
            try:
                rospy.loginfo("...Image Adaptor initialized...")
            except KeyboardInterrupt:
                rospy.loginfo("Shutting down node.")
            else:
                rospy.spin()
    return





###############################################################################
##  *****    *****    ENTRY POINT FOR STARTING THE CODE    *****    *****
###############################################################################

 ##MICHI TODO: call "start" from this main with a "try" and then a symbolic "stop" maybe?
if __name__ == '__main__':
    try:
        basename = sys.argv[0].split('/')[-1]
        if basename == "":
            sys.argv[0].split('/')[-2]
        if basename[-3:] == ".py":
            basename = basename[0: -3]
        mainFunction(basename)
    except Exception as e:
        rospy.logerr("WHOLE-SCOPE EXCEPTION - NODE SHUTTING DOWN")
        rospy.logerr(("Error: %s."%e).center(80, '*'))
    finally:
        rospy.signal_shutdown("testing shutdown")

