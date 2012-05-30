#!/usr/bin/env python

""" The following code implements an Adaptor Interface Node written in Python for Robot Operating System.
This module is meant to provide communication between any application able to communicate with this node
and any camera device drivers with the appropriate file configuration in the "translation.yaml" file.
"""



###############################################################################
##  *****     *****    Initially needed constants    *****     *****
###############################################################################
 # Constants
globals()["PACKAGE_NAME"] = 'image_adaptor'


###############################################################################
##  *****     *****    CONFIGURATION PARAMETERS    *****     *****
###############################################################################
 ## Keys
globals()["KEY_CONFIG_FILENAME"] = "property_config_file"
globals()["DEFAULT_CONFIG_FILENAME"] = "propertyConfigFile.yaml"
 ## Defaults
globals()["KEY_TIMEOUT"] = "service_time_out"
globals()["DEFAULT_TIMEOUT"] = 3
 # Global values
globals()["serviceTimeOut"] = 3


###############################################################################
##  *****     *****    External modules to import    *****     *****
###############################################################################
# ****   Standard Python Utility Modules
#==============================================================================
import roslib; roslib.load_manifest(PACKAGE_NAME)
import rospy
import sys
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
# ****   Assigning values to "constants" (used as literals):
#==============================================================================

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
        self.listOf_services['get/StringProperty'] = rospy.Service('get/StringProperty', stringValue, self.getStringProperty)
        self.listOf_services['get/IntProperty'] = rospy.Service('get/IntProperty', intValue, self.getIntProperty)
        self.listOf_services['get/FloatProperty'] = rospy.Service('get/FloatProperty', floatValue, self.getFloatProperty)
        self.listOf_services['get/BoolProperty'] = rospy.Service('get/BoolProperty', booleanValue, self.getBoolProperty)

##MICHI: 14Feb2012
        self.listOf_services['get/DispImage'] = rospy.Service('get/DispImage', disparityImage, self.getDispImage)
        self.listOf_services['get/Image'] = rospy.Service('get/Image', normalImage, self.getImage)
##MICHI: 13Mar2012
        self.listOf_services['publishDispImages'] = rospy.Service('publishDispImages', requestTopic, self.publishDispImages)
        self.listOf_services['publishImages'] = rospy.Service('publishImages', requestTopic, self.publishImages)
##MICHI: 16Apr2012
        self.listOf_services['get/TopicLocation'] = rospy.Service('get/TopicLocation', stringValue, self.getStringProperty)
        self.listOf_services['set/TopicLocation'] = rospy.Service('set/TopicLocation', setString, self.setTopicLocation)

        self.listOf_services['set/StrProperty'] = rospy.Service('set/StrProperty', setString, self.setStrProperty)
        self.listOf_services['set/IntProperty'] = rospy.Service('set/IntProperty', setInteger, self.setIntProperty)
        self.listOf_services['set/FloatProperty'] = rospy.Service('set/FloatProperty', setFloat, self.setFloatProperty)
        self.listOf_services['set/BoolProperty'] = rospy.Service('set/BoolProperty', setBoolean, self.setBoolProperty)
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
                        rospy.logdebug("...%s used"%(dynConfiguration[elem]))
        return dynConfiguration

    def updateSelfParameters(self, dynConfiguration, avoidPropagation = True):
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
        rospy.loginfo (str("Received call to set/TopicLocation " + setStrMsg.topicName + " " + setStrMsg.newValue))
        translation = self.translator.interpret(setStrMsg.topicName)
        if translation != None:
            oldAddress = translation[PPTY_REF]
            rospy.loginfo (str("...relocating " + oldAddress + "..."))
            if self.driverMgr.relocateTopic(oldAddress, setStrMsg.newValue):
                print "...setting new..."
                self.translator.updateValue(setStrMsg.topicName, setStrMsg.newValue)
            else:
                print "...ERROR while relocating!"
                return "...ERROR while relocating!"
        else:
## WATCH OUT: This is dangerous but in case the topicName is not known; it is supposed to be a path.
            print "...relocating ", setStrMsg.topicName + "..."
            if self.driverMgr.relocateTopic(setStrMsg.topicName, setStrMsg.newValue):
                print "...setting new..."
            else:
                print "...ERROR while relocating!"
                return "...ERROR while relocating!"
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
    ## The next methods are the callbacks for the setter services
    ##all of them are supposed to return the resulting values to
    ##inform in case the set event failed.
    ## In case there's an error; the error message is sent no
    ##matter the returning type is
    def setStrProperty(self, setterMessage):
        return self.setFixedTypeProperty(setterMessage.topicName, setterMessage.newValue, str)
    def setIntProperty(self, setterMessage):
        return self.setFixedTypeProperty(setterMessage.topicName, setterMessage.newValue, int)
    def setFloatProperty(self, setterMessage):
        return self.setFixedTypeProperty(setterMessage.topicName, setterMessage.newValue, float)
    def setBoolProperty(self, setterMessage):
        return self.setFixedTypeProperty(setterMessage.topicName, setterMessage.newValue, bool)

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
            paramName = propertyTranslator.getBasename(propertyData[PPTY_REF])
            resp1 = self.driverMgr.setParameter(paramName, newValue, self.translator.getDynServerPath(paramName), self)
        elif propertyData[PPTY_KIND] == "topic":
            self.driverMgr.sendByTopic(rospy.get_namespace() + propertyData[PPTY_REF], newValue, remoteType[valueType])
        else:
            resp1 = False
            print "Error: unable to set property %s of kind: '%s'"%(propertyName, propertyData[PPTY_KIND])
        return valueType(resp1)


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
            rospy.logerr("Error: non registered value type")
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
        return respImages
##AMPLIATION: I could add normalImage.timestamp (time[] timestamp) if needed (including the changes in the "normalImage.srv"
## in that case I would need a normalImage variable and set both fields: images and timestamp

    def getFixedTypeProperty(self, propertyName, valueType):
        """Main property getter receiving the property name and the value type
        and returning the current value from the low level driver."""
        propertyData = self.translator.interpret(propertyName)
        if propertyData == None:
            return None
        #else:
        if propertyData[PPTY_KIND] == "dynParam":
            paramName = propertyTranslator.getBasename(propertyData[PPTY_REF])
            resp1 = self.driverMgr.getParameter(paramName, self.translator.getDynServerPath(propertyName))
        elif propertyData[PPTY_KIND] == "publishedTopic":
            resp1 = self.driverMgr.getTopic(propertyData[PPTY_REF], valueType)
        elif propertyData[PPTY_KIND] == "readOnlyParam":
            paramName = propertyTranslator.getBasename(propertyData[PPTY_REF])
            location = rospy.search_param(param_name)
            resp1 = rospy.get_param(location)
        elif propertyData[PPTY_KIND] == "topic":
##MICHI: 14Feb2012
            if valueType == str:
                resp1 = str(propertyData[PPTY_REF])
            else: ## Special case for reading disparity images
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
            # Storing the filename as it's useful in case there is more than one instance
            self.property_config_file = config_filename
            # Loads the YAML Config in a pair of lists of names (drivers) and dictionaries (properties)
            self.translations = self.readYAMLConfig(file_name = config_filename)
            # A reverse dictionary is necessary to search for the original property names when needed
            self.ReversePropDict = self.getReversed()
            
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

    def updateValue (self, propertyName, newValue):
        for dictionary in self.translations[1]:
            if propertyName in dictionary:
                dictionary[propertyName][PPTY_REF] = newValue
                break
        else:
            return None
        return newValue
        
    def interpret(self, propertyName):
        """Receives a generic name specified in the YAML config
    Returns the associated values for the driver according to:
    [property name, data type, kind of property]."""
        resp1 = None
        for dictionary in self.translations[1]:
            if propertyName in dictionary:
                resp1 = dictionary[propertyName]
                break
        if resp1 == None:
            print "Property '%s' not found. Returning the whole string."%propertyName
        return resp1

    def reverseInterpret(self, reverseProperty):
        result = ""
        if reverseProperty in self.ReversePropDict:
            result = self.ReversePropDict[reverseProperty]
        else:
            for path in self.translations[0]:
                if str(path + "/" + reverseProperty) in self.ReversePropDict:
                    result = self.ReversePropDict[str(path + "/" + reverseProperty)]
        if result == "":
            print "not %s nor %s found in the property list."%(reverseProperty, str(path + "/" + reverseProperty), self.ReversePropDict)
        return result

    

###################################################
# ****   Methods for loading property configuration
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

        ## Once the config is successfully loaded:
        for page in yamlConfig:
            if len(page) < 1:
                rospy.logerr("WRONG YAML FORMAT!! Nothing found in this page.")
            if len(page) > 1:
                rospy.logerr("WRONG YAML FORMAT!! More than one dictionary in a single page.")
# There is supposed to be only 1 dictionary but it
#can be useful for the future making it with a loop
            for driverName in page:
                ## Store the properties...
                newDictionaries[1].append(page[driverName])
                ##...and the driver without the last '/'
                if len(driverName) > 0 and driverName[-1] == '/':
                    newDictionaries[0].append(driverName[:-1])
                else:
                    newDictionaries[0].append(driverName)
        
        
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
    
    
    def getReversed(self):
        reversePropDict = {}
        return reversePropDict
        for dictionary in self.translations[1]:
            for elem in dictionary:
                self.ReversePropDict[dictionary[elem][0]] = elem
                self.ReversePropDict[dictionary[elem][0].split("/")[-1]] = elem
        return reversePropDict


    def dynamicServers(self):
        drivers = []
        for elem in self.translations[0]:
            if elem != "" and elem != "~":
                drivers.append(elem)
        return drivers
    
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

    def getDynServerPath(self, propName):
        """Receives a property name.
        In case that the property is dynamic, the corresponding
        dynamic server is the response..."""
        for index in [dict for dict in xrange(len(self.translations[1])) if propName in self.translations[1][dict]]:
            if self.translations[1][index][propName][PPTY_KIND] == "dynParam":
                return (self.translations[0][index])
        return False


    @staticmethod
    def getBasename(propName):
        """Static method that receives a string with any name or path
        and returns the name after the last slash. That is:
        propName = /rootDir/secondary/package/whatever/propName = /propName/ """ 
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
    dynSrvTimeout = serviceTimeOut


###############################################
##  *****     Constructor Method     *****
###############################################
    def __init__(self, dynServers): ## , serverList):
        # Dictionary of multiplexors for remembering topic relocations
        self.createdMuxes = {}
        # Dictionary of parameter servers connected
        self.paramServers = {}
        # Self Reconfiguration semaphore begins with a 0
        self.avoidSelfReconf = 0
        try:
            ## It's assumed that every dynamic server has always a "set_parameters" service or it's just not running
            rospy.loginfo("Creating Dynamic Reconfigure Client;")
            ## A reconfiguration callback will be shooted. The semaphore is incremented in order to take that into account 
            self.avoidSelfReconf = self.avoidSelfReconf + 1
            ## Connecting to all the different servers
            for server in dynServers: ## serverList:
                rospy.loginfo("...waiting for server in %s."%(rospy.get_namespace() + server))
                rospy.wait_for_service(server + "/set_parameters")
                self.paramServers[server] = DynamicReconfigureClient(server, self.dynSrvTimeout, self.dynClientCallback)
            rospy.loginfo("Driver manager initialised.")
        except:
            rospy.logerr("Error while trying to connect to remote parameter server.")
            raise
        return



###################################################
##  *****     Getter and Setter Methods     *****
###################################################
# ****   Parameter getters and setters for any type
#==================================================
    def getParameter(self, paramName, dynServerPath):
        ## TODO: what if the parameter is virtual and the server is self?? it should work anyway!
        if dynServerPath in self.paramServers:
            remoteServer = self.paramServers[dynServerPath]
            currentConfig = remoteServer.get_configuration(self.dynSrvTimeout)
            if paramName in currentConfig:
                rospy.logdebug(str("Read parameter %s=%s from %s"%(paramName, currentConfig[paramName], dynServerPath)))
                return currentConfig[paramName]
        return None

    def setParameter(self, paramName, newValue, dynServerPath, ifcNodeInstance):
        remoteServer = self.paramServers[dynServerPath]
        newConfig = {paramName:newValue}
        self.avoidSelfReconf = self.avoidSelfReconf + 1
        requestResult = remoteServer.update_configuration(newConfig)
        if requestResult[paramName] != newValue:
            rospy.logrerr("Error while updating dynamic server; falling down to actual configuration.")
            newConfig = requestResult
            response = ifcNodeInstance.updateSelfParameters(newConfig, True)
            if response == None:
                rospy.logrerr("Error while correcting self parameters in dynamic reconfiguration.")
        return requestResult[paramName]


###################################################
# ****   Topic getter for different types
#==================================================
    def getTopic(self, topicName, data_type = str):
        print "Requesting %s with type %s"%(topicName, data_type)
        rcvdMsg = rospy.wait_for_message(topicName, data_type, serviceTimeOut)
        return rcvdMsg

    def sendByTopic(self, topic, value, data_type = UInt16):
        """ Publishes a given value just once and then exits.
        #If no connections listening, the method waits up to a second before publishing
        #and then publishes in either case."""
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
        if source_topic in rospy.get_published_topics(namespace='/') == False:
            print "Unable to find %s topic in %s in order to retransmit it"%(source_topic, rospy.get_published_topics(namespace='/'))
            return False
        print "Trying to retransmit %s in %s."%(source_topic, output_topic)
        publisher_topic = rospy.Publisher(output_topic, data_type)
        try:
            for i in xrange(0, times):
                publisher_topic.publish(rospy.wait_for_message(source_topic, data_type, serviceTimeOut))
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
            dynConfiguration = globals()["ifcNode"].updateSelfParameters(dynConfiguration, False)
        return dynConfiguration

    def relocateTopic(self, oldAddress, newAddress):
        '''This very important method is meant to change the topics from one name (or address) to another in runtime.
        Since that not possible in a literal way; "mux" tool is used to repeat them under the new name/address.
        
        ### Here's a next step when they complete their project >>> callService("rosspawn/start", "")
        '''
        myNamespace = '/'.join(rospy.get_namespace().split('/')[:-2])
        newIndex = len(self.createdMuxes)+1
        
        if not oldAddress in self.createdMuxes:
            ## In case that the oldAddress is a new address, the new "addressSub0" is the original one
            for addressSub0 in [j for j in self.createdMuxes if self.createdMuxes[j][1]==oldAddress]:
                oldAddress=addressSub0
                
        if oldAddress in self.createdMuxes:
            ## In case the oldAddress is already relocated, the first node is killed
            newIndex = self.createdMuxes[oldAddress][0]
            print "I will execute:", 'rosnode kill ' + myNamespace + '/mux' + str(newIndex)
            subprocess.Popen(shlex.split('rosnode kill ' + myNamespace + '/mux' + str(newIndex)), close_fds=True)
        ## Postcondition: the index is up to date and the previous mux node is supposed to be already killed
        self.createdMuxes[oldAddress] = (newIndex, newAddress) ## Maybe the address should be checked first
        print "Relocating from", oldAddress, "to", newAddress
        print "I will execute:", 'roslaunch image_adaptor runMultiplexers.launch namespace:="' + myNamespace + '" node_id:="mux' + str(newIndex) + '" args:="' + newAddress + ' ' + oldAddress + '"'
        subprocess.Popen(shlex.split('roslaunch image_adaptor runMultiplexers.launch namespace:="' + myNamespace + '" node_id:="mux' + str(newIndex) + '" args:="' + newAddress + ' ' + oldAddress + '"'), close_fds=True)
##        subprocess.Popen(shlex.split('rosrun topic_tools mux ...
        return True


###################################################
# ****   Service Callers
#==================================================
    def callService(service, arguments, valueType = stringValue):
        try:
            rospy.wait_for_service(service, timeout = serviceTimeOut * 10)
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
##  *****     *****    SINGLE UTILITY FUNCTIONS     *****     *****
###############################################################################
#  *****    Get Parameters from Parameter Server    *****
#==============================================================================
        
def searchParam(param_name):
    location = rospy.search_param(param_name)
    if location == None:
        raise Exception("ERROR: Mandatory '%s' parameter not found."%(param_name))
    return rospy.get_param(location)
        
def privateParam(param_name, default_value=None):
    response = rospy.get_param("~" + param_name, default_value)
    if response == None:
        raise Exception("ERROR: Mandatory '%s' parameter not found."%(param_name))
    else:
        rospy.set_param("~" + param_name, response)
    return response






###############################################################################
##  *****     *****    MAIN FUNCTION OF THE CODE     *****     *****
###############################################################################


def mainFunction(basename):
    ## Reading from arguments:
    rospy.loginfo("Initializing node")
    rospy.init_node(basename)

    ## Update service time out according to parameters
    serviceTimeOut=privateParam(KEY_TIMEOUT, DEFAULT_TIMEOUT)

    while not rospy.is_shutdown():
        try:
## Initialising the 3 layers trying to avoid dependency problems
            mainTranslator = propertyTranslator(privateParam(KEY_CONFIG_FILENAME, DEFAULT_CONFIG_FILENAME))

            mainDriverManager = manager3D(dynServers = mainTranslator.dynamicServers())
            globals()["ifcNode"] = img_interface_node(translator = mainTranslator, driverMgr = mainDriverManager)
        except KeyboardInterrupt:
            sys.exit(0)
        except:
#            print "Unexpected error:", sys.exc_info()[1]
#            raise
            rospy.logerr("Error while trying to Initialise node. Waiting 10s")
            try:
        ## If there was any error I delete the objects and begin from scratch
        # I could just use a try/except for each initialisation but I don't see real improvement on that
                del mainTranslator
                del mainDriverManager
                del globals()["ifcNode"]
            except:
                pass
            rospy.sleep(10)
            rospy.loginfo("Reinitializing Node")
        else:
            ## Everything is initialised and ready. Wait for requests:
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

if __name__ == '__main__':
    try:
        basename = sys.argv[0].split('/')[-1]
        if basename == "":
            basename = sys.argv[0].split('/')[-2]
        if basename[-3:] == ".py":
            basename = basename[0: -3]
        mainFunction(basename)
    except Exception as e:
        rospy.logerr("WHOLE-SCOPE EXCEPTION - NODE SHUTTING DOWN")
        rospy.logerr(("Error: %s."%e).center(80, '*'))
    finally:
        rospy.signal_shutdown("testing shutdown")

