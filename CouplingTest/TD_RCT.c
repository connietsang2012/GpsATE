#include <windows.h>
#include <utility.h>
#include <ansi_c.h>
#include "TD_RCT.h"
#include "TD_FT.h"
#include <visa.h>
//#include "TD_AG8960.h"
//#include "TD_SP6010.h"

#define TD_RCT_CHECK_STATUS(status) if( 0!=(status) ){return -1;}

int TD_RCT_Init (E_TD_INSTR instr, char *resource_name)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        //sprintf (resource_name, "GPIB0::%d::INSTR", SP6010_GPIB_Address);
        result = SP6010_Initialization (resource_name);
        break;

    case AG8960:
        //sprintf (resource_name, "GPIB0::%d::INSTR", AG8960_GPIB_Address);
        result = AG8960_Initialization ( resource_name );
        break;

    case MT8820:
        result = MT8820_Initialization (resource_name);
        break;

    case ZY4923B:
		result = ZY4923B_Initialization (resource_name);
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_Close (E_TD_INSTR instr)
{
    int result = 0;
    char resource_name[50];

    switch (instr)
    {
    case SP6010:
        result = SP6010_Close ();
        break;

    case AG8960:
        result = AG8960_Close ();
        break;

    case MT8820:
        result = MT8820_Close ();
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


/*********************************
mode : 0 GSM | 1 TDSCDMA
**********************************/
int TD_RCT_Service_Mode (E_TD_INSTR instr, int mode)
{
    int result = 0;
    switch (instr)
    {
    case SP6010:
        if ( mode == 0 )  // GSM
        {
            result = SP6010_System_Type ("GSM");
        }
        else // TD
        {
            result = SP6010_System_Type ("TD");
        }
        break;

    case AG8960:
        if (mode == 0)
        {
            result = AG8960_Call_Service_Mode ("GSM/GPRS");
        }
        else
        {
            result = AG8960_Call_Service_Mode ("TD-SCDMA");
        }
        break;

    case MT8820:
        if (mode == 0)
        {
            result = MT8820_Call_Service_Mode ("GSM");
        }
        else
        {
            result = MT8820_Call_Service_Mode ("TDSCDMA");
        }
        break;

	case ZY4923B:
		result = 0;
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Reset (E_TD_INSTR instr)
{
    int result = 0;
    switch (instr)
    {
    case SP6010:
        result = SP6010_Reset ();
        break;

    case AG8960:
        result = AG8960_Reset ();
        break;

    case MT8820:
        result = MT8820_Reset ();
        break;

	case ZY4923B:
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Call_Operating_Mode (E_TD_INSTR instr, char *mode)
{
    int result = 0;
    switch (instr)
    {
    case SP6010:
        result = SP6010_Call_Operating_Mode (mode);
        break;

    case AG8960:
        if ( strcmp (mode, "UECal") == 0 )
        {
            result = AG8960_Call_Operating_Mode ( "TDT" );  // TD Test mode
        }
        else
        {
            result = AG8960_Call_Operating_Mode ( mode );
        }
        break;

    case MT8820:
        result = MT8820_Call_Operating_Mode ("ON");
        break;

	case ZY4923B:
		result = ZY4923B_Set_Operating_Mode ("Active Cell");
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Call_Service_Type (E_TD_INSTR instr, char *type)
{
    int result = 0;
    switch (instr)
    {
    case SP6010:
        result = SP6010_Call_Service_Type (type);
        break;

    case AG8960:
        if ( strcmp ( type, "RMC12" ) == 0 )
        {
            result = AG8960_Channel_Type ( "SRMC12" );
        }
        else
        {
            result = AG8960_Channel_Type ( "MRMC12" );
        }
        break;

    case MT8820:
        result = 0;
        break;

	case ZY4923B:
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_Set_Downlink_Cable_Loss (E_TD_INSTR instr, double dB, int channel)
{
    int result = 0;
    switch (instr)
    {
    case SP6010:
        result = SP6010_Set_Downlink_Loss (dB);
        break;

    case AG8960:
        result = 0;
        break;

    case ZY4923B:
		result = ZY4923B_Set_Downlink_CableLoss (dB);
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Set_Uplink_Cable_Loss (E_TD_INSTR instr, double dB, int start_channel, int end_channel)
{
    int result = 0;
    switch (instr)
    {
    case SP6010:
        result = SP6010_Set_Uplink_Loss (dB);
        break;

    case AG8960:
        if ( start_channel != 0 )
        {
            result = AG8960_Set_Cable_Loss (start_channel, end_channel, dB);
        }
        break;

	case ZY4923B:
		result = ZY4923B_Set_Uplink_CableLoss (dB);
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_Register (E_TD_INSTR instr, int *stop)
{
    int result = 0;
    int count = 0;
    int try_times = 12;
    switch (instr)
    {
    case SP6010:
        do
        {
            count ++;
            result = SP6010_Register_Start ();
            if ( 0 == result )
            {
                result = SP6010_Wait_Register (30, stop);
            }

            if (*stop == 1)
            {
                break;
            }
        }
        while (result == -1 && count < try_times);
        break;

    case AG8960:
        // ........
        break;

     case ZY4923B:
        do
        {
            count ++;
            result = ZY4923B_Start_Register ();
			Delay (2.0);
            if ( 0 == result )
            {
                result = ZY4923B_Wait_Register (50, stop);
            }

            if (*stop == 1)
            {
                break;
            }
        }
        while (result == -1 && count < try_times);
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Call_Origenate ( E_TD_INSTR instr, int timeout_sec, int *stop )
{
    int result = 0;
    int count = 0;
    int try_times = 12;
    int status = 0;
    E_8960_TD_STATUS status_8960 = TD_8960_STATUS_IDLE;
    clock_t StartTime_pl;
    clock_t CurrentTime_pl;

    status = 0;
    switch (instr)
    {
    case SP6010:
        do
        {
            count ++;
            result = SP6010_Call_Originate ();
            if ( 0 == result )
            {
                result = SP6010_Wait_Call_Connected (10, stop);
            }
            if (*stop == 1)
            {
                break;
            }
        }
        while (result == -1 && count < try_times);
        break;

    case AG8960:
        StartTime_pl = clock();
        // start originating call
        TD_RCT_CHECK_STATUS ( AG8960_Call_Originate () );

        // check call connected until success or timeout.
        do
        {
            Delay ( 0.5 );
            TD_RCT_CHECK_STATUS ( AG8960_Get_Current_Status(&status_8960) );
            if (status_8960 == TD_8960_STATUS_IDLE)
            {
                TD_RCT_CHECK_STATUS ( AG8960_Call_Originate () );
            }

            // If timeout
            CurrentTime_pl = clock();
            if ( difftime(CurrentTime_pl, StartTime_pl)/1000.0 > timeout_sec)
            {
                break;
            }
            if (*stop == 1)
            {
                break;
            }
        }
        while ( status_8960 != TD_8960_STATUS_CONN );

        if ( status_8960 == TD_8960_STATUS_CONN )
        {
            result = 0;  // OK
        }
        else
        {
            result = -1; // Fail
        }
        break;

	case ZY4923B:
        do
        {
            count ++;
            result = ZY4923B_Originate_Call ();
			Delay (1.0);
            if ( 0 == result )
            {
                result = ZY4923B_Wait_Call_Connected (10, stop);
            }
            if (*stop == 1)
            {
                break;
            }
        }
        while (result == -1 && count < try_times);
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_Call_Release (E_TD_INSTR instr)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        result = SP6010_Call_Release ();
        break;

    case AG8960:
        result = AG8960_Call_Release ();
        break;

	case ZY4923B:
		result = ZY4923B_Release_Call ();
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_Set_Uplink_Channel (E_TD_INSTR instr, int channel)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        result = SP6010_Set_Uplink_Channel (channel);
        break;

    case AG8960:
        result = AG8960_Set_Test_Channel ( channel );
        break;

    case ZY4923B:
		result = ZY4923B_Set_Channel_Number (channel);
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_Receiver_Power_Control (E_TD_INSTR instr, char *mode)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Receiver_Power_Control(mode) );
        break;

    case ZY4923B:
		result = 0;
		break;
		
    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Receiver_Manual_Power (E_TD_INSTR instr, double manual_power_dBm)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Receiver_Manual_Power(manual_power_dBm) );
        break;

	case ZY4923B:
		TD_RCT_CHECK_STATUS ( ZY4923B_APC_Set_Threshold_Level(10.0) );
		TD_RCT_CHECK_STATUS ( ZY4923B_APC_Set_Input_Level((float)manual_power_dBm) );
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_MS_Target_Power (E_TD_INSTR instr, double target_power_dBm)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Call_Target_Power(target_power_dBm) );
        break;

    case MT8820:
        TD_RCT_CHECK_STATUS (MT8820_Call_Target_Power(target_power_dBm) );
        break;

	case ZY4923B:
		//TD_RCT_CHECK_STATUS (ZY4923B_Set_MS_Power(target_power_dBm));
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


// dedicated for zy4923b start
// mode : 0 Single | 1 Continuous
int TD_RCT_Preset_Ex (E_TD_INSTR instr, int contin_mode)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        break;

    case AG8960:
        
        break;

    case MT8820:
        break;

	case ZY4923B:
		if (0 == contin_mode)
		{
			TD_RCT_CHECK_STATUS (ZY4923B_Set_Mesurement_Continuous_Mode("Single"));
		}
		else
		{
			TD_RCT_CHECK_STATUS (ZY4923B_Set_Mesurement_Continuous_Mode("Continuous"));
		}
		TD_RCT_CHECK_STATUS (ZY4923B_Set_RSL_Count_Number(10000));
		TD_RCT_CHECK_STATUS (ZY4923B_Set_FS_Slot_Number(200));
		TD_RCT_CHECK_STATUS (ZY4923B_Set_CLPC_Step_Number(1));
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

// dedicated for zy4923b end ...




// uplink power control mode
// only for 8960 now
int TD_RCT_UL_Power_Control_Mode (E_TD_INSTR instr, char *mode)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Call_UL_Power_Control_Mode(mode) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}



//OBW
int TD_RCT_OBW_Init (E_TD_INSTR instr, int avg_count, int timeslot,
                     int timeout_sec, char *continuous_mode, char *control_mode, int percent)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_OBW_Set_Avg_Count (avg_count) );
        TD_RCT_CHECK_STATUS ( SP6010_OBW_Set_TSlot (timeslot));
        TD_RCT_CHECK_STATUS ( SP6010_OBW_Set_Timeout (timeout_sec) );
        TD_RCT_CHECK_STATUS ( SP6010_OBW_Set_Continuous_Mode(continuous_mode));
        TD_RCT_CHECK_STATUS ( SP6010_OBW_Set_Control_Mode(control_mode));
        TD_RCT_CHECK_STATUS ( SP6010_OBW_Set_Percent(percent));
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_OBW_Set_Count_Number(avg_count) );
        TD_RCT_CHECK_STATUS ( AG8960_OBW_Set_Timeout(timeout_sec, "S") );
        TD_RCT_CHECK_STATUS ( AG8960_OBW_Set_Continuous_Mode(continuous_mode) );
        TD_RCT_CHECK_STATUS ( AG8960_OBW_Set_Percent(percent) );
        TD_RCT_CHECK_STATUS ( AG8960_OBW_Set_Trigger_Source(TD_TRIGGER_RF_RISE) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_OBW_Start (E_TD_INSTR instr)
{
    int result = 0;
    int count = 0;
    int timeout_sec = 10;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS (SP6010_OBW_Start_Test (30));
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Init_Measurement("TOBW") );
        result = AG8960_Get_Measurement_State ("TOBW");
        if ( result != 0 )
        {
            do
            {
                count ++;
                Delay (0.2);
                result = AG8960_Get_Measurement_State ("TOBW");
            }
            while ( count < timeout_sec*5 && result != 0);
        }
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_OBW_GetResult (E_TD_INSTR instr, double *value, int *passFlag)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS (SP6010_OBW_Get_Value (value, passFlag));
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS (AG8960_OBW_Get_Value(value, passFlag));
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_OBW_Stop (E_TD_INSTR instr)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS (SP6010_OBW_Stop_Test ());
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS (AG8960_Abort_Measurement("TOBW"));
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


//ACLR
int TD_RCT_ACLR_Init (E_TD_INSTR instr, int avg_count, int timeslot,
                      int timeout_sec, char *continuous_mode, char *control_mode)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_ACLR_Set_Avg_Count (avg_count) );
        TD_RCT_CHECK_STATUS ( SP6010_ACLR_Set_TSlot (timeslot));
        TD_RCT_CHECK_STATUS ( SP6010_ACLR_Set_Timeout (timeout_sec) );
        TD_RCT_CHECK_STATUS ( SP6010_ACLR_Set_Continuous_Mode (continuous_mode) );
        TD_RCT_CHECK_STATUS ( SP6010_ACLR_Set_Control_Mode (control_mode) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_ACLR_Set_Count_Number(avg_count) );
        TD_RCT_CHECK_STATUS ( AG8960_ACLR_Set_Timeout (timeout_sec, "S") );
        TD_RCT_CHECK_STATUS ( AG8960_ACLR_Set_Continuous_Mode(continuous_mode) );
        TD_RCT_CHECK_STATUS ( AG8960_ACLR_Set_Trigger_Source(TD_TRIGGER_RF_RISE) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_ACLR_Set_Threshold (E_TD_INSTR instr, int upper1_dBc, int upper2_dBc, int lower1_dBc, int lower2_dBc)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_ACLR_Set_Upper1_Threshold (upper1_dBc) );
        TD_RCT_CHECK_STATUS ( SP6010_ACLR_Set_Upper2_Threshold (upper2_dBc) );
        TD_RCT_CHECK_STATUS ( SP6010_ACLR_Set_Lower1_Threshold (lower1_dBc) );
        TD_RCT_CHECK_STATUS ( SP6010_ACLR_Set_Lower2_Threshold (lower2_dBc) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_ACLR_Start (E_TD_INSTR instr)
{
    int result = 0;
    int count = 0;
    int timeout_sec = 10;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_ACLR_Start_Test (30) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Init_Measurement("TACL") );
        result = AG8960_Get_Measurement_State ("TACL");
        if ( result != 0 )
        {
            do
            {
                count ++;
                Delay (0.2);
                result = AG8960_Get_Measurement_State ("TACL");
            }
            while ( count < timeout_sec*5 && result != 0);
        }
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


//value [5]
int TD_RCT_ACLR_GetResult(E_TD_INSTR instr, double *value, int *passFlag)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_ACLR_Get_Result (value, passFlag) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_ACLR_Get_Result(value, passFlag) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_ACLR_Stop (E_TD_INSTR instr)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_OBW_Stop_Test () );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Abort_Measurement ("TACL") );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


// BER
int TD_RCT_Set_RFG_Transmit_Power (E_TD_INSTR instr, double dBm)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_BER_Set_RFGenerator_Power (dBm) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Set_Cell_Power(dBm) );
        break;

    case MT8820:
        TD_RCT_CHECK_STATUS ( MT8820_Set_Cell_Power (dBm) );
        break;

    case ZY4923B:
		TD_RCT_CHECK_STATUS ( ZY4923B_Set_Cell_Power(dBm) );
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_BER_Init (E_TD_INSTR instr, int bit_number, int timeout_sec, double cell_power)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_BER_Set_Bits_Number(bit_number) );
        TD_RCT_CHECK_STATUS ( AG8960_BER_Set_Confidence_State("OFF") );
        TD_RCT_CHECK_STATUS ( AG8960_BER_Set_Timeout(timeout_sec, "S") );
        TD_RCT_CHECK_STATUS ( AG8960_BER_Set_Continuous_Mode("OFF") );
        TD_RCT_CHECK_STATUS ( AG8960_Set_Cell_Power(cell_power) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_BER_Wait_Sync (E_TD_INSTR instr, int timeout_sec)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_BER_Wait_Sync (timeout_sec) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_BER_Set_Timeout (E_TD_INSTR instr, int timeout_sec)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_BER_Set_Timeout (timeout_sec) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_BER_Set_Conf_State (E_TD_INSTR instr, char *state)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_BER_Set_Conf_State (state) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_BER_Set_Bit_Num (E_TD_INSTR instr, int bit_num)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_BER_Set_Bit_Num (bit_num) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_BER_Start (E_TD_INSTR instr, int timeout_sec)
{
    int result = 0;
    int count = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_BER_Start_Test (timeout_sec) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Init_Measurement("TBER") );
        result = AG8960_Get_Measurement_State ("TBER");
        if ( result != 0 )
        {
            do
            {
                count ++;
                Delay (0.2);
                result = AG8960_Get_Measurement_State ("TBER");
            }
            while ( count < timeout_sec*5 && result != 0);
        }
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_BER_Get_Result (E_TD_INSTR instr, double *value, int *passFlag)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_BER_Get_Result (value, passFlag) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_BER_Get_Result(value) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_BER_Stop (E_TD_INSTR instr)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_BER_Stop_Test () );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Abort_Measurement ("TBER") );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


//SEM
int TD_RCT_SEM_Init (E_TD_INSTR instr, int avg_count, int timeslot,
                     int timeout_sec, char *continuous_mode)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_SEM_Set_Avg_Count (avg_count) );
        TD_RCT_CHECK_STATUS ( SP6010_SEM_Set_TSlot (timeslot));
        TD_RCT_CHECK_STATUS ( SP6010_SEM_Set_Timeout (timeout_sec) );
        TD_RCT_CHECK_STATUS ( SP6010_SEM_Set_Continuous_Mode (continuous_mode) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_SEM_Set_Count_Number(avg_count) );
        TD_RCT_CHECK_STATUS ( AG8960_SEM_Set_Timeout(timeout_sec, "S") );
        TD_RCT_CHECK_STATUS ( AG8960_SEM_Set_Continuous_Mode(continuous_mode) );
        TD_RCT_CHECK_STATUS ( AG8960_SEM_Set_Trigger_Source(TD_TRIGGER_RF_RISE) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_SEM_Start (E_TD_INSTR instr)
{
    int result = 0;
    int count = 0;
    int timeout_sec = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_SEM_Start_Test(30) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Init_Measurement("TSEM") );
        result = AG8960_Get_Measurement_State ("TSEM");
        if ( result != 0 )
        {
            do
            {
                count ++;
                Delay (0.2);
                result = AG8960_Get_Measurement_State ("TSEM");
            }
            while ( count < timeout_sec*5 && result != 0);
        }
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_SEM_Get_Result (E_TD_INSTR instr, int *passFlag)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_SEM_Get_Result (passFlag) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_SEM_Get_Result(passFlag) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_SEM_Stop (E_TD_INSTR instr)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_SEM_Stop_Test () );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Abort_Measurement("TSEM") );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

// power
int TD_RCT_Power_Set_Timeout (E_TD_INSTR instr, int timeout_sec)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_Power_Set_Timeout (timeout_sec) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_TCP_Set_Timeout (timeout_sec, "S") );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Power_Set_State (E_TD_INSTR instr, char *state)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_Power_Set_PControl_State (state) );
        break;

    case AG8960:
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_Power_Set_Count (E_TD_INSTR instr, int count)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_TCP_Set_Count_Number(count) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Power_Set_Trigger_Source (E_TD_INSTR instr, E_8960_TD_TRIGGER_SOURCE trigger)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_TCP_Set_Trigger_Source(trigger) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Power_Init(E_TD_INSTR instr)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        result = 0;
        break;

    case AG8960:
        result = 0;
        break;

    case MT8820:
		result = 0;
		break;

	case ZY4923B:
		result = ZY4923B_Init_Item_State ("APC", "ON");
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_Power_Start (E_TD_INSTR instr)
{
    int result = 0;
    int count = 0;
    int timeout_sec = 10;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_Power_Start_Test (timeout_sec) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Init_Measurement("TCP") );
        result = AG8960_Get_Measurement_State ("TCP");
        if ( result != 0 )
        {
            do
            {
                count ++;
                Delay (0.2);
                result = AG8960_Get_Measurement_State ("TCP");
            }
            while ( count < timeout_sec*5 && result != 0);
        }
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Power_Get_Result (E_TD_INSTR instr, SP6010_POWER_TYPE power_type, double *value, int *passFlag)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_Power_Get_Result (power_type, value, passFlag) );
        break;

    case AG8960:
        if (SP6010_POWER_MAX == power_type)
        {
            TD_RCT_CHECK_STATUS ( AG8960_TCP_Get_Power_Max (value) );
        }
        else if (SP6010_POWER_MIN == power_type)
        {
            TD_RCT_CHECK_STATUS ( AG8960_TCP_Get_Power_Min (value) );
        }
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Power_Stop (E_TD_INSTR instr)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_Power_Stop_Test () );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Abort_Measurement ("TCP") );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

//PVT
int TD_RCT_PVT_Set_Timeout(E_TD_INSTR instr, int timeout_sec)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_PVT_Set_Timeout (timeout_sec) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_PVT_Start (E_TD_INSTR instr)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_PVT_Start_Test (10) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_PVT_Get_Result (E_TD_INSTR instr, int *passFlag)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_PVT_Get_Result (passFlag) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_PVT_Stop (E_TD_INSTR instr)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_PVT_Stop_Test () );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

//WQulity
int TD_RCT_WQulity_Set_Timeout (E_TD_INSTR instr, int timeout_sec)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_WQulity_Set_Timeout (timeout_sec) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_WQulity_Set_Timeout(timeout_sec, "S") );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_WQulity_Init (E_TD_INSTR instr, int avg_count, int timeslot,
                         int timeout_sec, char *continuous_mode)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_WQulity_Set_Count_Number(avg_count) );
        TD_RCT_CHECK_STATUS ( AG8960_WQulity_Set_Timeout(timeout_sec, "S") );
        TD_RCT_CHECK_STATUS ( AG8960_WQulity_Set_Continuous_Mode(continuous_mode) );
        TD_RCT_CHECK_STATUS ( AG8960_WQulity_Set_Trigger_Source(TD_TRIGGER_RF_RISE) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_WQulity_Start (E_TD_INSTR instr)
{
    int result = 0;
    int count = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_WQulity_Start_Test (10) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Init_Measurement("TWQ") );
        result = AG8960_Get_Measurement_State ("TWQ");
        if ( result != 0 )
        {
            do
            {
                count ++;
                Delay (0.2);
                result = AG8960_Get_Measurement_State ("TWQ");
            }
            while ( count < 20 && result != 0);
        }
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_WQulity_Get_AVG_EVM (E_TD_INSTR instr, double *d_EVM)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_WQulity_Get_AVG_EVM (d_EVM) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_WQulity_Get_EVM_AVG(d_EVM) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_WQulity_Get_Peak_EVM (E_TD_INSTR instr, double *d_EVM)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_WQulity_Get_Peak_EVM (d_EVM) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_WQulity_Get_EVM_Peak(d_EVM) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_WQulity_Get_FE (E_TD_INSTR instr, double *d_FE)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_WQulity_Get_FE (d_FE) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_WQulity_Get_FE_AVG(d_FE) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_WQulity_Stop (E_TD_INSTR instr)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_WQulity_Stop_Test () );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Abort_Measurement("TWQ") );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


//OLPC
int TD_RCT_OLPC_Init (E_TD_INSTR instr,  int timeout_sec)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_OLPC_Set_Timeout (timeout_sec) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_CLPC_Set_Timeout (timeout_sec, "S") );
        TD_RCT_CHECK_STATUS ( AG8960_CLPC_Set_Trigger_Source (TD_TRIGGER_PROTOCOL));
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_OLPC_Start (E_TD_INSTR instr)
{
    int result = 0;
    int count = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_OLPC_Start_Test (10) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Init_Measurement("TCLP") );
        result = AG8960_Get_Measurement_State ("TCLP");
        if ( result != 0 )
        {
            do
            {
                count ++;
                Delay (0.2);
                result = AG8960_Get_Measurement_State ("TCLP");
            }
            while ( count < 20 && result != 0);
        }
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_OLPC_Get_Result (E_TD_INSTR instr, int *passFlag)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_OLPC_Get_Result (passFlag) );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_CLPC_Get_Result (passFlag) );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_OLPC_Stop (E_TD_INSTR instr)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_OLPC_Stop_Test () );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Abort_Measurement("TCLP") );
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_SetCellMode(E_TD_INSTR instr, char CellMode[])
{
    int result = 0;
    //"OFF", "TD_AFC", "TD_RSSI", "TD_TPC"
    switch (instr)
    {
    case SP6010:
        if(strcmp("OFF", CellMode) == 0)
        {
            result = SP6010_Call_Operating_Mode ("OFF");
        }
        else if(strcmp("TD_AFC", CellMode) == 0 || strcmp("TD_TPC", CellMode) == 0)
        {
            result = SP6010_Call_Operating_Mode ("UECal");
        }
        else if(strcmp("TD_RSSI", CellMode) == 0)
        {
            result = SP6010_Call_Operating_Mode ("CALL");
        }
        else
        {
            result = TD_INSTR_NOT_SUPPORT;
        }
        break;

    case AG8960:
        if(strcmp("OFF", CellMode) == 0)
        {
            result = AG8960_Call_Operating_Mode ("OFF");
        }
        else if(strcmp("TD_AFC", CellMode) == 0 || strcmp("TD_TPC", CellMode) == 0)
        {
            result = AG8960_Call_Operating_Mode ("TDT");
        }
        else if(strcmp("TD_RSSI", CellMode) == 0)
        {
            result = AG8960_Call_Operating_Mode ("TDT");
        }
        else
        {
            result = TD_INSTR_NOT_SUPPORT;
        }
        break;

	case ZY4923B:
		if(strcmp("TD_RSSI", CellMode) == 0)
		{
			result = ZY4923B_Set_Operating_Mode ("TD-SCDMA Signal");
		}
		else
		{
			result = ZY4923B_Set_Operating_Mode ("Cell Off");
		}
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
        break;
    }
    return result;

}

/**
int TD_RCT_SetCableloss(E_TD_INSTR instr, E_TD_A_NVRAM_BAND_T band)
{
    int result = 0;
    double CableLoss_dB_Input = 0;
    double CableLoss_dB_Output = 0;

    switch(band)
    {
    	case TD_BAND1:
    		CableLoss_dB_Input = TD_CableLoss_Input[0];
    		CableLoss_dB_Output = TD_CableLoss_Output[0];
    	break;
    	case TD_BAND2:
    		CableLoss_dB_Input = TD_CableLoss_Input[1];
    		CableLoss_dB_Output = TD_CableLoss_Output[1];
    	break;
    }

    switch (instr)
    {
    case SP6010:
        result = SP6010_Set_Downlink_Loss (CableLoss_dB_Output);
        result = SP6010_Set_Uplink_Loss (CableLoss_dB_Input);
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}
**/

int TD_RCT_SetChannel(E_TD_INSTR instr, int TestChannel)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        result = SP6010_Set_Uplink_Channel (TestChannel);
        break;

    case AG8960:
        result = AG8960_Set_Test_Channel (TestChannel);
        break;

	case ZY4923B:
		result = ZY4923B_Set_Channel_Number (TestChannel);
		if (result == 0)
		{
			//Sleep (500);
		}
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_StartOrEndCall(E_TD_INSTR instr, int bStart)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        if ( bStart )
        {
            result = SP6010_Register_Start ();
        }
        else
        {
            result = SP6010_Call_End ();
        }
        break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


// IF_Continuous : 1 ON | 0 OFF
int TD_RCT_Meas_Freq_Setup(E_TD_INSTR instr, int IF_Continuous, int Average_Count, int TimeOut_ms)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        result = SP6010_Meas_Freq_Setup(IF_Continuous, Average_Count);//, TimeOut_ms);
        break;

    case AG8960:
        if (IF_Continuous == 1)
        {
            TD_RCT_CHECK_STATUS (AG8960_WQulity_Set_Continuous_Mode("ON"));
        }
        else
        {
            TD_RCT_CHECK_STATUS (AG8960_WQulity_Set_Continuous_Mode("OFF"));
        }

        TD_RCT_CHECK_STATUS (AG8960_WQulity_Set_Count_Number(Average_Count));
        TD_RCT_CHECK_STATUS (AG8960_WQulity_Set_Timeout(TimeOut_ms, "MS"));
        TD_RCT_CHECK_STATUS (AG8960_WQulity_Set_Trigger_Source(TD_TRIGGER_RF_RISE));
        break;

	case ZY4923B:
		if (IF_Continuous == 0)
        {
            TD_RCT_CHECK_STATUS (ZY4923B_Set_Item_Continuous_Mode("AFC", "Single"));
        }
        else
        {
            TD_RCT_CHECK_STATUS (ZY4923B_Set_Item_Continuous_Mode("AFC", "Continuous"));
        }
		TD_RCT_CHECK_STATUS (ZY4923B_Set_Item_Count_State_Number("AFC", "ON", Average_Count));
		TD_RCT_CHECK_STATUS (ZY4923B_Set_Item_Timeout("AFC", (int)(TimeOut_ms/1000)));
		TD_RCT_CHECK_STATUS (ZY4923B_Set_Item_Signal_Type("AFC", "TD"));
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Meas_Freq_Init_Pre (E_TD_INSTR instr)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
		result = 0;
        break;

    case AG8960:
        result = 0;
        break;

    case ZY4923B:
		result = ZY4923B_Init_Item_State ("AFC", "ON");
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_Meas_Freq_Init (E_TD_INSTR instr)
{
    int result = 0;
    int count = 0;

    switch (instr)
    {
    case SP6010:
        result = SP6010_Meas_Freq_Init ();
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Init_Measurement("TWQ") );
        result = AG8960_Get_Measurement_State ("TWQ");
        if ( result != 0 )
        {
            do
            {
                count ++;
                Delay (0.2);
                result = AG8960_Get_Measurement_State ("TWQ");
            }
            while ( count < 20 && result != 0);
        }
        break;

    case ZY4923B:
		result = ZY4923B_Start_Item_Test("AFC");
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Meas_Freq(E_TD_INSTR instr, double *pFreqError)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        result = SP6010_Meas_Freq(pFreqError);
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_WQulity_Get_FE_AVG(pFreqError) );
        break;

	case ZY4923B:
		TD_RCT_CHECK_STATUS (ZY4923B_AFC_Fetch_FOFFSet_AVG(pFreqError));
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Meas_Freq_Abort (E_TD_INSTR instr)
{
    int result = 0;
    int count = 0;

    switch (instr)
    {
    case SP6010:
        TD_RCT_CHECK_STATUS ( SP6010_Meas_Freq_Abort() );
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Abort_Measurement("TWQ") );
        break;

    case ZY4923B:
		result = 0;
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_Meas_TxPower_Setup(E_TD_INSTR instr, int IF_Continuous, int Average_Count, int TimeOut_ms)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        result = SP6010_Meas_TxPower_Setup(IF_Continuous, Average_Count, TimeOut_ms);
        break;

    case AG8960:
        if (IF_Continuous == 0)
        {
            TD_RCT_CHECK_STATUS (AG8960_TCP_Set_Continuous_Mode("OFF"));
        }
        else
        {
            TD_RCT_CHECK_STATUS (AG8960_TCP_Set_Continuous_Mode("ON"));
        }
        TD_RCT_CHECK_STATUS (AG8960_TCP_Set_Count_Number(Average_Count));
        TD_RCT_CHECK_STATUS (AG8960_TCP_Set_Timeout(TimeOut_ms, "MS"));
        TD_RCT_CHECK_STATUS (AG8960_TCP_Set_Trigger_Source(TD_TRIGGER_RF_RISE));
        break;

	case ZY4923B:
		if (IF_Continuous == 0)
        {
            TD_RCT_CHECK_STATUS (ZY4923B_Set_Item_Continuous_Mode("APC", "Single"));
        }
        else
        {
            TD_RCT_CHECK_STATUS (ZY4923B_Set_Item_Continuous_Mode("APC", "Continuous"));
        }
		TD_RCT_CHECK_STATUS (ZY4923B_Set_Item_Count_State_Number("APC", "OFF", 0));
		TD_RCT_CHECK_STATUS (ZY4923B_Set_Item_Timeout("APC", (int)(TimeOut_ms/1000)));
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Meas_TxPower_Init (E_TD_INSTR instr)
{
    int result = 0;
    int count = 0;

    switch (instr)
    {
    case SP6010:
        result = SP6010_Meas_TxPower_Init ();
        break;

    case AG8960:
        TD_RCT_CHECK_STATUS ( AG8960_Init_Measurement("TCP") );
        result = AG8960_Get_Measurement_State ("TCP");
        if ( result != 0 )
        {
            do
            {
                count ++;
                Delay (0.2);
                result = AG8960_Get_Measurement_State ("TCP");
            }
            while ( count < 20 && result != 0);
        }
        break;

    case ZY4923B:
		TD_RCT_CHECK_STATUS (ZY4923B_Start_Item_Test("APC"));
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}


int TD_RCT_Meas_TxPower(E_TD_INSTR instr, double *pTxPower)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        result = SP6010_Meas_TxPower(pTxPower);
        break;

    case AG8960:
        result = AG8960_TCP_Get_Power_AVG (pTxPower);
        break;

	case ZY4923B:
		result = ZY4923B_APC_Fetch_Power_AVG(pTxPower);
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

int TD_RCT_Meas_TxPower_Abort (E_TD_INSTR instr)
{
    int result = 0;

    switch (instr)
    {
    case SP6010:
        result = SP6010_Meas_TxPower_Abort ();
        break;

    case AG8960:
        result = AG8960_Abort_Measurement ("TCP");
        break;

    case ZY4923B:
		result = 0;
		break;

    default:
        result = TD_INSTR_NOT_SUPPORT;
    }

    return result;
}

