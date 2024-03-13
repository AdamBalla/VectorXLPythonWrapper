# *-* encoding: utf-8 *-*

from libc.string cimport memset
from libc.string cimport memcpy
from libc.stdlib cimport malloc, free


cdef extern from "vxlapi.h":

    int _XL_HWTYPE_NONE                    "XL_HWTYPE_NONE"
    int _XL_HWTYPE_VIRTUAL                 "XL_HWTYPE_VIRTUAL"
    int _XL_HWTYPE_CANCARDX                "XL_HWTYPE_CANCARDX"
    int _XL_HWTYPE_CANAC2PCI               "XL_HWTYPE_CANAC2PCI"
    int _XL_HWTYPE_CANCARDY                "XL_HWTYPE_CANCARDY"
    int _XL_HWTYPE_CANCARDXL               "XL_HWTYPE_CANCARDXL"
    int _XL_HWTYPE_CANCASEXL               "XL_HWTYPE_CANCASEXL"
    int _XL_HWTYPE_CANCASEXL_LOG_OBSOLETE  "XL_HWTYPE_CANCASEXL_LOG_OBSOLETE"
    int _XL_HWTYPE_CANBOARDXL              "XL_HWTYPE_CANBOARDXL"
    int _XL_HWTYPE_CANBOARDXL_PXI          "XL_HWTYPE_CANBOARDXL_PXI"
    int _XL_HWTYPE_VN2600                  "XL_HWTYPE_VN2600"
    int _XL_HWTYPE_VN2610                  "XL_HWTYPE_VN2610"
    int _XL_HWTYPE_VN3300                  "XL_HWTYPE_VN3300"
    int _XL_HWTYPE_VN3600                  "XL_HWTYPE_VN3600"
    int _XL_HWTYPE_VN7600                  "XL_HWTYPE_VN7600"
    int _XL_HWTYPE_CANCARDXLE              "XL_HWTYPE_CANCARDXLE"
    int _XL_HWTYPE_VN8900                  "XL_HWTYPE_VN8900"
    int _XL_HWTYPE_VN8950                  "XL_HWTYPE_VN8950"
    int _XL_HWTYPE_VN2640                  "XL_HWTYPE_VN2640"
    int _XL_HWTYPE_VN1610                  "XL_HWTYPE_VN1610"
    int _XL_HWTYPE_VN1630                  "XL_HWTYPE_VN1630"
    int _XL_HWTYPE_VN1640                  "XL_HWTYPE_VN1640"
    int _XL_HWTYPE_VN8970                  "XL_HWTYPE_VN8970"
    int _XL_HWTYPE_VN1611                  "XL_HWTYPE_VN1611"
    int _XL_HWTYPE_VN5610                  "XL_HWTYPE_VN5610"
    int _XL_HWTYPE_VN7570                  "XL_HWTYPE_VN7570"
    int _XL_HWTYPE_IPCLIENT                "XL_HWTYPE_IPCLIENT"
    int _XL_HWTYPE_IPSERVER                "XL_HWTYPE_IPSERVER"
    int _XL_HWTYPE_VX1121                  "XL_HWTYPE_VX1121"
    int _XL_HWTYPE_VX1131                  "XL_HWTYPE_VX1131"
    int _XL_HWTYPE_VT6204                  "XL_HWTYPE_VT6204"
    int _XL_HWTYPE_VN1630_LOG              "XL_HWTYPE_VN1630_LOG"
    int _XL_HWTYPE_VN7610                  "XL_HWTYPE_VN7610"
    int _XL_HWTYPE_VN7572                  "XL_HWTYPE_VN7572"
    int _XL_HWTYPE_VN8972                  "XL_HWTYPE_VN8972"
    int _XL_HWTYPE_VN0601                  "XL_HWTYPE_VN0601"
    int _XL_HWTYPE_VX0312                  "XL_HWTYPE_VX0312"
    int _XL_HWTYPE_VN8800                  "XL_HWTYPE_VN8800"
    int _XL_HWTYPE_IPCL8800                "XL_HWTYPE_IPCL8800"
    int _XL_HWTYPE_IPSRV8800               "XL_HWTYPE_IPSRV8800"
    int _XL_HWTYPE_CSMCAN                  "XL_HWTYPE_CSMCAN"
    int _XL_HWTYPE_VN5610A                 "XL_HWTYPE_VN5610A"
    int _XL_HWTYPE_VN7640                  "XL_HWTYPE_VN7640"
    int _XL_MAX_HWTYPE                     "XL_MAX_HWTYPE"

    int _XL_BUS_TYPE_NONE      "XL_BUS_TYPE_NONE"
    int _XL_BUS_TYPE_CAN       "XL_BUS_TYPE_CAN"
    int _XL_BUS_TYPE_LIN       "XL_BUS_TYPE_LIN"
    int _XL_BUS_TYPE_FLEXRAY   "XL_BUS_TYPE_FLEXRAY"
    int _XL_BUS_TYPE_AFDX      "XL_BUS_TYPE_AFDX"
    int _XL_BUS_TYPE_MOST      "XL_BUS_TYPE_MOST"
    int _XL_BUS_TYPE_DAIO      "XL_BUS_TYPE_DAIO"
    int _XL_BUS_TYPE_J1708     "XL_BUS_TYPE_J1708"
    int _XL_BUS_TYPE_ETHERNET  "XL_BUS_TYPE_ETHERNET"
    int _XL_BUS_TYPE_A429      "XL_BUS_TYPE_A429"

    int _XL_INTERFACE_VERSION_V2  "XL_INTERFACE_VERSION_V2"
    int _XL_INTERFACE_VERSION_V3  "XL_INTERFACE_VERSION_V3"
    int _XL_INTERFACE_VERSION_V4  "XL_INTERFACE_VERSION_V4"
    int _XL_INTERFACE_VERSION     "XL_INTERFACE_VERSION"

    int _XL_INVALID_PORTHANDLE    "XL_INVALID_PORTHANDLE"

    int _XL_BUS_PARAMS_CANOPMODE_CAN20  "XL_BUS_PARAMS_CANOPMODE_CAN20"
    int _XL_BUS_PARAMS_CANOPMODE_CANFD  "XL_BUS_PARAMS_CANOPMODE_CANFD"

    int _XL_A429_MSG_CHANNEL_DIR_TX              "XL_A429_MSG_CHANNEL_DIR_TX"
    int _XL_A429_MSG_CHANNEL_DIR_RX              "XL_A429_MSG_CHANNEL_DIR_RX"
    int _XL_A429_MSG_BITRATE_SLOW_MIN            "XL_A429_MSG_BITRATE_SLOW_MIN"
    int _XL_A429_MSG_BITRATE_SLOW_MAX            "XL_A429_MSG_BITRATE_SLOW_MAX"
    int _XL_A429_MSG_BITRATE_FAST_MIN            "XL_A429_MSG_BITRATE_FAST_MIN"
    int _XL_A429_MSG_BITRATE_FAST_MAX            "XL_A429_MSG_BITRATE_FAST_MAX"
    int _XL_A429_MSG_GAP_4BIT                    "XL_A429_MSG_GAP_4BIT"
    int _XL_A429_MSG_BITRATE_RX_MIN              "XL_A429_MSG_BITRATE_RX_MIN"
    int _XL_A429_MSG_BITRATE_RX_MAX              "XL_A429_MSG_BITRATE_RX_MAX"
    int _XL_A429_MSG_AUTO_BAUDRATE_DISABLED      "XL_A429_MSG_AUTO_BAUDRATE_DISABLED"
    int _XL_A429_MSG_AUTO_BAUDRATE_ENABLED       "XL_A429_MSG_AUTO_BAUDRATE_ENABLED"
    int _XL_A429_MSG_FLAG_ON_REQUEST             "XL_A429_MSG_FLAG_ON_REQUEST"
    int _XL_A429_MSG_FLAG_CYCLIC                 "XL_A429_MSG_FLAG_CYCLIC"
    int _XL_A429_MSG_FLAG_DELETE_CYCLIC          "XL_A429_MSG_FLAG_DELETE_CYCLIC"
    int _XL_A429_MSG_CYCLE_MAX                   "XL_A429_MSG_CYCLE_MAX"
    int _XL_A429_MSG_GAP_DEFAULT                 "XL_A429_MSG_GAP_DEFAULT"
    int _XL_A429_MSG_GAP_MAX                     "XL_A429_MSG_GAP_MAX"
    int _XL_A429_MSG_PARITY_DEFAULT              "XL_A429_MSG_PARITY_DEFAULT"
    int _XL_A429_MSG_PARITY_DISABLED             "XL_A429_MSG_PARITY_DISABLED"
    int _XL_A429_MSG_PARITY_ODD                  "XL_A429_MSG_PARITY_ODD"
    int _XL_A429_MSG_PARITY_EVEN                 "XL_A429_MSG_PARITY_EVEN"
    int _XL_A429_EV_TX_MSG_CTRL_ON_REQUEST       "XL_A429_EV_TX_MSG_CTRL_ON_REQUEST"
    int _XL_A429_EV_TX_MSG_CTRL_CYCLIC           "XL_A429_EV_TX_MSG_CTRL_CYCLIC"
    int _XL_A429_EV_TX_ERROR_ACCESS_DENIED       "XL_A429_EV_TX_ERROR_ACCESS_DENIED"
    int _XL_A429_EV_TX_ERROR_TRANSMISSION_ERROR  "XL_A429_EV_TX_ERROR_TRANSMISSION_ERROR"
    int _XL_A429_EV_RX_ERROR_GAP_VIOLATION       "XL_A429_EV_RX_ERROR_GAP_VIOLATION"
    int _XL_A429_EV_RX_ERROR_PARITY              "XL_A429_EV_RX_ERROR_PARITY"
    int _XL_A429_EV_RX_ERROR_BITRATE_LOW         "XL_A429_EV_RX_ERROR_BITRATE_LOW"
    int _XL_A429_EV_RX_ERROR_BITRATE_HIGH        "XL_A429_EV_RX_ERROR_BITRATE_HIGH"
    int _XL_A429_EV_RX_ERROR_FRAME_FORMAT        "XL_A429_EV_RX_ERROR_FRAME_FORMAT"
    int _XL_A429_EV_RX_ERROR_CODING_RZ           "XL_A429_EV_RX_ERROR_CODING_RZ"
    int _XL_A429_EV_RX_ERROR_DUTY_FACTOR         "XL_A429_EV_RX_ERROR_DUTY_FACTOR"
    int _XL_A429_EV_RX_ERROR_AVG_BIT_LENGTH      "XL_A429_EV_RX_ERROR_AVG_BIT_LENGTH"
    int _XL_A429_QUEUE_OVERFLOW                  "XL_A429_QUEUE_OVERFLOW"
    int _XL_A429_RX_FIFO_QUEUE_SIZE_MAX          "XL_A429_RX_FIFO_QUEUE_SIZE_MAX"
    int _XL_A429_RX_FIFO_QUEUE_SIZE_MIN          "XL_A429_RX_FIFO_QUEUE_SIZE_MIN"

    int _XL_SUCCESS                        "XL_SUCCESS"
    int _XL_PENDING                        "XL_PENDING"
    int _XL_ERR_QUEUE_IS_EMPTY             "XL_ERR_QUEUE_IS_EMPTY"
    int _XL_ERR_QUEUE_IS_FULL              "XL_ERR_QUEUE_IS_FULL"
    int _XL_ERR_TX_NOT_POSSIBLE            "XL_ERR_TX_NOT_POSSIBLE"
    int _XL_ERR_NO_LICENSE                 "XL_ERR_NO_LICENSE"
    int _XL_ERR_WRONG_PARAMETER            "XL_ERR_WRONG_PARAMETER"
    int _XL_ERR_TWICE_REGISTER             "XL_ERR_TWICE_REGISTER"
    int _XL_ERR_INVALID_CHAN_INDEX         "XL_ERR_INVALID_CHAN_INDEX"
    int _XL_ERR_INVALID_ACCESS             "XL_ERR_INVALID_ACCESS"
    int _XL_ERR_PORT_IS_OFFLINE            "XL_ERR_PORT_IS_OFFLINE"
    int _XL_ERR_CHAN_IS_ONLINE             "XL_ERR_CHAN_IS_ONLINE"
    int _XL_ERR_NOT_IMPLEMENTED            "XL_ERR_NOT_IMPLEMENTED"
    int _XL_ERR_INVALID_PORT               "XL_ERR_INVALID_PORT"
    int _XL_ERR_HW_NOT_READY               "XL_ERR_HW_NOT_READY"
    int _XL_ERR_CMD_TIMEOUT                "XL_ERR_CMD_TIMEOUT"
    int _XL_ERR_CMD_HANDLING               "XL_ERR_CMD_HANDLING"
    int _XL_ERR_HW_NOT_PRESENT             "XL_ERR_HW_NOT_PRESENT"
    int _XL_ERR_NOTIFY_ALREADY_ACTIVE      "XL_ERR_NOTIFY_ALREADY_ACTIVE"
    int _XL_ERR_INVALID_TAG                "XL_ERR_INVALID_TAG"
    int _XL_ERR_INVALID_RESERVED_FLD       "XL_ERR_INVALID_RESERVED_FLD"
    int _XL_ERR_INVALID_SIZE               "XL_ERR_INVALID_SIZE"
    int _XL_ERR_INSUFFICIENT_BUFFER        "XL_ERR_INSUFFICIENT_BUFFER"
    int _XL_ERR_ERROR_CRC                  "XL_ERR_ERROR_CRC"
    int _XL_ERR_BAD_EXE_FORMAT             "XL_ERR_BAD_EXE_FORMAT"
    int _XL_ERR_NO_SYSTEM_RESOURCES        "XL_ERR_NO_SYSTEM_RESOURCES"
    int _XL_ERR_NOT_FOUND                  "XL_ERR_NOT_FOUND"
    int _XL_ERR_INVALID_ADDRESS            "XL_ERR_INVALID_ADDRESS"
    int _XL_ERR_REQ_NOT_ACCEP              "XL_ERR_REQ_NOT_ACCEP"
    int _XL_ERR_INVALID_LEVEL              "XL_ERR_INVALID_LEVEL"
    int _XL_ERR_NO_DATA_DETECTED           "XL_ERR_NO_DATA_DETECTED"
    int _XL_ERR_INTERNAL_ERROR             "XL_ERR_INTERNAL_ERROR"
    int _XL_ERR_UNEXP_NET_ERR              "XL_ERR_UNEXP_NET_ERR"
    int _XL_ERR_INVALID_USER_BUFFER        "XL_ERR_INVALID_USER_BUFFER"
    int _XL_ERR_NO_RESOURCES               "XL_ERR_NO_RESOURCES"
    int _XL_ERR_WRONG_CHIP_TYPE            "XL_ERR_WRONG_CHIP_TYPE"
    int _XL_ERR_WRONG_COMMAND              "XL_ERR_WRONG_COMMAND"
    int _XL_ERR_INVALID_HANDLE             "XL_ERR_INVALID_HANDLE"
    int _XL_ERR_RESERVED_NOT_ZERO          "XL_ERR_RESERVED_NOT_ZERO"
    int _XL_ERR_INIT_ACCESS_MISSING        "XL_ERR_INIT_ACCESS_MISSING"
    int _XL_ERR_CANNOT_OPEN_DRIVER         "XL_ERR_CANNOT_OPEN_DRIVER"
    int _XL_ERR_WRONG_BUS_TYPE             "XL_ERR_WRONG_BUS_TYPE"
    int _XL_ERR_DLL_NOT_FOUND              "XL_ERR_DLL_NOT_FOUND"
    int _XL_ERR_INVALID_CHANNEL_MASK       "XL_ERR_INVALID_CHANNEL_MASK"
    int _XL_ERR_NOT_SUPPORTED              "XL_ERR_NOT_SUPPORTED"
    int _XL_ERR_CONNECTION_BROKEN          "XL_ERR_CONNECTION_BROKEN"
    int _XL_ERR_CONNECTION_CLOSED          "XL_ERR_CONNECTION_CLOSED"
    int _XL_ERR_INVALID_STREAM_NAME        "XL_ERR_INVALID_STREAM_NAME"
    int _XL_ERR_CONNECTION_FAILED          "XL_ERR_CONNECTION_FAILED"
    int _XL_ERR_STREAM_NOT_FOUND           "XL_ERR_STREAM_NOT_FOUND"
    int _XL_ERR_STREAM_NOT_CONNECTED       "XL_ERR_STREAM_NOT_CONNECTED"
    int _XL_ERR_QUEUE_OVERRUN              "XL_ERR_QUEUE_OVERRUN"
    int _XL_ERROR                          "XL_ERROR"
    int _XL_ERR_INVALID_DLC                "XL_ERR_INVALID_DLC"
    int _XL_ERR_INVALID_CANID              "XL_ERR_INVALID_CANID"
    int _XL_ERR_INVALID_FDFLAG_MODE20      "XL_ERR_INVALID_FDFLAG_MODE20"
    int _XL_ERR_EDL_RTR                    "XL_ERR_EDL_RTR"
    int _XL_ERR_EDL_NOT_SET                "XL_ERR_EDL_NOT_SET"
    int _XL_ERR_UNKNOWN_FLAG               "XL_ERR_UNKNOWN_FLAG"
    int _XL_ERR_ETH_PHY_ACTIVATION_FAILED  "XL_ERR_ETH_PHY_ACTIVATION_FAILED"
    int _XL_ERR_ETH_PHY_CONFIG_ABORTED     "XL_ERR_ETH_PHY_CONFIG_ABORTED"
    int _XL_ERR_ETH_RESET_FAILED           "XL_ERR_ETH_RESET_FAILED"
    int _XL_ERR_ETH_SET_CONFIG_DELAYED     "XL_ERR_ETH_SET_CONFIG_DELAYED"
    int _XL_ERR_ETH_UNSUPPORTED_FEATURE    "XL_ERR_ETH_UNSUPPORTED_FEATURE"
    int _XL_ERR_ETH_MAC_ACTIVATION_FAILED  "XL_ERR_ETH_MAC_ACTIVATION_FAILED"

    int _XL_ACTIVATE_NONE         "XL_ACTIVATE_NONE"
    int _XL_ACTIVATE_RESET_CLOCK  "XL_ACTIVATE_RESET_CLOCK"

    int _XL_CAN_EXT_MSG_ID              "XL_CAN_EXT_MSG_ID"
    int _XL_CAN_MSG_FLAG_ERROR_FRAME    "XL_CAN_MSG_FLAG_ERROR_FRAME"
    int _XL_CAN_MSG_FLAG_OVERRUN        "XL_CAN_MSG_FLAG_OVERRUN"
    int _XL_CAN_MSG_FLAG_NERR           "XL_CAN_MSG_FLAG_NERR"
    int _XL_CAN_MSG_FLAG_WAKEUP         "XL_CAN_MSG_FLAG_WAKEUP"
    int _XL_CAN_MSG_FLAG_REMOTE_FRAME   "XL_CAN_MSG_FLAG_REMOTE_FRAME"
    int _XL_CAN_MSG_FLAG_RESERVED_1     "XL_CAN_MSG_FLAG_RESERVED_1"
    int _XL_CAN_MSG_FLAG_TX_COMPLETED   "XL_CAN_MSG_FLAG_TX_COMPLETED"
    int _XL_CAN_MSG_FLAG_TX_REQUEST     "XL_CAN_MSG_FLAG_TX_REQUEST"
    int _XL_CAN_MSG_FLAG_SRR_BIT_DOM    "XL_CAN_MSG_FLAG_SRR_BIT_DOM"
    int _XL_EVENT_FLAG_OVERRUN          "XL_EVENT_FLAG_OVERRUN"
    int _XL_LIN_MSGFLAG_TX              "XL_LIN_MSGFLAG_TX"
    int _XL_LIN_MSGFLAG_CRCERROR        "XL_LIN_MSGFLAG_CRCERROR"

    unsigned long _XL_SET_TIMESYNC_NO_CHANGE    "XL_SET_TIMESYNC_NO_CHANGE"
    unsigned long _XL_SET_TIMESYNC_ON           "XL_SET_TIMESYNC_ON"
    unsigned long _XL_SET_TIMESYNC_OFF          "XL_SET_TIMESYNC_OFF"

    int _XL_CAN_TXMSG_FLAG_EDL           "XL_CAN_TXMSG_FLAG_EDL"
    int _XL_CAN_TXMSG_FLAG_BRS           "XL_CAN_TXMSG_FLAG_BRS"
    int _XL_CAN_TXMSG_FLAG_RTR           "XL_CAN_TXMSG_FLAG_RTR"
    int _XL_CAN_TXMSG_FLAG_HIGHPRIO      "XL_CAN_TXMSG_FLAG_HIGHPRIO"
    int _XL_CAN_TXMSG_FLAG_WAKEUP        "XL_CAN_TXMSG_FLAG_WAKEUP"

    unsigned short _XL_CAN_EV_TAG_TX_MSG "XL_CAN_EV_TAG_TX_MSG"

    int _XL_FR_MODE_NORMAL                           "XL_FR_MODE_NORMAL"
    int _XL_FR_MODE_COLD_NORMAL                      "XL_FR_MODE_COLD_NORMAL"

    int _XL_FR_MODE_NONE                             "XL_FR_MODE_NONE"
    int _XL_FR_MODE_WAKEUP                           "XL_FR_MODE_WAKEUP"
    int _XL_FR_MODE_COLDSTART_LEADING                "XL_FR_MODE_COLDSTART_LEADING"
    int _XL_FR_MODE_COLDSTART_FOLLOWING              "XL_FR_MODE_COLDSTART_FOLLOWING"
    int _XL_FR_MODE_WAKEUP_AND_COLDSTART_LEADING     "XL_FR_MODE_WAKEUP_AND_COLDSTART_LEADING"
    int _XL_FR_MODE_WAKEUP_AND_COLDSTART_FOLLOWING   "XL_FR_MODE_WAKEUP_AND_COLDSTART_FOLLOWING"

    int _XL_FR_CHANNEL_CFG_STATUS_INIT_APP_PRESENT   "XL_FR_CHANNEL_CFG_STATUS_INIT_APP_PRESENT"
    int _XL_FR_CHANNEL_CFG_STATUS_CHANNEL_ACTIVATED  "XL_FR_CHANNEL_CFG_STATUS_CHANNEL_ACTIVATED"
    int _XL_FR_CHANNEL_CFG_STATUS_VALID_CFG_MODE     "XL_FR_CHANNEL_CFG_STATUS_VALID_CFG_MODE"

    int _XL_FR_CHANNEL_CFG_MODE_SYNCHRONOUS          "XL_FR_CHANNEL_CFG_MODE_SYNCHRONOUS"
    int _XL_FR_CHANNEL_CFG_MODE_COMBINED             "XL_FR_CHANNEL_CFG_MODE_COMBINED"
    int _XL_FR_CHANNEL_CFG_MODE_ASYNCHRONOUS         "XL_FR_CHANNEL_CFG_MODE_ASYNCHRONOUS"

    int _XL_FR_FILTER_PASS                           "XL_FR_FILTER_PASS"                           
    int _XL_FR_FILTER_BLOCK                          "XL_FR_FILTER_BLOCK"                          

    int _XL_FR_FILTER_TYPE_DATA                      "XL_FR_FILTER_TYPE_DATA"                      
    int _XL_FR_FILTER_TYPE_NF                        "XL_FR_FILTER_TYPE_NF"                        
    int _XL_FR_FILTER_TYPE_FILLUP_NF                 "XL_FR_FILTER_TYPE_FILLUP_NF"                 

    int _XL_FR_FILTER_CHANNEL_A                      "XL_FR_FILTER_CHANNEL_A"                      
    int _XL_FR_FILTER_CHANNEL_B                      "XL_FR_FILTER_CHANNEL_B"                      

    int _XL_FR_START_CYCLE                           "XL_FR_START_CYCLE"                           
    int _XL_FR_RX_FRAME                              "XL_FR_RX_FRAME"                              
    int _XL_FR_TX_FRAME                              "XL_FR_TX_FRAME"                              
    #int _XL_FR_TXACK_FRAME                           "XL_FR_TXACK_FRAME"                           
    #int _XL_FR_INVALID_FRAME                         "XL_FR_INVALID_FRAME"                         
    int _XL_FR_WAKEUP                                "XL_FR_WAKEUP"                                
    int _XL_FR_SYMBOL_WINDOW                         "XL_FR_SYMBOL_WINDOW"                         
    int _XL_FR_ERROR                                 "XL_FR_ERROR"                                 
    int _XL_FR_STATUS                                "XL_FR_STATUS"                                
    int _XL_FR_NM_VECTOR                             "XL_FR_NM_VECTOR"                             
    int _XL_FR_TRANCEIVER_STATUS                     "XL_FR_TRANCEIVER_STATUS"                     
    int _XL_FR_SPY_FRAME                             "XL_FR_SPY_FRAME"                             
    int _XL_FR_SPY_SYMBOL                            "XL_FR_SPY_SYMBOL"                            

    int _XL_FR_CHANNEL_A                             "XL_FR_CHANNEL_A"                             
    int _XL_FR_CHANNEL_B                             "XL_FR_CHANNEL_B"                             
    int _XL_FR_CHANNEL_AB                            "XL_FR_CHANNEL_AB"                            
    int _XL_FR_SPY_CHANNEL_A                         "XL_FR_SPY_CHANNEL_A"                         
    int _XL_FR_SPY_CHANNEL_B                         "XL_FR_SPY_CHANNEL_B"                         
    int _XL_FR_CC_COLD_A                             "XL_FR_CC_COLD_A"                             
    int _XL_FR_CC_COLD_B                             "XL_FR_CC_COLD_B"                             
    int _XL_FR_QUEUE_OVERFLOW                        "XL_FR_QUEUE_OVERFLOW"                        

    int _XL_FR_FRAMEFLAG_STARTUP                     "XL_FR_FRAMEFLAG_STARTUP"                     
    int _XL_FR_FRAMEFLAG_SYNC                        "XL_FR_FRAMEFLAG_SYNC"                        
    int _XL_FR_FRAMEFLAG_NULLFRAME                   "XL_FR_FRAMEFLAG_NULLFRAME"                   
    int _XL_FR_FRAMEFLAG_PAYLOAD_PREAMBLE            "XL_FR_FRAMEFLAG_PAYLOAD_PREAMBLE"            
    int _XL_FR_FRAMEFLAG_FR_RESERVED                 "XL_FR_FRAMEFLAG_FR_RESERVED"                 
    int _XL_FR_FRAMEFLAG_REQ_TXACK                   "XL_FR_FRAMEFLAG_REQ_TXACK"                   
    int _XL_FR_FRAMEFLAG_TXACK_SS                    "XL_FR_FRAMEFLAG_TXACK_SS"                    
    int _XL_FR_FRAMEFLAG_RX_UNEXPECTED               "XL_FR_FRAMEFLAG_RX_UNEXPECTED"               
    int _XL_FR_FRAMEFLAG_NEW_DATA_TX                 "XL_FR_FRAMEFLAG_NEW_DATA_TX"                 
    int _XL_FR_FRAMEFLAG_DATA_UPDATE_LOST            "XL_FR_FRAMEFLAG_DATA_UPDATE_LOST"            
    int _XL_FR_FRAMEFLAG_SYNTAX_ERROR                "XL_FR_FRAMEFLAG_SYNTAX_ERROR"                
    int _XL_FR_FRAMEFLAG_CONTENT_ERROR               "XL_FR_FRAMEFLAG_CONTENT_ERROR"               
    int _XL_FR_FRAMEFLAG_SLOT_BOUNDARY_VIOLATION     "XL_FR_FRAMEFLAG_SLOT_BOUNDARY_VIOLATION"     
    int _XL_FR_FRAMEFLAG_TX_CONFLICT                 "XL_FR_FRAMEFLAG_TX_CONFLICT"                 
    int _XL_FR_FRAMEFLAG_EMPTY_SLOT                  "XL_FR_FRAMEFLAG_EMPTY_SLOT"                  
    int _XL_FR_FRAMEFLAG_FRAME_TRANSMITTED           "XL_FR_FRAMEFLAG_FRAME_TRANSMITTED"           

    int _XL_FR_SPY_FRAMEFLAG_FRAMING_ERROR           "XL_FR_SPY_FRAMEFLAG_FRAMING_ERROR"           
    int _XL_FR_SPY_FRAMEFLAG_HEADER_CRC_ERROR        "XL_FR_SPY_FRAMEFLAG_HEADER_CRC_ERROR"        
    int _XL_FR_SPY_FRAMEFLAG_FRAME_CRC_ERROR         "XL_FR_SPY_FRAMEFLAG_FRAME_CRC_ERROR"         
    int _XL_FR_SPY_FRAMEFLAG_BUS_ERROR               "XL_FR_SPY_FRAMEFLAG_BUS_ERROR"               

    int _XL_FR_TX_MODE_CYCLIC                        "XL_FR_TX_MODE_CYCLIC"                        
    int _XL_FR_TX_MODE_SINGLE_SHOT                   "XL_FR_TX_MODE_SINGLE_SHOT"                   
    int _XL_FR_TX_MODE_NONE                          "XL_FR_TX_MODE_NONE"                          

    int _XL_FR_PAYLOAD_INCREMENT_8BIT                "XL_FR_PAYLOAD_INCREMENT_8BIT"                
    int _XL_FR_PAYLOAD_INCREMENT_16BIT               "XL_FR_PAYLOAD_INCREMENT_16BIT"               
    int _XL_FR_PAYLOAD_INCREMENT_32BIT               "XL_FR_PAYLOAD_INCREMENT_32BIT"               
    int _XL_FR_PAYLOAD_INCREMENT_NONE                "XL_FR_PAYLOAD_INCREMENT_NONE"                

    int _XL_FR_WAKEUP_UNDEFINED                      "XL_FR_WAKEUP_UNDEFINED"                      
    int _XL_FR_WAKEUP_RECEIVED_HEADER                "XL_FR_WAKEUP_RECEIVED_HEADER"                
    int _XL_FR_WAKEUP_RECEIVED_WUP                   "XL_FR_WAKEUP_RECEIVED_WUP"                   
    int _XL_FR_WAKEUP_COLLISION_HEADER               "XL_FR_WAKEUP_COLLISION_HEADER"               
    int _XL_FR_WAKEUP_COLLISION_WUP                  "XL_FR_WAKEUP_COLLISION_WUP"                  
    int _XL_FR_WAKEUP_COLLISION_UNKNOWN              "XL_FR_WAKEUP_COLLISION_UNKNOWN"              
    int _XL_FR_WAKEUP_TRANSMITTED                    "XL_FR_WAKEUP_TRANSMITTED"                    
    int _XL_FR_WAKEUP_RESERVED                       "XL_FR_WAKEUP_RESERVED"                       

    int _XL_FR_SYMBOL_MTS                            "XL_FR_SYMBOL_MTS"                            
    int _XL_FR_SYMBOL_CAS                            "XL_FR_SYMBOL_CAS"                            

    int _XL_FR_SYMBOL_STATUS_SESA                    "XL_FR_SYMBOL_STATUS_SESA"                    
    int _XL_FR_SYMBOL_STATUS_SBSA                    "XL_FR_SYMBOL_STATUS_SBSA"                    
    int _XL_FR_SYMBOL_STATUS_TCSA                    "XL_FR_SYMBOL_STATUS_TCSA"                    
    int _XL_FR_SYMBOL_STATUS_SESB                    "XL_FR_SYMBOL_STATUS_SESB"                    
    int _XL_FR_SYMBOL_STATUS_SBSB                    "XL_FR_SYMBOL_STATUS_SBSB"                    
    int _XL_FR_SYMBOL_STATUS_TCSB                    "XL_FR_SYMBOL_STATUS_TCSB"                    
    int _XL_FR_SYMBOL_STATUS_MTSA                    "XL_FR_SYMBOL_STATUS_MTSA"                    
    int _XL_FR_SYMBOL_STATUS_MTSB                    "XL_FR_SYMBOL_STATUS_MTSB"                    

    int _XL_FR_ERROR_POC_MODE                        "XL_FR_ERROR_POC_MODE"                        
    int _XL_FR_ERROR_SYNC_FRAMES_BELOWMIN            "XL_FR_ERROR_SYNC_FRAMES_BELOWMIN"            
    int _XL_FR_ERROR_SYNC_FRAMES_OVERLOAD            "XL_FR_ERROR_SYNC_FRAMES_OVERLOAD"            
    int _XL_FR_ERROR_CLOCK_CORR_FAILURE              "XL_FR_ERROR_CLOCK_CORR_FAILURE"              
    int _XL_FR_ERROR_NIT_FAILURE                     "XL_FR_ERROR_NIT_FAILURE"                     
    int _XL_FR_ERROR_CC_ERROR                        "XL_FR_ERROR_CC_ERROR"                        

    int _XL_FR_ERROR_POC_ACTIVE                      "XL_FR_ERROR_POC_ACTIVE"                      
    int _XL_FR_ERROR_POC_PASSIVE                     "XL_FR_ERROR_POC_PASSIVE"                     
    int _XL_FR_ERROR_POC_COMM_HALT                   "XL_FR_ERROR_POC_COMM_HALT"                   

    int _XL_FR_ERROR_MISSING_OFFSET_CORRECTION       "XL_FR_ERROR_MISSING_OFFSET_CORRECTION"       
    int _XL_FR_ERROR_MAX_OFFSET_CORRECTION_REACHED   "XL_FR_ERROR_MAX_OFFSET_CORRECTION_REACHED"   
    int _XL_FR_ERROR_MISSING_RATE_CORRECTION         "XL_FR_ERROR_MISSING_RATE_CORRECTION"         
    int _XL_FR_ERROR_MAX_RATE_CORRECTION_REACHED     "XL_FR_ERROR_MAX_RATE_CORRECTION_REACHED"     

    int _XL_FR_ERROR_NIT_SENA                        "XL_FR_ERROR_NIT_SENA"                        
    int _XL_FR_ERROR_NIT_SBNA                        "XL_FR_ERROR_NIT_SBNA"                        
    int _XL_FR_ERROR_NIT_SENB                        "XL_FR_ERROR_NIT_SENB"                        
    int _XL_FR_ERROR_NIT_SBNB                        "XL_FR_ERROR_NIT_SBNB"                        

    int _XL_FR_ERROR_CC_PERR                         "XL_FR_ERROR_CC_PERR"                         
    int _XL_FR_ERROR_CC_IIBA                         "XL_FR_ERROR_CC_IIBA"                         
    int _XL_FR_ERROR_CC_IOBA                         "XL_FR_ERROR_CC_IOBA"                         
    int _XL_FR_ERROR_CC_MHF                          "XL_FR_ERROR_CC_MHF"                          
    int _XL_FR_ERROR_CC_EDA                          "XL_FR_ERROR_CC_EDA"                          
    int _XL_FR_ERROR_CC_LTVA                         "XL_FR_ERROR_CC_LTVA"                         
    int _XL_FR_ERROR_CC_TABA                         "XL_FR_ERROR_CC_TABA"                         
    int _XL_FR_ERROR_CC_EDB                          "XL_FR_ERROR_CC_EDB"                          
    int _XL_FR_ERROR_CC_LTVB                         "XL_FR_ERROR_CC_LTVB"                         
    int _XL_FR_ERROR_CC_TABB                         "XL_FR_ERROR_CC_TABB"                         

    int _XL_FR_STATUS_DEFAULT_CONFIG                 "XL_FR_STATUS_DEFAULT_CONFIG"                 
    int _XL_FR_STATUS_READY                          "XL_FR_STATUS_READY"                          
    int _XL_FR_STATUS_NORMAL_ACTIVE                  "XL_FR_STATUS_NORMAL_ACTIVE"                  
    int _XL_FR_STATUS_NORMAL_PASSIVE                 "XL_FR_STATUS_NORMAL_PASSIVE"                 
    int _XL_FR_STATUS_HALT                           "XL_FR_STATUS_HALT"                           
    int _XL_FR_STATUS_MONITOR_MODE                   "XL_FR_STATUS_MONITOR_MODE"                   
    int _XL_FR_STATUS_CONFIG                         "XL_FR_STATUS_CONFIG"                         
    int _XL_FR_STATUS_WAKEUP_STANDBY                 "XL_FR_STATUS_WAKEUP_STANDBY"                 
    int _XL_FR_STATUS_WAKEUP_LISTEN                  "XL_FR_STATUS_WAKEUP_LISTEN"                  
    int _XL_FR_STATUS_WAKEUP_SEND                    "XL_FR_STATUS_WAKEUP_SEND"                    
    int _XL_FR_STATUS_WAKEUP_DETECT                  "XL_FR_STATUS_WAKEUP_DETECT"                  
    int _XL_FR_STATUS_STARTUP_PREPARE                "XL_FR_STATUS_STARTUP_PREPARE"                
    int _XL_FR_STATUS_COLDSTART_LISTEN               "XL_FR_STATUS_COLDSTART_LISTEN"               
    int _XL_FR_STATUS_COLDSTART_COLLISION_RESOLUTION "XL_FR_STATUS_COLDSTART_COLLISION_RESOLUTION" 
    int _XL_FR_STATUS_COLDSTART_CONSISTENCY_CHECK    "XL_FR_STATUS_COLDSTART_CONSISTENCY_CHECK"    
    int _XL_FR_STATUS_COLDSTART_GAP                  "XL_FR_STATUS_COLDSTART_GAP"                  
    int _XL_FR_STATUS_COLDSTART_JOIN                 "XL_FR_STATUS_COLDSTART_JOIN"                 
    int _XL_FR_STATUS_INTEGRATION_COLDSTART_CHECK    "XL_FR_STATUS_INTEGRATION_COLDSTART_CHECK"    
    int _XL_FR_STATUS_INTEGRATION_LISTEN             "XL_FR_STATUS_INTEGRATION_LISTEN"             
    int _XL_FR_STATUS_INTEGRATION_CONSISTENCY_CHECK  "XL_FR_STATUS_INTEGRATION_CONSISTENCY_CHECK"  
    int _XL_FR_STATUS_INITIALIZE_SCHEDULE            "XL_FR_STATUS_INITIALIZE_SCHEDULE"            
    int _XL_FR_STATUS_ABORT_STARTUP                  "XL_FR_STATUS_ABORT_STARTUP"                  
    int _XL_FR_STATUS_STARTUP_SUCCESS                "XL_FR_STATUS_STARTUP_SUCCESS"                

    int _XL_NOTIFY_REASON_CHANNEL_ACTIVATION         "XL_NOTIFY_REASON_CHANNEL_ACTIVATION"         
    int _XL_NOTIFY_REASON_CHANNEL_DEACTIVATION       "XL_NOTIFY_REASON_CHANNEL_DEACTIVATION"       
    int _XL_NOTIFY_REASON_PORT_CLOSED                "XL_NOTIFY_REASON_PORT_CLOSED"   

    int _XL_FR_TRANSCEIVER_MODE_SLEEP                "XL_FR_TRANSCEIVER_MODE_SLEEP"
    int _XL_FR_TRANSCEIVER_MODE_NORMAL               "XL_FR_TRANSCEIVER_MODE_NORMAL"
    int _XL_FR_TRANSCEIVER_MODE_RECEIVE_ONLY         "XL_FR_TRANSCEIVER_MODE_RECEIVE_ONLY"
    int _XL_FR_TRANSCEIVER_MODE_STANDBY              "XL_FR_TRANSCEIVER_MODE_STANDBY"

    XLstatus xlOpenDriver()
    XLstatus xlCloseDriver()

    XLaccess xlGetChannelMask(int hwType, int hwIndex, int hwChannel)
    int xlGetChannelIndex(int hwType, int hwIndex, int hwChannel)

    XLstatus xlOpenPort(XLportHandle* portHandle, char* userName, XLaccess accessMask, XLaccess* permissionMask, unsigned int rxQueueSize, unsigned int xlInterfaceVersion, unsigned int busType)
    XLstatus xlClosePort(XLportHandle portHandle)
    
    XLstatus xlSetTimerRate(XLportHandle portHandle, unsigned long timerRate)
    XLstatus xlSetTimerRateAndChannel(XLportHandle portHandle, XLaccess* timerChannelMask, unsigned long *timerRate)

    XLstatus xlCanSetChannelBitrate(XLportHandle portHandle, XLaccess accessMask, unsigned long bitrate)
    XLstatus xlCanSetChannelParams(XLportHandle portHandle, XLaccess accessMask, XLchipParams* pChipParams)
    XLstatus xlCanSetChannelParamsC200(XLportHandle portHandle, XLaccess accessMask, unsigned char btr0, unsigned char btr1)

    XLstatus xlActivateChannel(XLportHandle portHandle, XLaccess accessMask, unsigned int busType, unsigned int flags)
    XLstatus xlDeactivateChannel(XLportHandle portHandle, XLaccess accessMask)

    XLstatus xlCanTransmit(XLportHandle portHandle, XLaccess accessMask, unsigned int* messageCount, void* pMessage)
    XLstatus xlCanFlushTransmitQueue(XLportHandle portHandle, XLaccess accessMask)
    XLstatus xlCanRequestChipState(XLportHandle portHandle, XLaccess accessMask)

    XLstatus xlReceive(XLportHandle portHandle, unsigned int* pEventCount, XLevent* pEventList)
    XLstatus xlFlushReceiveQueue(XLportHandle portHandle)
    XLstatus xlGetReceiveQueueLevel(XLportHandle portHandle, int* level)

    XLstatus xlSetNotification(XLportHandle portHandle, XLhandle pXlHandle, int queueLevel)
    
    XLstatus xlResetClock(XLportHandle portHandle)
    
    XLstatus xlCanSetChannelMode(XLportHandle portHandle, XLaccess accessMask, int tx, int txrq)
    XLstatus xlCanSetChannelOutput(XLportHandle portHandle, XLaccess accessMask, unsigned char mode)
    XLstatus xlCanSetReceiveMode(XLportHandle portHandle, unsigned char ErrorFrame, unsigned char ChipState)
    XLstatus xlCanSetChannelTransceiver(XLportHandle portHandle, XLaccess accessMask, int type, int lineMode, int resNet)
    XLstatus xlCanSetChannelAcceptance(XLportHandle portHandle, XLaccess accessMask, unsigned long code, unsigned long mask, unsigned int idRange)
    XLstatus xlCanAddAcceptanceRange(XLportHandle portHandle, XLaccess accessMask, unsigned long first_id, unsigned long last_id)
    XLstatus xlCanRemoveAcceptanceRange(XLportHandle portHandle, XLaccess accessMask, unsigned long first_id, unsigned long last_id)
    XLstatus xlCanResetAcceptance(XLportHandle portHandle, XLaccess accessMask, unsigned int idRange)
    
    XLstatus xlSetGlobalTimeSync(unsigned long newValue, unsigned long* previousValue)
    XLstatus xlGetSyncTime(XLportHandle portHandle, XLuint64* time)
    XLstatus xlGetChannelTime(XLportHandle portHandle, XLaccess accessMask, XLuint64* pChannelTime)
    XLstatus xlGenerateSyncPulse(XLportHandle portHandle, XLaccess accessMask)
    
    XLstringType xlGetEventString(XLevent* ev)
    const char* xlGetErrorString(XLstatus err)

    XLstatus xlGetApplConfig(char *appName, unsigned int appChannel, unsigned int *pHwType, unsigned int *pHwIndex, unsigned int *pHwChannel, unsigned int busType)
    XLstatus xlSetApplConfig(char *appName, unsigned int appChannel, unsigned int hwType, unsigned int hwIndex, unsigned int hwChannel, unsigned int busType)
    
    XLstatus xlGetDriverConfig(XLdriverConfig *pDriverConfig)
    XLstatus xlGetRemoteDriverConfig(XLdriverConfig *pDriverConfig)

    XLstatus xlPopupHwConfig(char* callSign, unsigned int waitForFinish)
    XLstatus xlGetLicenseInfo(XLaccess channelMask, XLlicenseInfo* pLicInfoArray, unsigned int licInfoArraySize)
    XLstatus xlGetKeymanBoxes(unsigned int* boxCount)
    XLstatus xlGetKeymanInfo(unsigned int boxIndex, unsigned int* boxMask, unsigned int* boxSerial, XLuint64* licInfo)


    XLstatus xlCanFdSetConfiguration(XLportHandle portHandle, XLaccess accessMask, XLcanFdConf* pCanFdConf)
    XLstatus xlCanTransmitEx(XLportHandle portHandle, XLaccess accessMask, unsigned int msgCnt, unsigned int* pMsgCntSent, XLcanTxEvent* pXlCanTxEvt)




    XLstatus xlFrSetConfiguration(XLportHandle portHandle, XLaccess accessMask, XLfrClusterConfig *pxlClusterConfig)
    XLstatus xlFrGetChannelConfiguration(XLportHandle portHandle, XLaccess accessMask, XLfrChannelConfig* pxlFrChannelConfig)
    XLstatus xlFrSetMode(XLportHandle portHandle, XLaccess accessMask, XLfrMode *frMode)
    XLstatus xlFrInitStartupAndSync(XLportHandle portHandle, XLaccess accessMask, XLfrEvent *pEventBuffer)
    XLstatus xlFrSetupSymbolWindow(XLportHandle portHandle, XLaccess accessMask, unsigned int frChannel, unsigned int symbolWindowMask)
    XLstatus xlFrActivateSpy(XLportHandle portHandle, XLaccess accessMask, unsigned int mode)
    XLstatus xlSetTimerBaseNotify(XLportHandle portHandle, XLhandle *pHandle)
    XLstatus xlFrReceive(XLportHandle portHandle, XLfrEvent *pEventBuffer)
    XLstatus xlFrTransmit(XLportHandle portHandle, XLaccess accessMask, XLfrEvent *pEventBuffer)
    XLstatus xlFrSetTransceiverMode(XLportHandle portHandle, XLaccess accessMask, unsigned int frChannel, unsigned int mode)
    XLstatus xlFrSendSymbolWindow(XLportHandle portHandle, XLaccess accessMask, unsigned int symbolWindow)
    XLstatus xlFrSetAcceptanceFilter(XLportHandle portHandle, XLaccess accessMask, XLfrAcceptanceFilter *pAcceptanceFilter)




cdef enum e_XLevent_type:
    XL_NO_COMMAND               =  0
    XL_RECEIVE_MSG              =  1
    XL_CHIP_STATE               =  4
    XL_TRANSCEIVER              =  6
    XL_TIMER                    =  8
    XL_TRANSMIT_MSG             = 10
    XL_SYNC_PULSE               = 11
    XL_APPLICATION_NOTIFICATION = 15
    XL_LIN_MSG                  = 20
    XL_LIN_ERRMSG               = 21
    XL_LIN_SYNCERR              = 22
    XL_LIN_NOANS                = 23
    XL_LIN_WAKEUP               = 24
    XL_LIN_SLEEP                = 25
    XL_LIN_CRCINFO              = 26
    XL_RECEIVE_DAIO_DATA        = 32
    XL_RECEIVE_DAIO_PIGGY       = 34

def OpenDriver():
    return xlOpenDriver()

def CloseDriver():
    return xlCloseDriver()

def GetChannelMask(int hwType, int hwIndex, int hwChannel):
    return xlGetChannelMask(hwType, hwIndex, hwChannel)

def GetChannelIndex(int hwType, int hwIndex, int hwChannel):
    return xlGetChannelIndex(hwType, hwIndex, hwChannel)

def OpenPort(list portHandle, char* appName, XLaccess accessMask, list permissionMask, unsigned int rxQueueSize, unsigned int xlInterfaceVersion, unsigned int busType):
    cdef XLstatus status = XL_ERROR
    cdef XLportHandle port_handle = XL_INVALID_PORTHANDLE
    cdef XLaccess permission_mask = permissionMask[0]

    status = xlOpenPort(&port_handle, appName, accessMask, &permission_mask, rxQueueSize, xlInterfaceVersion, busType)
    
    portHandle[0] = port_handle
    permissionMask[0] = permission_mask
    return status

def ClosePort(XLportHandle portHandle):
    return xlClosePort(portHandle)

def SetTimerRate(XLportHandle portHandle, unsigned long timerRate):
    return xlSetTimerRate(portHandle, timerRate)

def SetTimerRateAndChannel(XLportHandle portHandle, list ptimerChannelMask, list ptimerRate):
    cdef XLstatus status = XL_ERROR
    cdef XLaccess timerChannelMask = ptimerChannelMask[0]
    cdef unsigned long timerRate = ptimerRate[0]
    
    status = xlSetTimerRateAndChannel(portHandle, &timerChannelMask, &timerRate)

    return status

def CanSetChannelBitrate(XLportHandle portHandle, XLaccess accessMask, unsigned long bitrate):
    return xlCanSetChannelBitrate(portHandle, accessMask, bitrate)

def CanSetChannelParams(XLportHandle portHandle, XLaccess accessMask, dict pChipParams):
    cdef XLstatus status = XL_ERROR
    cdef XLchipParams chipParams = {0}

    chipParams.bitRate  = pChipParams["bitRate"]
    chipParams.sjw      = pChipParams["sjw"]
    chipParams.tseg1    = pChipParams["tseg1"]
    chipParams.tseg2    = pChipParams["tseg2"]
    chipParams.sam      = pChipParams["sam"]

    status = xlCanSetChannelParams(portHandle, accessMask, &chipParams)
    return status

def ActivateChannel(XLportHandle portHandle, XLaccess accessMask, unsigned int busType, unsigned int flags):
    return xlActivateChannel(portHandle, accessMask, busType, flags)

def DeactivateChannel(XLportHandle portHandle, XLaccess accessMask):
    return xlDeactivateChannel(portHandle, accessMask)

def CanTransmit(XLportHandle portHandle, XLaccess accessMask, list messageCount, list pMessage):
    cdef XLstatus status = XL_ERROR
    cdef unsigned int message_count = 0
    cdef XLevent *pxlEvent = NULL

    message_count = <unsigned int>len(pMessage)
    if message_count > 0:
        pxlEvent = <XLevent *> malloc(sizeof(XLevent) * message_count)
        memset(pxlEvent, 0, sizeof(XLevent) * message_count)
        for i, msg in enumerate(pMessage):
            pxlEvent[i].tag                 = <unsigned char >XL_TRANSMIT_MSG
            pxlEvent[i].tagData.msg.flags   = <unsigned short>msg["flags"]
            pxlEvent[i].tagData.msg.id      = <unsigned long >msg["id"]
            pxlEvent[i].tagData.msg.dlc     = <unsigned short>msg["dlc"]
            for j, b in enumerate(msg["data"]):
                pxlEvent[i].tagData.msg.data[j] = b
        status = xlCanTransmit(portHandle, accessMask, &message_count, pxlEvent)
        free(pxlEvent)
    messageCount[0] = message_count
    return status

def CanFlushTransmitQueue(XLportHandle portHandle, XLaccess accessMask):
    return xlCanFlushTransmitQueue(portHandle, accessMask)

def CanRequestChipState(XLportHandle portHandle, XLaccess accessMask):
    return xlCanRequestChipState(portHandle,accessMask)

def Receive(XLportHandle portHandle, list pEventCount, list pEventList, list pEventString):
    cdef XLstatus status = XL_ERROR
    cdef unsigned int eventCount = 1
    cdef XLevent xlEvent
    cdef XLstringType xlstring
    memset(&xlEvent, 0, sizeof(xlEvent))
    retEvent = {}

    status = xlReceive(portHandle, &eventCount, &xlEvent)
    pEventString[0] = xlGetEventString(&xlEvent)

    retEvent["tag"]         = xlEvent.tag
    retEvent["chanIndex"]   = xlEvent.chanIndex
    retEvent["transId"]     = xlEvent.transId
    retEvent["portHandle"]  = xlEvent.portHandle
    retEvent["flags"]       = xlEvent.flags
    retEvent["reserved"]    = xlEvent.reserved
    retEvent["timeStamp"]   = xlEvent.timeStamp # Actual time stamp generated by the hardware with 8 μs resolution. Value is in nanoseconds.

    tagData = {}
    if xlEvent.tag == XL_RECEIVE_MSG:
        msg = {}
        msg["id"]    = xlEvent.tagData.msg.id
        msg["flags"] = xlEvent.tagData.msg.flags
        msg["dlc"]   = xlEvent.tagData.msg.dlc
        msg["data"]   = [xlEvent.tagData.msg.data[i] for i in range(8)]
        tagData["msg"] = msg
    else:
        # The following events are not supported now.
        # Common and CAN events : XL_CHIP_STATE, XL_TRANSCEIVER, XL_TIMER, XL_TRANSMIT_MSG, XL_SYNC_PULSE
        # Special LIN events    : XL_LIN_MSG, XL_LIN_ERRMSG,XL_LIN_SYNCERR, XL_LIN_NOANS, XL_LIN_WAKEUP, XL_LIN_SLEEP, XL_LIN_CRCINFO
        # Special DAIO events   : XL_RECEIVE_DAIO_DATA
        pass
    retEvent["tagData"] = tagData
    pEventCount[0] = eventCount
    pEventList[0] = retEvent
    return status

def FlushReceiveQueue(XLportHandle portHandle):
    return xlFlushReceiveQueue(portHandle)

def GetReceiveQueueLevel(XLportHandle portHandle, list plevel):
    cdef XLstatus status
    cdef int level = plevel[0]
    status = xlGetReceiveQueueLevel(portHandle, &level)
    plevel[0] = level
    return status

def SetNotification(XLportHandle portHandle, list pXlHandle, int queueLevel):
    cdef XLstatus status = XL_ERROR
    cdef XLhandle xlHandle = NULL
    status = xlSetNotification(portHandle, &xlHandle, queueLevel)
    pXlHandle[0] = <size_t>xlHandle
    return status

def ResetClock(XLportHandle portHandle):
    return xlResetClock(portHandle)

def CanSetChannelMode(XLportHandle portHandle, XLaccess accessMask, int tx, int txrq):
    return xlCanSetChannelMode(portHandle, accessMask, tx, txrq)

def CanSetChannelOutput(XLportHandle portHandle, XLaccess accessMask, unsigned char mode):
    return xlCanSetChannelOutput(portHandle, accessMask, mode)

def CanSetReceiveMode(XLportHandle portHandle, unsigned char ErrorFrame, unsigned char ChipState):
    return xlCanSetReceiveMode(portHandle, ErrorFrame, ChipState)

def CanSetChannelParamsC200(XLportHandle portHandle, XLaccess accessMask, unsigned char btr0, unsigned char btr1):
    return xlCanSetChannelParamsC200(portHandle, accessMask, btr0, btr1)

def CanSetChannelTransceiver(XLportHandle portHandle, XLaccess accessMask, int type, int lineMode, int resNet):
    return xlCanSetChannelTransceiver(portHandle, accessMask, type, lineMode, resNet)

def CanSetChannelAcceptance(XLportHandle portHandle, XLaccess accessMask, unsigned long code, unsigned long mask, unsigned int idRange):
    return xlCanSetChannelAcceptance(portHandle, accessMask, code, mask, idRange)

def CanAddAcceptanceRange(XLportHandle portHandle, XLaccess accessMask, unsigned long first_id, unsigned long last_id):
    return xlCanAddAcceptanceRange(portHandle, accessMask, first_id, last_id)

def CanRemoveAcceptanceRange(XLportHandle portHandle, XLaccess accessMask, unsigned long first_id, unsigned long last_id):
    return xlCanRemoveAcceptanceRange(portHandle, accessMask, first_id, last_id)

def CanResetAcceptance(XLportHandle portHandle, XLaccess accessMask, unsigned int idRange):
    return xlCanResetAcceptance(portHandle, accessMask, idRange)

def SetGlobalTimeSync(unsigned long newValue, list pPreviousValue):
    cdef XLstatus status = XL_ERROR
    cdef unsigned long previousValue = XL_SET_TIMESYNC_NO_CHANGE
    status = xlSetGlobalTimeSync(newValue, &previousValue)
    pPreviousValue[0] = previousValue
    return status

def GetSyncTime(XLportHandle portHandle, list pTime):
    cdef XLstatus = XL_ERROR
    cdef XLuint64 time = 0
    status = xlGetSyncTime(portHandle, &time)
    pTime[0] = time
    return status

def GetChannelTime(XLportHandle portHandle, XLaccess accessMask, list pChannelTime):
    cdef XLstatus status = XL_ERROR
    cdef XLuint64 channelTime
    status = xlGetChannelTime(portHandle, accessMask, &channelTime)
    pChannelTime[0] = channelTime
    return status

def GenerateSyncPulse(XLportHandle portHandle, XLaccess accessMask):
    return xlGenerateSyncPulse(portHandle, accessMask)

#def GetEventString(dict pXLevent):
    #cdef XLevent xlEvent
    #memset(&xlEvent, 0, sizeof(xlEvent))

    # xlEvent.tag         = pXLevent["tag"]
    # xlEvent.chanIndex   = pXLevent["chanIndex"]
    # xlEvent.transId     = pXLevent["transId"]
    # xlEvent.portHandle  = pXLevent["portHandle"]
    # xlEvent.flags       = pXLevent["flags"]
    # xlEvent.timeStamp   = pXLevent["timeStamp"]
    # xlEvent.tagData.msg.id = pXLevent["tagData"]["msg"]["id"]
    # xlEvent.tagData.msg.flags = pXLevent["tagData"]["msg"]["flags"]
    # xlEvent.tagData.msg.dlc = pXLevent["tagData"]["msg"]["dlc"]
    # for i in range(xlEvent.tagData.msg.dlc):
    #     xlEvent.tagData.msg.data[i] = pXLevent["tagData"]["msg"]["data"][i]
    #return xlGetEventString(&xlEvent)

def GetErrorString(XLstatus err):
    return xlGetErrorString(err)

def GetApplConfig(char *appName, unsigned int appChannel, list pHwType, list pHwIndex, list pHwChannel, unsigned int busType):
    cdef XLstatus status = XL_ERROR
    cdef unsigned int hwType    = pHwType[0]
    cdef unsigned int hwIndex   = pHwIndex[0]
    cdef unsigned int hwChannel = pHwChannel[0]

    status = xlGetApplConfig(appName, appChannel, &hwType, &hwIndex, &hwChannel, busType)
    pHwType[0]    = hwType
    pHwIndex[0]   = hwIndex
    pHwChannel[0] = hwChannel

    return status

def SetApplConfig(char *appName, unsigned int appChannel, list pHwType, list pHwIndex, list pHwChannel, unsigned int busType):
    return xlSetApplConfig(appName, appChannel, pHwType[0], pHwIndex[0], pHwChannel[0], busType)

def GetDriverConfig(dict pDriverConfig):
    cdef XLstatus status
    cdef XLdriverConfig driverConfig
    
    status = xlGetDriverConfig(&driverConfig)

    pDriverConfig["dllVersion"]   = driverConfig.dllVersion
    pDriverConfig["channelCount"] = driverConfig.channelCount
    pDriverConfig["reserved[10]"] = [driverConfig.reserved[i] for i in range(10)]

    channel = []
    cdef int channelCount = driverConfig.channelCount
    for i in range(channelCount):
        ch = {}
        ch["name"]                   = bytes(driverConfig.channel[i].name)
        ch["hwType"]                 = driverConfig.channel[i].hwType
        ch["hwIndex"]                = driverConfig.channel[i].hwIndex
        ch["hwChannel"]              = driverConfig.channel[i].hwChannel
        ch["transceiverType"]        = driverConfig.channel[i].transceiverType
        ch["transceiverState"]       = driverConfig.channel[i].transceiverState
        ch["configError"]            = driverConfig.channel[i].configError
        ch["channelIndex"]           = driverConfig.channel[i].channelIndex
        ch["channelMask"]            = driverConfig.channel[i].channelMask
        ch["channelCapabilities"]    = driverConfig.channel[i].channelCapabilities
        ch["channelBusCapabilities"] = driverConfig.channel[i].channelBusCapabilities
        ch["isOnBus"]                = driverConfig.channel[i].isOnBus
        ch["connectedBusType"]       = driverConfig.channel[i].connectedBusType

        busParams = {}
        busParams["busType"] = driverConfig.channel[i].busParams.busType

        data = {}
        if busParams["busType"]   == XL_BUS_TYPE_NONE:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_CAN:
            if driverConfig.channel[i].busParams.data.can.canOpMode == XL_BUS_PARAMS_CANOPMODE_CANFD:
                canFD = {}
                canFD["arbitrationBitRate"] = driverConfig.channel[i].busParams.data.canFD.arbitrationBitRate
                canFD["sjwAbr"]             = driverConfig.channel[i].busParams.data.canFD.sjwAbr
                canFD["tseg1Abr"]           = driverConfig.channel[i].busParams.data.canFD.tseg1Abr
                canFD["tseg2Abr"]           = driverConfig.channel[i].busParams.data.canFD.tseg2Abr
                canFD["samAbr"]             = driverConfig.channel[i].busParams.data.canFD.samAbr
                canFD["outputMode"]         = driverConfig.channel[i].busParams.data.canFD.outputMode
                canFD["sjwDbr"]             = driverConfig.channel[i].busParams.data.canFD.sjwDbr
                canFD["tseg1Dbr"]           = driverConfig.channel[i].busParams.data.canFD.tseg1Dbr
                canFD["tseg2Dbr"]           = driverConfig.channel[i].busParams.data.canFD.tseg2Dbr
                canFD["dataBitRate"]        = driverConfig.channel[i].busParams.data.canFD.dataBitRate
                canFD["canOpMode"]          = driverConfig.channel[i].busParams.data.canFD.canOpMode
                data["canFD"] = canFD
            else:
                can = {}
                can["bitRate"]    = driverConfig.channel[i].busParams.data.can.bitRate
                can["sjw"]        = driverConfig.channel[i].busParams.data.can.sjw
                can["tseg1"]      = driverConfig.channel[i].busParams.data.can.tseg1
                can["tseg2"]      = driverConfig.channel[i].busParams.data.can.tseg2
                can["sam"]        = driverConfig.channel[i].busParams.data.can.sam
                can["outputMode"] = driverConfig.channel[i].busParams.data.can.outputMode
                can["reserved1[7]"]= bytearray([driverConfig.channel[i].busParams.data.can.reserved1[j] for j in range(7)])
                can["canOpMode"]  = driverConfig.channel[i].busParams.data.can.canOpMode
                data["can"] = can
        elif busParams["busType"] == XL_BUS_TYPE_LIN:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_FLEXRAY:
            flexray = {}
            flexray["status"]   = driverConfig.channel[i].busParams.data.flexray.status
            flexray["cfgMode"]  = driverConfig.channel[i].busParams.data.flexray.cfgMode
            flexray["baudrate"] = driverConfig.channel[i].busParams.data.flexray.baudrate
            data["flexray"] = flexray
        elif busParams["busType"] == XL_BUS_TYPE_AFDX:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_MOST:
            most = {}
            most["activeSpeedGrade"]     = driverConfig.channel[i].busParams.data.most.activeSpeedGrade
            most["compatibleSpeedGrade"] = driverConfig.channel[i].busParams.data.most.compatibleSpeedGrade
            most["inicFwVersion"]        = driverConfig.channel[i].busParams.data.most.inicFwVersion
            data["most"] = most
        elif busParams["busType"] == XL_BUS_TYPE_DAIO:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_J1708:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_ETHERNET:
            ethernet = {}
            ethernet["macAddr[6]"]      = bytearray([driverConfig.channel[i].busParams.data.ethernet.macAddr[j] for j in range(6)])
            ethernet["connector"]       = driverConfig.channel[i].busParams.data.ethernet.connector
            ethernet["phy"]             = driverConfig.channel[i].busParams.data.ethernet.phy
            ethernet["link"]            = driverConfig.channel[i].busParams.data.ethernet.link
            ethernet["speed"]           = driverConfig.channel[i].busParams.data.ethernet.speed
            ethernet["clockMode"]       = driverConfig.channel[i].busParams.data.ethernet.clockMode
            ethernet["bypass"]          = driverConfig.channel[i].busParams.data.ethernet.bypass
            data["ethernet"] = ethernet
        elif busParams["busType"] == XL_BUS_TYPE_A429:
            a429 = {}
            a429["res1"] = driverConfig.channel[i].busParams.data.a429.res1
            a429["channelDirection"] = driverConfig.channel[i].busParams.data.a429.channelDirection
            dir = {}
            if a429["channelDirection"] == XL_A429_MSG_CHANNEL_DIR_TX:
                dir["bitrate"] = driverConfig.channel[i].busParams.data.a429.dir.tx.bitrate
                dir["parity"]  = driverConfig.channel[i].busParams.data.a429.dir.tx.parity
                dir["minGap"]  = driverConfig.channel[i].busParams.data.a429.dir.tx.minGap
            elif driverConfig.channel[i].busParams.data.a429.channelDirection == XL_A429_MSG_CHANNEL_DIR_RX:
                dir["bitrate"]     = driverConfig.channel[i].busParams.data.a429.dir.rx.bitrate
                dir["minBitrate"]  = driverConfig.channel[i].busParams.data.a429.dir.rx.minBitrate
                dir["maxBitrate"]  = driverConfig.channel[i].busParams.data.a429.dir.rx.maxBitrate
                dir["parity"]      = driverConfig.channel[i].busParams.data.a429.dir.rx.parity
                dir["minGap"]      = driverConfig.channel[i].busParams.data.a429.dir.rx.minGap
                dir["autoBaudrate"]= driverConfig.channel[i].busParams.data.a429.dir.rx.autoBaudrate
            else:
                pass
            dir["raw[24]"]   = bytearray([driverConfig.channel[i].busParams.data.raw[j] for j in range(24)])
            a429["dir"]  = dir
            data["a429"] = a429
        else:
            pass
        
        data["raw[28]"]   = bytearray([driverConfig.channel[i].busParams.data.raw[j] for j in range(28)])
        busParams["data"] = data
        ch["busParams"] = busParams

        ch["_doNotUse"]                     = driverConfig.channel[i]._doNotUse
        ch["driverVersion"]                 = driverConfig.channel[i].driverVersion
        ch["interfaceVersion"]              = driverConfig.channel[i].interfaceVersion
        ch["raw_data[10]"]                  = [driverConfig.channel[i].raw_data[j] for j in range(10)]
        ch["serialNumber"]                  = driverConfig.channel[i].serialNumber
        ch["articleNumber"]                 = driverConfig.channel[i].articleNumber
        ch["transceiverName"]               = bytes(driverConfig.channel[i].transceiverName)
        ch["specialCabFlags"]               = driverConfig.channel[i].specialCabFlags
        ch["dominantTimeout"]               = driverConfig.channel[i].dominantTimeout
        ch["dominantRecessiveDelay"]        = driverConfig.channel[i].dominantRecessiveDelay
        ch["recessiveDominantDelay"]        = driverConfig.channel[i].recessiveDominantDelay
        ch["connectionInfo"]                = driverConfig.channel[i].connectionInfo
        ch["currentlyAvailableTimestamps"]  = driverConfig.channel[i].currentlyAvailableTimestamps
        ch["minimalSupplyVoltage"]          = driverConfig.channel[i].minimalSupplyVoltage
        ch["maximalSupplyVoltage"]          = driverConfig.channel[i].maximalSupplyVoltage
        ch["maximalBaudrate"]               = driverConfig.channel[i].maximalBaudrate
        ch["fpgaCoreCapabilities"]          = driverConfig.channel[i].fpgaCoreCapabilities
        ch["specialDeviceStatus"]           = driverConfig.channel[i].specialDeviceStatus
        ch["channelBusActiveCapabilities"]  = driverConfig.channel[i].channelBusActiveCapabilities
        ch["breakOffset"]                   = driverConfig.channel[i].breakOffset
        ch["delimiterOffset"]               = driverConfig.channel[i].delimiterOffset
        ch["reserved[3]"]                      = bytearray([driverConfig.channel[i].reserved[j] for j in range(3)])





        channel.append(ch)
    
    pDriverConfig["channel"] = channel

    return status


def GetRemoteDriverConfig(dict pDriverConfig):
    cdef XLstatus status
    cdef XLdriverConfig driverConfig
    
    status = xlGetRemoteDriverConfig(&driverConfig)

    pDriverConfig["dllVersion"]   = driverConfig.dllVersion
    pDriverConfig["channelCount"] = driverConfig.channelCount
    pDriverConfig["reserved[10]"] = [driverConfig.reserved[i] for i in range(10)]

    channel = []
    cdef int channelCount = driverConfig.channelCount
    for i in range(channelCount):
        ch = {}
        ch["name"]                   = bytes(driverConfig.channel[i].name)
        ch["hwType"]                 = driverConfig.channel[i].hwType
        ch["hwIndex"]                = driverConfig.channel[i].hwIndex
        ch["hwChannel"]              = driverConfig.channel[i].hwChannel
        ch["transceiverType"]        = driverConfig.channel[i].transceiverType
        ch["transceiverState"]       = driverConfig.channel[i].transceiverState
        ch["configError"]            = driverConfig.channel[i].configError
        ch["channelIndex"]           = driverConfig.channel[i].channelIndex
        ch["channelMask"]            = driverConfig.channel[i].channelMask
        ch["channelCapabilities"]    = driverConfig.channel[i].channelCapabilities
        ch["channelBusCapabilities"] = driverConfig.channel[i].channelBusCapabilities
        ch["isOnBus"]                = driverConfig.channel[i].isOnBus
        ch["connectedBusType"]       = driverConfig.channel[i].connectedBusType

        busParams = {}
        busParams["busType"] = driverConfig.channel[i].busParams.busType

        data = {}
        if busParams["busType"]   == XL_BUS_TYPE_NONE:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_CAN:
            if driverConfig.channel[i].busParams.data.can.canOpMode == XL_BUS_PARAMS_CANOPMODE_CANFD:
                canFD = {}
                canFD["arbitrationBitRate"] = driverConfig.channel[i].busParams.data.canFD.arbitrationBitRate
                canFD["sjwAbr"]             = driverConfig.channel[i].busParams.data.canFD.sjwAbr
                canFD["tseg1Abr"]           = driverConfig.channel[i].busParams.data.canFD.tseg1Abr
                canFD["tseg2Abr"]           = driverConfig.channel[i].busParams.data.canFD.tseg2Abr
                canFD["samAbr"]             = driverConfig.channel[i].busParams.data.canFD.samAbr
                canFD["outputMode"]         = driverConfig.channel[i].busParams.data.canFD.outputMode
                canFD["sjwDbr"]             = driverConfig.channel[i].busParams.data.canFD.sjwDbr
                canFD["tseg1Dbr"]           = driverConfig.channel[i].busParams.data.canFD.tseg1Dbr
                canFD["tseg2Dbr"]           = driverConfig.channel[i].busParams.data.canFD.tseg2Dbr
                canFD["dataBitRate"]        = driverConfig.channel[i].busParams.data.canFD.dataBitRate
                canFD["canOpMode"]          = driverConfig.channel[i].busParams.data.canFD.canOpMode
                data["canFD"] = canFD
            else:
                can = {}
                can["bitRate"]    = driverConfig.channel[i].busParams.data.can.bitRate
                can["sjw"]        = driverConfig.channel[i].busParams.data.can.sjw
                can["tseg1"]      = driverConfig.channel[i].busParams.data.can.tseg1
                can["tseg2"]      = driverConfig.channel[i].busParams.data.can.tseg2
                can["sam"]        = driverConfig.channel[i].busParams.data.can.sam
                can["outputMode"] = driverConfig.channel[i].busParams.data.can.outputMode
                can["reserved1[7]"]= bytearray([driverConfig.channel[i].busParams.data.can.reserved1[j] for j in range(7)])
                can["canOpMode"]  = driverConfig.channel[i].busParams.data.can.canOpMode
                data["can"] = can
        elif busParams["busType"] == XL_BUS_TYPE_LIN:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_FLEXRAY:
            flexray = {}
            flexray["status"]   = driverConfig.channel[i].busParams.data.flexray.status
            flexray["cfgMode"]  = driverConfig.channel[i].busParams.data.flexray.cfgMode
            flexray["baudrate"] = driverConfig.channel[i].busParams.data.flexray.baudrate
            data["flexray"] = flexray
        elif busParams["busType"] == XL_BUS_TYPE_AFDX:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_MOST:
            most = {}
            most["activeSpeedGrade"]     = driverConfig.channel[i].busParams.data.most.activeSpeedGrade
            most["compatibleSpeedGrade"] = driverConfig.channel[i].busParams.data.most.compatibleSpeedGrade
            most["inicFwVersion"]        = driverConfig.channel[i].busParams.data.most.inicFwVersion
            data["most"] = most
        elif busParams["busType"] == XL_BUS_TYPE_DAIO:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_J1708:
            pass
        elif busParams["busType"] == XL_BUS_TYPE_ETHERNET:
            ethernet = {}
            ethernet["macAddr[6]"]      = bytearray([driverConfig.channel[i].busParams.data.ethernet.macAddr[j] for j in range(6)])
            ethernet["connector"]       = driverConfig.channel[i].busParams.data.ethernet.connector
            ethernet["phy"]             = driverConfig.channel[i].busParams.data.ethernet.phy
            ethernet["link"]            = driverConfig.channel[i].busParams.data.ethernet.link
            ethernet["speed"]           = driverConfig.channel[i].busParams.data.ethernet.speed
            ethernet["clockMode"]       = driverConfig.channel[i].busParams.data.ethernet.clockMode
            ethernet["bypass"]          = driverConfig.channel[i].busParams.data.ethernet.bypass
            data["ethernet"] = ethernet
        elif busParams["busType"] == XL_BUS_TYPE_A429:
            a429 = {}
            a429["res1"] = driverConfig.channel[i].busParams.data.a429.res1
            a429["channelDirection"] = driverConfig.channel[i].busParams.data.a429.channelDirection
            dir = {}
            if a429["channelDirection"] == XL_A429_MSG_CHANNEL_DIR_TX:
                dir["bitrate"] = driverConfig.channel[i].busParams.data.a429.dir.tx.bitrate
                dir["parity"]  = driverConfig.channel[i].busParams.data.a429.dir.tx.parity
                dir["minGap"]  = driverConfig.channel[i].busParams.data.a429.dir.tx.minGap
            elif driverConfig.channel[i].busParams.data.a429.channelDirection == XL_A429_MSG_CHANNEL_DIR_RX:
                dir["bitrate"]     = driverConfig.channel[i].busParams.data.a429.dir.rx.bitrate
                dir["minBitrate"]  = driverConfig.channel[i].busParams.data.a429.dir.rx.minBitrate
                dir["maxBitrate"]  = driverConfig.channel[i].busParams.data.a429.dir.rx.maxBitrate
                dir["parity"]      = driverConfig.channel[i].busParams.data.a429.dir.rx.parity
                dir["minGap"]      = driverConfig.channel[i].busParams.data.a429.dir.rx.minGap
                dir["autoBaudrate"]= driverConfig.channel[i].busParams.data.a429.dir.rx.autoBaudrate
            else:
                pass
            dir["raw[24]"]   = bytearray([driverConfig.channel[i].busParams.data.raw[j] for j in range(24)])
            a429["dir"]  = dir
            data["a429"] = a429
        else:
            pass
        
        data["raw[28]"]   = bytearray([driverConfig.channel[i].busParams.data.raw[j] for j in range(28)])
        busParams["data"] = data
        ch["busParams"] = busParams

        ch["_doNotUse"]                     = driverConfig.channel[i]._doNotUse
        ch["driverVersion"]                 = driverConfig.channel[i].driverVersion
        ch["interfaceVersion"]              = driverConfig.channel[i].interfaceVersion
        ch["raw_data[10]"]                  = [driverConfig.channel[i].raw_data[j] for j in range(10)]
        ch["serialNumber"]                  = driverConfig.channel[i].serialNumber
        ch["articleNumber"]                 = driverConfig.channel[i].articleNumber
        ch["transceiverName"]               = bytes(driverConfig.channel[i].transceiverName)
        ch["specialCabFlags"]               = driverConfig.channel[i].specialCabFlags
        ch["dominantTimeout"]               = driverConfig.channel[i].dominantTimeout
        ch["dominantRecessiveDelay"]        = driverConfig.channel[i].dominantRecessiveDelay
        ch["recessiveDominantDelay"]        = driverConfig.channel[i].recessiveDominantDelay
        ch["connectionInfo"]                = driverConfig.channel[i].connectionInfo
        ch["currentlyAvailableTimestamps"]  = driverConfig.channel[i].currentlyAvailableTimestamps
        ch["minimalSupplyVoltage"]          = driverConfig.channel[i].minimalSupplyVoltage
        ch["maximalSupplyVoltage"]          = driverConfig.channel[i].maximalSupplyVoltage
        ch["maximalBaudrate"]               = driverConfig.channel[i].maximalBaudrate
        ch["fpgaCoreCapabilities"]          = driverConfig.channel[i].fpgaCoreCapabilities
        ch["specialDeviceStatus"]           = driverConfig.channel[i].specialDeviceStatus
        ch["channelBusActiveCapabilities"]  = driverConfig.channel[i].channelBusActiveCapabilities
        ch["breakOffset"]                   = driverConfig.channel[i].breakOffset
        ch["delimiterOffset"]               = driverConfig.channel[i].delimiterOffset
        ch["reserved[3]"]                      = bytearray([driverConfig.channel[i].reserved[j] for j in range(3)])





        channel.append(ch)
    
    pDriverConfig["channel"] = channel

    return status

def PopupHwConfig(char* callSign=NULL, unsigned int waitForFinish=0):
    return xlPopupHwConfig(callSign, waitForFinish)

def GetLicenseInfo(XLaccess channelMask, list pLicInfoArray):
    cdef XLstatus status = XL_ERROR
    cdef XLlicenseInfo licInfoArray[1024]
    cdef unsigned int licInfoArraySize = 1024
    pLicInfoArray = []

    if licInfoArraySize > 0:
        memset(licInfoArray, 0, sizeof(XLlicenseInfo) * licInfoArraySize)
        status = xlGetLicenseInfo(channelMask, licInfoArray, licInfoArraySize)
        if status == XL_SUCCESS:
            for i in range(licInfoArraySize):
                licInfo = {}
                licInfo["bAvailable"] = licInfoArray[i].bAvailable
                licInfo["licName"] =  bytearray([licInfoArray[i].licName[j] for j in range(65)])
                pLicInfoArray.append(licInfo)
    return status

def GetKeymanBoxes(list pBoxCount):
    cdef XLstatus status = XL_ERROR
    cdef unsigned int boxCount = 0
    status = xlGetKeymanBoxes(&boxCount)
    pBoxCount[0] = boxCount
    return status

def GetKeymanInfo(unsigned int boxIndex, list pBoxMask, list pBoxSerial, list pLicInfo):
        cdef XLstatus status = XL_ERROR
        cdef unsigned int boxMask = 0
        cdef unsigned int boxSerial = 0
        cdef XLuint64 licInfo[4]
        pLicInfo = []
        
        memset(licInfo, 0, sizeof(XLuint64) * 4)
        status = xlGetKeymanInfo(boxIndex, &boxMask, &boxSerial, licInfo)
        if status == XL_SUCCESS:
            pBoxMask[0]   = boxMask
            pBoxSerial[0] = boxSerial
            for i in range(4):
                pLicInfo.append(licInfo[i])
        return status

def CanFdSetConfiguration(XLportHandle portHandle, XLaccess accessMask, list pCanFdConf):
    cdef XLstatus status = XL_ERROR
    cdef XLcanFdConf canFdConf
    memset(&canFdConf, 0, sizeof(canFdConf))

    status = xlCanFdSetConfiguration(portHandle, accessMask, &canFdConf)

    pCanFdConf[0] = canFdConf

    return status

def CanTransmitEx(XLportHandle portHandle, XLaccess accessMask, unsigned char channelIndex, unsigned int msgCnt, list pMsgCntSent, list pXlCanTxEvt):
    cdef XLstatus status = XL_ERROR
    cdef unsigned int message_count = 0
    cdef unsigned int msgCntSent = 0
    cdef XLcanTxEvent* pXLcanTxEvents = NULL

    message_count = <unsigned int>len(pXlCanTxEvt)
    if msgCnt > message_count:
        msgCnt = message_count

    if msgCnt > 0:
        pXLcanTxEvents = <XLcanTxEvent *> malloc(sizeof(XLcanTxEvent) * msgCnt)
        memset(pXLcanTxEvents, 0, sizeof(XLcanTxEvent) * msgCnt)
        for i, msg in enumerate(pXlCanTxEvt):
            pXLcanTxEvents[i].tag                 = <unsigned short>XL_CAN_EV_TAG_TX_MSG
            pXLcanTxEvents[i].transId             = <unsigned short>0xffff
            pXLcanTxEvents[i].channelIndex        = <unsigned char> channelIndex

            pXLcanTxEvents[i].tagData.canMsg.canId      = <unsigned int>msg["canId"]
            pXLcanTxEvents[i].tagData.canMsg.msgFlags   = <unsigned int>msg["msgFlags"]
            pXLcanTxEvents[i].tagData.canMsg.dlc        = <unsigned char>msg["dlc"]
            for j, b in enumerate(msg["data"]):
                pXLcanTxEvents[i].tagData.canMsg.data[j] = b

            status = xlCanTransmitEx(portHandle, accessMask, msgCnt, &msgCntSent, pXLcanTxEvents)
        free(pXLcanTxEvents)

    pMsgCntSent[0] = msgCntSent
    return status

def FrSetConfiguration(XLportHandle portHandle, XLaccess accessMask, dict pxlClusterConfig):
    cdef XLstatus status = XL_ERROR
    cdef XLfrClusterConfig clusterConfig
    memset(&clusterConfig, 0, sizeof(clusterConfig))
    clusterConfig.busGuardianEnable                 = pxlClusterConfig["busGuardianEnable"]                 
    clusterConfig.baudrate                          = pxlClusterConfig["baudrate"]                          
    clusterConfig.busGuardianTick                   = pxlClusterConfig["busGuardianTick"]                   
    clusterConfig.externalClockCorrectionMode       = pxlClusterConfig["externalClockCorrectionMode"]       
    clusterConfig.gColdStartAttempts                = pxlClusterConfig["gColdStartAttempts"]                
    clusterConfig.gListenNoise                      = pxlClusterConfig["gListenNoise"]                      
    clusterConfig.gMacroPerCycle                    = pxlClusterConfig["gMacroPerCycle"]                    
    clusterConfig.gMaxWithoutClockCorrectionFatal   = pxlClusterConfig["gMaxWithoutClockCorrectionFatal"]   
    clusterConfig.gMaxWithoutClockCorrectionPassive = pxlClusterConfig["gMaxWithoutClockCorrectionPassive"] 
    clusterConfig.gNetworkManagementVectorLength    = pxlClusterConfig["gNetworkManagementVectorLength"]    
    clusterConfig.gNumberOfMinislots                = pxlClusterConfig["gNumberOfMinislots"]                
    clusterConfig.gNumberOfStaticSlots              = pxlClusterConfig["gNumberOfStaticSlots"]              
    clusterConfig.gOffsetCorrectionStart            = pxlClusterConfig["gOffsetCorrectionStart"]            
    clusterConfig.gPayloadLengthStatic              = pxlClusterConfig["gPayloadLengthStatic"]              
    clusterConfig.gSyncNodeMax                      = pxlClusterConfig["gSyncNodeMax"]                      
    clusterConfig.gdActionPointOffset               = pxlClusterConfig["gdActionPointOffset"]               
    clusterConfig.gdDynamicSlotIdlePhase            = pxlClusterConfig["gdDynamicSlotIdlePhase"]            
    clusterConfig.gdMacrotick                       = pxlClusterConfig["gdMacrotick"]                       
    clusterConfig.gdMinislot                        = pxlClusterConfig["gdMinislot"]                        
    clusterConfig.gdMiniSlotActionPointOffset       = pxlClusterConfig["gdMiniSlotActionPointOffset"]       
    clusterConfig.gdNIT                             = pxlClusterConfig["gdNIT"]                             
    clusterConfig.gdStaticSlot                      = pxlClusterConfig["gdStaticSlot"]                      
    clusterConfig.gdSymbolWindow                    = pxlClusterConfig["gdSymbolWindow"]                    
    clusterConfig.gdTSSTransmitter                  = pxlClusterConfig["gdTSSTransmitter"]                  
    clusterConfig.gdWakeupSymbolRxIdle              = pxlClusterConfig["gdWakeupSymbolRxIdle"]              
    clusterConfig.gdWakeupSymbolRxLow               = pxlClusterConfig["gdWakeupSymbolRxLow"]               
    clusterConfig.gdWakeupSymbolRxWindow            = pxlClusterConfig["gdWakeupSymbolRxWindow"]            
    clusterConfig.gdWakeupSymbolTxIdle              = pxlClusterConfig["gdWakeupSymbolTxIdle"]              
    clusterConfig.gdWakeupSymbolTxLow               = pxlClusterConfig["gdWakeupSymbolTxLow"]               
    clusterConfig.pAllowHaltDueToClock              = pxlClusterConfig["pAllowHaltDueToClock"]              
    clusterConfig.pAllowPassiveToActive             = pxlClusterConfig["pAllowPassiveToActive"]             
    clusterConfig.pChannels                         = pxlClusterConfig["pChannels"]                         
    clusterConfig.pClusterDriftDamping              = pxlClusterConfig["pClusterDriftDamping"]              
    clusterConfig.pDecodingCorrection               = pxlClusterConfig["pDecodingCorrection"]               
    clusterConfig.pDelayCompensationA               = pxlClusterConfig["pDelayCompensationA"]               
    clusterConfig.pDelayCompensationB               = pxlClusterConfig["pDelayCompensationB"]               
    clusterConfig.pExternOffsetCorrection           = pxlClusterConfig["pExternOffsetCorrection"]           
    clusterConfig.pExternRateCorrection             = pxlClusterConfig["pExternRateCorrection"]             
    clusterConfig.pKeySlotUsedForStartup            = pxlClusterConfig["pKeySlotUsedForStartup"]            
    clusterConfig.pKeySlotUsedForSync               = pxlClusterConfig["pKeySlotUsedForSync"]               
    clusterConfig.pLatestTx                         = pxlClusterConfig["pLatestTx"]                         
    clusterConfig.pMacroInitialOffsetA              = pxlClusterConfig["pMacroInitialOffsetA"]              
    clusterConfig.pMacroInitialOffsetB              = pxlClusterConfig["pMacroInitialOffsetB"]              
    clusterConfig.pMaxPayloadLengthDynamic          = pxlClusterConfig["pMaxPayloadLengthDynamic"]          
    clusterConfig.pMicroInitialOffsetA              = pxlClusterConfig["pMicroInitialOffsetA"]              
    clusterConfig.pMicroInitialOffsetB              = pxlClusterConfig["pMicroInitialOffsetB"]              
    clusterConfig.pMicroPerCycle                    = pxlClusterConfig["pMicroPerCycle"]                    
    clusterConfig.pMicroPerMacroNom                 = pxlClusterConfig["pMicroPerMacroNom"]                 
    clusterConfig.pOffsetCorrectionOut              = pxlClusterConfig["pOffsetCorrectionOut"]              
    clusterConfig.pRateCorrectionOut                = pxlClusterConfig["pRateCorrectionOut"]                
    clusterConfig.pSamplesPerMicrotick              = pxlClusterConfig["pSamplesPerMicrotick"]              
    clusterConfig.pSingleSlotEnabled                = pxlClusterConfig["pSingleSlotEnabled"]                
    clusterConfig.pWakeupChannel                    = pxlClusterConfig["pWakeupChannel"]                    
    clusterConfig.pWakeupPattern                    = pxlClusterConfig["pWakeupPattern"]                    
    clusterConfig.pdAcceptedStartupRange            = pxlClusterConfig["pdAcceptedStartupRange"]            
    clusterConfig.pdListenTimeout                   = pxlClusterConfig["pdListenTimeout"]                   
    clusterConfig.pdMaxDrift                        = pxlClusterConfig["pdMaxDrift"]                        
    clusterConfig.pdMicrotick                       = pxlClusterConfig["pdMicrotick"]                       
    clusterConfig.gdCASRxLowMax                     = pxlClusterConfig["gdCASRxLowMax"]                     
    clusterConfig.gChannels                         = pxlClusterConfig["gChannels"]                         
    clusterConfig.vExternOffsetControl              = pxlClusterConfig["vExternOffsetControl"]              
    clusterConfig.vExternRateControl                = pxlClusterConfig["vExternRateControl"]                
    clusterConfig.pChannelsMTS                      = pxlClusterConfig["pChannelsMTS"]                      
    status = xlFrSetConfiguration(portHandle, accessMask, &clusterConfig)
    pxlClusterConfig = clusterConfig
    return status

def FrGetChannelConfiguration(XLportHandle portHandle, XLaccess accessMask, dict pxlFrChannelConfig):
    cdef XLstatus status = XL_ERROR
    cdef XLfrChannelConfig channelConfig
    status = xlFrGetChannelConfiguration(portHandle, accessMask, &channelConfig)
    pxlFrChannelConfig = channelConfig
    return status

def FrSetMode(XLportHandle portHandle, XLaccess accessMask, dict frMode):
    cdef XLstatus status = XL_ERROR
    cdef XLfrMode mode
    memset(&mode, 0, sizeof(mode))
    mode.frMode                 = frMode['frMode']
    mode.frStartupAttributes    = frMode['frStartupAttributes']
    status = xlFrSetMode(portHandle, accessMask, &mode)
    frMode = mode
    return status

cdef GetEventBufferFromDict(XLfrEvent *pEventBuffer, dict dictEventBuffer):
    pEventBuffer.tag                               = dictEventBuffer['tag']
    pEventBuffer.flagsChip                         = dictEventBuffer['flagsChip']
    pEventBuffer.size                              = dictEventBuffer['size']
    pEventBuffer.userHandle                        = dictEventBuffer['userHandle']
    pEventBuffer.tagData.frTxFrame.flags           = dictEventBuffer['tagData']['frTxFrame']['flags']
    pEventBuffer.tagData.frTxFrame.offset          = dictEventBuffer['tagData']['frTxFrame']['offset']
    pEventBuffer.tagData.frTxFrame.repetition      = dictEventBuffer['tagData']['frTxFrame']['repetition']
    pEventBuffer.tagData.frTxFrame.payloadLength   = dictEventBuffer['tagData']['frTxFrame']['payloadLength']
    pEventBuffer.tagData.frTxFrame.slotID          = dictEventBuffer['tagData']['frTxFrame']['slotID']
    pEventBuffer.tagData.frTxFrame.txMode          = dictEventBuffer['tagData']['frTxFrame']['txMode']
    pEventBuffer.tagData.frTxFrame.incrementOffset = dictEventBuffer['tagData']['frTxFrame']['incrementOffset']
    pEventBuffer.tagData.frTxFrame.incrementSize   = dictEventBuffer['tagData']['frTxFrame']['incrementSize']
    for i in range(pEventBuffer.tagData.frTxFrame.payloadLength):
        pEventBuffer.tagData.frTxFrame.data[i] = int(dictEventBuffer['tagData']['frTxFrame']['data'][2*i:2*(i+1)])


def FrInitStartupAndSync(XLportHandle portHandle, XLaccess accessMask, dict pEventBuffer):
    cdef XLstatus status = XL_ERROR
    cdef XLfrEvent eventBuffer
    memset(&eventBuffer, 0, sizeof(eventBuffer))
    GetEventBufferFromDict(&eventBuffer, pEventBuffer)
    status = xlFrInitStartupAndSync(portHandle, accessMask, &eventBuffer)
    pEventBuffer = eventBuffer
    return status

def FrSetupSymbolWindow(XLportHandle portHandle, XLaccess accessMask, unsigned int frChannel, unsigned int symbolWindowMask):
    return xlFrSetupSymbolWindow(portHandle, accessMask, frChannel, symbolWindowMask)

def FrActivateSpy(XLportHandle portHandle, XLaccess accessMask, unsigned int mode):
    return xlFrActivateSpy(portHandle, accessMask, mode)

#def SetTimerBaseNotify(XLportHandle portHandle, list pHandle):
#    cdef XLstatus status = XL_ERROR
#    cdef XLhandle handle = NULL
#    memset(&handle, 0, sizeof(handle))
#    status = xlSetTimerBaseNotify(portHandle, &handle)
#    pHandle[0] = <size_t>handle
#    return status

def FrReceive(XLportHandle portHandle, dict pEventBuffer):
    cdef XLstatus status = XL_ERROR
    cdef XLfrEvent eventBuffer
    memset(&eventBuffer, 0, sizeof(eventBuffer))
    status = xlFrReceive(portHandle, &eventBuffer)
    pEventBuffer = eventBuffer
    return status

def FrTransmit(XLportHandle portHandle, XLaccess accessMask, dict pEventBuffer):
    cdef XLstatus status = XL_ERROR
    cdef XLfrEvent eventBuffer
    memset(&eventBuffer, 0, sizeof(eventBuffer))
    GetEventBufferFromDict(&eventBuffer, pEventBuffer)
    print(eventBuffer.tagData.frTxFrame.data)
    status = xlFrTransmit(portHandle, accessMask, &eventBuffer)
    pEventBuffer = eventBuffer
    return status

def FrSetTransceiverMode(XLportHandle portHandle, XLaccess accessMask, unsigned int frChannel, unsigned int mode):
    return xlFrSetTransceiverMode(portHandle, accessMask, frChannel, mode)

def FrSendSymbolWindow(XLportHandle portHandle, XLaccess accessMask, unsigned int symbolWindow):
    return xlFrSendSymbolWindow(portHandle, accessMask, symbolWindow)

def FrSetAcceptanceFilter(XLportHandle portHandle, XLaccess accessMask, dict pAcceptanceFilter):
    cdef XLstatus status = XL_ERROR
    cdef XLfrAcceptanceFilter acceptanceFilter
    memset(&acceptanceFilter, 0, sizeof(acceptanceFilter))
    acceptanceFilter.filterStatus       = pAcceptanceFilter['filterStatus']
    acceptanceFilter.filterTypeMask     = pAcceptanceFilter['filterTypeMask']
    acceptanceFilter.filterFirstSlot    = pAcceptanceFilter['filterFirstSlot']
    acceptanceFilter.filterLastSlot     = pAcceptanceFilter['filterLastSlot']
    acceptanceFilter.filterChannelMask  = pAcceptanceFilter['filterChannelMask']
    status = xlFrSetAcceptanceFilter(portHandle, accessMask, &acceptanceFilter)
    pAcceptanceFilter = acceptanceFilter
    return status

# HwType
XL_HWTYPE_NONE                   = _XL_HWTYPE_NONE
XL_HWTYPE_VIRTUAL                = _XL_HWTYPE_VIRTUAL
XL_HWTYPE_CANCARDX               = _XL_HWTYPE_CANCARDX
XL_HWTYPE_CANAC2PCI              = _XL_HWTYPE_CANAC2PCI
XL_HWTYPE_CANCARDY               = _XL_HWTYPE_CANCARDY
XL_HWTYPE_CANCARDXL              = _XL_HWTYPE_CANCARDXL
XL_HWTYPE_CANCASEXL              = _XL_HWTYPE_CANCASEXL
XL_HWTYPE_CANCASEXL_LOG_OBSOLETE = _XL_HWTYPE_CANCASEXL_LOG_OBSOLETE
XL_HWTYPE_CANBOARDXL             = _XL_HWTYPE_CANBOARDXL
XL_HWTYPE_CANBOARDXL_PXI         = _XL_HWTYPE_CANBOARDXL_PXI
XL_HWTYPE_VN2600                 = _XL_HWTYPE_VN2600
XL_HWTYPE_VN2610                 = _XL_HWTYPE_VN2610
XL_HWTYPE_VN3300                 = _XL_HWTYPE_VN3300
XL_HWTYPE_VN3600                 = _XL_HWTYPE_VN3600
XL_HWTYPE_VN7600                 = _XL_HWTYPE_VN7600
XL_HWTYPE_CANCARDXLE             = _XL_HWTYPE_CANCARDXLE
XL_HWTYPE_VN8900                 = _XL_HWTYPE_VN8900
XL_HWTYPE_VN8950                 = _XL_HWTYPE_VN8950
XL_HWTYPE_VN2640                 = _XL_HWTYPE_VN2640
XL_HWTYPE_VN1610                 = _XL_HWTYPE_VN1610
XL_HWTYPE_VN1630                 = _XL_HWTYPE_VN1630
XL_HWTYPE_VN1640                 = _XL_HWTYPE_VN1640
XL_HWTYPE_VN8970                 = _XL_HWTYPE_VN8970
XL_HWTYPE_VN1611                 = _XL_HWTYPE_VN1611
XL_HWTYPE_VN5610                 = _XL_HWTYPE_VN5610
XL_HWTYPE_VN7570                 = _XL_HWTYPE_VN7570
XL_HWTYPE_IPCLIENT               = _XL_HWTYPE_IPCLIENT
XL_HWTYPE_IPSERVER               = _XL_HWTYPE_IPSERVER
XL_HWTYPE_VX1121                 = _XL_HWTYPE_VX1121
XL_HWTYPE_VX1131                 = _XL_HWTYPE_VX1131
XL_HWTYPE_VT6204                 = _XL_HWTYPE_VT6204
XL_HWTYPE_VN1630_LOG             = _XL_HWTYPE_VN1630_LOG
XL_HWTYPE_VN7610                 = _XL_HWTYPE_VN7610
XL_HWTYPE_VN7572                 = _XL_HWTYPE_VN7572
XL_HWTYPE_VN8972                 = _XL_HWTYPE_VN8972
XL_HWTYPE_VN0601                 = _XL_HWTYPE_VN0601
XL_HWTYPE_VX0312                 = _XL_HWTYPE_VX0312
XL_HWTYPE_VN8800                 = _XL_HWTYPE_VN8800
XL_HWTYPE_IPCL8800               = _XL_HWTYPE_IPCL8800
XL_HWTYPE_IPSRV8800              = _XL_HWTYPE_IPSRV8800
XL_HWTYPE_CSMCAN                 = _XL_HWTYPE_CSMCAN
XL_HWTYPE_VN5610A                = _XL_HWTYPE_VN5610A
XL_HWTYPE_VN7640                 = _XL_HWTYPE_VN7640
XL_MAX_HWTYPE                    = _XL_MAX_HWTYPE

# BusType
XL_BUS_TYPE_NONE     = _XL_BUS_TYPE_NONE
XL_BUS_TYPE_CAN      = _XL_BUS_TYPE_CAN
XL_BUS_TYPE_LIN      = _XL_BUS_TYPE_LIN
XL_BUS_TYPE_FLEXRAY  = _XL_BUS_TYPE_FLEXRAY
XL_BUS_TYPE_AFDX     = _XL_BUS_TYPE_AFDX
XL_BUS_TYPE_MOST     = _XL_BUS_TYPE_MOST
XL_BUS_TYPE_DAIO     = _XL_BUS_TYPE_DAIO
XL_BUS_TYPE_J1708    = _XL_BUS_TYPE_J1708
XL_BUS_TYPE_ETHERNET = _XL_BUS_TYPE_ETHERNET
XL_BUS_TYPE_A429     = _XL_BUS_TYPE_A429

# interface version for our events
XL_INTERFACE_VERSION_V2 = _XL_INTERFACE_VERSION_V2
XL_INTERFACE_VERSION_V3 = _XL_INTERFACE_VERSION_V3 
XL_INTERFACE_VERSION_V4 = _XL_INTERFACE_VERSION_V4 # for MOST,CAN FD, Ethernet, FlexRay, ARINC429
XL_INTERFACE_VERSION    = _XL_INTERFACE_VERSION       # forCAN, LIN, DAIO.

# porthandle
XL_INVALID_PORTHANDLE = _XL_INVALID_PORTHANDLE

# defines for XLbusParams::data::can/canFD::canOpMode
XL_BUS_PARAMS_CANOPMODE_CAN20 = _XL_BUS_PARAMS_CANOPMODE_CAN20
XL_BUS_PARAMS_CANOPMODE_CANFD = _XL_BUS_PARAMS_CANOPMODE_CANFD

# ARINC429 types and definitions
XL_A429_MSG_CHANNEL_DIR_TX = _XL_A429_MSG_CHANNEL_DIR_TX
XL_A429_MSG_CHANNEL_DIR_RX = _XL_A429_MSG_CHANNEL_DIR_RX
XL_A429_MSG_BITRATE_SLOW_MIN = _XL_A429_MSG_BITRATE_SLOW_MIN
XL_A429_MSG_BITRATE_SLOW_MAX = _XL_A429_MSG_BITRATE_SLOW_MAX
XL_A429_MSG_BITRATE_FAST_MIN = _XL_A429_MSG_BITRATE_FAST_MIN
XL_A429_MSG_BITRATE_FAST_MAX = _XL_A429_MSG_BITRATE_FAST_MAX
XL_A429_MSG_GAP_4BIT = _XL_A429_MSG_GAP_4BIT
XL_A429_MSG_BITRATE_RX_MIN = _XL_A429_MSG_BITRATE_RX_MIN
XL_A429_MSG_BITRATE_RX_MAX = _XL_A429_MSG_BITRATE_RX_MAX
XL_A429_MSG_AUTO_BAUDRATE_DISABLED = _XL_A429_MSG_AUTO_BAUDRATE_DISABLED
XL_A429_MSG_AUTO_BAUDRATE_ENABLED = _XL_A429_MSG_AUTO_BAUDRATE_ENABLED
XL_A429_MSG_FLAG_ON_REQUEST = _XL_A429_MSG_FLAG_ON_REQUEST
XL_A429_MSG_FLAG_CYCLIC = _XL_A429_MSG_FLAG_CYCLIC
XL_A429_MSG_FLAG_DELETE_CYCLIC = _XL_A429_MSG_FLAG_DELETE_CYCLIC
XL_A429_MSG_CYCLE_MAX = _XL_A429_MSG_CYCLE_MAX
XL_A429_MSG_GAP_DEFAULT = _XL_A429_MSG_GAP_DEFAULT
XL_A429_MSG_GAP_MAX = _XL_A429_MSG_GAP_MAX
XL_A429_MSG_PARITY_DEFAULT = _XL_A429_MSG_PARITY_DEFAULT
XL_A429_MSG_PARITY_DISABLED = _XL_A429_MSG_PARITY_DISABLED
XL_A429_MSG_PARITY_ODD = _XL_A429_MSG_PARITY_ODD
XL_A429_MSG_PARITY_EVEN = _XL_A429_MSG_PARITY_EVEN
XL_A429_EV_TX_MSG_CTRL_ON_REQUEST = _XL_A429_EV_TX_MSG_CTRL_ON_REQUEST
XL_A429_EV_TX_MSG_CTRL_CYCLIC = _XL_A429_EV_TX_MSG_CTRL_CYCLIC
XL_A429_EV_TX_ERROR_ACCESS_DENIED = _XL_A429_EV_TX_ERROR_ACCESS_DENIED
XL_A429_EV_TX_ERROR_TRANSMISSION_ERROR = _XL_A429_EV_TX_ERROR_TRANSMISSION_ERROR
XL_A429_EV_RX_ERROR_GAP_VIOLATION = _XL_A429_EV_RX_ERROR_GAP_VIOLATION
XL_A429_EV_RX_ERROR_PARITY = _XL_A429_EV_RX_ERROR_PARITY
XL_A429_EV_RX_ERROR_BITRATE_LOW = _XL_A429_EV_RX_ERROR_BITRATE_LOW
XL_A429_EV_RX_ERROR_BITRATE_HIGH = _XL_A429_EV_RX_ERROR_BITRATE_HIGH
XL_A429_EV_RX_ERROR_FRAME_FORMAT = _XL_A429_EV_RX_ERROR_FRAME_FORMAT
XL_A429_EV_RX_ERROR_CODING_RZ = _XL_A429_EV_RX_ERROR_CODING_RZ
XL_A429_EV_RX_ERROR_DUTY_FACTOR = _XL_A429_EV_RX_ERROR_DUTY_FACTOR
XL_A429_EV_RX_ERROR_AVG_BIT_LENGTH = _XL_A429_EV_RX_ERROR_AVG_BIT_LENGTH
XL_A429_QUEUE_OVERFLOW = _XL_A429_QUEUE_OVERFLOW
XL_A429_RX_FIFO_QUEUE_SIZE_MAX = _XL_A429_RX_FIFO_QUEUE_SIZE_MAX
XL_A429_RX_FIFO_QUEUE_SIZE_MIN = _XL_A429_RX_FIFO_QUEUE_SIZE_MIN

# driver status
XL_SUCCESS                       = _XL_SUCCESS
XL_PENDING                       = _XL_PENDING
XL_ERR_QUEUE_IS_EMPTY            = _XL_ERR_QUEUE_IS_EMPTY
XL_ERR_QUEUE_IS_FULL             = _XL_ERR_QUEUE_IS_FULL
XL_ERR_TX_NOT_POSSIBLE           = _XL_ERR_TX_NOT_POSSIBLE
XL_ERR_NO_LICENSE                = _XL_ERR_NO_LICENSE
XL_ERR_WRONG_PARAMETER           = _XL_ERR_WRONG_PARAMETER
XL_ERR_TWICE_REGISTER            = _XL_ERR_TWICE_REGISTER
XL_ERR_INVALID_CHAN_INDEX        = _XL_ERR_INVALID_CHAN_INDEX
XL_ERR_INVALID_ACCESS            = _XL_ERR_INVALID_ACCESS
XL_ERR_PORT_IS_OFFLINE           = _XL_ERR_PORT_IS_OFFLINE
XL_ERR_CHAN_IS_ONLINE            = _XL_ERR_CHAN_IS_ONLINE
XL_ERR_NOT_IMPLEMENTED           = _XL_ERR_NOT_IMPLEMENTED
XL_ERR_INVALID_PORT              = _XL_ERR_INVALID_PORT
XL_ERR_HW_NOT_READY              = _XL_ERR_HW_NOT_READY
XL_ERR_CMD_TIMEOUT               = _XL_ERR_CMD_TIMEOUT
XL_ERR_CMD_HANDLING              = _XL_ERR_CMD_HANDLING
XL_ERR_HW_NOT_PRESENT            = _XL_ERR_HW_NOT_PRESENT
XL_ERR_NOTIFY_ALREADY_ACTIVE     = _XL_ERR_NOTIFY_ALREADY_ACTIVE
XL_ERR_INVALID_TAG               = _XL_ERR_INVALID_TAG
XL_ERR_INVALID_RESERVED_FLD      = _XL_ERR_INVALID_RESERVED_FLD
XL_ERR_INVALID_SIZE              = _XL_ERR_INVALID_SIZE
XL_ERR_INSUFFICIENT_BUFFER       = _XL_ERR_INSUFFICIENT_BUFFER
XL_ERR_ERROR_CRC                 = _XL_ERR_ERROR_CRC
XL_ERR_BAD_EXE_FORMAT            = _XL_ERR_BAD_EXE_FORMAT
XL_ERR_NO_SYSTEM_RESOURCES       = _XL_ERR_NO_SYSTEM_RESOURCES
XL_ERR_NOT_FOUND                 = _XL_ERR_NOT_FOUND
XL_ERR_INVALID_ADDRESS           = _XL_ERR_INVALID_ADDRESS
XL_ERR_REQ_NOT_ACCEP             = _XL_ERR_REQ_NOT_ACCEP
XL_ERR_INVALID_LEVEL             = _XL_ERR_INVALID_LEVEL
XL_ERR_NO_DATA_DETECTED          = _XL_ERR_NO_DATA_DETECTED
XL_ERR_INTERNAL_ERROR            = _XL_ERR_INTERNAL_ERROR
XL_ERR_UNEXP_NET_ERR             = _XL_ERR_UNEXP_NET_ERR
XL_ERR_INVALID_USER_BUFFER       = _XL_ERR_INVALID_USER_BUFFER
XL_ERR_NO_RESOURCES              = _XL_ERR_NO_RESOURCES
XL_ERR_WRONG_CHIP_TYPE           = _XL_ERR_WRONG_CHIP_TYPE
XL_ERR_WRONG_COMMAND             = _XL_ERR_WRONG_COMMAND
XL_ERR_INVALID_HANDLE            = _XL_ERR_INVALID_HANDLE
XL_ERR_RESERVED_NOT_ZERO         = _XL_ERR_RESERVED_NOT_ZERO
XL_ERR_INIT_ACCESS_MISSING       = _XL_ERR_INIT_ACCESS_MISSING
XL_ERR_CANNOT_OPEN_DRIVER        = _XL_ERR_CANNOT_OPEN_DRIVER
XL_ERR_WRONG_BUS_TYPE            = _XL_ERR_WRONG_BUS_TYPE
XL_ERR_DLL_NOT_FOUND             = _XL_ERR_DLL_NOT_FOUND
XL_ERR_INVALID_CHANNEL_MASK      = _XL_ERR_INVALID_CHANNEL_MASK
XL_ERR_NOT_SUPPORTED             = _XL_ERR_NOT_SUPPORTED
XL_ERR_CONNECTION_BROKEN         = _XL_ERR_CONNECTION_BROKEN
XL_ERR_CONNECTION_CLOSED         = _XL_ERR_CONNECTION_CLOSED
XL_ERR_INVALID_STREAM_NAME       = _XL_ERR_INVALID_STREAM_NAME
XL_ERR_CONNECTION_FAILED         = _XL_ERR_CONNECTION_FAILED
XL_ERR_STREAM_NOT_FOUND          = _XL_ERR_STREAM_NOT_FOUND
XL_ERR_STREAM_NOT_CONNECTED      = _XL_ERR_STREAM_NOT_CONNECTED
XL_ERR_QUEUE_OVERRUN             = _XL_ERR_QUEUE_OVERRUN
XL_ERROR                         = _XL_ERROR
XL_ERR_INVALID_DLC               = _XL_ERR_INVALID_DLC
XL_ERR_INVALID_CANID             = _XL_ERR_INVALID_CANID
XL_ERR_INVALID_FDFLAG_MODE20     = _XL_ERR_INVALID_FDFLAG_MODE20
XL_ERR_EDL_RTR                   = _XL_ERR_EDL_RTR
XL_ERR_EDL_NOT_SET               = _XL_ERR_EDL_NOT_SET
XL_ERR_UNKNOWN_FLAG              = _XL_ERR_UNKNOWN_FLAG
XL_ERR_ETH_PHY_ACTIVATION_FAILED = _XL_ERR_ETH_PHY_ACTIVATION_FAILED
XL_ERR_ETH_PHY_CONFIG_ABORTED    = _XL_ERR_ETH_PHY_CONFIG_ABORTED
XL_ERR_ETH_RESET_FAILED          = _XL_ERR_ETH_RESET_FAILED
XL_ERR_ETH_SET_CONFIG_DELAYED    = _XL_ERR_ETH_SET_CONFIG_DELAYED
XL_ERR_ETH_UNSUPPORTED_FEATURE   = _XL_ERR_ETH_UNSUPPORTED_FEATURE
XL_ERR_ETH_MAC_ACTIVATION_FAILED = _XL_ERR_ETH_MAC_ACTIVATION_FAILED

XL_ACTIVATE_NONE        = _XL_ACTIVATE_NONE
XL_ACTIVATE_RESET_CLOCK = _XL_ACTIVATE_RESET_CLOCK

XL_CAN_EXT_MSG_ID            = _XL_CAN_EXT_MSG_ID
XL_CAN_MSG_FLAG_ERROR_FRAME  = _XL_CAN_MSG_FLAG_ERROR_FRAME
XL_CAN_MSG_FLAG_OVERRUN      = _XL_CAN_MSG_FLAG_OVERRUN
XL_CAN_MSG_FLAG_NERR         = _XL_CAN_MSG_FLAG_NERR
XL_CAN_MSG_FLAG_WAKEUP       = _XL_CAN_MSG_FLAG_WAKEUP
XL_CAN_MSG_FLAG_REMOTE_FRAME = _XL_CAN_MSG_FLAG_REMOTE_FRAME
XL_CAN_MSG_FLAG_RESERVED_1   = _XL_CAN_MSG_FLAG_RESERVED_1
XL_CAN_MSG_FLAG_TX_COMPLETED = _XL_CAN_MSG_FLAG_TX_COMPLETED
XL_CAN_MSG_FLAG_TX_REQUEST   = _XL_CAN_MSG_FLAG_TX_REQUEST
XL_CAN_MSG_FLAG_SRR_BIT_DOM  = _XL_CAN_MSG_FLAG_SRR_BIT_DOM
XL_EVENT_FLAG_OVERRUN        = _XL_EVENT_FLAG_OVERRUN
XL_LIN_MSGFLAG_TX            = _XL_LIN_MSGFLAG_TX
XL_LIN_MSGFLAG_CRCERROR      = _XL_LIN_MSGFLAG_CRCERROR

XL_SET_TIMESYNC_NO_CHANGE   = _XL_SET_TIMESYNC_NO_CHANGE
XL_SET_TIMESYNC_ON          = _XL_SET_TIMESYNC_ON
XL_SET_TIMESYNC_OFF         = _XL_SET_TIMESYNC_OFF

XL_CAN_TXMSG_FLAG_EDL       = _XL_CAN_TXMSG_FLAG_EDL
XL_CAN_TXMSG_FLAG_BRS       = _XL_CAN_TXMSG_FLAG_BRS
XL_CAN_TXMSG_FLAG_RTR       = _XL_CAN_TXMSG_FLAG_RTR
XL_CAN_TXMSG_FLAG_HIGHPRIO  = _XL_CAN_TXMSG_FLAG_HIGHPRIO
XL_CAN_TXMSG_FLAG_WAKEUP    = _XL_CAN_TXMSG_FLAG_WAKEUP

XL_CAN_EV_TAG_TX_MSG = _XL_CAN_EV_TAG_TX_MSG

XL_FR_MODE_NORMAL                           = _XL_FR_MODE_NORMAL
XL_FR_MODE_COLD_NORMAL                      = _XL_FR_MODE_COLD_NORMAL # only paid version

XL_FR_MODE_NONE                             = _XL_FR_MODE_NONE
XL_FR_MODE_WAKEUP                           = _XL_FR_MODE_WAKEUP
XL_FR_MODE_COLDSTART_LEADING                = _XL_FR_MODE_COLDSTART_LEADING
XL_FR_MODE_COLDSTART_FOLLOWING              = _XL_FR_MODE_COLDSTART_FOLLOWING
XL_FR_MODE_WAKEUP_AND_COLDSTART_LEADING     = _XL_FR_MODE_WAKEUP_AND_COLDSTART_LEADING
XL_FR_MODE_WAKEUP_AND_COLDSTART_FOLLOWING   = _XL_FR_MODE_WAKEUP_AND_COLDSTART_FOLLOWING

XL_FR_CHANNEL_CFG_STATUS_INIT_APP_PRESENT   = _XL_FR_CHANNEL_CFG_STATUS_INIT_APP_PRESENT
XL_FR_CHANNEL_CFG_STATUS_CHANNEL_ACTIVATED  = _XL_FR_CHANNEL_CFG_STATUS_CHANNEL_ACTIVATED
XL_FR_CHANNEL_CFG_STATUS_VALID_CFG_MODE     = _XL_FR_CHANNEL_CFG_STATUS_VALID_CFG_MODE

XL_FR_CHANNEL_CFG_MODE_SYNCHRONOUS          = _XL_FR_CHANNEL_CFG_MODE_SYNCHRONOUS
XL_FR_CHANNEL_CFG_MODE_COMBINED             = _XL_FR_CHANNEL_CFG_MODE_COMBINED
XL_FR_CHANNEL_CFG_MODE_ASYNCHRONOUS         = _XL_FR_CHANNEL_CFG_MODE_ASYNCHRONOUS

XL_FR_FILTER_PASS                           = _XL_FR_FILTER_PASS                           
XL_FR_FILTER_BLOCK                          = _XL_FR_FILTER_BLOCK                          

XL_FR_FILTER_TYPE_DATA                      = _XL_FR_FILTER_TYPE_DATA                      
XL_FR_FILTER_TYPE_NF                        = _XL_FR_FILTER_TYPE_NF                        
XL_FR_FILTER_TYPE_FILLUP_NF                 = _XL_FR_FILTER_TYPE_FILLUP_NF                 

XL_FR_FILTER_CHANNEL_A                      = _XL_FR_FILTER_CHANNEL_A                      
XL_FR_FILTER_CHANNEL_B                      = _XL_FR_FILTER_CHANNEL_B                      

XL_FR_START_CYCLE                           = _XL_FR_START_CYCLE                           
XL_FR_RX_FRAME                              = _XL_FR_RX_FRAME                              
XL_FR_TX_FRAME                              = _XL_FR_TX_FRAME                              
#XL_FR_TXACK_FRAME                           = _XL_FR_TXACK_FRAME                           
#XL_FR_INVALID_FRAME                         = _XL_FR_INVALID_FRAME                         
XL_FR_WAKEUP                                = _XL_FR_WAKEUP                                
XL_FR_SYMBOL_WINDOW                         = _XL_FR_SYMBOL_WINDOW                         
XL_FR_ERROR                                 = _XL_FR_ERROR                                 
XL_FR_STATUS                                = _XL_FR_STATUS                                
XL_FR_NM_VECTOR                             = _XL_FR_NM_VECTOR                             
XL_FR_TRANCEIVER_STATUS                     = _XL_FR_TRANCEIVER_STATUS                     
XL_FR_SPY_FRAME                             = _XL_FR_SPY_FRAME                             
XL_FR_SPY_SYMBOL                            = _XL_FR_SPY_SYMBOL                            

XL_FR_CHANNEL_A                             = _XL_FR_CHANNEL_A                             
XL_FR_CHANNEL_B                             = _XL_FR_CHANNEL_B                             
XL_FR_CHANNEL_AB                            = _XL_FR_CHANNEL_AB                            
XL_FR_SPY_CHANNEL_A                         = _XL_FR_SPY_CHANNEL_A                         
XL_FR_SPY_CHANNEL_B                         = _XL_FR_SPY_CHANNEL_B                         
XL_FR_CC_COLD_A                             = _XL_FR_CC_COLD_A                             
XL_FR_CC_COLD_B                             = _XL_FR_CC_COLD_B                             
XL_FR_QUEUE_OVERFLOW                        = _XL_FR_QUEUE_OVERFLOW                        

XL_FR_FRAMEFLAG_STARTUP                     = _XL_FR_FRAMEFLAG_STARTUP                     
XL_FR_FRAMEFLAG_SYNC                        = _XL_FR_FRAMEFLAG_SYNC                        
XL_FR_FRAMEFLAG_NULLFRAME                   = _XL_FR_FRAMEFLAG_NULLFRAME                   
XL_FR_FRAMEFLAG_PAYLOAD_PREAMBLE            = _XL_FR_FRAMEFLAG_PAYLOAD_PREAMBLE            
XL_FR_FRAMEFLAG_FR_RESERVED                 = _XL_FR_FRAMEFLAG_FR_RESERVED                 
XL_FR_FRAMEFLAG_REQ_TXACK                   = _XL_FR_FRAMEFLAG_REQ_TXACK                   
XL_FR_FRAMEFLAG_TXACK_SS                    = _XL_FR_FRAMEFLAG_TXACK_SS                    
XL_FR_FRAMEFLAG_RX_UNEXPECTED               = _XL_FR_FRAMEFLAG_RX_UNEXPECTED               
XL_FR_FRAMEFLAG_NEW_DATA_TX                 = _XL_FR_FRAMEFLAG_NEW_DATA_TX                 
XL_FR_FRAMEFLAG_DATA_UPDATE_LOST            = _XL_FR_FRAMEFLAG_DATA_UPDATE_LOST            
XL_FR_FRAMEFLAG_SYNTAX_ERROR                = _XL_FR_FRAMEFLAG_SYNTAX_ERROR                
XL_FR_FRAMEFLAG_CONTENT_ERROR               = _XL_FR_FRAMEFLAG_CONTENT_ERROR               
XL_FR_FRAMEFLAG_SLOT_BOUNDARY_VIOLATION     = _XL_FR_FRAMEFLAG_SLOT_BOUNDARY_VIOLATION     
XL_FR_FRAMEFLAG_TX_CONFLICT                 = _XL_FR_FRAMEFLAG_TX_CONFLICT                 
XL_FR_FRAMEFLAG_EMPTY_SLOT                  = _XL_FR_FRAMEFLAG_EMPTY_SLOT                  
XL_FR_FRAMEFLAG_FRAME_TRANSMITTED           = _XL_FR_FRAMEFLAG_FRAME_TRANSMITTED           

XL_FR_SPY_FRAMEFLAG_FRAMING_ERROR           = _XL_FR_SPY_FRAMEFLAG_FRAMING_ERROR           
XL_FR_SPY_FRAMEFLAG_HEADER_CRC_ERROR        = _XL_FR_SPY_FRAMEFLAG_HEADER_CRC_ERROR        
XL_FR_SPY_FRAMEFLAG_FRAME_CRC_ERROR         = _XL_FR_SPY_FRAMEFLAG_FRAME_CRC_ERROR         
XL_FR_SPY_FRAMEFLAG_BUS_ERROR               = _XL_FR_SPY_FRAMEFLAG_BUS_ERROR               

XL_FR_TX_MODE_CYCLIC                        = _XL_FR_TX_MODE_CYCLIC                        
XL_FR_TX_MODE_SINGLE_SHOT                   = _XL_FR_TX_MODE_SINGLE_SHOT                   
XL_FR_TX_MODE_NONE                          = _XL_FR_TX_MODE_NONE                          

XL_FR_PAYLOAD_INCREMENT_8BIT                = _XL_FR_PAYLOAD_INCREMENT_8BIT                
XL_FR_PAYLOAD_INCREMENT_16BIT               = _XL_FR_PAYLOAD_INCREMENT_16BIT               
XL_FR_PAYLOAD_INCREMENT_32BIT               = _XL_FR_PAYLOAD_INCREMENT_32BIT               
XL_FR_PAYLOAD_INCREMENT_NONE                = _XL_FR_PAYLOAD_INCREMENT_NONE                

XL_FR_WAKEUP_UNDEFINED                      = _XL_FR_WAKEUP_UNDEFINED                      
XL_FR_WAKEUP_RECEIVED_HEADER                = _XL_FR_WAKEUP_RECEIVED_HEADER                
XL_FR_WAKEUP_RECEIVED_WUP                   = _XL_FR_WAKEUP_RECEIVED_WUP                   
XL_FR_WAKEUP_COLLISION_HEADER               = _XL_FR_WAKEUP_COLLISION_HEADER               
XL_FR_WAKEUP_COLLISION_WUP                  = _XL_FR_WAKEUP_COLLISION_WUP                  
XL_FR_WAKEUP_COLLISION_UNKNOWN              = _XL_FR_WAKEUP_COLLISION_UNKNOWN              
XL_FR_WAKEUP_TRANSMITTED                    = _XL_FR_WAKEUP_TRANSMITTED                    
XL_FR_WAKEUP_RESERVED                       = _XL_FR_WAKEUP_RESERVED                       

XL_FR_SYMBOL_MTS                            = _XL_FR_SYMBOL_MTS                            
XL_FR_SYMBOL_CAS                            = _XL_FR_SYMBOL_CAS                            

XL_FR_SYMBOL_STATUS_SESA                    = _XL_FR_SYMBOL_STATUS_SESA                    
XL_FR_SYMBOL_STATUS_SBSA                    = _XL_FR_SYMBOL_STATUS_SBSA                    
XL_FR_SYMBOL_STATUS_TCSA                    = _XL_FR_SYMBOL_STATUS_TCSA                    
XL_FR_SYMBOL_STATUS_SESB                    = _XL_FR_SYMBOL_STATUS_SESB                    
XL_FR_SYMBOL_STATUS_SBSB                    = _XL_FR_SYMBOL_STATUS_SBSB                    
XL_FR_SYMBOL_STATUS_TCSB                    = _XL_FR_SYMBOL_STATUS_TCSB                    
XL_FR_SYMBOL_STATUS_MTSA                    = _XL_FR_SYMBOL_STATUS_MTSA                    
XL_FR_SYMBOL_STATUS_MTSB                    = _XL_FR_SYMBOL_STATUS_MTSB                    

XL_FR_ERROR_POC_MODE                        = _XL_FR_ERROR_POC_MODE                        
XL_FR_ERROR_SYNC_FRAMES_BELOWMIN            = _XL_FR_ERROR_SYNC_FRAMES_BELOWMIN            
XL_FR_ERROR_SYNC_FRAMES_OVERLOAD            = _XL_FR_ERROR_SYNC_FRAMES_OVERLOAD            
XL_FR_ERROR_CLOCK_CORR_FAILURE              = _XL_FR_ERROR_CLOCK_CORR_FAILURE              
XL_FR_ERROR_NIT_FAILURE                     = _XL_FR_ERROR_NIT_FAILURE                     
XL_FR_ERROR_CC_ERROR                        = _XL_FR_ERROR_CC_ERROR                        

XL_FR_ERROR_POC_ACTIVE                      = _XL_FR_ERROR_POC_ACTIVE                      
XL_FR_ERROR_POC_PASSIVE                     = _XL_FR_ERROR_POC_PASSIVE                     
XL_FR_ERROR_POC_COMM_HALT                   = _XL_FR_ERROR_POC_COMM_HALT                   

XL_FR_ERROR_MISSING_OFFSET_CORRECTION       = _XL_FR_ERROR_MISSING_OFFSET_CORRECTION       
XL_FR_ERROR_MAX_OFFSET_CORRECTION_REACHED   = _XL_FR_ERROR_MAX_OFFSET_CORRECTION_REACHED   
XL_FR_ERROR_MISSING_RATE_CORRECTION         = _XL_FR_ERROR_MISSING_RATE_CORRECTION         
XL_FR_ERROR_MAX_RATE_CORRECTION_REACHED     = _XL_FR_ERROR_MAX_RATE_CORRECTION_REACHED     

XL_FR_ERROR_NIT_SENA                        = _XL_FR_ERROR_NIT_SENA                        
XL_FR_ERROR_NIT_SBNA                        = _XL_FR_ERROR_NIT_SBNA                        
XL_FR_ERROR_NIT_SENB                        = _XL_FR_ERROR_NIT_SENB                        
XL_FR_ERROR_NIT_SBNB                        = _XL_FR_ERROR_NIT_SBNB                        

XL_FR_ERROR_CC_PERR                         = _XL_FR_ERROR_CC_PERR                         
XL_FR_ERROR_CC_IIBA                         = _XL_FR_ERROR_CC_IIBA                         
XL_FR_ERROR_CC_IOBA                         = _XL_FR_ERROR_CC_IOBA                         
XL_FR_ERROR_CC_MHF                          = _XL_FR_ERROR_CC_MHF                          
XL_FR_ERROR_CC_EDA                          = _XL_FR_ERROR_CC_EDA                          
XL_FR_ERROR_CC_LTVA                         = _XL_FR_ERROR_CC_LTVA                         
XL_FR_ERROR_CC_TABA                         = _XL_FR_ERROR_CC_TABA                         
XL_FR_ERROR_CC_EDB                          = _XL_FR_ERROR_CC_EDB                          
XL_FR_ERROR_CC_LTVB                         = _XL_FR_ERROR_CC_LTVB                         
XL_FR_ERROR_CC_TABB                         = _XL_FR_ERROR_CC_TABB                         

XL_FR_STATUS_DEFAULT_CONFIG                 = _XL_FR_STATUS_DEFAULT_CONFIG                 
XL_FR_STATUS_READY                          = _XL_FR_STATUS_READY                          
XL_FR_STATUS_NORMAL_ACTIVE                  = _XL_FR_STATUS_NORMAL_ACTIVE                  
XL_FR_STATUS_NORMAL_PASSIVE                 = _XL_FR_STATUS_NORMAL_PASSIVE                 
XL_FR_STATUS_HALT                           = _XL_FR_STATUS_HALT                           
XL_FR_STATUS_MONITOR_MODE                   = _XL_FR_STATUS_MONITOR_MODE                   
XL_FR_STATUS_CONFIG                         = _XL_FR_STATUS_CONFIG                         
XL_FR_STATUS_WAKEUP_STANDBY                 = _XL_FR_STATUS_WAKEUP_STANDBY                 
XL_FR_STATUS_WAKEUP_LISTEN                  = _XL_FR_STATUS_WAKEUP_LISTEN                  
XL_FR_STATUS_WAKEUP_SEND                    = _XL_FR_STATUS_WAKEUP_SEND                    
XL_FR_STATUS_WAKEUP_DETECT                  = _XL_FR_STATUS_WAKEUP_DETECT                  
XL_FR_STATUS_STARTUP_PREPARE                = _XL_FR_STATUS_STARTUP_PREPARE                
XL_FR_STATUS_COLDSTART_LISTEN               = _XL_FR_STATUS_COLDSTART_LISTEN               
XL_FR_STATUS_COLDSTART_COLLISION_RESOLUTION = _XL_FR_STATUS_COLDSTART_COLLISION_RESOLUTION 
XL_FR_STATUS_COLDSTART_CONSISTENCY_CHECK    = _XL_FR_STATUS_COLDSTART_CONSISTENCY_CHECK    
XL_FR_STATUS_COLDSTART_GAP                  = _XL_FR_STATUS_COLDSTART_GAP                  
XL_FR_STATUS_COLDSTART_JOIN                 = _XL_FR_STATUS_COLDSTART_JOIN                 
XL_FR_STATUS_INTEGRATION_COLDSTART_CHECK    = _XL_FR_STATUS_INTEGRATION_COLDSTART_CHECK    
XL_FR_STATUS_INTEGRATION_LISTEN             = _XL_FR_STATUS_INTEGRATION_LISTEN             
XL_FR_STATUS_INTEGRATION_CONSISTENCY_CHECK  = _XL_FR_STATUS_INTEGRATION_CONSISTENCY_CHECK  
XL_FR_STATUS_INITIALIZE_SCHEDULE            = _XL_FR_STATUS_INITIALIZE_SCHEDULE            
XL_FR_STATUS_ABORT_STARTUP                  = _XL_FR_STATUS_ABORT_STARTUP                  
XL_FR_STATUS_STARTUP_SUCCESS                = _XL_FR_STATUS_STARTUP_SUCCESS                

XL_NOTIFY_REASON_CHANNEL_ACTIVATION         = _XL_NOTIFY_REASON_CHANNEL_ACTIVATION         
XL_NOTIFY_REASON_CHANNEL_DEACTIVATION       = _XL_NOTIFY_REASON_CHANNEL_DEACTIVATION       
XL_NOTIFY_REASON_PORT_CLOSED                = _XL_NOTIFY_REASON_PORT_CLOSED                

XL_FR_TRANSCEIVER_MODE_SLEEP                = _XL_FR_TRANSCEIVER_MODE_SLEEP
XL_FR_TRANSCEIVER_MODE_NORMAL               = _XL_FR_TRANSCEIVER_MODE_NORMAL
XL_FR_TRANSCEIVER_MODE_RECEIVE_ONLY         = _XL_FR_TRANSCEIVER_MODE_RECEIVE_ONLY
XL_FR_TRANSCEIVER_MODE_STANDBY              = _XL_FR_TRANSCEIVER_MODE_STANDBY