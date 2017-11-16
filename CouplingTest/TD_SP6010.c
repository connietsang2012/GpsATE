#include <windows.h>
#include <formatio.h>
#include <utility.h>
#include <ansi_c.h>
#include <visa.h>
#include "TD_SP6010.h"
#include <userint.h>

#include "CommonFunc.h"

#define META_TD_A_ADD_OPC
//#define VISA_BUF_LEN 32767
#define TD_SP6010_MAX_RETRY_CNT   100
//#define SP6010_CHECK_STATUS(status) if(VI_SUCCESS!=(status)){return -1;}

static int b_finished = 0;
static ViStatus vistat_opc = 0;

#ifdef  META_TD_A_ADD_OPC
#define META_TDA_QUERY_OPC_PROCEDURE  { \
        vistat_opc = sp6010_QueryOpcFinished();\
        if (vistat_opc != VI_SUCCESS)       \
        {                                \
           return -1; \
        }  \
        if (b_finished == 0) \
        { \
           return -1;   \
        }\
}
#else
#define META_TDA_QUERY_OPC_PROCEDURE {}
#endif

/*
void SP6010_CHECK_STATUS (int status)
{

}*/

ViStatus sp6010_QueryOpcFinished ( void )
{
    char cmd[64];
    int i = 0;
    ViStatus vistat = VI_ERROR_TMO;
    int trial_times = 1;
    int opc = 0;

    sprintf(cmd,"*OPC?");
    b_finished = 0;

    for (i = 0; i < trial_times; i++)
    {
        vistat = viQueryf (SP6010_Handle, cmd, "%d", &opc);
        if(vistat != VI_SUCCESS && i == trial_times-1)
        {
            return vistat;
        }
        else
        {
            if(vistat == VI_SUCCESS && opc == 1)
            {
                b_finished = 1;
                return VI_SUCCESS;
            }
            else
            {
                Sleep(100);
            }
        }
    }

    return vistat;

}


/***********************************************************************************************
//Function
************************************************************************************************/


int SP6010_Register_Start ( void )
{
    int b_HasError = 1;
    ViStatus vistat = 0;

    SP6010_CHECK_STATUS (SP6010_SendGpibCmd ("CALL:REGister:STARt"));

    vistat = sp6010_QuerySystemError (&b_HasError);
    if (vistat != VI_SUCCESS) return -1;
    if (b_HasError == 1) return -1;

    return 0;
}


int SP6010_Wait_Register (int timeout_sec, int *stop)
{
    int iConnected = 0;
    int count = 0;
    int newTimeout = 0;

    newTimeout = timeout_sec * 5;

    while ( iConnected != 1 && count < newTimeout )
    {
        if (*stop == 1)
        {
            return -1;
        }

        Delay (0.2);
        SP6010_CHECK_STATUS ( SP6010_SendGpibCmd ("CALL:REGister?") );
        SP6010_CHECK_STATUS ( SP6010_GetData (DT_INT, 1, &iConnected) );

        count ++;
    }

    if (count >= newTimeout)
    {
        return -1;
    }

    return 0;
}

int SP6010_Call_Originate ( void )
{
    SP6010_CHECK_STATUS (SP6010_SendGpibCmd ("CALL:ORIGinate"));
    return 0;
}

int SP6010_Wait_Call_Connected (int timeout_sec, int *stop)
{
    int iConnected = 0;
    int count = 0;
    int newTimeout = 0;

    newTimeout = timeout_sec * 5;

    while ( iConnected != 1 && count < newTimeout )
    {
        if (*stop == 1)
        {
            return -1;
        }

        Delay (0.2);
        SP6010_CHECK_STATUS ( SP6010_SendGpibCmd ("CALL:CONNected?") );
        SP6010_CHECK_STATUS ( SP6010_GetData (DT_INT, 1, &iConnected) );

        count ++;
    }

    if (count >= newTimeout)
    {
        return -1;
    }

    return 0;
}

int SP6010_Call_Release ( void )
{
    int iConnected = 0;

    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd ("CALL:CONNected?") );
    SP6010_CHECK_STATUS ( SP6010_GetData (DT_INT, 1, &iConnected) );

    if ( 1 == iConnected )
    {
        SP6010_CHECK_STATUS (SP6010_SendGpibCmd ("CALL:END"));
    }
    return 0;
}

int SP6010_Call_End ( void )
{
    SP6010_CHECK_STATUS (SP6010_SendGpibCmd ("CALL:END"));
    return 0;
}

int SP6010_Wait_Call_Release (int timeout_sec)
{
    int iConnected = 0;
    int count = 0;
    int newTimeout = 0;

    newTimeout = timeout_sec * 5;

    while ( iConnected != 0 && count < newTimeout )
    {
        Delay (0.2);
        SP6010_CHECK_STATUS ( SP6010_SendGpibCmd ("CALL:CONNected?") );
        SP6010_CHECK_STATUS ( SP6010_GetData (DT_INT, 1, &iConnected) );

        count ++;
    }

    return 0;
}

/**************************************************************
 type : AMR12 / RMC12 / RMC64 / RMC144 / RMC384 /
           FACH  / ECALL / OLPC  / HSDPA
***************************************************************/
int SP6010_Call_Service_Type (char *type)
{
    char serviceType[50];

    sprintf (serviceType, "CALL:SERVice %s", type);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (serviceType) );
    return 0;
}


/**************************************************************
  mode : CALL / UECal / CW / OFF
***************************************************************/
int SP6010_Call_Operating_Mode (char *mode)
{
    char serviceType[50];
    ViStatus vistat = 0;
    int b_HasError = 0;

    sprintf (serviceType, "CALL:OPERating:MODE %s", mode);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (serviceType) );

    vistat = sp6010_QuerySystemError (&b_HasError);
    if (vistat != VI_SUCCESS) return -1;
    if (b_HasError == 1) return -1;;
    return 0;
}


/*************************************************************
    revision : R4 / R5
    Need to set in Cell Off mode
**************************************************************/
int SP6010_Call_Revision (char *revision)
{
    char cmd[50];

    sprintf (cmd, "CALL:REVision %s", revision);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}


int SP6010_Set_Downlink_Loss (double dBm)
{
    char cmd[50];

    sprintf (cmd, "RFG:DOWN:WIRE:LOSS %.2f", dBm);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}


int SP6010_Set_Uplink_Loss (double dBm)
{
    char cmd[50];

    sprintf (cmd, "RFAN:UPLink:WIRE:LOSS %.2f", dBm);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}


int SP6010_Set_Uplink_Channel (int channel)
{
    char cmd[50];
    int result = 0;
    ViStatus vistat = 0;
    int b_HasError = 0;

    sprintf (cmd, "CALL:UPLink:MEAS:CHAN %d", channel);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    /**
    strcpy (cmd, "SYSTem:ERRor?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData (DT_INT, 1, &result) );
    if ( 0 != result )
    {
        return -1;
    }
    **/

    vistat = sp6010_QuerySystemError (&b_HasError);
    if (vistat != VI_SUCCESS) return -1;
    if (b_HasError == 1) return -1;

    return 0;
}

// ACLR
int SP6010_ACLR_Set_Avg_Count (int count)
{
    char cmd[50];

    sprintf (cmd, "SETup:ACLeakage:AVERage:COUNt %d", count);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_ACLR_Set_TSlot (int timeslot)
{
    char cmd[50];

    sprintf (cmd, "SETup:ACLeakage:TSLot %d", timeslot);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_ACLR_Set_Timeout (int timeout_sec)
{
    char cmd[50];

    sprintf (cmd, "SETup:ACLeakage:TIMeout %d", timeout_sec);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_ACLR_Set_Continuous_Mode (char * mode)
{
    char cmd[50];

    sprintf (cmd, "SETup:ACLeakage:CONTinuous %s", mode);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_ACLR_Set_Control_Mode (char * mode)
{
    char cmd[50];

    sprintf (cmd, "SETup:ACLeakage:MCONtrol %s", mode);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_ACLR_Set_Upper1_Threshold (double dBc)
{
    char cmd[50];

    sprintf (cmd, "SETup:ACLeakage:UPPer1:THReshold %f", dBc);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_ACLR_Set_Upper2_Threshold (double dBc)
{
    char cmd[50];

    sprintf (cmd, "SETup:ACLeakage:UPPer2:THReshold %f", dBc);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_ACLR_Set_Lower1_Threshold (double dBc)
{
    char cmd[50];

    sprintf (cmd, "SETup:ACLeakage:Lower1:THReshold %f", dBc);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_ACLR_Set_Lower2_Threshold (double dBc)
{
    char cmd[50];

    sprintf (cmd, "SETup:ACLeakage:Lower2:THReshold %f", dBc);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_ACLR_Start_Test (int timeout_sec)
{
    char cmd[50];
    char ACLR_Done[16];
    int newTimeout = timeout_sec * 5;
    int count = 0;

    strcpy (cmd, "INITiate:ACLEakage");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    strcpy (cmd, "INITiate:DONE?");
    do
    {
        Delay (0.2);
        SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
        SP6010_CHECK_STATUS ( SP6010_GetData (DT_CHAR, 4, ACLR_Done) );
        if ( 0 == strcmp(ACLR_Done, "ACLR") )
        {
            break;
        }

        count ++;
    }
    while (count < newTimeout);

    if (count >= newTimeout)
    {
        return -1;
    }
    return 0;
}

int SP6010_ACLR_Get_Result ( double *value, int *passFlag)
{
    char cmd[50];

    strcpy (cmd, "FETCh:ACLeakage:RATio?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData(DT_FLOAT, 5, value) );

    strcpy (cmd, "FETCh:ACLeakage:PASS?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData(DT_INT, 1, passFlag) );

    return 0;
}

int SP6010_ACLR_Stop_Test ( void )
{
    char cmd[50];

    strcpy (cmd, "ABORt:ACLeakage");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    Delay (0.2);

    return 0;
}


// OBW
int SP6010_OBW_Set_Avg_Count (int count)
{
    char cmd[50];

    sprintf (cmd, "SETup:OBWidth:AVERage:COUNt %d", count);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_OBW_Set_TSlot (int timeslot)
{
    char cmd[50];

    sprintf (cmd, "SETup:OBWidth:TSLot %d", timeslot);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}


int SP6010_OBW_Set_Timeout (int timeout_sec)
{
    char cmd[50];

    sprintf (cmd, "SETup:OBWidth:TIMeout %d", timeout_sec);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

// mode : ON/OFF
int SP6010_OBW_Set_Continuous_Mode(char * mode)
{
    char cmd[50];

    sprintf (cmd, "SETup:OBWidth:CONTinuous %s", mode);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_OBW_Set_Control_Mode (char *mode)
{
    char cmd[50];

    sprintf (cmd, "SETup:OBWidth:MCONtrol %s", mode);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_OBW_Set_Percent (int per)
{
    char cmd[50];

    sprintf (cmd, "SETup:OBWidth:PERCent %d", per);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_OBW_Start_Test (int timeout_sec)
{
    char cmd[50];
    int newTimeout = timeout_sec* 5;
    int count = 0;
    char initDone[16];

    strcpy (cmd, "INITiate:OBWidth");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    strcpy (cmd, "INITiate:DONE?");
    do
    {
        Delay (0.2);

        memset (initDone, 16, 0);
        SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
        SP6010_CHECK_STATUS ( SP6010_GetData (DT_CHAR, 3, initDone) );
        if ( 0 == strcmp(initDone, "OBW") )
        {
            break;
        }
    }
    while (count < newTimeout);

    if ( count >= newTimeout )
    {
        return -1;
    }

    return 0;
}

// value : OBW Value
// testFlag : 1 - Pass
//               0 - Fail
int SP6010_OBW_Get_Value (double *value, int *testFlag)
{
    char cmd[50];

    strcpy (cmd, "FETCh:OBWidth:FREQuency:BANDwidth?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData (DT_FLOAT, 1, value));

    strcpy (cmd, "FETCh:OBWidth:PASS?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData (DT_INT, 1, testFlag));
    return 0;
}


int SP6010_OBW_Stop_Test (void)
{
    char cmd[50];

    strcpy (cmd, "ABORt:OBWidth");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    Delay (0.2);

    return 0;
}


//BER
int SP6010_BER_Set_RFGenerator_Power (double dBm)
{
    char cmd[50];
    ViStatus vistat = 0;
    int b_HasError = 0;

    sprintf (cmd, "RFGenerator:MANual:TRANsmit:Power %f", dBm);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    vistat = sp6010_QuerySystemError (&b_HasError);
    if (vistat != VI_SUCCESS) return -1;
    if (b_HasError == 1) return -1;

    return 0;
}

int SP6010_BER_Wait_Sync (int timeout_sec)
{
    char cmd[50];
    char result_status[16];
    int newTimeout = timeout_sec * 10;
    int count = 0;

    strcpy (cmd, "FETCh:SYNChronise:STATus?");
    do
    {
        Delay (0.1);

        SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
        SP6010_CHECK_STATUS ( SP6010_GetData (DT_CHAR, 4, result_status) );
        if ( 0 == strcmp(result_status, "TRUE") )
        {
            break;
        }

        count ++;
    }
    while ( count < newTimeout );


    if (count >= newTimeout)
    {
        return -1;
    }

    return 0;
}


int SP6010_BER_Set_Conf_State (char *state)
{
    char cmd[50];

    sprintf (cmd, "SETup:BERror:CONF:STAT %s", state);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    return 0;
}

int SP6010_BER_Set_Bit_Num (int bit_num)
{
    char cmd[50];

    sprintf (cmd, "SETup:BERRor:COUNt %d", bit_num);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    return 0;
}

int SP6010_BER_Set_Timeout (int timeout_sec)
{
    char cmd[50];

    sprintf (cmd, "SETup:BERRor:TIMeout %d", timeout_sec);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    return 0;
}

int SP6010_BER_Start_Test (int timeout_sec)
{
    char cmd[50];
    char result_status[16];
    int newTimeout = timeout_sec * 5;
    int count = 0;

    strcpy (cmd, "INITiate:BERRor");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    strcpy (cmd, "INITiate:DONE?");
    do
    {
        Delay (0.2);

        SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
        SP6010_CHECK_STATUS ( SP6010_GetData (DT_CHAR, 3, result_status) );
        if ( 0 == strcmp(result_status, "BER") )
        {
            break;
        }
        count ++;
    }
    while ( count < newTimeout );

    if ( count > newTimeout )
    {
        return -1;
    }

    return 0;
}

int SP6010_BER_Get_Result (double *value, int *passFlag)
{
    char cmd[50];

    strcpy (cmd, "FETCh:BERRor:RATio?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData(DT_FLOAT, 1, value) );

    strcpy (cmd, "FETCh:BERRor:PASS?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData(DT_INT, 1, passFlag) );

    return 0;
}

int SP6010_BER_Stop_Test (void)
{
    char cmd[50];

    strcpy (cmd, "ABORt:BERRor");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    Delay (0.2);

    return 0;
}

//SEM
int SP6010_SEM_Set_Avg_Count (int count)
{
    char cmd[50];

    sprintf (cmd, "SETup:SEMask:AVERage:COUNt %d", count);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_SEM_Set_TSlot (int timeslot)
{
    char cmd[50];

    sprintf (cmd, "SETup:SEMask:TSLot %d", timeslot);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_SEM_Set_Timeout (int timeout_sec)
{
    char cmd[50];

    sprintf (cmd, "SETup:SEMask:TIMeout %d", timeout_sec);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

// mode : ON/OFF
int SP6010_SEM_Set_Continuous_Mode(char * mode)
{
    char cmd[50];

    sprintf (cmd, "SETup:SEMask:CONTinuous %s", mode);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}


int SP6010_SEM_Start_Test (int timeout_sec)
{
    char cmd[50];
    char result_status[16];
    int newTimeout = timeout_sec * 5;
    int count = 0;

    strcpy (cmd, "INITiate:SEMask");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    strcpy (cmd, "INITiate:DONE?");
    do
    {
        Delay (0.2);

        SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
        SP6010_CHECK_STATUS ( SP6010_GetData (DT_CHAR, 3, result_status) );
        if ( 0 == strcmp(result_status, "SEM") )
        {
            break;
        }
        count ++;
    }
    while ( count < newTimeout );

    if ( count > newTimeout )
    {
        return -1;
    }

    return 0;
}

int SP6010_SEM_Get_Result (int *passFlag)
{
    char cmd[50];

    strcpy (cmd, "FETCh:SEMask:PASS?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData(DT_INT, 1, passFlag) );

    return 0;
}


int SP6010_SEM_Stop_Test (void)
{
    char cmd[50];

    strcpy (cmd, "ABORt:SEMask");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    Delay (0.2);

    return 0;
}


// Power


// state : ON/OFF
int SP6010_Power_Set_PControl_State  (char *state)
{
    char cmd[50];

    sprintf (cmd, "SETup:PCONtrol:CLPControl:STATe %s", state);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    return 0;
}

int SP6010_Power_Set_Timeout  (int timeout_sec)
{
    char cmd[50];

    sprintf (cmd, "SETup:PCONtrol:TIMeout %d", timeout_sec);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    return 0;
}

int SP6010_Power_Start_Test (int timeout_sec)
{
    char cmd[50];
    char result_status[16];
    int newTimeout = timeout_sec * 10;
    int count = 0;

    strcpy (cmd, "INITiate:PCONtrol");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    strcpy (cmd, "INITiate:DONE?");
    do
    {
        Delay (0.1);

        SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
        SP6010_CHECK_STATUS ( SP6010_GetData (DT_CHAR, 4, result_status) );
        if ( 0 == strcmp(result_status, "PCON") )
        {
            break;
        }
        count ++;
    }
    while ( count < newTimeout );

    if ( count > newTimeout )
    {
        return -1;
    }

    return 0;
}

int SP6010_Power_Get_Result (SP6010_POWER_TYPE power_type, double *value, int *passFlag)
{
    char cmd[50];

    switch (power_type)
    {
    case SP6010_POWER_MAX :
        strcpy (cmd, "FETCh:PCONtrol:MAXPower?");
        break;
    case SP6010_POWER_MIN:
        strcpy (cmd, "FETCh:PCONtrol:MINPower?");
        break;
    case SP6010_POWER_CL:
        //strcpy (cmd, "FETCh:PCONtrol:CLPower:PASS?");
        break;
    }
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData(DT_FLOAT, 1, value) );

    switch (power_type)
    {
    case SP6010_POWER_MAX :
        strcpy (cmd, "FETCh:PCONtrol:POWer:MAXimum:PASS?");
        break;
    case SP6010_POWER_MIN:
        strcpy (cmd, "FETCh:PCONtrol:POWer:MINimum:PASS?");
        break;
    case SP6010_POWER_CL:
        strcpy (cmd, "FETCh:PCONtrol:CLPower:PASS?");
        break;
    }
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData(DT_INT, 1, passFlag) );

    return 0;
}


int SP6010_Power_Stop_Test (void)
{
    char cmd[50];

    strcpy (cmd, "ABORt:PCONtrol");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    Delay (0.2);

    return 0;
}

// PVT
int SP6010_PVT_Set_Timeout  (int timeout_sec)
{
    char cmd[50];

    sprintf (cmd, "SETup:TOOMask:TIMeout %d", timeout_sec);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    return 0;
}

int SP6010_PVT_Start_Test (int timeout_sec)
{
    char cmd[50];
    char result_status[16];
    int newTimeout = timeout_sec * 5;
    int count = 0;

    strcpy (cmd, "INITiate:TOOMask");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    strcpy (cmd, "INITiate:DONE?");
    do
    {
        Delay (0.2);

        SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
        SP6010_CHECK_STATUS ( SP6010_GetData (DT_CHAR, 4, result_status) );
        if ( 0 == strcmp(result_status, "PVST") )
        {
            break;
        }
        count ++;
    }
    while ( count < newTimeout );

    if ( count > newTimeout )
    {
        return -1;
    }

    return 0;
}


int SP6010_PVT_Get_Result_Value (SP6010_PVT_TYPE pvt_type, double *value)
{
    char cmd[50];

    switch (pvt_type)
    {
    case SP6010_PVT_POWER_ON:
        strcpy (cmd, "FETCh:TOOMask:POWer:ON?");
        break;
    case SP6010_PVT_POWER_OFF :
        strcpy (cmd, "FETCh:TOOMask:POWer:OFF?");
        break;
    }
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData (DT_FLOAT, 1, value) );

    return 0;
}


int SP6010_PVT_Get_Result (int *passFlag)
{
    char cmd[50];

    strcpy (cmd, "FETCh:TOOMask:PASS?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData (DT_INT, 1, passFlag) );

    return 0;
}

int SP6010_PVT_Stop_Test (void)
{
    char cmd[50];

    strcpy (cmd, "ABORt:TOOMask");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    Delay (0.2);

    return 0;
}


// Wave Quality
int SP6010_WQulity_Set_Timeout  (int timeout_sec)
{
    char cmd[50];

    sprintf (cmd, "SETup:WQUality:TIMeout %d", timeout_sec);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    return 0;
}

int SP6010_WQulity_Start_Test (int timeout_sec)
{
    char cmd[50];
    char result_status[16];
    int newTimeout = timeout_sec * 5;
    int count = 0;

    strcpy (cmd, "INITiate:WQUality");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    strcpy (cmd, "INITiate:DONE?");
    do
    {
        Delay (0.2);

        SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
        SP6010_CHECK_STATUS ( SP6010_GetData (DT_CHAR, 4, result_status) );
        if ( 0 == strcmp(result_status, "WQUA") )
        {
            break;
        }
        count ++;
    }
    while ( count < newTimeout );

    if ( count > newTimeout )
    {
        return -1;
    }

    return 0;
}


int SP6010_WQulity_Get_AVG_EVM (double *d_EVM)
{
    char cmd[50];

    strcpy (cmd, "FETCh:WQUality:EVM?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData (DT_FLOAT, 1, d_EVM) );

    return 0;
}

int SP6010_WQulity_Get_Peak_EVM (double *d_EVM)
{
    char cmd[50];

    strcpy (cmd, "FETCh:WQUality:EVM:MAXimum?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData (DT_FLOAT, 1, d_EVM) );

    return 0;
}

int SP6010_WQulity_Get_FE (double *d_FE)
{
    char cmd[50];

    strcpy (cmd, "FETCh:WQUality:FERRor?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData (DT_FLOAT, 1, d_FE) );

    return 0;
}


int SP6010_WQulity_Stop_Test (void)
{
    char cmd[50];

    strcpy (cmd, "ABORt:WQUality");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    Delay (0.2);

    return 0;
}


// OLPC
int SP6010_OLPC_Set_Timeout (int timeout_sec)
{
    char cmd[50];

    sprintf (cmd, "SETup:OLPControl:TIMeout %d", timeout_sec);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    return 0;
}

int SP6010_OLPC_Start_Test (int timeout_sec)
{
    char cmd[50];
    char result_status[16];
    int newTimeout = timeout_sec * 5;
    int count = 0;

    strcpy (cmd, "INITiate:OLPControl");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    strcpy (cmd, "INITiate:DONE?");
    do
    {
        Delay (0.2);

        SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
        SP6010_CHECK_STATUS ( SP6010_GetData (DT_CHAR, 4, result_status) );
        if ( 0 == strcmp(result_status, "OLPC") )
        {
            break;
        }
        count ++;
    }
    while ( count < newTimeout );

    if ( count > newTimeout )
    {
        return -1;
    }

    return 0;
}


int SP6010_OLPC_Get_Result (int *passFlag)
{
    char cmd[50];

    strcpy (cmd, "FETCh:OLPControl:PASS?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData (DT_INT, 1, passFlag) );

    return 0;
}


int SP6010_OLPC_Stop_Test (void)
{
    char cmd[50];

    strcpy (cmd, "ABORt:OLPControl");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    Delay (0.2);

    return 0;
}

//==========================================================================================
// Calirbation dedicated
//==========================================================================================
int SP6010_Meas_Freq_Setup(int IF_Continuous, int Average_Count)//, int TimeOut_ms)
{
    char cmd[50];

    if(IF_Continuous == 1)
    {
        strcpy (cmd, "SETup:AFCalibrate:CONTinuous ON");
    }
    else
    {
        strcpy (cmd, "SETup:AFCalibrate:CONTinuous OFF");
    }
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    sprintf (cmd, "SETup:AFCalibrate:AVErage:COUNt %d", Average_Count);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    //no timeout setting for AFC in SP6010
    return 0;
}


int SP6010_Meas_Freq_Init ( void )
{
    char cmd[50];
    char buf[VISA_BUF_LEN];
    int i = 0;
    ViStatus vistat = VI_SUCCESS;

    sprintf (cmd, "INITiate:AFCalibrate");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    sprintf (cmd, "INITiate:DONE?");
    for(i = 0; i<TD_SP6010_MAX_RETRY_CNT; i++)
    {
        Delay (0.1);
        memset(buf, 0x0, sizeof(buf));
        vistat = viQueryf (SP6010_Handle, cmd, "%s", buf);
        if (vistat != VI_SUCCESS)
        {
            return -1;
        }
        if(strstr(buf, "AFC") != NULL)
        {
            return 0;
        }
    }

    if(i == TD_SP6010_MAX_RETRY_CNT)
        return -1; // return error to indicate the operation failed!
    else
        return 0;

    return 0;
}

int SP6010_Meas_Freq(double *pFreqError)
{
    char cmd[50];

    /**
    sprintf (cmd, "INITiate:AFCalibrate");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    Sleep(500);
    **/

    sprintf (cmd, "FETCh:AFCalibrate:FOFFset?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData (DT_FLOAT, 1, pFreqError) );

    /**
    sprintf (cmd, "ABORt:AFCalibrate");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    **/

    return 0;
}

int SP6010_Meas_Freq_Abort ( void )
{
    char cmd[50];

    sprintf (cmd, "ABORt:AFCalibrate");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    return 0;
}

int SP6010_Meas_TxPower_Setup(int IF_Continuous, int Average_Count,int Timeout_ms)
{
    char cmd[50];
    int Timeout_sec;

    if(IF_Continuous == 1)
    {
        sprintf (cmd, "SETup:APCalibrate:CONTinuous ON");
    }
    else
    {
        sprintf (cmd, "SETup:APCalibrate:CONTinuous OFF");
    }
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    sprintf (cmd, "SETup:APCalibrate:NUMBer %d", Average_Count);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    // unit: second
    Timeout_sec = Timeout_ms / 1000.0;
    sprintf (cmd, "SETup:APCalibrate:TIMeout %d", Timeout_sec);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    return 0;
}

int SP6010_Meas_TxPower_Init (void)
{
    char cmd[50];
    char buf[VISA_BUF_LEN];
    int i = 0;
    ViStatus vistat = VI_SUCCESS;

    sprintf (cmd, "INITiate:APCalibrate");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    sprintf (cmd, "INITiate:DONE?");
    for(i = 0; i<TD_SP6010_MAX_RETRY_CNT; i++)
    {
        Delay (0.1);
        memset(buf, 0x0, sizeof(buf));
        vistat = viQueryf (SP6010_Handle, cmd, "%s", buf);
        if (vistat != VI_SUCCESS)
        {
            return -1;
        }
        if(strstr(buf, "APC") != NULL)
        {
            return 0;
        }
    }

    if(i == TD_SP6010_MAX_RETRY_CNT)
        return -1; // return error to indicate the operation failed!
    else
        return 0;

    //return 0;
}


int SP6010_Meas_TxPower(double *pTxPower_dBm)
{
    char cmd[50];

    /**
    sprintf (cmd, "INITiate:APCalibrate");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    Sleep (250);
    **/

    sprintf (cmd, "FETCh:APCalibrate:SPOWer?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData (DT_FLOAT, 1, pTxPower_dBm) );

    /**
    sprintf (cmd, "ABORt:APCalibrate");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    **/

    return 0;
}

int SP6010_Meas_TxPower_Abort (void)
{
    char cmd[50];

    sprintf (cmd, "ABORt:APCalibrate");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    return 0;
}