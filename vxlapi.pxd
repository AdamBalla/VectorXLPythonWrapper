# *-* encoding: utf-8 *-*

# vxlapi.h expects <windows.h>
cdef extern from "<windows.h>":
    pass

cdef extern from "vxlapi.h":
    cdef:
        DEF XL_MAX_LENGTH          = 31
        DEF XL_CONFIG_MAX_CHANNELS = 64
        DEF XL_INVALID_PORTHANDLE  = -1
        DEF MAX_MSG_LEN = 8
        DEF XL_CAN_MAX_DATA_LEN           = 64
        DEF XL_CANFD_RX_EVENT_HEADER_SIZE = 32
        DEF XL_CANFD_MAX_EVENT_SIZE       = 128
        DEF XL_FR_MAX_DATA_LENGTH         = 254
        DEF XL_FR_RX_EVENT_HEADER_SIZE    = 32 
        DEF XL_FR_MAX_EVENT_SIZE          = 512

        ctypedef short XLstatus
        ctypedef unsigned long long XLuint64
        ctypedef XLuint64 XLaccess
        ctypedef long XLportHandle
        ctypedef void* HANDLE
        ctypedef HANDLE XLhandle
    
        struct st_can:
            unsigned int    bitRate
            unsigned char   sjw
            unsigned char   tseg1
            unsigned char   tseg2
            unsigned char   sam
            unsigned char   outputMode
            unsigned char   reserved1[7]
            unsigned char   canOpMode

        struct st_canFD:
            unsigned int  arbitrationBitRate
            unsigned char sjwAbr
            unsigned char tseg1Abr
            unsigned char tseg2Abr
            unsigned char samAbr
            unsigned char outputMode
            unsigned char sjwDbr
            unsigned char tseg1Dbr
            unsigned char tseg2Dbr
            unsigned int  dataBitRate
            unsigned char canOpMode

        struct st_most:
            unsigned int  activeSpeedGrade
            unsigned int  compatibleSpeedGrade
            unsigned int  inicFwVersion

        struct st_flexray:
            unsigned int  status
            unsigned int  cfgMode
            unsigned int  baudrate

        struct st_ethernet:
            unsigned char macAddr[6]
            unsigned char connector
            unsigned char phy
            unsigned char link
            unsigned char speed
            unsigned char clockMode
            unsigned char bypass

        struct st_tx:
            unsigned int bitrate
            unsigned int parity
            unsigned int minGap

        struct st_rx:
            unsigned int bitrate
            unsigned int minBitrate
            unsigned int maxBitrate
            unsigned int parity
            unsigned int minGap
            unsigned int autoBaudrate
    
        union union_dir:
            st_tx tx
            st_rx rx
            unsigned char raw[24]

        struct st_a429:
            unsigned short  channelDirection
            unsigned short  res1
            union_dir       dir
        
        union union_data:
            st_can      can
            st_canFD    canFD
            st_most     most
            st_flexray  flexray
            st_ethernet ethernet
            st_a429     a429
            unsigned char raw[28]

        struct XLbusParams:
            unsigned int    busType
            union_data      data

        struct XL_CHANNEL_CONFIG:
            char                name[XL_MAX_LENGTH + 1]
            unsigned char       hwType
            unsigned char       hwIndex
            unsigned char       hwChannel
            unsigned short      transceiverType
            unsigned short      transceiverState
            unsigned short      configError
            unsigned char       channelIndex
            XLuint64            channelMask
            unsigned int        channelCapabilities
            unsigned int        channelBusCapabilities      
            unsigned char       isOnBus
            unsigned int        connectedBusType
            XLbusParams         busParams
            unsigned int        _doNotUse                                             
            unsigned int        driverVersion
            unsigned int        interfaceVersion
            unsigned int        raw_data[10]       
            unsigned int        serialNumber
            unsigned int        articleNumber                 
            char                transceiverName [XL_MAX_LENGTH + 1]                    
            unsigned int        specialCabFlags
            unsigned int        dominantTimeout
            unsigned char       dominantRecessiveDelay
            unsigned char       recessiveDominantDelay
            unsigned char       connectionInfo
            unsigned char       currentlyAvailableTimestamps
            unsigned short      minimalSupplyVoltage
            unsigned short      maximalSupplyVoltage
            unsigned int        maximalBaudrate
            unsigned char       fpgaCoreCapabilities
            unsigned char       specialDeviceStatus
            unsigned short      channelBusActiveCapabilities
            unsigned short      breakOffset
            unsigned short      delimiterOffset
            unsigned int        reserved[3]

        struct XL_DRIVER_CONFIG:
            unsigned int        dllVersion
            unsigned int        channelCount
            unsigned int        reserved[10]
            XL_CHANNEL_CONFIG   channel[XL_CONFIG_MAX_CHANNELS]
    
        ctypedef XL_DRIVER_CONFIG  XLdriverConfig

        struct s_xl_can_msg:
            unsigned long     id
            unsigned short    flags
            unsigned short    dlc
            XLuint64          res1
            unsigned char     data[MAX_MSG_LEN]
            XLuint64          res2
        
        struct s_xl_chip_state:
            unsigned char busStatus
            unsigned char txErrorCounter
            unsigned char rxErrorCounter

        struct s_xl_transceiver:
            unsigned char  event_reason
            unsigned char  is_present

        struct s_xl_lin_msg:
            unsigned char id
            unsigned char dlc
            unsigned short flags
            unsigned char data[8]
            unsigned char crc

        struct s_xl_lin_sleep:
            unsigned char flag

        struct s_xl_lin_no_ans:
            unsigned char id

        struct s_xl_lin_wake_up:
            unsigned char flag
            unsigned char unused[3]
            unsigned int  startOffs
            unsigned int  width

        struct s_xl_lin_crc_info:
            unsigned char id
            unsigned char flags

        union s_xl_lin_msg_api:
            s_xl_lin_msg           linMsg
            s_xl_lin_no_ans        linNoAns
            s_xl_lin_wake_up       linWakeUp
            s_xl_lin_sleep         linSleep
            s_xl_lin_crc_info      linCRCinfo

        ctypedef struct XL_IO_DIGITAL_DATA:
            unsigned int digitalInputData

        ctypedef struct XL_IO_ANALOG_DATA:
            unsigned int measuredAnalogData0
            unsigned int measuredAnalogData1
            unsigned int measuredAnalogData2
            unsigned int measuredAnalogData3

        union st_dio_data:
            XL_IO_DIGITAL_DATA  digital
            XL_IO_ANALOG_DATA   analog

        struct s_xl_daio_piggy_data:
            unsigned int daioEvtTag
            unsigned int triggerType
            st_dio_data  data

        struct s_xl_daio_data:
                unsigned short    flags
                unsigned int      timestamp_correction
                unsigned char     mask_digital
                unsigned char     value_digital
                unsigned char     mask_analog
                unsigned char     reserved0
                unsigned short    value_analog[4]
                unsigned int      pwm_frequency
                unsigned short    pwm_value
                unsigned int      reserved1
                unsigned int      reserved2

        struct s_xl_sync_pulse_ev:
            unsigned int      triggerSource
            unsigned int      reserved
            XLuint64          time

        struct s_xl_sync_pulse:
            unsigned char     pulseCode
            XLuint64          time

        union s_xl_tag_data:
            s_xl_can_msg           msg
            s_xl_chip_state        chipState
            s_xl_lin_msg_api       linMsgApi
            s_xl_sync_pulse        syncPulse
            s_xl_daio_data         daioData
            s_xl_transceiver       transceiver
            s_xl_daio_piggy_data   daioPiggyData

        ctypedef unsigned char  XLeventTag
        ctypedef struct s_xl_event:
            XLeventTag             tag
            unsigned char          chanIndex
            unsigned short         transId
            unsigned short         portHandle
            unsigned char          flags
            unsigned char          reserved
            XLuint64               timeStamp
            s_xl_tag_data          tagData
        
        ctypedef s_xl_event XLevent

        ctypedef char *XLstringType
        
        ctypedef struct XLchipParams:
            unsigned long bitRate
            unsigned char sjw
            unsigned char tseg1
            unsigned char tseg2
            unsigned char sam

        ctypedef struct XL_LICENSE_INFO:
            unsigned char bAvailable
            char          licName[65]

        ctypedef XL_LICENSE_INFO XLlicenseInfo

        ctypedef struct XLcanFdConf:
            unsigned int  arbitrationBitRate
            unsigned int  sjwAbr
            unsigned int  tseg1Abr
            unsigned int  tseg2Abr
            unsigned int  dataBitRate
            unsigned int  sjwDbr
            unsigned int  tseg1Dbr
            unsigned int  tseg2Dbr
            unsigned char reserved;
            unsigned char options;
            unsigned char reserved1[2];
            unsigned int  reserved2;

        ctypedef struct XL_CAN_TX_MSG:
            unsigned int       canId
            unsigned int       msgFlags
            unsigned char      dlc
            unsigned char      reserved[7]
            unsigned char      data[XL_CAN_MAX_DATA_LEN]

        ctypedef union st_tagData:
            XL_CAN_TX_MSG   canMsg

        ctypedef struct XLcanTxEvent:
            unsigned short     tag
            unsigned short     transId
            unsigned char      channelIndex
            unsigned char      reserved[3]
            st_tagData         tagData

        ctypedef struct XLfrClusterConfig:
            unsigned int busGuardianEnable
            unsigned int baudrate
            unsigned int busGuardianTick
            unsigned int externalClockCorrectionMode
            unsigned int gColdStartAttempts
            unsigned int gListenNoise
            unsigned int gMacroPerCycle
            unsigned int gMaxWithoutClockCorrectionFatal
            unsigned int gMaxWithoutClockCorrectionPassive
            unsigned int gNetworkManagementVectorLength
            unsigned int gNumberOfMinislots
            unsigned int gNumberOfStaticSlots
            unsigned int gOffsetCorrectionStart
            unsigned int gPayloadLengthStatic
            unsigned int gSyncNodeMax
            unsigned int gdActionPointOffset
            unsigned int gdDynamicSlotIdlePhase
            unsigned int gdMacrotick
            unsigned int gdMinislot
            unsigned int gdMiniSlotActionPointOffset
            unsigned int gdNIT
            unsigned int gdStaticSlot
            unsigned int gdSymbolWindow
            unsigned int gdTSSTransmitter
            unsigned int gdWakeupSymbolRxIdle
            unsigned int gdWakeupSymbolRxLow
            unsigned int gdWakeupSymbolRxWindow
            unsigned int gdWakeupSymbolTxIdle
            unsigned int gdWakeupSymbolTxLow
            unsigned int pAllowHaltDueToClock
            unsigned int pAllowPassiveToActive
            unsigned int pChannels
            unsigned int pClusterDriftDamping
            unsigned int pDecodingCorrection
            unsigned int pDelayCompensationA
            unsigned int pDelayCompensationB
            unsigned int pExternOffsetCorrection
            unsigned int pExternRateCorrection
            unsigned int pKeySlotUsedForStartup
            unsigned int pKeySlotUsedForSync
            unsigned int pLatestTx
            unsigned int pMacroInitialOffsetA
            unsigned int pMacroInitialOffsetB
            unsigned int pMaxPayloadLengthDynamic
            unsigned int pMicroInitialOffsetA
            unsigned int pMicroInitialOffsetB
            unsigned int pMicroPerCycle
            unsigned int pMicroPerMacroNom
            unsigned int pOffsetCorrectionOut
            unsigned int pRateCorrectionOut
            unsigned int pSamplesPerMicrotick
            unsigned int pSingleSlotEnabled
            unsigned int pWakeupChannel
            unsigned int pWakeupPattern
            unsigned int pdAcceptedStartupRange
            unsigned int pdListenTimeout
            unsigned int pdMaxDrift
            unsigned int pdMicrotick
            unsigned int gdCASRxLowMax
            unsigned int gChannels
            unsigned int vExternOffsetControl
            unsigned int vExternRateControl
            unsigned int pChannelsMTS
            unsigned int reserved[16]

        ctypedef struct XLfrChannelConfig:
            unsigned int status
            unsigned int cfgMode
            unsigned int reserved[6]
            XLfrClusterConfig xlFrClusterConfig

        ctypedef struct XLfrMode:
            unsigned int frMode
            unsigned int frStartupAttributes
            unsigned int reserved[30]

        ctypedef struct XLfrAcceptanceFilter:
            unsigned int filterStatus
            unsigned int filterTypeMask
            unsigned int filterFirstSlot
            unsigned int filterLastSlot
            unsigned int filterChannelMask

        struct s_xl_fr_start_cycle:
            unsigned int cycleCount
            int          vRateCorrection
            int          vOffsetCorrection
            unsigned int vClockCorrectionFailed
            unsigned int vAllowPassivToActive
            unsigned int reserved[3]

        ctypedef s_xl_fr_start_cycle XL_FR_START_CYCLE_EV

        struct s_xl_fr_rx_frame:
            unsigned short flags
            unsigned short headerCRC
            unsigned short slotID
            unsigned char  cycleCount
            unsigned char  payloadLength
            unsigned char  data[XL_FR_MAX_DATA_LENGTH]
        
        ctypedef s_xl_fr_rx_frame XL_FR_RX_FRAME_EV

        struct s_xl_fr_tx_frame:
            unsigned short flags
            unsigned short slotID
            unsigned char  offset
            unsigned char  repetition
            unsigned char  payloadLength
            unsigned char  txMode
            unsigned char  incrementSize
            unsigned char  incrementOffset
            unsigned char  reserved0
            unsigned char  reserved1
            unsigned char  data[XL_FR_MAX_DATA_LENGTH]

        ctypedef s_xl_fr_tx_frame XL_FR_TX_FRAME_EV

        ctypedef s_xl_fr_rx_frame XL_FR_TXACK_FRAME

        ctypedef s_xl_fr_rx_frame XL_FR_INVALID_FRAME

        struct s_xl_fr_wakeup:
            unsigned char cycleCount
            unsigned char wakeupStatus
            unsigned char reserved[6]

        ctypedef s_xl_fr_wakeup XL_FR_WAKEUP_EV

        struct s_xl_fr_symbol_window:
            unsigned int  symbol
            unsigned int  flags
            unsigned char cycleCount
            unsigned char reserved[7]

        ctypedef s_xl_fr_symbol_window XL_FR_SYMBOL_WINDOW_EV

        struct s_xl_fr_error_poc_mode:
            unsigned char errorMode
            unsigned char reserved[3]

        ctypedef s_xl_fr_error_poc_mode XL_FR_ERROR_POC_MODE_EV

        #ctypedef ... XL_FR_ERROR_SYNC_FRAMES_BELOWMIN

        struct s_xl_fr_error_sync_frames:
            unsigned short evenSyncFramesA
            unsigned short oddSyncFramesA
            unsigned short evenSyncFramesB
            unsigned short oddSyncFramesB
            unsigned int   reserved

        ctypedef s_xl_fr_error_sync_frames XL_FR_ERROR_SYNC_FRAMES_EV

        struct s_xl_fr_error_clock_corr_failure:
            unsigned short evenSyncFramesA
            unsigned short oddSyncFramesA
            unsigned short evenSyncFramesB
            unsigned short oddSyncFramesB
            unsigned int   flags
            unsigned int   clockCorrFailedCounter
            unsigned int   reserved
        
        ctypedef s_xl_fr_error_clock_corr_failure XL_FR_ERROR_CLOCK_CORR_FAILURE_EV

        struct s_xl_fr_error_nit_failure:
            unsigned int flags
            unsigned int reserved

        ctypedef s_xl_fr_error_nit_failure XL_FR_ERROR_NIT_FAILURE_EV

        struct s_xl_fr_error_cc_error:
            unsigned int ccError
            unsigned int reserved

        ctypedef s_xl_fr_error_cc_error XL_FR_ERROR_CC_ERROR_EV

        struct s_xl_fr_status:
            unsigned int statusType
            unsigned int reserved
        
        ctypedef s_xl_fr_status XL_FR_STATUS_EV

        struct s_xl_fr_nm_vector:
            unsigned char nmVector[12]
            unsigned char cycleCount
            unsigned char reserved[3]

        ctypedef s_xl_fr_nm_vector XL_FR_NM_VECTOR_EV

        struct s_xl_sync_pulse_ev:
            unsigned int      triggerSource;
            unsigned int      reserved;
            XLuint64          time;
        
        ctypedef s_xl_sync_pulse_ev XL_SYNC_PULSE_EV

        ctypedef XL_SYNC_PULSE_EV XL_FR_SYNC_PULSE_EV

        struct s_xl_fr_spy_frame:
            unsigned int   frameLength
            unsigned char  frameError
            unsigned char  tssLength
            unsigned short headerFlags
#            unsigned short slotId
            unsigned short headerCRC
            unsigned char  payloadLength
            unsigned char  cycleCount
            unsigned short reserved
            unsigned int   frameCRC
            unsigned char  data[254]

        ctypedef s_xl_fr_spy_frame XL_FR_SPY_FRAME_EV

        struct s_xl_fr_spy_symbol:
            unsigned short lowLength
            unsigned short reserved

        ctypedef s_xl_fr_spy_symbol XL_FR_SPY_SYMBOL_EV

        struct s_xl_application_notification:
            unsigned int notifyReason
            unsigned int reserved[7]

        ctypedef s_xl_application_notification XL_APPLICATION_NOTIFICATION_EV

        union s_xl_fr_error_info:
            XL_FR_ERROR_POC_MODE_EV               frPocMode
            XL_FR_ERROR_SYNC_FRAMES_EV            frSyncFramesBelowMin
            XL_FR_ERROR_SYNC_FRAMES_EV            frSyncFramesOverload
            XL_FR_ERROR_CLOCK_CORR_FAILURE_EV     frClockCorrectionFailure
            XL_FR_ERROR_NIT_FAILURE_EV            frNitFailure
            XL_FR_ERROR_CC_ERROR_EV               frCCError

        struct s_xl_fr_error:
            unsigned char      tag
            unsigned char      cycleCount
            unsigned char      reserved[6]
            s_xl_fr_error_info errorInfo
        
        ctypedef s_xl_fr_error XL_FR_ERROR_EV

        union s_xl_fr_tag_data:
            XL_FR_START_CYCLE_EV                  frStartCycle
            XL_FR_RX_FRAME_EV                     frRxFrame
            XL_FR_TX_FRAME_EV                     frTxFrame
            XL_FR_WAKEUP_EV                       frWakeup
            XL_FR_SYMBOL_WINDOW_EV                frSymbolWindow
            XL_FR_ERROR_EV                        frError
            XL_FR_STATUS_EV                       frStatus
            XL_FR_NM_VECTOR_EV                    frNmVector
            XL_FR_SYNC_PULSE_EV                   frSyncPulse
            XL_FR_SPY_FRAME_EV                    frSpyFrame
            XL_FR_SPY_SYMBOL_EV                   frSpySymbol
            XL_APPLICATION_NOTIFICATION_EV        applicationNotification
            unsigned char                         raw[XL_FR_MAX_EVENT_SIZE - XL_FR_RX_EVENT_HEADER_SIZE]

        ctypedef unsigned short XLfrEventTag

        struct s_xl_fr_event:
            unsigned int     size
            XLfrEventTag     tag
            unsigned short   channelIndex
            unsigned int     userHandle
            unsigned short   flagsChip
            unsigned short   reserved
            XLuint64         timeStamp
            XLuint64         timeStampSync
            s_xl_fr_tag_data tagData

        ctypedef s_xl_fr_event XLfrEvent