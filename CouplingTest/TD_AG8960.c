#include <windows.h>
#include <utility.h>
#include <visa.h>
#include <ansi_c.h>
#include <formatio.h>
#include "TD_AG8960.h"
#include "CommonFunc.h"

#define AG8960_CHECK_STATUS(status) if(VI_SUCCESS!=(status)){return -1;}
#define VISA_BUF_LEN 32767

int AG8960_Initialization (ViRsrc resourceName)
{
    ViSession  defRM = 0;
    ViStatus   errStatus = 0;
    char cmd_buf[64];
    char read_buf[VISA_BUF_LEN];
    int num = 0;

    if ((errStatus = viOpenDefaultRM (&defRM)) < VI_SUCCESS)
        return errStatus;

    if ((errStatus = viOpen(defRM, resourceName, VI_NULL, VI_NULL, &AG8960_Handle)) < VI_SUCCESS)
    {
        viClose(defRM);
        AG8960_Handle = VI_NULL;
        return errStatus;
    }

    // Set 8960 application format to TD-SCDMA.
    strcpy ( cmd_buf, "SYST:APPL:FORM?" );
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_buf, strlen(cmd_buf), &num) );
    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buf, VISA_BUF_LEN, &num) );
    if ( FindPattern ( read_buf, 0, -1, "TD-SCDMA", 0, 0 ) < 0 )
    {
        strcpy ( cmd_buf, "SYST:APPL:FORM 'TD-SCDMA'" );
        AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_buf, strlen(cmd_buf), &num) );
    }

    return 0;
}


ViStatus AG8960_SendGpibCmd(char* pGpibCmd)
{
    unsigned long rtnCnt = 0;
    ViStatus errStatus;

    errStatus = viWrite (AG8960_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt);
    return errStatus;
}


ViStatus AG8960_Close ( void )
{
    ViStatus errStatus = 0;
    ViSession defRM;

    if ((errStatus = viGetAttribute(AG8960_Handle, VI_ATTR_RM_SESSION, &defRM)) < VI_SUCCESS)
    {
        return errStatus;
    }

    return viClose(defRM);
}


int AG8960_Reset ( void )
{
    unsigned long rtnCnt = 0;
    char cmd_str[16];

    strcpy ( cmd_str, "*RST" );
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


/**************************************************************

***************************************************************/
int AG8960_Get_Current_Status (E_8960_TD_STATUS *status)
{
    char cmd_str[64];
    char read_buf[64];
    unsigned long rtnCnt = 0;

    sprintf (cmd_str, "CALL:STATus?");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buf, 64, &rtnCnt) );
    read_buf[rtnCnt-1] = '\0';

    if (FindPattern ( read_buf, 0, -1, "IDLE", 0, 0 ) >= 0)
    {
        *status = TD_8960_STATUS_IDLE;
    }
    else if (FindPattern ( read_buf, 0, -1, "PAG", 0, 0 ) >= 0)
    {
        *status = TD_8960_STATUS_PAG;
    }
    else if (FindPattern ( read_buf, 0, -1, "APR", 0, 0 ) >= 0)
    {
        *status = TD_8960_STATUS_APR;
    }
    else if (FindPattern ( read_buf, 0, -1, "SREQ", 0, 0 ) >= 0)
    {
        *status = TD_8960_STATUS_SREQ;
    }
    else if (FindPattern ( read_buf, 0, -1, "REG", 0, 0 ) >= 0)
    {
        *status = TD_8960_STATUS_REG;
    }
    else if (FindPattern ( read_buf, 0, -1, "CONN", 0, 0 ) >= 0)
    {
        *status = TD_8960_STATUS_CONN;
    }
    else if (FindPattern ( read_buf, 0, -1, "HAND", 0, 0 ) >= 0)
    {
        *status = TD_8960_STATUS_HAND;
    }
    else if (FindPattern ( read_buf, 0, -1, "REL", 0, 0 ) >= 0)
    {
        *status = TD_8960_STATUS_REL;
    }
    else
    {
        return -1;
    }

    return 0;
}


/**************************************************************
  mode : TD-SCDMA
***************************************************************/
int AG8960_Call_Service_Mode (char *mode)
{
    char cmd_str[64];
    unsigned long rtnCnt = 0;

    sprintf (cmd_str, "SYST:APPL:FORM '%s'", mode);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


/**************************************************************
  mode : CALL | CW | TDT | OFF
***************************************************************/
int AG8960_Call_Operating_Mode (char *mode)
{
    char cmd_str[64];
    unsigned long rtnCnt = 0;

    sprintf ( cmd_str, "CALL:CELL:OPERating:MODE %s", mode );
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );

    /**
    sprintf (cmd_str, "*OPC?");
    viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt);
    Delay (0.3);
    **/

    return 0;
}


/**************************************************************
 type : SRMC12|MRMC12
***************************************************************/
int AG8960_Channel_Type ( char *type )
{
    char serviceType[64];
    unsigned long rtnCnt = 0;

    sprintf (serviceType, "CALL:DPCHannel:TYPE %s", type);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, serviceType, strlen(serviceType), &rtnCnt) );
    return 0;
}


int AG8960_Call_Originate ( void )
{
    char cmd_str[64];
    unsigned long rtnCnt = 0;

    strcpy ( cmd_str, "CALL:ORIGinate" );
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

int AG8960_Call_Originate_Complete ( int *status )
{
    char cmd_str[64];
    char read_str[VISA_BUF_LEN];
    unsigned long rtnCnt = 0;
    int num = 0;

    strcpy ( cmd_str, "CALL:ORIGinate:OPComplete?" );
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_str, VISA_BUF_LEN, &num) );
    if ( FindPattern ( read_str, 0, -1, "1", 0, 0 ) >= 0 )
    {
        *status = 1;
    }
    else
    {
        *status = 0;
    }

    return 0;
}


int AG8960_Call_Release ( void )
{
    char cmd_str[64];
    unsigned long rtnCnt = 0;

    strcpy ( cmd_str, "CALL:END" );
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


int AG8960_Set_Cell_Power (double cell_power_dBm)
{
    char cmd_str[124];
    int result = 0;
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "CALL:CELL:POWER:SAMPLITUDE:TDSCDMA %f", cell_power_dBm);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


// mode : OFF | ON
// OFF : Manual
// ON : Auto
int AG8960_Receiver_Power_Control (char *mode)
{
    char cmd_str[124];
    int result = 0;
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "RFANalyzer:CONTrol:POWer:AUTO %s", mode);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


int AG8960_Receiver_Manual_Power (double manual_power_dBm)
{
    char cmd_str[124];
    int result = 0;
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "RFANALYZER:MANUAL:POWER:SELECTED %f DBM", manual_power_dBm);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


int AG8960_Call_Target_Power (double target_power_dBm)
{
    char cmd_str[124];
    int result = 0;
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "CALL:MS:POWER:TARGET:AMPLITUDE %f", target_power_dBm);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


// mode : ACT | ALT | UP | DOWN
int AG8960_Call_UL_Power_Control_Mode (char *mode)
{
    char cmd_str[124];
    int result = 0;
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "CALL:CELL:CLPControl:UPLink:MODE %s", mode);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


int AG8960_Set_Test_Channel (int channel)
{
    char cmd_str[64];
    int result = 0;
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "CALL:CHANnel %d", channel);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

int AG8960_Set_Cable_Loss ( int start_channel, int end_channel, double power_dB )
{
    char cmd_str[50];
    int result = 0;
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SYSTem:CORRection:FREQuency %.1f MHZ, %.1f MHZ", start_channel/5.0, end_channel/5.0);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );

    sprintf (cmd_str, "SYSTem:CORRection:GAIN %.2f, %.2f", power_dB, power_dB);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


/******************************************
item :
TCP (Channel Power Measurement)
TWQ (Waveform Quality Measurement)
TACL (Adjacent Channel Leakage Ratio
TSEMask (Spectrum Emission Mask Measurement )
FSTability (Frequency Stability Measurement)
TCLPower (Closed Loop Power Control Measurement)
TOBWidth (Occupied Bandwidth Measurements)
TDPower (Dynamic Power Measurement)
TOOPower (Transmit ON/OFF Power Measurement)
TBERror (Loopback Bit Error Rate Measurement)
******************************************/
int AG8960_Init_Measurement ( char *item )
{
    char cmd_str[64];
    char read_buff[1024];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "INITiate:%s", item);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );

    return 0;
}


// 0 : OK
// -1 : not finish
int AG8960_Get_Measurement_State ( char *item )
{
    char cmd_str[64];
    char read_buff[1024];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "INITIATE:DONE?");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );

    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buff, 1024, &rtnCnt) );
    read_buff[rtnCnt-1] = '\0';

    // check measurement finished ?
    if (FindPattern ( read_buff, 0, -1, item, 0, 0 ) >= 0)
    {
        return 0;
    }
    else
    {
        return -1;
    }
}


int AG8960_Abort_Measurement ( char *item )
{
    char cmd_str[64];
    char read_buff[1024];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "INITiate:%s:OFF", item);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );

    return 0;
}


//Wave Quality

// mode : OFF / ON
int AG8960_WQulity_Set_Continuous_Mode ( char *mode )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETup:TWQuality:CONTinuous %s", mode);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


//count : 1 ~ 999
int AG8960_WQulity_Set_Count_Number ( int count )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETup:TWQuality:COUNt:SNUMber %d", count);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


//timeout_sec : 0.1 ~ 999.9 second
//Resolution: 0.1 second
//Unit: S | MS | US | NS
int AG8960_WQulity_Set_Timeout ( double timeout, char *unit )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETUP:TWQuality:TIMEOUT:STIME %.1f %s", timeout, unit);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


//delay_ms : -10 ~ 10 ms
//unit : S | MS | US | NS
int AG8960_WQulity_Set_Trigger_Delay ( double delay, char *unit )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETUP:TWQuality:TRIGGER:DELAY %.1f%s", delay, unit);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


//trigger
int AG8960_WQulity_Set_Trigger_Source ( E_8960_TD_TRIGGER_SOURCE trigger)
{
    char cmd_str[128];
    unsigned int rtnCnt = 0;

    switch (trigger)
    {
    case TD_TRIGGER_AUTO:
        sprintf (cmd_str, "SETup:TWQuality:TRIGger:SOURce AUTO");
        break;
    case TD_TRIGGER_IMMEDIATE:
        sprintf (cmd_str, "SETup:TWQuality:TRIGger:SOURce IMMediate");
        break;
    case TD_TRIGGER_RF_RISE:
        sprintf (cmd_str, "SETup:TWQuality:TRIGger:SOURce RISE");
        break;
    case TD_TRIGGER_EXTERNAL:
        sprintf (cmd_str, "SETup:TWQuality:TRIGger:SOURce EXTernal");
        break;
    case TD_TRIGGER_PROTOCOL:
        sprintf (cmd_str, "SETup:TWQuality:TRIGger:SOURce PROTocol");
        break;
    default:
        return -1;
    }

    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


int AG8960_WQulity_Get_FE_AVG ( double *FE_Hz )
{
    char cmd_str[64];
    char read_buff[1024];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "FETCh:TWQuality:FERRor:AVERage?");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buff, 1024, &rtnCnt) );
    read_buff[rtnCnt-1] = '\0';
    *FE_Hz = atof(read_buff);
    return 0;
}

int AG8960_WQulity_Get_EVM_AVG ( double *d_EVM )
{
    char cmd_str[64];
    char read_buff[1024];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "FETCh:TWQuality:EVM:AVERage?");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buff, 1024, &rtnCnt) );
    read_buff[rtnCnt-1] = '\0';
    *d_EVM = atof(read_buff);
    return 0;
}

int AG8960_WQulity_Get_EVM_Peak ( double *d_EVM )
{
    char cmd_str[64];
    char read_buff[1024];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "FETCh:TWQuality:EVM:PEAK:AVERage?");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buff, 1024, &rtnCnt) );
    read_buff[rtnCnt-1] = '\0';
    *d_EVM = atof(read_buff);
    return 0;
}



// Channel Power


// mode : OFF / ON
int AG8960_TCP_Set_Continuous_Mode ( char *mode )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETUP:TCPOWER:CONTINUOUS %s", mode);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

//count : 1 ~ 999
int AG8960_TCP_Set_Count_Number ( int count )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETUP:TCPOWER:COUNT:SNUMBER %d", count);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


//timeout_sec : 0.1 ~ 999.9 second
//Resolution: 0.1 second
//Unit: S | MS | US | NS
int AG8960_TCP_Set_Timeout ( double timeout, char *unit )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETUP:TCPOWER:TIMEOUT:STIME %.1f %s", timeout, unit);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}



//delay_ms : -10 ~ 10 ms
//unit : S | MS | US | NS
int AG8960_TCP_Set_Trigger_Delay ( double delay, char *unit )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETUP:TCPOWER:TRIGGER:DELAY %.1f%s", delay, unit);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


//trigger
int AG8960_TCP_Set_Trigger_Source ( E_8960_TD_TRIGGER_SOURCE trigger)
{
    char cmd_str[128];
    unsigned int rtnCnt = 0;

    switch (trigger)
    {
    case TD_TRIGGER_AUTO:
        sprintf (cmd_str, "SETup:TCPOWER:TRIGger:SOURce AUTO");
        break;
    case TD_TRIGGER_IMMEDIATE:
        sprintf (cmd_str, "SETup:TCPOWER:TRIGger:SOURce IMMediate");
        break;
    case TD_TRIGGER_RF_RISE:
        sprintf (cmd_str, "SETup:TCPOWER:TRIGger:SOURce RISE");
        break;
    case TD_TRIGGER_EXTERNAL:
        sprintf (cmd_str, "SETup:TCPOWER:TRIGger:SOURce EXTernal");
        break;
    case TD_TRIGGER_PROTOCOL:
        sprintf (cmd_str, "SETup:TCPOWER:TRIGger:SOURce PROTocol");
        break;
    default:
        return -1;
    }

    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


int AG8960_TCP_Get_Power_AVG ( double *power_dBm )
{
    char cmd_str[64];
    char read_buff[1024];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "FETCH:TCPOWER:POWER:AVERAGE?");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );

    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buff, 1024, &rtnCnt) );
    read_buff[rtnCnt-1] = '\0';
    *power_dBm = atof(read_buff);
    return 0;
}

int AG8960_TCP_Get_Power_Max ( double *power_dBm )
{
    char cmd_str[64];
    char read_buff[1024];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "FETCh:TCPower:POWer:MAXimum?");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );

    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buff, 1024, &rtnCnt) );
    read_buff[rtnCnt-1] = '\0';
    *power_dBm = atof(read_buff);
    return 0;
}

int AG8960_TCP_Get_Power_Min ( double *power_dBm )
{
    char cmd_str[64];
    char read_buff[1024];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "FETCh:TCPower:POWer:MINimum?");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );

    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buff, 1024, &rtnCnt) );
    read_buff[rtnCnt-1] = '\0';
    *power_dBm = atof(read_buff);
    return 0;
}


// ACLR


// mode : OFF / ON
int AG8960_ACLR_Set_Continuous_Mode ( char *mode )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETup:TACLeakage:CONTinuous %s", mode);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

//timeout_sec : 0.1 ~ 999.9 second
//Resolution: 0.1 second
//Unit: S | MS | US | NS
int AG8960_ACLR_Set_Timeout ( double timeout, char *unit )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETup:TACLeakage:TIMeout:STIMe %.1f %s", timeout, unit);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

//count : 1 ~ 999
int AG8960_ACLR_Set_Count_Number ( int count )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETup:TACLeakage:COUNt:SNUMber %d", count);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


//trigger
int AG8960_ACLR_Set_Trigger_Source ( E_8960_TD_TRIGGER_SOURCE trigger)
{
    char cmd_str[128];
    unsigned int rtnCnt = 0;

    switch (trigger)
    {
    case TD_TRIGGER_AUTO:
        sprintf (cmd_str, "SETup:TACLeakage:TRIGger:SOURce AUTO");
        break;
    case TD_TRIGGER_IMMEDIATE:
        sprintf (cmd_str, "SETup:TACLeakage:TRIGger:SOURce IMMediate");
        break;
    case TD_TRIGGER_RF_RISE:
        sprintf (cmd_str, "SETup:TACLeakage:TRIGger:SOURce RISE");
        break;
    case TD_TRIGGER_EXTERNAL:
        sprintf (cmd_str, "SETup:TACLeakage:TRIGger:SOURce EXTernal");
        break;
    case TD_TRIGGER_PROTOCOL:
        sprintf (cmd_str, "SETup:TACLeakage:TRIGger:SOURce PROTocol");
        break;
    default:
        return -1;
    }

    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


int AG8960_ACLR_Get_Result ( double *value, int *passFlag)
{
    char cmd_str[50];
    char read_buff[1024];
    double d_array[32];
    int rtnCnt = 0;

    *passFlag = 1;

    // Low 3.2MHz
    strcpy (cmd_str, "FETCh:TACLeakage:LOWer:ALTernate?");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buff, 1024, &rtnCnt) );
    read_buff[rtnCnt-1] = '\0';
    String_To_Array_double (read_buff, d_array, 4);
    value[0] = d_array[2];
    if (1 == d_array[1])
    {
        *passFlag = 0;
    }

    // Low 1.6MHz
    strcpy (cmd_str, "FETCh:TACLeakage:LOWer:ADJacent?");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buff, 1024, &rtnCnt) );
    read_buff[rtnCnt-1] = '\0';
    String_To_Array_double (read_buff, d_array, 4);
    value[1] = d_array[2];
    if (1 == d_array[1])
    {
        *passFlag = 0;
    }

    value[2] = 0;

    // Up 1.6MHz
    strcpy (cmd_str, "FETCh:TACLeakage:UPPer:ADJacent?;*OPC");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buff, 1024, &rtnCnt) );
    read_buff[rtnCnt-1] = '\0';
    String_To_Array_double (read_buff, d_array, 4);
    value[3] = d_array[2];
    if (1 == d_array[1])
    {
        *passFlag = 0;
    }

    // Up 3.2MHz
    strcpy (cmd_str, "FETCh:TACLeakage:UPPer:ALTernate?;*OPC");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buff, 1024, &rtnCnt) );
    read_buff[rtnCnt-1] = '\0';
    String_To_Array_double (read_buff, d_array, 4);
    value[4] = d_array[2];
    if (1 == d_array[1])
    {
        *passFlag = 0;
    }

    return 0;
}


// OBW


// mode : OFF / ON
int AG8960_OBW_Set_Continuous_Mode ( char *mode )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETup:TOBWidth:CONTinuous %s", mode);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

//count : 1 ~ 999
int AG8960_OBW_Set_Count_Number ( int count )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETUP:TOBWidth:COUNT:SNUMBER %d", count);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

//timeout_sec : 0.1 ~ 999.9 second
//Resolution: 0.1 second
//Unit: S | MS | US | NS
int AG8960_OBW_Set_Timeout ( double timeout, char *unit )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETup:TOBWidth:TIMeout:STIMe %.1f %s", timeout, unit);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


//trigger
int AG8960_OBW_Set_Trigger_Source ( E_8960_TD_TRIGGER_SOURCE trigger)
{
    char cmd_str[128];
    unsigned int rtnCnt = 0;

    switch (trigger)
    {
    case TD_TRIGGER_AUTO:
        sprintf (cmd_str, "SETUP:TOBWidth:TRIGGER:SOURCE AUTO");
        break;
    case TD_TRIGGER_IMMEDIATE:
        sprintf (cmd_str, "SETUP:TOBWidth:TRIGGER:SOURCE IMMediate");
        break;
    case TD_TRIGGER_RF_RISE:
        sprintf (cmd_str, "SETUP:TOBWidth:TRIGGER:SOURCE RISE");
        break;
    case TD_TRIGGER_EXTERNAL:
        sprintf (cmd_str, "SETUP:TOBWidth:TRIGGER:SOURCE EXTernal");
        break;
    case TD_TRIGGER_PROTOCOL:
        sprintf (cmd_str, "SETUP:TOBWidth:TRIGGER:SOURCE PROTocol");
        break;
    default:
        return -1;
    }

    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


int AG8960_OBW_Set_Percent (int per)
{
    char cmd_str[50];
    int rtnCnt = 0;

    sprintf (cmd_str, "SETup:TOBWidth:PERCent %d", per);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


// value : OBW Value
// testFlag : 1 - Pass
//               0 - Fail
int AG8960_OBW_Get_Value (double *value, int *testFlag)
{
    char cmd[50];
    char read_buff[1024];
    double d_array[32];
    int rtnCnt = 0;

    strcpy (cmd, "FETCh:TOBWidth?");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd, strlen(cmd), &rtnCnt) );

    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buff, 1024, &rtnCnt) );
    read_buff[rtnCnt-1] = '\0';
    String_To_Array_double (read_buff, d_array, 4);
    *value = d_array[1];  // Hz
    return 0;
}



// SEM


// mode : OFF / ON
int AG8960_SEM_Set_Continuous_Mode ( char *mode )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETUP:TSEMASK:CONTINUOUS %s", mode);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

//count : 1 ~ 999
int AG8960_SEM_Set_Count_Number ( int count )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETup:TSEMask:COUNt:SNUMber %d", count);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

//timeout_sec : 0.1 ~ 999.9 second
//Resolution: 0.1 second
//Unit: S | MS | US | NS
int AG8960_SEM_Set_Timeout ( double timeout, char *unit )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETup:TSEMask:TIMeout:STIMe %.1f %s", timeout, unit);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

//trigger
int AG8960_SEM_Set_Trigger_Source ( E_8960_TD_TRIGGER_SOURCE trigger)
{
    char cmd_str[128];
    unsigned int rtnCnt = 0;

    switch (trigger)
    {
    case TD_TRIGGER_AUTO:
        sprintf (cmd_str, "SETup:TSEMask:TRIGger:SOURce AUTO");
        break;
    case TD_TRIGGER_IMMEDIATE:
        sprintf (cmd_str, "SETup:TSEMask:TRIGger:SOURce IMMediate");
        break;
    case TD_TRIGGER_RF_RISE:
        sprintf (cmd_str, "SETup:TSEMask:TRIGger:SOURce RISE");
        break;
    case TD_TRIGGER_EXTERNAL:
        sprintf (cmd_str, "SETup:TSEMask:TRIGger:SOURce EXTernal");
        break;
    case TD_TRIGGER_PROTOCOL:
        sprintf (cmd_str, "SETup:TSEMask:TRIGger:SOURce PROTocol");
        break;
    default:
        return -1;
    }

    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

int AG8960_SEM_Get_Result (int *passFlag)
{
    char cmd_str[50];
    char read_buff[1024];
    double d_array[32];
    int rtnCnt = 0;

    strcpy (cmd_str, "FETCh:TSEMask?");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );

    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buff, 1024, &rtnCnt) );
    read_buff[rtnCnt-1] = '\0';
    String_To_Array_double (read_buff, d_array, 4);
    *passFlag = d_array[1];

    return 0;
}


// CLPC
// timeout_sec : 0.1 ~ 999.9 second
// Resolution: 0.1 second
// Unit: S | MS | US | NS
int AG8960_CLPC_Set_Timeout ( double timeout, char *unit )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETup:TCLPower:TIMeout:STIMe %.1f %s", timeout, unit);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

//trigger
int AG8960_CLPC_Set_Trigger_Source ( E_8960_TD_TRIGGER_SOURCE trigger)
{
    char cmd_str[128];
    unsigned int rtnCnt = 0;

    switch (trigger)
    {
    case TD_TRIGGER_AUTO:
        sprintf (cmd_str, "SETup:TCLPower:TRIGger:SOURce AUTO");
        break;
    case TD_TRIGGER_IMMEDIATE:
        sprintf (cmd_str, "SETup:TCLPower:TRIGger:SOURce IMMediate");
        break;
    case TD_TRIGGER_RF_RISE:
        sprintf (cmd_str, "SETup:TCLPower:TRIGger:SOURce RISE");
        break;
    case TD_TRIGGER_EXTERNAL:
        sprintf (cmd_str, "SETup:TCLPower:TRIGger:SOURce EXTernal");
        break;
    case TD_TRIGGER_PROTOCOL:
        sprintf (cmd_str, "SETup:TCLPower:TRIGger:SOURce PROTocol");
        break;
    default:
        return -1;
    }

    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

int AG8960_CLPC_Get_Result (int *passFlag)
{
    char cmd_str[50];
    char read_buff[1024];
    double d_array[32];
    int rtnCnt = 0;

    strcpy (cmd_str, "FETCh:TCLPower?");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );

    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buff, 1024, &rtnCnt) );
    read_buff[rtnCnt-1] = '\0';
    String_To_Array_double (read_buff, d_array, 4);
    if (0 != d_array[1])
    {
        *passFlag = 1;
    }
    else
    {
        *passFlag = 0;
    }

    return 0;
}


// BER
int AG8960_BER_Set_Confidence_State ( char *state )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETup:TBERror:CONFidence:STATe %s", state);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

int AG8960_BER_Set_Continuous_Mode ( char *mode )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETUP:TBERror:CONTinuous %s", mode);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

int AG8960_BER_Set_Timeout ( double timeout, char *unit )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETup:TBERror:TIMeout:STIMe %.1f %s", timeout, unit);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

// bits_number : 1000 to 999 999 999
int AG8960_BER_Set_Bits_Number ( int bits_number )
{
    char cmd_str[64];
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "SETup:TBERror:COUNt %d", bits_number);
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

int AG8960_BER_Get_Result (double *result)
{
    char cmd_str[50];
    char read_buff[1024];
    double d_array[32];
    int rtnCnt = 0;

    strcpy (cmd_str, "FETCH:TBERror?");
    AG8960_CHECK_STATUS ( viWrite (AG8960_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );

    AG8960_CHECK_STATUS ( viRead (AG8960_Handle, read_buff, 1024, &rtnCnt) );
    read_buff[rtnCnt-1] = '\0';
    String_To_Array_double (read_buff, d_array, 4);

    if (d_array[0] == 1)
    {
        return -1;
    }
    *result = d_array[1];

    return 0;
}

