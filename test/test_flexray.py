# *-* encoding: utf-8 *-*
# python -m unittest tests.test_flexray
import unittest
import inspect
import vxlapi as xl
from pprint import pprint
import chardet

def decode_bin(bin):
    return bin.decode(chardet.detect(bin)["encoding"])

def get_flexray_bus_params(hwType, hwIndex, hwChannel, busType):
    driverConfig = {}
    xl.GetDriverConfig(driverConfig)
    flexray_bus_params = None
    for ch in driverConfig["channel"]:
        if (ch["hwType"] == hwType and ch["hwIndex"] == hwIndex and ch["hwChannel"] == hwChannel):
            if ch["busParams"]["busType"] == busType:
                flexray_bus_params = ch["busParams"]["data"]["flexray"]
                flexray_bus_params["name"] = ch["name"]
                flexray_bus_params["hwType"] = ch["hwType"]
                flexray_bus_params["hwIndex"] = ch["hwIndex"]
                flexray_bus_params["hwChannel"] = ch["hwChannel"]
    return flexray_bus_params

def set_appl_config(self):
    self.appName    = bytes("pyxldrv".encode())
    self.appChannel = 0
    self.pHwType    = [xl.XL_HWTYPE_VN7610]
    self.pHwIndex   = [0]
    self.pHwChannel = [0]
    self.busType    = xl.XL_BUS_TYPE_FLEXRAY
    return xl.SetApplConfig(self.appName, self.appChannel, self.pHwType, self.pHwIndex, self.pHwChannel, self.busType)

def open_port(self):
    self.portHandle     = [0]
    self.permissionMask = [self.accessMask]
    self.rxQueueSize    = 2^10
    self.xlInterfaceVersion = xl.XL_INTERFACE_VERSION_V4
    return xl.OpenPort(self.portHandle, self.appName, self.accessMask, self.permissionMask, self.rxQueueSize, self.xlInterfaceVersion, self.busType)

def set_configuration(self):
    xlConf = {}
    xlConf["busGuardianEnable"]                  = 0
    xlConf["baudrate"]                           = 10000
    xlConf["busGuardianTick"]                    = 0
    xlConf["externalClockCorrectionMode"]        = 0
    xlConf["gColdStartAttempts"]                 = 0x00000014
    xlConf["gListenNoise"]                       = 11
    xlConf["gMacroPerCycle"]                     = 0x00001388
    xlConf["gMaxWithoutClockCorrectionFatal"]    = 0x00000001
    xlConf["gMaxWithoutClockCorrectionPassive"]  = 0x00000001
    xlConf["gNetworkManagementVectorLength"]     = 0
    xlConf["gNumberOfMinislots"]                 = 0x000001E5
    xlConf["gNumberOfStaticSlots"]               = 60
    xlConf["gOffsetCorrectionStart"]             = 0x00001343
    xlConf["gPayloadLengthStatic"]               = 2
    xlConf["gSyncNodeMax"]                       = 4
    xlConf["gdActionPointOffset"]                = 5
    xlConf["gdDynamicSlotIdlePhase"]             = 1
    xlConf["gdMacrotick"]                        = 0
    xlConf["gdMinislot"]                         = 7
    xlConf["gdMiniSlotActionPointOffset"]        = 3
    xlConf["gdNIT"]                              = 103
    xlConf["gdStaticSlot"]                       = 0x00000019
    xlConf["gdSymbolWindow"]                     = 0
    xlConf["gdTSSTransmitter"]                   = 5
    xlConf["gdWakeupSymbolRxIdle"]               = 0
    xlConf["gdWakeupSymbolRxLow"]                = 0
    xlConf["gdWakeupSymbolRxWindow"]             = 0
    xlConf["gdWakeupSymbolTxIdle"]               = 0
    xlConf["gdWakeupSymbolTxLow"]                = 0
    xlConf["pAllowHaltDueToClock"]               = 0
    xlConf["pAllowPassiveToActive"]              = 7
    xlConf["pChannels"]                          = 3
    xlConf["pClusterDriftDamping"]               = 1
    xlConf["pDecodingCorrection"]                = 0x24
    xlConf["pDelayCompensationA"]                = 10
    xlConf["pDelayCompensationB"]                = 10
    xlConf["pExternOffsetCorrection"]            = 1
    xlConf["pExternRateCorrection"]              = 2
    xlConf["pKeySlotUsedForStartup"]             = 1
    xlConf["pKeySlotUsedForSync"]                = 1
    xlConf["pLatestTx"]                          = 0x000001DF
    xlConf["pMacroInitialOffsetA"]               = 7
    xlConf["pMacroInitialOffsetB"]               = 7
    xlConf["pMaxPayloadLengthDynamic"]           = 2
    xlConf["pMicroInitialOffsetA"]               = 0x22
    xlConf["pMicroInitialOffsetB"]               = 0x22
    xlConf["pMicroPerCycle"]                     = 0x00030D40
    xlConf["pMicroPerMacroNom"]                  = 0
    xlConf["pOffsetCorrectionOut"]               = 0x00000057
    xlConf["pRateCorrectionOut"]                 = 0x00000259
    xlConf["pSamplesPerMicrotick"]               = 0
    xlConf["pSingleSlotEnabled"]                 = 0
    xlConf["pWakeupChannel"]                     = 0
    xlConf["pWakeupPattern"]                     = 0
    xlConf["pdAcceptedStartupRange"]             = 0xCD
    xlConf["pdListenTimeout"]                    = 0x61CD8
    xlConf["pdMaxDrift"]                         = 0x0000012C
    xlConf["pdMicrotick"]                        = 0
    xlConf["gdCASRxLowMax"]                      = 7
    xlConf["gChannels"]                          = 0
    xlConf["vExternOffsetControl"]               = 0
    xlConf["vExternRateControl"]                 = 0
    xlConf["pChannelsMTS"]                       = 0

    return xl.FrSetConfiguration(self.portHandle[0], self.accessMask, xlConf)

# python -m unittest tests.test_flexray.TestOpenCloseDriver
class TestOpenCloseDriver(unittest.TestCase):
    def test_opendriver_close_driver(self):
        print(inspect.getframeinfo(inspect.currentframe())[2])

        status = xl.OpenDriver()
        self.assertEqual(status, xl.XL_SUCCESS)
        status = xl.CloseDriver()
        self.assertEqual(status, xl.XL_SUCCESS)

# python -m unittest tests.test_flexray.TestSetGetAppConfig
class TestSetGetAppConfig(unittest.TestCase):
    def setUp(self):
        xl.OpenDriver()

    def tearDown(self):
        xl.CloseDriver()

    def test_setapplconfig_getapplconfig(self):
        print(inspect.getframeinfo(inspect.currentframe())[2])

        status = set_appl_config(self)
        self.assertEqual(status, xl.XL_SUCCESS)

        pHwType = [0xff]
        pHwIndex = [0xff]
        pHwChannel = [0xff]
        status = xl.GetApplConfig(appName=bytes("pyxldrv".encode()), appChannel=0, pHwType=pHwType, pHwIndex=pHwIndex, pHwChannel=pHwChannel, busType=xl.XL_BUS_TYPE_FLEXRAY)
        self.assertEqual(status, xl.XL_SUCCESS)
        self.assertEqual(pHwType[0], xl.XL_HWTYPE_VN7610)
        self.assertEqual(pHwIndex[0], 0)
        self.assertEqual(pHwChannel[0], 0)

# python -m unittest tests.test_flexray.TestGetDriverConfig
class TestGetDriverConfig(unittest.TestCase):
    def setUp(self):
        xl.OpenDriver()
        set_appl_config(self)

    def tearDown(self):
        xl.CloseDriver()

    def test_getdriverconfig(self):
        print(inspect.getframeinfo(inspect.currentframe())[2])

        driverConfig = {}
        status = xl.GetDriverConfig(driverConfig)
        self.assertEqual(status, xl.XL_SUCCESS)

# python -m unittest tests.test_flexray.TestGetChannelMask
class TestGetChannelMask(unittest.TestCase):
    def setUp(self):
        xl.OpenDriver()
        set_appl_config(self)

    def tearDown(self):
        xl.CloseDriver()

    def test_getchannelmask(self):
        print(inspect.getframeinfo(inspect.currentframe())[2])
        
        accessMask = xl.GetChannelMask(self.pHwType[0], self.pHwIndex[0], self.pHwChannel[0])
        self.assertNotEqual(accessMask,0)

# python -m unittest tests.test_flexray.TestOpenClosePort
class TestOpenClosePort(unittest.TestCase):
    def setUp(self):
        xl.OpenDriver()
        set_appl_config(self)
        self.accessMask = xl.GetChannelMask(self.pHwType[0],self.pHwIndex[0],self.pHwChannel[0])

    def tearDown(self):
        xl.CloseDriver()

    def test_openport_closeport(self):
        print(inspect.getframeinfo(inspect.currentframe())[2])

        portHandle      = [xl.XL_INVALID_PORTHANDLE]
        permissionMask  = [self.accessMask]
        rxQueueSize     = 2^10
        appName         = self.appName
        accessMask      = self.accessMask
        xlInterfaceVersion = xl.XL_INTERFACE_VERSION_V4
        busType         = self.busType

        status = xl.OpenPort(portHandle, appName, accessMask, permissionMask, rxQueueSize, xlInterfaceVersion, busType)
        
        self.assertEqual(status, xl.XL_SUCCESS)
        self.assertNotEqual(portHandle, xl.XL_INVALID_PORTHANDLE)
        self.assertEqual(permissionMask[0], self.accessMask)

        status = xl.ClosePort(portHandle[0])
        self.assertEqual(status, xl.XL_SUCCESS)

        status = xl.CloseDriver()
        self.assertEqual(status, xl.XL_SUCCESS)

# python -m unittest tests.test_flexray.TestSetConfiguration
class TestSetConfiguration(unittest.TestCase):
    def setUp(self):
        xl.OpenDriver()
        set_appl_config(self)
        self.accessMask = xl.GetChannelMask(self.pHwType[0],self.pHwIndex[0],self.pHwChannel[0])
        open_port(self)

    def tearDown(self):
        xl.ClosePort(self.portHandle[0])
        xl.CloseDriver()

    def test_set_configuration(self):
        xlStatus = set_configuration(self)
        self.assertEqual(xlStatus, xl.XL_SUCCESS)

# python -m unittest tests.test_flexray.TestActivateDeactivate
class TestActivateDeactivate(unittest.TestCase):
    def setUp(self):
        xl.OpenDriver()
        set_appl_config(self)
        self.accessMask = xl.GetChannelMask(self.pHwType[0],self.pHwIndex[0],self.pHwChannel[0])

        open_port(self)
        set_configuration(self)

    def tearDown(self):
        xl.ClosePort(self.portHandle[0])
        xl.CloseDriver()

    def test_activate_deactivate(self):
        print(inspect.getframeinfo(inspect.currentframe())[2])

        portHandle = self.portHandle[0]
        accessMask = self.accessMask
        busType    = self.busType
        flags      = xl.XL_ACTIVATE_RESET_CLOCK

        status = xl.ActivateChannel(portHandle, accessMask, busType, flags)
        self.assertEqual(status, xl.XL_SUCCESS)

        status = xl.DeactivateChannel(portHandle, accessMask)
        self.assertEqual(status, xl.XL_SUCCESS)

# python -m unittest tests.test_flexray.TestFlexRayInitStartupAndSync
class TestFlexRayInitStartupAndSync(unittest.TestCase):
    def setUp(self):
        xl.OpenDriver()
        set_appl_config(self)

        self.accessMask = xl.GetChannelMask(self.pHwType[0],self.pHwIndex[0],self.pHwChannel[0])
        open_port(self)
        set_configuration(self)

    def tearDown(self):
        xl.ClosePort(self.portHandle[0])
        xl.CloseDriver()

    def test_get_channel_configuration(self):
        config = {}
        xlStatus = xl.FrGetChannelConfiguration(self.portHandle[0], self.accessMask, config)
        self.assertEqual(xlStatus, xl.XL_SUCCESS)

    def test_set_mode(self):
        mode = {}
        mode["frMode"] = xl.XL_FR_MODE_NORMAL
        mode["frStartupAttributes"] = xl.XL_FR_MODE_COLDSTART_LEADING
        xlStatus = xl.FrSetMode(self.portHandle[0], self.accessMask, mode)
        self.assertEqual(xlStatus, xl.XL_SUCCESS)

    def test_init_startup_and_sync(self):
        payload = ""
        configFrame = {}
        configFrame['tag']                                      = xl.XL_FR_TX_FRAME
        configFrame['flagsChip']                                = xl.XL_FR_CHANNEL_A
        configFrame['size']                                     = 0
        configFrame['userHandle']                               = 0
        configFrame['tagData'] = {}
        configFrame['tagData']['frTxFrame'] = {}
        configFrame['tagData']['frTxFrame']['flags']            = xl.XL_FR_FRAMEFLAG_STARTUP|xl.XL_FR_FRAMEFLAG_SYNC|xl.XL_FR_FRAMEFLAG_REQ_TXACK
        configFrame['tagData']['frTxFrame']['offset']           = 0
        configFrame['tagData']['frTxFrame']['repetition']       = 2
        configFrame['tagData']['frTxFrame']['payloadLength']    = len(payload)/2
        configFrame['tagData']['frTxFrame']['slotID']           = 4
        configFrame['tagData']['frTxFrame']['txMode']           = xl.XL_FR_TX_MODE_CYCLIC
        configFrame['tagData']['frTxFrame']['incrementOffset']  = 0
        configFrame['tagData']['frTxFrame']['incrementSize']    = 0
        configFrame['tagData']['frTxFrame']['data']             = payload
        xlStatus = xl.FrInitStartupAndSync(self.portHandle[0], self.accessMask, configFrame)
        self.assertEquals(xlStatus, xl.XL_SUCCESS)
        
# python -m unittest tests.test_flexray.TestFlexRayFunctions
class TestFlexRayTransmitReceive(unittest.TestCase):
    def setUp(self):
        xl.OpenDriver()
        set_appl_config(self)

        self.accessMask = xl.GetChannelMask(self.pHwType[0],self.pHwIndex[0],self.pHwChannel[0])
        open_port(self)
        set_configuration(self)

        self.flags      = xl.XL_ACTIVATE_RESET_CLOCK
        xl.ActivateChannel(self.portHandle[0], self.accessMask, self.busType, self.flags)

    def tearDown(self):
        xl.DeactivateChannel(self.portHandle[0], self.accessMask)
        xl.ClosePort(self.portHandle[0])
        xl.CloseDriver()
        
    def test_set_transceiver_mode(self):
        xlStatus = xl.FrSetTransceiverMode(self.portHandle[0], self.accessMask, xl.XL_FR_CHANNEL_AB, xl.XL_FR_TRANSCEIVER_MODE_NORMAL)
        self.assertEquals(xlStatus, xl.XL_SUCCESS)

    #def test_set_acceptance_filter(self):
    #    accFilter = {}
    #    accFilter['filterStatus']       = xl.XL_FR_FILTER_PASS
    #    accFilter['filterTypeMask']     = xl.XL_FR_FILTER_TYPE_DATA
    #    accFilter['filterFirstSlot']    = 0
    #    accFilter['filterLastSlot']     = 100
    #    accFilter['filterChannelMask']  = xl.XL_FR_FILTER_CHANNEL_A
    #    xlStatus = xl.FrSetAcceptanceFilter(self.portHandle[0], self.accessMask, accFilter)
    #    self.assertEquals(xlStatus, xl.XL_SUCCESS) # XL_ERR_NO_LICENSE

    def test_fr_transmit_receive(self):
        payload = "010203040506"
        transmitFrame = {}
        transmitFrame['tag']                                      = xl.XL_FR_TX_FRAME
        transmitFrame['flagsChip']                                = xl.XL_FR_CHANNEL_A
        transmitFrame['size']                                     = 0
        transmitFrame['userHandle']                               = 0
        transmitFrame['tagData'] = {}
        transmitFrame['tagData']['frTxFrame'] = {}
        transmitFrame['tagData']['frTxFrame']['flags']            = 0
        transmitFrame['tagData']['frTxFrame']['offset']           = 0
        transmitFrame['tagData']['frTxFrame']['repetition']       = 2
        transmitFrame['tagData']['frTxFrame']['payloadLength']    = len(payload)/2
        transmitFrame['tagData']['frTxFrame']['slotID']           = 4
        transmitFrame['tagData']['frTxFrame']['txMode']           = xl.XL_FR_TX_MODE_CYCLIC
        transmitFrame['tagData']['frTxFrame']['incrementOffset']  = 0
        transmitFrame['tagData']['frTxFrame']['incrementSize']    = 0
        transmitFrame['tagData']['frTxFrame']['data']             = payload
        xlStatus = xl.FrTransmit(self.portHandle[0], self.accessMask, transmitFrame)
        print(transmitFrame)
        self.assertEquals(xlStatus, xl.XL_SUCCESS)

        #receiveFrame = {}
        #transmitFrame['tag']            = xl.XL_FR_RX_FRAME
        #xlStatus = xl.FrReceive(self.portHandle[0], receiveFrame)
        #self.assertEqual(xlStatus, xl.XL_SUCCESS)

if __name__ == '__main__':
    unittest.main()