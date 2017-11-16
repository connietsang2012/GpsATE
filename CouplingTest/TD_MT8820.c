#include <windows.h>
#include <utility.h>
#include <visa.h>
#include <ansi_c.h>
#include <formatio.h>
#include "TD_MT8820.h"

#define MT8820_CHECK_STATUS(status) if(VI_SUCCESS!=(status)){return -1;}
#define VISA_BUF_LEN 32767

ViSession MT8820_Handle;

int MT8820_Initialization (ViRsrc resourceName)
{
    ViSession  defRM = 0;
    ViStatus   errStatus = 0;
    char cmd_buf[64];
    char read_buf[VISA_BUF_LEN];
    int num = 0;

    if (MT8820_Handle != VI_NULL)
    {
        MT8820_Close ();
    }

    if ((errStatus = viOpenDefaultRM (&defRM)) < VI_SUCCESS)
        return errStatus;

    if ((errStatus = viOpen(defRM, resourceName, VI_NULL, VI_NULL, &MT8820_Handle)) < VI_SUCCESS)
    {
        viClose(defRM);
        MT8820_Handle = VI_NULL;
        return errStatus;
    }

    return 0;
}

ViStatus MT8820_Close ( void )
{
    ViStatus errStatus = 0;
    ViSession defRM;

    if ((errStatus = viGetAttribute(MT8820_Handle, VI_ATTR_RM_SESSION, &defRM)) < VI_SUCCESS)
    {
        return errStatus;
    }
    MT8820_Handle = VI_NULL;

    return viClose(defRM);
}

int MT8820_Reset ( void )
{
    unsigned long rtnCnt = 0;
    char cmd_str[16];

    strcpy ( cmd_str, "*RST" );
    MT8820_CHECK_STATUS ( viWrite (MT8820_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

/**************************************************************
  mode : GSM / WCDMA / TDSCDMA
***************************************************************/
int MT8820_Call_Service_Mode (char *mode)
{
    char cmd_str[64];
    unsigned long rtnCnt = 0;

    sprintf (cmd_str, "STDSEL %s", mode);
    MT8820_CHECK_STATUS ( viWrite (MT8820_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

/**************************************************************
  mode : ON | OFF
***************************************************************/
int MT8820_Call_Operating_Mode (char *mode)
{
    char cmd_str[64];
    unsigned long rtnCnt = 0;

    sprintf ( cmd_str, "CALLPROC %s", mode );
    MT8820_CHECK_STATUS ( viWrite (MT8820_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );

    return 0;
}

int MT8820_Set_Cell_Power (double cell_power_dBm)
{
    char cmd_str[124];
    int result = 0;
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "OLVL %.2fdBm", cell_power_dBm);
    MT8820_CHECK_STATUS ( viWrite (MT8820_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}

int MT8820_Call_Target_Power (double target_power_dBm)
{
    char cmd_str[124];
    int result = 0;
    unsigned int rtnCnt = 0;

    sprintf (cmd_str, "ILVL %.2fdBm", target_power_dBm);
    MT8820_CHECK_STATUS ( viWrite (MT8820_Handle, cmd_str, strlen(cmd_str), &rtnCnt) );
    return 0;
}


