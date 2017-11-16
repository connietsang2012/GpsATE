#include <formatio.h>
#include <ansi_c.h>
#include <visa.h>
#include <utility.h>
#include "SP6010_Common.h"


ViSession SP6010_Handle = 0;

extern int _ArrayString_Parse( char *src, char* dst, short* dst_pos );
extern int String_To_Array_double( char *src, double* array, int max_count );

int String_To_Array_float( char *src, float * array, int max_count )
{
    char  str[32767];//RD_BUFFER_SIZE_ARRAY];
    short str_pos[32767];//RD_BUFFER_SIZE_ARRAY];
    int   i, count;

    count = _ArrayString_Parse( src, str, str_pos );
    if( count>max_count )  count = max_count;

    for(i=0; i<count; i++)
    {
        array[i] = atof( &str[str_pos[i]] );
    }
    return count;
}


ViStatus sp6010_QuerySystemError (int *b_HasError)
{
    unsigned long num = 0;
    char cmd[VISA_BUF_LEN];
    char buf[VISA_BUF_LEN];
    ViStatus vistat = VI_ERROR_TMO;
    int trial_times = 1;
    int i = 0;
    int error = 0;

    *b_HasError = 1;

    sprintf(cmd, "SYSTem:ERRor?");
    for (i = 0; i < trial_times; i++)
    {
        vistat = viQueryf (SP6010_Handle, cmd, "%d", &error);
        if(vistat != VI_SUCCESS && i == trial_times-1)
        {
            return vistat;
        }
        else
        {
            if (vistat == VI_SUCCESS && error == 0)
            {
                *b_HasError = 0;
                return VI_SUCCESS;
            }
            else
            {
                Delay (0.1);
            }

        }
    }

    return vistat;
}

ViStatus SP6010_Initialization (ViRsrc resourceName)
{
    ViSession  defRM;
    ViStatus   errStatus;

    if ((errStatus = viOpenDefaultRM (&defRM)) < VI_SUCCESS)
        return errStatus;

    if ((errStatus = viOpen(defRM, resourceName, VI_NULL, VI_NULL, &SP6010_Handle)) < VI_SUCCESS)
    {
        viClose(defRM);
        SP6010_Handle = VI_NULL;
        return errStatus;
    }

    return VI_SUCCESS;
}

ViStatus SP6010_SendGpibCmd(char* pGpibCmd)
{
    unsigned long rtnCnt = 0;
    ViStatus errStatus;

    errStatus = viWrite (SP6010_Handle, pGpibCmd, strlen(pGpibCmd), &rtnCnt);
    return errStatus;
}


ViStatus SP6010_GetData (Data_Type DataType, unsigned long ulDataLen, void* pDataValue)
{
    int num = 0;
    //char buf[VISA_BUF_LEN];
    //char buf[VISA_BUF_LEN];
    char buf[10240];
    char temp_buf[10];
    ViStatus errStatus;
    int index = 0;

    int i_value = 0;
    double f_value = 0;

    double f_array[10240];

    errStatus = viRead (SP6010_Handle, buf, 4096, &num);
    if (errStatus != VI_SUCCESS && errStatus != VI_SUCCESS_MAX_CNT &&
            errStatus != VI_SUCCESS_TERM_CHAR)
    {
        errStatus = viRead (SP6010_Handle, buf, VISA_BUF_LEN, &num);
        if (errStatus != VI_SUCCESS)
        {
            return errStatus;
        }
    }
    //Buffer length not need to modified, for Register
    buf[num] = 0;


    switch (DataType)
    {
    case DT_INT:
        String_To_Array_double(buf, f_array, ulDataLen);
        for (index=0; index < ulDataLen; index ++)
        {
            ((int *)pDataValue)[index] = (int) f_array[index];
        }
        break;

    case DT_FLOAT:
        String_To_Array_double(buf, f_array, ulDataLen);
        for (index=0; index < ulDataLen; index ++)
        {
            ((double *)pDataValue)[index] = (double) f_array[index];
        }
        break;

    case DT_CHAR:
        for (index=0; index < ulDataLen; index ++)
        {
            if (buf[index] == 0)
            {
                break;
            }

            ((char *)pDataValue)[index] = buf[index];
        }
        if ( index == ulDataLen )
        {
            ((char *)pDataValue)[index] = 0;
        }
        break;
    }

    return VI_SUCCESS;
}

ViStatus SP6010_Close ( void )
{
    ViStatus errStatus;
    ViSession defRM;

    if ((errStatus = viGetAttribute(SP6010_Handle, VI_ATTR_RM_SESSION, &defRM)) < VI_SUCCESS)
    {
        return errStatus;
    }

    return viClose(defRM);
}


int SP6010_Reset ( void )
{
    int b_HasError = 1;
    ViStatus vistat = 0;

    SP6010_CHECK_STATUS (SP6010_SendGpibCmd ("*RST"));

	Delay (1.0);

 //   vistat = sp6010_QuerySystemError (&b_HasError);
   // if (vistat != VI_SUCCESS) return -1;
   // if (b_HasError == 1) return -1;

    return 0;
}

/////////////////////////////////////////////
//SystemType:TD/GSM
/////////////////////////////////////////////
int SP6010_System_Type(char * SystemType)
{
    int errStatus;
    char cmd[50];
    char current_type[32];
    unsigned long rtnCnt = 0;

    int b_HasError = 1;
    ViStatus vistat = 0;

    sprintf(cmd,"SYST:PROT:TYPE?");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
    SP6010_CHECK_STATUS ( SP6010_GetData(DT_CHAR, 32, current_type) );
    if (FindPattern (current_type, 0, -1, SystemType, 0, 0) >= 0)
    {
        return 0;
    }
	if(FindPattern (current_type, 0, -1, "LTE", 0, 0) >= 0)
   { 
	   sprintf(cmd,"CALL:CELL:OPER:MODE:TLTE OFF");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
	
	vistat = sp6010_QuerySystemError (&b_HasError);
    if (vistat != VI_SUCCESS) return -1;
    if (b_HasError == 1) return -1;
   }
	
   if(FindPattern (current_type, 0, -1, "TD", 0, 0) >= 0)
   { sprintf(cmd,"CALL:OPER:MODE OFF");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

	   sprintf(cmd,"CALL:SERV RMC12");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    vistat = sp6010_QuerySystemError (&b_HasError);
    if (vistat != VI_SUCCESS) return -1;
    if (b_HasError == 1) return -1;



    sprintf(cmd,"SYST:PROT:TYPE %s",SystemType);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    vistat = sp6010_QuerySystemError (&b_HasError);
    if (vistat != VI_SUCCESS) return -1;
    if (b_HasError == 1) return -1;
   }

    sprintf(cmd,"SYST:PROT:TYPE %s",SystemType);
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );

    vistat = sp6010_QuerySystemError (&b_HasError);
    if (vistat != VI_SUCCESS) return -1;
    if (b_HasError == 1) return -1;

	//add by chengshidong20150701
	sprintf(cmd,"SYST:RFS:FDC:CTAB:UNL");
    SP6010_CHECK_STATUS ( SP6010_SendGpibCmd (cmd) );
	//chengshidong20150701

    /**
    errStatus = SP6010_SendGpibCmd("SYST:ERR?");
    if(errStatus != 0)
        return -1;
    **/
    return 0;
}



