
#include <windows.h>
#include <userint.h>
#include <utility.h>
#include <visa.h>
#include <ansi_c.h>
#include <formatio.h>
#include "TD_ZY4923B.h"

int ZY4923B_GPIB_Address;
ViSession ZY4923B_Handle;

#define ZY4923B_CHECK_STATUS(status) if(VI_SUCCESS!=(status)){return -1;}


ViStatus ZY4923B_Initialization (ViRsrc resourceName)
{
    ViSession  defRM;
    ViStatus   errStatus;

    if ((errStatus = viOpenDefaultRM (&defRM)) < VI_SUCCESS)
        return errStatus;

    if ((errStatus = viOpen(defRM, resourceName, VI_NULL, VI_NULL, &ZY4923B_Handle)) < VI_SUCCESS)
    {
        viClose(defRM);
        ZY4923B_Handle = VI_NULL;
        return errStatus;
    }

    return VI_SUCCESS;
}

ViStatus ZY4923B_Close ( void )
{
    ViStatus errStatus;
    ViSession defRM;

    if ((errStatus = viGetAttribute(ZY4923B_Handle, VI_ATTR_RM_SESSION, &defRM)) < VI_SUCCESS)
    {
        return errStatus;
    }

    return viClose(defRM);
}


// mode : TD / GSM
int ZY4923B_Set_System_Mode (char *mode)
{
	char pGpibCmd[128];
	char pRtnBuf[4096];
	unsigned long rtnCnt = 0;
	int loop_count = 50; // 5 second
	int loop_index = 0;
	int integrity = 0;

    // Check current mode
    sprintf (pGpibCmd, "SYSTem:MODE?");
	ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
	ZY4923B_CHECK_STATUS ( viRead (ZY4923B_Handle, pRtnBuf, 4096, &rtnCnt) );
	if (strcmp (pRtnBuf, mode) == 0)
    {
		return 0;
	}

    // Set mode
    sprintf (pGpibCmd, "SYSTem:MODE %s", mode);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

	// Check setting completed ?
    sprintf (pGpibCmd, "SYSTem:MODE?");
	do {
		Delay (0.1);
		ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
		ZY4923B_CHECK_STATUS ( viRead (ZY4923B_Handle, pRtnBuf, 4096, &rtnCnt) );

		if (strcmp (pRtnBuf, mode) == 0)
		{
			break;
		}

		loop_index ++;
	} while (loop_index < loop_count);

	if (strcmp (pRtnBuf, mode) == 0)
    {
		return 0;
	}
	else
	{
		return -1;
	}
}

// port : Port1 / Port2
int ZY4923B_Set_System_Port (char *port)
{
	char pGpibCmd[128];
	char pRtnBuf[4096];
	unsigned long rtnCnt = 0;
	int loop_count = 50; // 5 second
	int loop_index = 0;
	int integrity = 0;

    // Check current port
    sprintf (pGpibCmd, "SYSTem:PORT?");
	ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
	ZY4923B_CHECK_STATUS ( viRead (ZY4923B_Handle, pRtnBuf, 4096, &rtnCnt) );
	if (strcmp (pRtnBuf, port) == 0)
    {
		return 0;
	}

    // Set port
    sprintf (pGpibCmd, "SYSTem:PORT %s", port);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

	// Check setting completed ?
    sprintf (pGpibCmd, "SYSTem:PORT?");
	do {
		Delay (0.1);
		ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
		ZY4923B_CHECK_STATUS ( viRead (ZY4923B_Handle, pRtnBuf, 4096, &rtnCnt) );

		if (strcmp (pRtnBuf, port) == 0)
		{
			break;
		}

		loop_index ++;
	} while (loop_index < loop_count);

	if (strcmp (pRtnBuf, port) == 0)
    {
		return 0;
	}
	else
	{
		return -1;
	}
}

//loss_dB : 0.00 ~ 100.0
int ZY4923B_Set_Uplink_CableLoss (double loss_dB)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "SYSTem:ATTenuation:UPLevelcal %.2f", loss_dB);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

	return 0;
}

//loss_dB : 0.00 ~ 100.0
int ZY4923B_Set_Downlink_CableLoss (double loss_dB)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "SYSTem:ATTenuation:DOWNlevelcal %.2f", loss_dB);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

	return 0;
}

// mode : Active cell | TD-SCDMA Signal | CW Signal | Cell Off
int ZY4923B_Set_Operating_Mode (char *mode)
{
	char pGpibCmd[128];
	char pRtnBuf[4096];
	unsigned long rtnCnt = 0;
	int loop_count = 50; // 5 second
	int loop_index = 0;
	int integrity = 0;

	sprintf (pGpibCmd, "CALL:OPERating:MODE %s", mode);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
	Sleep (200);

	return 0;

    // Check current mode
    sprintf (pGpibCmd, "CALL:OPERating:MODE?");
	ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
	ZY4923B_CHECK_STATUS ( viRead (ZY4923B_Handle, pRtnBuf, 4096, &rtnCnt) );
	//pRtnBuf[rtnCnt] = 0;
	if (strcmp (pRtnBuf, mode) == 0)
    {
		return 0;
	}

	if(FindPattern (pRtnBuf, 0, -1, mode, 0, 0) >= 0)
	{
		return 0;
	}

    // Set mode
    sprintf (pGpibCmd, "CALL:OPERating:MODE %s", mode);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

	// Check setting completed ?
    sprintf (pGpibCmd, "CALL:OPERating:MODE?");
	do {
		Delay (0.1);
		ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
		ZY4923B_CHECK_STATUS ( viRead (ZY4923B_Handle, pRtnBuf, 4096, &rtnCnt) );

		if (strcmp (pRtnBuf, mode) == 0)
		{
			break;
		}

		loop_index ++;
	} while (loop_index < loop_count);

	if (strcmp (pRtnBuf, mode) == 0)
    {
		return 0;
	}
	else
	{
		return -1;
	}
}

// channel : int 9400бл11500
int ZY4923B_Set_Channel_Number (int channel)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "CALL:CHANnel:NUMBer %d", channel);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

    return 0;
}

int ZY4923B_Set_Cell_Power (double dBm)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "CALL:CELL:POWer %.2f", dBm);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

    return 0;
}

int ZY4923B_Set_MS_Power (double dBm)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "SETup:MSTarget:POWer:NUMBer %.2f", dBm);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

    return 0;
}


// item : AFC / APC
// state : ON / OFF
int ZY4923B_Init_Item_State (char *item, char *state)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "INIT:%s:%s", item, state);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
	Sleep (200);

	return 0;
}

// item : AFC / APC
int ZY4923B_Start_Item_Test (char *item)
{
	char pGpibCmd[128];
	char pRtnBuf[4096];
	unsigned long rtnCnt = 0;
	int integrity = 0;
	int loop_index = 0;
	int loop_count = 50;

    sprintf (pGpibCmd, "SETup:%s:STESt", item);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

	sprintf (pGpibCmd, "FETCh:%s:INTegrity?", item);
	memset (pRtnBuf, 0x0, 4096*sizeof(char));
	do {
		Delay (0.1);
		ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
		ZY4923B_CHECK_STATUS ( viRead (ZY4923B_Handle, pRtnBuf, 4096, &rtnCnt) );

		integrity = atoi(pRtnBuf);
		if (integrity == 0 || integrity == 1)
		{
			break;
		}
		loop_index ++;
	} while (loop_index < loop_count);

	if (integrity == 0)
	{
		return 0;
	}
	else
	{
		return -1;
	}

    return 0;
}

// mode : single |continuous
int ZY4923B_Set_Item_Continuous_Mode (char *item, char *mode)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "SETup:%s:CONTinuous %s", item, mode);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

    return 0;
}


// timeout_sec : 0.1 ~ 999.0  unit : second
int ZY4923B_Set_Item_Timeout (char *item, float timeout_sec)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "SETup:%s:TIMeout:TIME %.1f", item, timeout_sec);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

    return 0;
}

// item : AFC / APC
// type : TD / GSM / CW
int ZY4923B_Set_Item_Signal_Type (char *item, char *type)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "SETup:%s:SIGType %s", item, type);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

    return 0;
}

// item : AFC / APC
// state : on / off
// count : 
//        AFC : 2 ~ 999 -default : 0
//        APC : 2 ~ 300
int ZY4923B_Set_Item_Count_State_Number (char *item, char * state, int count)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    // Set State ( APC needed ? )
    sprintf (pGpibCmd, "SETup:%s:COUNt:STATe %s", item, state);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

    if (strcmp(state, "ON") == 0 || strcmp(state, "on") == 0)
    {
	    // Set count number
	    sprintf (pGpibCmd, "SETup:%s:COUNt:NUMBer %d", item, count);
	    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
    }

    return 0;
}

// item : AFC / APC
// state : on / off
// count : 2 ~ 999 -default : 0
int ZY4923B_AFC_Fetch_FOFFSet_AVG (double *freqErr)
{
	char pGpibCmd[128];
	char pRtnBuf[4096];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "FETCh:AFC:FOFFset:AVERage?");
	sprintf (pRtnBuf, 0x0, sizeof(char)*4096);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
    ZY4923B_CHECK_STATUS ( viRead (ZY4923B_Handle, pRtnBuf, 4096, &rtnCnt) );
	
    *freqErr = atof (pRtnBuf);
    return 0;
}


// level_dBm : -50.0 ~ 35.0 dBm
int ZY4923B_APC_Set_Input_Level (float level_dBm)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "SETup:APC:RFINput:LEVel %.1f", level_dBm);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
	
    return 0;
}

// level_dBm : -85.0 ~ 35.0 dBm 
// default : -50 dBm
int ZY4923B_APC_Set_Threshold_Level (float level_dBm)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "SETup:APC:TRGThreshold %.1f", level_dBm);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
	
    return 0;
}


// item : AFC / APC
// state : on / off
// count : 2 ~ 999 -default : 0
int ZY4923B_APC_Fetch_Power_AVG (double *result_dBm)
{
	char pGpibCmd[128];
	char pRtnBuf[4096];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "FETCh:APC:CHPower:AVERage?");
	sprintf (pRtnBuf, 0x0, sizeof(char)*4096);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
    ZY4923B_CHECK_STATUS ( viRead (ZY4923B_Handle, pRtnBuf, 4096, &rtnCnt) );
	
    *result_dBm = atof (pRtnBuf);
    return 0;
}


/*******************************
*
* 		 Final Test
*
********************************/

// mode : Single / Continous
int ZY4923B_Set_Mesurement_Continuous_Mode (char *mode)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "SETup:MEASurement:ITEM:CONTinuous %s", mode);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

    return 0;
}


int ZY4923B_Set_FS_Slot_Number (int slot_num)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "SET:FST:TSL %d", slot_num);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

    return 0;
}

int ZY4923B_Set_RSL_Count_Number (int num)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "SET:RSL:COUN %d", num);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

    return 0;
}

int ZY4923B_Set_CLPC_Step_Number (int num)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "INIT:CLPC:STEP %d", num);
    ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

    return 0;
}



int ZY4923B_Start_Register (void)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "CALL:REGister:RECAll");
	ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

    return 0;
}


int ZY4923B_Wait_Register (int timeout_sec, int *stop)
{
    int iConnected = 0;
    int count = 0;
    int newTimeout = 0;

	char pGpibCmd[128];
	char pRtnBuf[4096];
	unsigned long rtnCnt = 0;

    newTimeout = timeout_sec * 30;

    sprintf (pGpibCmd, "CALL:STATus?");
    while ( count < newTimeout )
    {
        if (*stop == 1)
        {
            return -1;
        }
        Delay (0.2);
		
    	//ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
        //ZY4923B_CHECK_STATUS ( viRead (ZY4923B_Handle, pRtnBuf, 4096, &rtnCnt) );

		ZY4923B_CHECK_STATUS ( viQueryf(ZY4923B_Handle, pGpibCmd, "%s" , pRtnBuf) );
		//pRtnBuf[rtnCnt] = 0;
		if ( FindPattern (pRtnBuf, 0, -1, "Idle", 0, 0) >= 0 ||
			 FindPattern (pRtnBuf, 0, -1, "Conn", 0, 0) >= 0
		   )
		{
			break;
		}

        count ++;
    }

    if (count >= newTimeout)
    {
        return -1;
    }

    return 0;
}

int ZY4923B_Originate_Call (void)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "CALL:ORIG");
	ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

    return 0;
}

int ZY4923B_Release_Call (void)
{
	char pGpibCmd[128];
	unsigned long rtnCnt = 0;

    sprintf (pGpibCmd, "CALL:END");
	ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );

    return 0;
}

int ZY4923B_Wait_Call_Connected (int timeout_sec, int *stop)
{
    int iConnected = 0;
    int count = 0;
    int newTimeout = 0;

	char pGpibCmd[128];
	char pRtnBuf[4096];
	unsigned long rtnCnt = 0;

    newTimeout = timeout_sec * 5;

    sprintf (pGpibCmd, "CALL:STATus?");
    while ( count < newTimeout )
    {
        if (*stop == 1)
        {
            return -1;
        }
        Delay (0.2);
		
    	//ZY4923B_CHECK_STATUS ( viWrite (ZY4923B_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt) );
        //ZY4923B_CHECK_STATUS ( viRead (ZY4923B_Handle, pRtnBuf, 4096, &rtnCnt) );

		ZY4923B_CHECK_STATUS ( viQueryf(ZY4923B_Handle, pGpibCmd, "%s" , pRtnBuf) );
		//pRtnBuf[rtnCnt] = 0;
		if ( FindPattern (pRtnBuf, 0, -1, "Conn", 0, 0) >= 0 )
		{
			break;
		}

        count ++;
    }

    if (count >= newTimeout)
    {
        return -1;
    }

    return 0;
}




