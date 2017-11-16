#include <windows.h>

#include <cvidef.h>
#include <cvirte.h>    /* Needed if linking in external compiler; harmless otherwise */
#include <ddesupp.h>
#include <userint.h>
#include <cviauto.h>
#include <formatio.h>
#include <string.h>

#include <utility.h>
#include <formatio.h>
#include <visa.h>
#include <userint.h>
#include <ansi_c.h>
#include "inifile.h"
#include "System_Share.h"
#include "TD_FT.h"
#include "TD_Common.h"
#include "TD_CAL.h"

//#include "TD_RCT.h"
//#include "SP6010.h"


//#define TD_FT_CHECK_STATUS(status) if( 0!=(status) ){goto Error;}

/*
void TD_FT_CHECK_STATUS(int status)
{
}
*/

void TD_Report_Display ( char *msg, int detail_display )
{
    char str[10240];

    strcpy (str, msg);
    switch (detail_display)
    {
    case 0:
        break;
    case 1:
        if (TD_Report_Detail == 0)
        {
            return;
        }
        break;
    }
    strcat (str, "\n");
    strcat (TD_Report_Handle, str);
    SetCtrlVal (TD_Report_Panel, TD_Report_Ctrl, str);
}


void Load_TD_Setting (IniText FileHandle, char *SectionName, S_TD_FT_CASE *TestSet)
{
    Int_IniRead (FileHandle, SectionName, "Check Max Power", 0, &TestSet->check_max_power);
    Int_IniRead (FileHandle, SectionName, "Check Min Power", 0, &TestSet->check_min_power);
    Int_IniRead (FileHandle, SectionName, "Check PVT", 0, &TestSet->check_PVT);
    Int_IniRead (FileHandle, SectionName, "Check Occupied Bandwidth", 0, &TestSet->check_OBW);
    Int_IniRead (FileHandle, SectionName, "Check Spectrum Emission Mask", 0, &TestSet->check_SEM);
    Int_IniRead (FileHandle, SectionName, "Check Adjacent Channel Leakage", 0, &TestSet->check_ACLR);
    Int_IniRead (FileHandle, SectionName, "Check Waveform Quality", 0, &TestSet->check_wave_quality);
    Int_IniRead (FileHandle, SectionName, "Check BER", 0, &TestSet->check_BER);
    Int_IniRead (FileHandle, SectionName, "Check Open Loop Power", 0, &TestSet->check_OLPC);

    //Int_IniRead (FileHandle, SectionName, "Uplink Channel",     TD_NO_TEST, &TestSet->UL_Channel);
    //Int_IniRead (FileHandle, SectionName, "Downlink Channel", TD_NO_TEST, &TestSet->DL_Channel);
    Int_IniRead (FileHandle, SectionName, "Test Channel", TD_NO_TEST, &TestSet->test_channel);
    Double_IniRead(FileHandle, SectionName, "Cable Loss Input (dB)",   0.5, &TestSet->input_loss_dB);
    Double_IniRead(FileHandle, SectionName, "Cable Loss Output (dB)", 0.5, &TestSet->output_loss_dB);
    Double_IniRead(FileHandle, SectionName, "MAX PWR AVG HIGH (dBm)", 25.0, &TestSet->Max_power_high_dB);
    Double_IniRead(FileHandle, SectionName, "MAX PWR AVG LOW (dBm)",  21.0, &TestSet->Max_power_low_dB);
    Double_IniRead(FileHandle, SectionName, "MIN PWR AVG High (dBm)",   -43.0, &TestSet->Min_power_high_dB);
    Double_IniRead(FileHandle, SectionName, "OBW MAX (MHz)", 5.0, &TestSet->OBW_Max_MHz);
    Double_IniRead(FileHandle, SectionName, "ACLR 5M (dBc)",     -33.0, &TestSet->ACLR_5M_dBc);
    Double_IniRead(FileHandle, SectionName, "ACLR 10M (dBc)",   -43.0, &TestSet->ACLR_10M_dBc);
    Double_IniRead(FileHandle, SectionName, "EVM PK MAX (%)",    17.5, &TestSet->EVM_PK_Max_Percent);
    Double_IniRead(FileHandle, SectionName, "EVM RMS MAX (%)", 17.5, &TestSet->EVM_AVG_Max_Percent);
    Double_IniRead(FileHandle, SectionName, "Frequency Error Peak (Hz)", 17.5, &TestSet->frequency_error_peak_HZ);
    Double_IniRead(FileHandle, SectionName, "BER LEVEL (dBm)",   -105.0, &TestSet->BER_Level_dBm);
    Int_IniRead (FileHandle, SectionName, "BER Bit Num",     10000, &TestSet->BER_Bit_Num);
    Int_IniRead (FileHandle, SectionName, "BER Conf State", 0, &TestSet->BER_Conf_State);
    Double_IniRead(FileHandle, SectionName, "BER LIMIT (%)",       0.1, &TestSet->BER_Limit_Percent);
}

/************************************************
Descriptin:
    Load TD FT Test Cases into TD_FT_Cases[]

Return :
    the number of test cases
************************************************/
int Get_TD_FT_Cases (IniText FileHandle)
{
    char section_name[50];
    int LoopIndex = 0;
    int return_value = 0;

    strcpy (section_name, "TDD Test Case ");

    for (LoopIndex = 0; LoopIndex < TD_MAX_SUPPORTED_CASE_NUM; LoopIndex ++)
    {
        sprintf (section_name, "TDD Test Case %d", LoopIndex+1);

        return_value = Ini_SectionExists (FileHandle, section_name);
        if (return_value == 0)
        {
            break;
        }
        else
        {
            Load_TD_Setting (FileHandle, section_name, &TD_FT_Cases[LoopIndex]);
        }
    }

    return LoopIndex;

}


int TD_FT_Initialize (E_TD_INSTR instr_type, char *resource_name)
{
    TD_FT_CHECK_STATUS ( TD_RCT_Init (instr_type, resource_name) );
    TD_FT_CHECK_STATUS ( TD_RCT_Service_Mode (instr_type, 1) );  // Set mode to TD
    TD_FT_CHECK_STATUS ( TD_RCT_Reset (instr_type) );
    TD_FT_CHECK_STATUS ( TD_RCT_Call_Operating_Mode (instr_type, "OFF") );
    TD_FT_CHECK_STATUS ( TD_RCT_Call_Service_Type (instr_type, "RMC12") );
    TD_FT_CHECK_STATUS ( TD_RCT_Set_RFG_Transmit_Power(instr_type, -70.0));
    TD_FT_CHECK_STATUS ( TD_RCT_MS_Target_Power(instr_type, 24.0) );

    return 0;
Error:
    return -1;
}


int TD_FT_Preset (E_TD_INSTR instr_type, int bCal)
{
    TD_FT_CHECK_STATUS ( TD_RCT_Service_Mode (instr_type, 1) );  // Set mode to TD
    TD_FT_CHECK_STATUS ( TD_RCT_Reset (instr_type) );
    TD_FT_CHECK_STATUS ( TD_RCT_Call_Operating_Mode (instr_type, "OFF") );
    TD_FT_CHECK_STATUS ( TD_RCT_Call_Service_Type (instr_type, "RMC12") );
    TD_FT_CHECK_STATUS ( TD_RCT_Set_RFG_Transmit_Power(instr_type, -70.0));
    TD_FT_CHECK_STATUS ( TD_RCT_MS_Target_Power(instr_type, 24.0) );
	if (bCal != 1)
	{
		TD_FT_CHECK_STATUS ( TD_RCT_Preset_Ex(instr_type, 0) );
	}

    return 0;
Error:
    return -1;
}


int TD_Final_Test (E_TD_INSTR instr_type)
{
    int LoopIndex = 0;
    int fail_flag = 0;
    int return_value = 0;
    S_TD_FT_CASE temp_case;

    char message[1024];
    clock_t time_start, time_end;
    clock_t time_start_total, time_end_total;

    time_start_total = clock ();

    TD_FT_CHECK_STATUS ( TD_RCT_Call_Operating_Mode (instr_type, "CALL") );

    time_start = clock ();

    if (SP6010 == instr_type || ZY4923B == instr_type)
    {
        TD_Report_Display ("Start Register.", 0);
        TD_FT_CHECK_STATUS ( TD_RCT_Register (instr_type, pTD_Terminate_Request) );
        TD_Report_Display ("Register OK!", 0);
    }

    TD_Report_Display ("Start Originating Call.", 0);
    TD_FT_CHECK_STATUS ( TD_RCT_Call_Origenate (instr_type, 60, pTD_Terminate_Request) );
    TD_Report_Display ("Call Connected OK!\n", 0);
    time_end = clock ();
    sprintf ( message, "\n[Time Used] [Call Connected] %.2f sec", difftime(time_end, time_start)/1000 );
    TD_Report_Display (message, 1);

    for (LoopIndex = 0; LoopIndex < TD_FT_Case_Num; LoopIndex ++)
    {
        temp_case = TD_FT_Cases[LoopIndex];
        if (temp_case.test_channel == TD_NO_TEST)
        {
            continue;
        }

        sprintf (message, "\n===========UARFCN: %d===========", temp_case.test_channel);
        TD_Report_Display (message, 0);

        return_value = 0;
        switch (instr_type)
        {
        case SP6010:
            return_value = SP6010_Inner_Loop_Test (&temp_case);
            break;
        case AG8960:
            return_value = AG8960_Inner_Loop_Test (&temp_case);
            break;
		case ZY4923B:
			return_value = ZY4923B_Inner_Loop_Test (&temp_case);
			break;
        }

        if (return_value == -1)
        {
            fail_flag = 1;
            if (TD_Stop_Condition == 1)
            {
                goto Error;
            }
        }
    }

    if (fail_flag == 1)
    {
        goto Error;
    }

    time_start = clock ();
    TD_Report_Display ("\nStart Releasing Call.", 0);
    TD_FT_CHECK_STATUS ( TD_RCT_Call_Release (instr_type) );
    TD_FT_CHECK_STATUS ( TD_RCT_Call_Operating_Mode (instr_type, "OFF") );
    TD_Report_Display ("Release Call OK.", 0);
    time_end = clock ();
    sprintf ( message, "[Time Used] [Call Release] %.2f sec", difftime(time_end, time_start)/1000 );
    TD_Report_Display (message, 1);

    time_end_total = clock ();
    sprintf ( message, "\n[Total Time Used] %.2f sec", difftime(time_end_total, time_start_total)/1000 );
    TD_Report_Display (message, 1);

    return 0;

Error:

    TD_Report_Display ("Start Releasing Call.", 0);
    TD_RCT_Call_Release (instr_type);
    TD_RCT_Call_Operating_Mode (instr_type, "OFF");
    TD_Report_Display ("Release Call OK.", 0);

    time_end_total = clock ();
    sprintf ( message, "\n[Total Time Used] %.2f sec", difftime(time_end_total, time_start_total)/1000 );
    TD_Report_Display (message, 1);

    return -1;
}



/**********************************************************************

Following is SP6010 Final Test Body

***********************************************************************/
int SP6010_Inner_Loop_Test  (S_TD_FT_CASE *temp_case)
{
    int return_value = 0;
    int test_result_flag = 0;
    clock_t time_start, time_end;
    char message[128];

    time_start = clock ();

    TD_FT_CHECK_STATUS ( TD_RCT_Set_Uplink_Channel (SP6010, temp_case->test_channel) );
    TD_FT_CHECK_STATUS ( TD_RCT_Set_Uplink_Cable_Loss (SP6010, temp_case->output_loss_dB, 0, 0) );
    TD_FT_CHECK_STATUS ( TD_RCT_Set_Downlink_Cable_Loss (SP6010, temp_case->input_loss_dB, temp_case->test_channel) );

    // Max Power
    Time_Record[0] = clock ();
    if (temp_case->check_max_power == 1)
    {
        return_value = SP6010_Check_Max_Power (temp_case);
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[1] = clock ();

    TD_CHECK_TEMINATE

    // Min Power
    if (temp_case->check_min_power == 1)
    {
        return_value = SP6010_Check_Min_Power (temp_case);
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[2] = clock ();

    TD_CHECK_TEMINATE

    // PVT
    if (temp_case->check_PVT == 1)
    {
        return_value = SP6010_Check_PVT (temp_case);
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[3] = clock ();

    TD_CHECK_TEMINATE

    // OLPC
    if (temp_case->check_OLPC == 1)
    {
        return_value = SP6010_Check_OLPC (temp_case);
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[4] = clock ();

    TD_CHECK_TEMINATE

    // OBW
    if (temp_case->check_OBW == 1)
    {
        return_value = SP6010_Check_OBW (temp_case);
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[5] = clock ();

    TD_CHECK_TEMINATE

    // SEM
    if (temp_case->check_SEM == 1)
    {
        return_value = SP6010_Check_SEM (temp_case);
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[6] = clock ();

    TD_CHECK_TEMINATE

    // ACLR
    if (temp_case->check_ACLR == 1)
    {
        return_value = SP6010_Check_ACLR (temp_case);
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[7] = clock ();

    TD_CHECK_TEMINATE

    // BER
    if (temp_case->check_BER == 1)
    {
        return_value = SP6010_Check_BER ( temp_case );
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[8] = clock ();

    TD_CHECK_TEMINATE

    // WQulity
    if (temp_case->check_wave_quality == 1)
    {
        return_value = SP6010_Check_WQulity ( temp_case );
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[9] = clock ();

    // Time Report
    sprintf ( message, "\n[Time Used] [Instrument Setup]\t %.2f sec", difftime(Time_Record[0], time_start)/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [Max Power]\t %.2f sec", difftime(Time_Record[1], Time_Record[0])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [Min Power]\t %.2f sec", difftime(Time_Record[2], Time_Record[1])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [PVT]\t %.2f sec", difftime(Time_Record[3], Time_Record[2])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [OLPC]\t %.2f sec", difftime(Time_Record[4], Time_Record[3])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [OBW]\t %.2f sec", difftime(Time_Record[5], Time_Record[4])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [SEM]\t %.2f sec", difftime(Time_Record[6], Time_Record[5])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [ACLR]\t %.2f sec", difftime(Time_Record[7], Time_Record[6])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [BER]\t %.2f sec", difftime(Time_Record[8], Time_Record[7])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [WQulity]\t %.2f sec", difftime(Time_Record[9], Time_Record[8])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used in this test case] \t\t %.2f sec", difftime(Time_Record[9], time_start)/1000 );
    TD_Report_Display (message, 1);

    if ( test_result_flag == -1 )
    {
        goto Error;
    }

    return 0;

Error:
    return -1;
}

int SP6010_Check_ACLR (S_TD_FT_CASE *temp_case)
{
    double value[5];
    char pass_str[2][10] = {"Fail", "Pass"};
    char ADJ[5][10] = {"LOW3.2", "LOW1.6", "CURRENT", "UP1.6", "UP3.2"};
    double threshold[5];
    int passFlag = 0;
    int index = 0;
    char temp_buf[1024];
    char buf[1024];
    char final_buf[1024];

    strcpy (temp_buf, "");
    strcpy (buf, "");

    TD_FT_CHECK_STATUS ( TD_RCT_ACLR_Init ( SP6010,  //E_TD_INSTR instr,
                                            2,           //int avg_count,
                                            1,           //int timeslot,
                                            3,         //int timeout_sec,
                                            "OFF",     //char * continuous_mode,
                                            "MANual" // char * control_mode
                                          ) );
    //TD_FT_CHECK_STATUS ( TD_RCT_ACLR_Set_Threshold ( SP6010,
    //                                                                                           temp_case->ACLR_5M_dBc, //int upper1_dBc,
    //                                                                                           temp_case->ACLR_10M_dBc, //int upper2_dBc,
    //                                                                                            temp_case->ACLR_5M_dBc,   //int lower1_dBc,
    //                                                                                           temp_case->ACLR_10M_dBc  //int lower2_dBc
    //                                                                                         ) );
    TD_FT_CHECK_STATUS ( TD_RCT_ACLR_Start (SP6010) );
    TD_FT_CHECK_STATUS ( TD_RCT_ACLR_GetResult (SP6010, value, &passFlag) );
    TD_FT_CHECK_STATUS ( TD_RCT_ACLR_Stop (SP6010) );

    //sprintf (temp_buf, "ACLR : \t%s", pass_str[passFlag]);
    //TD_Report_Display (temp_buf, 0);

    threshold[0] = temp_case->ACLR_10M_dBc;
    threshold[1] = temp_case->ACLR_5M_dBc;
    threshold[2] = 0;
    threshold[3] = temp_case->ACLR_5M_dBc;
    threshold[4] = temp_case->ACLR_10M_dBc;

    passFlag = 1;
    for (index = 0; index < 5; index ++)
    {
        if ( index != 2 )
        {
            sprintf (temp_buf, "    %s(dBc) : \t%.3f (< %.3f)", ADJ[index], value[index], threshold[index]);
            if ( value[index] < threshold[index] )
            {
                sprintf (temp_buf, "%s, %s", temp_buf, "Pass");
            }
            else
            {
                sprintf (temp_buf, "%s, %s", temp_buf, "Fail");
                passFlag = 0;
            }
        }
        else
        {
            sprintf (temp_buf, "    %s : \t\t%.3f", ADJ[index], value[index]);
        }

        //TD_Report_Display (temp_buf, 0);
        strcat (buf, temp_buf);
        strcat (buf, "\n");
    }

    sprintf (final_buf, "ACLR : \t%s\n%s", pass_str[passFlag], buf);
    TD_Report_Display (final_buf, 0);

    if (passFlag == 0)
    {
        goto Error;
    }
    return 0;
Error:
    return -1;
}

int SP6010_Check_OBW (S_TD_FT_CASE *temp_case)
{
    double OBW_Value = 0.0;
    int passFlag = 0;
    char result[2][10] = {"Fail", "Pass"};
    char temp_buf[100];

    TD_FT_CHECK_STATUS ( TD_RCT_OBW_Init (SP6010,
                                          2,   //avg_count,
                                          1,   //int timeslot,
                                          3,   //int timeout_sec,
                                          "OFF",        //char * continuous_mode,
                                          "MANual",   //char * control_mode,
                                          99  //int percent
                                         ) );
    TD_FT_CHECK_STATUS ( TD_RCT_OBW_Start (SP6010) );
    TD_FT_CHECK_STATUS ( TD_RCT_OBW_GetResult (SP6010, &OBW_Value, &passFlag) );
    TD_FT_CHECK_STATUS ( TD_RCT_OBW_Stop (SP6010) );

    if ( OBW_Value < temp_case->OBW_Max_MHz)
    {
        passFlag = 1;
    }
    else
    {
        passFlag = 0;
    }
    sprintf (temp_buf, "OBW(MHz): %.2f  ( <%.2f )  %s", OBW_Value, temp_case->OBW_Max_MHz, result[passFlag]);
    TD_Report_Display (temp_buf, 0);
    if (passFlag == 0)
    {
        goto Error;
    }

    return 0;
Error:
    return -1;
}


int SP6010_Check_BER (S_TD_FT_CASE *temp_case)
{
    double BER_Value = 0.0;
    int passFlag = 0;
    int return_value = 0;
    char pass_str[2][10] = {"Fail", "Pass"};
    char ber_conf_state[2][8] = {"OFF", "ON"};
    char temp_str[128];

    TD_FT_CHECK_STATUS ( TD_RCT_Set_RFG_Transmit_Power (SP6010, temp_case->BER_Level_dBm) );
    return_value = TD_RCT_BER_Wait_Sync ( SP6010, 5);
    if (return_value == -1)
    {
        sprintf (temp_str, "BER Fail : MT Call drop when setting RFG Power (%.2fdBm)", temp_case->BER_Level_dBm);
        TD_Report_Display ( temp_str, 0 );
        goto Error;
    }
    //TD_FT_CHECK_STATUS ( TD_RCT_BER_Set_Conf_State (SP6010, "ON") );
    //TD_FT_CHECK_STATUS ( TD_RCT_BER_Set_Conf_State (SP6010, "OFF") );
    TD_FT_CHECK_STATUS ( TD_RCT_BER_Set_Conf_State (SP6010, ber_conf_state[temp_case->BER_Conf_State]) );
    TD_FT_CHECK_STATUS ( TD_RCT_BER_Set_Bit_Num (SP6010, temp_case->BER_Bit_Num) );
    TD_FT_CHECK_STATUS ( TD_RCT_BER_Set_Timeout (SP6010, 10) );
    TD_FT_CHECK_STATUS ( TD_RCT_BER_Start (SP6010, 20) );
    TD_FT_CHECK_STATUS ( TD_RCT_BER_Get_Result (SP6010, &BER_Value, &passFlag));
    TD_FT_CHECK_STATUS ( TD_RCT_BER_Stop (SP6010) );
    // Restore RFG power to normal
    TD_FT_CHECK_STATUS ( TD_RCT_Set_RFG_Transmit_Power (SP6010, -70) );

    /**
    sprintf (temp_str, "BER(percent) : \t%.2f \t%s", BER_Value, pass_str[passFlag]);
    TD_Report_Display (temp_str, 0);
    if ( passFlag == 0 )
    {
        goto Error;
    }
    **/

    if ( BER_Value <= temp_case->BER_Limit_Percent )
    {
        sprintf (temp_str, "BER(percent) : \t%.2f \t%s", BER_Value, "Pass");
        TD_Report_Display (temp_str, 0);
    }
    else
    {
        sprintf (temp_str, "BER(percent) : \t%.2f \t%s", BER_Value, "Fail");
        TD_Report_Display (temp_str, 0);
        goto Error;
    }

    return 0;
Error:
    return -1;
}


int SP6010_Check_Max_Power (S_TD_FT_CASE *temp_case)
{
    int passFlag = 0;
    double power_value = 0.0;
    char result_str[2][10] = {"Fail", "Pass"};
    char temp_str[128];

    TD_FT_CHECK_STATUS ( TD_RCT_Power_Set_State (SP6010, "ON") );
    TD_FT_CHECK_STATUS ( TD_RCT_Power_Set_Timeout (SP6010, 3) );
    TD_FT_CHECK_STATUS ( TD_RCT_Power_Start (SP6010) );
    TD_FT_CHECK_STATUS ( TD_RCT_Power_Get_Result (SP6010, SP6010_POWER_MAX, &power_value, &passFlag));
    TD_FT_CHECK_STATUS ( TD_RCT_Power_Stop (SP6010) );

    if ( power_value >= temp_case->Max_power_low_dB && power_value <= temp_case->Max_power_high_dB)
    {
        passFlag = 1;
    }
    else
    {
        passFlag = 0;
    }

    //sprintf (temp_str, "Max Power(dBm) : \t%.2f\t\t%s", power_value, result_str[passFlag]);
    sprintf (temp_str, "Max Power(dBm) : %.2f ( %.2f ~ %.2f ) %s", power_value,
             temp_case->Max_power_low_dB, temp_case->Max_power_high_dB, result_str[passFlag]);
    TD_Report_Display (temp_str, 0);
    if ( passFlag == 0 )
    {
        goto Error;
    }

    return 0;
Error:
    return -1;
}


int SP6010_Check_Min_Power (S_TD_FT_CASE *temp_case)
{
    int passFlag = 0;
    double power_value = 0.0;
    char result_str[2][10] = {"Fail", "Pass"};
    char temp_str[128];

    TD_FT_CHECK_STATUS ( TD_RCT_Power_Set_State (SP6010, "ON") );
    TD_FT_CHECK_STATUS ( TD_RCT_Power_Set_Timeout (SP6010, 3) );
    TD_FT_CHECK_STATUS ( TD_RCT_Power_Start (SP6010) );
    TD_FT_CHECK_STATUS ( TD_RCT_Power_Get_Result (SP6010, SP6010_POWER_MIN, &power_value, &passFlag));
    TD_FT_CHECK_STATUS ( TD_RCT_Power_Stop (SP6010) );
    //TD_FT_CHECK_STATUS ( TD_RCT_Power_Set_State (SP6010, "OFF") );

    if (power_value < temp_case->Min_power_high_dB)
    {
        passFlag = 1;
    }
    else
    {
        passFlag = 0;
    }

    sprintf (temp_str, "Min Power(dBm) : %.2f ( <%.2f ) %s", power_value, temp_case->Min_power_high_dB, result_str[passFlag]);
    TD_Report_Display (temp_str, 0);
    if ( passFlag == 0 )
    {
        goto Error;
    }

    return 0;
Error:
    return -1;
}

int SP6010_Check_PVT (S_TD_FT_CASE *temp_case)
{
    int passFlag;
    char result_str[2][10] = {"Fail", "Pass"};
    char temp_str[128];

    TD_FT_CHECK_STATUS ( TD_RCT_PVT_Set_Timeout (SP6010, 3) );
    TD_FT_CHECK_STATUS ( TD_RCT_PVT_Start (SP6010) );
    TD_FT_CHECK_STATUS ( TD_RCT_PVT_Get_Result (SP6010, &passFlag) );
    TD_FT_CHECK_STATUS ( TD_RCT_PVT_Stop (SP6010) );

    sprintf (temp_str, "PVT : \t%s", result_str[passFlag]);
    TD_Report_Display (temp_str, 0);
    if ( passFlag == 0 )
    {
        goto Error;
    }

    return 0;
Error:
    return -1;
}


int SP6010_Check_SEM (S_TD_FT_CASE *temp_case)
{
    int passFlag;
    char result_str[2][10] = {"Fail", "Pass"};
    char temp_str[128];

    TD_FT_CHECK_STATUS ( TD_RCT_SEM_Init (SP6010, 20, 1, 3, "OFF") );
    TD_FT_CHECK_STATUS ( TD_RCT_SEM_Start (SP6010) );
    TD_FT_CHECK_STATUS ( TD_RCT_SEM_Get_Result (SP6010, &passFlag) );
    TD_FT_CHECK_STATUS ( TD_RCT_SEM_Stop (SP6010) );

    sprintf (temp_str, "SEM : \t%s", result_str[passFlag]);
    TD_Report_Display (temp_str, 0);
    if ( passFlag == 0 )
    {
        goto Error;
    }

    return 0;
Error:
    return -1;
}


int SP6010_Check_WQulity (S_TD_FT_CASE *temp_case)
{
    int passFlag = 1;
    char temp_str[1024];

    double d_EVM = 0.0;
    double d_EVM_Peak = 0.0;
    double d_FE = 0.0;

    TD_FT_CHECK_STATUS ( TD_RCT_WQulity_Set_Timeout (SP6010, 3) );
    TD_FT_CHECK_STATUS ( TD_RCT_WQulity_Start (SP6010) );
    TD_FT_CHECK_STATUS ( TD_RCT_WQulity_Get_AVG_EVM (SP6010, &d_EVM) );
    TD_FT_CHECK_STATUS ( TD_RCT_WQulity_Get_Peak_EVM (SP6010, &d_EVM_Peak) );
    TD_FT_CHECK_STATUS ( TD_RCT_WQulity_Get_FE (SP6010, &d_FE) );
    TD_FT_CHECK_STATUS ( TD_RCT_WQulity_Stop (SP6010) );

    if (d_EVM > temp_case->EVM_AVG_Max_Percent)
    {
        sprintf (temp_str, "EVM AVG(percent): %.2f    (< %.2f) Fail", d_EVM, temp_case->EVM_AVG_Max_Percent);
        TD_Report_Display (temp_str, 0);
        passFlag = 0;
    }
    else
    {
        sprintf (temp_str, "EVM AVG(percent): %.2f    (< %.2f) Pass", d_EVM, temp_case->EVM_AVG_Max_Percent);
        TD_Report_Display (temp_str, 0);
    }

    if (d_EVM_Peak > temp_case->EVM_PK_Max_Percent)
    {
        sprintf (temp_str, "EVM PEAK(percent): %.2f    (< %.2f) Fail", d_EVM_Peak, temp_case->EVM_PK_Max_Percent);
        TD_Report_Display (temp_str, 0);
        passFlag = 0;
    }
    else
    {
        sprintf (temp_str, "EVM PEAK(percent): %.2f    (< %.2f) Pass", d_EVM_Peak, temp_case->EVM_PK_Max_Percent);
        TD_Report_Display (temp_str, 0);
    }

    if (d_FE > temp_case->frequency_error_peak_HZ || d_FE < -1 * temp_case->frequency_error_peak_HZ)
    {
        sprintf (temp_str, "FE(Hz): %.2f    ( %.2f ~ %.2f ) Fail", d_FE, -1 * temp_case->frequency_error_peak_HZ, temp_case->frequency_error_peak_HZ);
        TD_Report_Display (temp_str, 0);
        passFlag = 0;
    }
    else
    {
        sprintf (temp_str, "FE(Hz): %.2f    ( %.2f ~ %.2f ) Pass", d_FE, -1 * temp_case->frequency_error_peak_HZ, temp_case->frequency_error_peak_HZ);
        TD_Report_Display (temp_str, 0);
    }

    if ( passFlag == 0 )
    {
        goto Error;
    }

    return 0;
Error:
    return -1;
}


int SP6010_Check_OLPC (S_TD_FT_CASE *temp_case)
{
    int passFlag;
    char result_str[2][10] = {"Fail", "Pass"};
    char temp_str[128];

    TD_FT_CHECK_STATUS ( TD_RCT_OLPC_Init (SP6010, 3) );
    TD_FT_CHECK_STATUS ( TD_RCT_OLPC_Start (SP6010) );
    TD_FT_CHECK_STATUS ( TD_RCT_OLPC_Get_Result (SP6010, &passFlag) );
    TD_FT_CHECK_STATUS ( TD_RCT_OLPC_Stop (SP6010) );

    sprintf (temp_str, "OLPC : \t%s", result_str[passFlag]);
    TD_Report_Display (temp_str, 0);
    if ( passFlag == 0 )
    {
        goto Error;
    }

    return 0;
Error:
    return -1;
}





/**********************************************************************

Following is AG8960 Final Test Body

***********************************************************************/
int AG8960_Inner_Loop_Test  (S_TD_FT_CASE *temp_case)
{
    int return_value = 0;
    int test_result_flag = 0;
    clock_t time_start, time_end;
    char message[128];
    S_TD_A_NVRAM_FREQ_RANGE_T freq_range;
    int band = 0;

    time_start = clock ();
    TD_FT_CHECK_STATUS ( TD_RCT_Set_Uplink_Channel (AG8960, temp_case->test_channel) );
    TD_FT_CHECK_STATUS ( TD_RCT_Set_RFG_Transmit_Power(AG8960, -70.0));

    freq_range = Get_NvFreqRangeSupport ( m_usTDA_COMMON_BAND );
    band = Get_BandIndexForChannel (freq_range, temp_case->test_channel);
    TD_FT_CHECK_STATUS ( TD_RCT_Set_Uplink_Cable_Loss(AG8960, -1*temp_case->output_loss_dB,
                         freq_range.us_min_uarfcn[band], freq_range.us_max_uarfcn[band]) );

    // Max Power
    Time_Record[0] = clock ();
    if (temp_case->check_max_power == 1)
    {
        return_value = AG8960_Check_Max_Power (temp_case);
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[1] = clock ();

    TD_CHECK_TEMINATE

    // Min Power
    if (temp_case->check_min_power == 1)
    {
        return_value = AG8960_Check_Min_Power (temp_case);
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[2] = clock ();

    TD_CHECK_TEMINATE

    // PVT
    if (temp_case->check_PVT == 1)
    {
        //return_value = SP6010_Check_PVT (temp_case);
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[3] = clock ();

    TD_CHECK_TEMINATE

    // OLPC
    if (temp_case->check_OLPC == 1)
    {
        return_value = AG8960_Check_OLPC (temp_case);
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[4] = clock ();

    TD_CHECK_TEMINATE

    // OBW
    if (temp_case->check_OBW == 1)
    {
        return_value = AG8960_Check_OBW (temp_case);
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[5] = clock ();

    TD_CHECK_TEMINATE

    // SEM
    if (temp_case->check_SEM == 1)
    {
        return_value = AG8960_Check_SEM (temp_case);
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[6] = clock ();

    TD_CHECK_TEMINATE

    // ACLR
    if (temp_case->check_ACLR == 1)
    {
        return_value = AG8960_Check_ACLR (temp_case);
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[7] = clock ();

    TD_CHECK_TEMINATE

    // BER
    if (temp_case->check_BER == 1)
    {
        return_value = AG8960_Check_BER ( temp_case );
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[8] = clock ();

    TD_CHECK_TEMINATE

    // WQulity
    if (temp_case->check_wave_quality == 1)
    {
        return_value = AG8960_Check_WQulity (temp_case);
        if ( return_value == -1 )
        {
            test_result_flag = -1;
            if ( TD_Stop_Condition == 1 )
            {
                goto Error;
            }
        }
    }
    Time_Record[9] = clock ();

    // Time Report
    sprintf ( message, "\n[Time Used] [Instrument Setup]\t %.2f sec", difftime(Time_Record[0], time_start)/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [Max Power]\t %.2f sec", difftime(Time_Record[1], Time_Record[0])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [Min Power]\t %.2f sec", difftime(Time_Record[2], Time_Record[1])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [PVT]\t %.2f sec", difftime(Time_Record[3], Time_Record[2])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [OLPC]\t %.2f sec", difftime(Time_Record[4], Time_Record[3])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [OBW]\t %.2f sec", difftime(Time_Record[5], Time_Record[4])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [SEM]\t %.2f sec", difftime(Time_Record[6], Time_Record[5])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [ACLR]\t %.2f sec", difftime(Time_Record[7], Time_Record[6])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [BER]\t %.2f sec", difftime(Time_Record[8], Time_Record[7])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used] [WQulity]\t %.2f sec", difftime(Time_Record[9], Time_Record[8])/1000 );
    TD_Report_Display (message, 1);

    sprintf ( message, "[Time Used in this test case] \t\t %.2f sec", difftime(Time_Record[9], time_start)/1000 );
    TD_Report_Display (message, 1);

    if ( test_result_flag == -1 )
    {
        goto Error;
    }

    return 0;

Error:
    return -1;
}


int AG8960_Check_Max_Power (S_TD_FT_CASE *temp_case)
{
    int passFlag = 0;
    double power_value = 0.0;
    char result_str[2][10] = {"Fail", "Pass"};
    char temp_str[128];

    TD_FT_CHECK_STATUS ( TD_RCT_Meas_TxPower_Setup (AG8960, 0, 10, 3000) );
    TD_FT_CHECK_STATUS ( TD_RCT_Receiver_Power_Control(AG8960, "ON") );
    TD_FT_CHECK_STATUS ( TD_RCT_UL_Power_Control_Mode (AG8960, "ACT") );
    TD_FT_CHECK_STATUS ( TD_RCT_MS_Target_Power (AG8960, 24.0) );
    TD_FT_CHECK_STATUS ( TD_RCT_UL_Power_Control_Mode (AG8960, "UP") );
    Sleep (500);
    TD_FT_CHECK_STATUS ( TD_RCT_Power_Start (AG8960) );
    TD_FT_CHECK_STATUS ( TD_RCT_Meas_TxPower (AG8960, &power_value) );
    TD_FT_CHECK_STATUS ( TD_RCT_Power_Stop (AG8960) );

    TD_FT_CHECK_STATUS ( TD_RCT_UL_Power_Control_Mode (AG8960, "ACT") ); // restore to Active bits
    //TD_FT_CHECK_STATUS ( TD_RCT_MS_Target_Power (AG8960, 5.0) );

    if ( power_value >= temp_case->Max_power_low_dB && power_value <= temp_case->Max_power_high_dB)
    {
        passFlag = 1;
    }
    else
    {
        passFlag = 0;
    }

    //sprintf (temp_str, "Max Power(dBm) : \t%.2f\t\t%s", power_value, result_str[passFlag]);
    sprintf (temp_str, "Max Power(dBm) : %.2f ( %.2f ~ %.2f ) %s", power_value,
             temp_case->Max_power_low_dB, temp_case->Max_power_high_dB, result_str[passFlag]);
    TD_Report_Display (temp_str, 0);
    if ( passFlag == 0 )
    {
        goto Error;
    }

    return 0;
Error:
    return -1;
}

int AG8960_Check_Min_Power (S_TD_FT_CASE *temp_case)
{
    int passFlag = 0;
    double power_value = 0.0;
    char result_str[2][10] = {"Fail", "Pass"};
    char temp_str[128];

    TD_FT_CHECK_STATUS ( TD_RCT_Meas_TxPower_Setup (AG8960, 0, 10, 3000) );
    TD_FT_CHECK_STATUS ( TD_RCT_Receiver_Power_Control(AG8960, "ON") );
    TD_FT_CHECK_STATUS ( TD_RCT_UL_Power_Control_Mode (AG8960, "ACT") );
    TD_FT_CHECK_STATUS ( TD_RCT_MS_Target_Power (AG8960, -10.0) ); // incase drop call
    TD_FT_CHECK_STATUS ( TD_RCT_MS_Target_Power (AG8960, -55.0) );
    TD_FT_CHECK_STATUS ( TD_RCT_UL_Power_Control_Mode (AG8960, "DOWN") );
    Sleep (500);
    TD_FT_CHECK_STATUS ( TD_RCT_Power_Start (AG8960) );
    //TD_FT_CHECK_STATUS ( TD_RCT_Power_Get_Result (AG8960, SP6010_POWER_MIN, &power_value, &passFlag));
    TD_FT_CHECK_STATUS ( TD_RCT_Meas_TxPower (AG8960, &power_value) );
    TD_FT_CHECK_STATUS ( TD_RCT_Power_Stop (AG8960) );

    TD_FT_CHECK_STATUS ( TD_RCT_UL_Power_Control_Mode (AG8960, "UP") ); // restore to Active bits
    Sleep (100);
    TD_FT_CHECK_STATUS ( TD_RCT_MS_Target_Power (AG8960, 24.0) );
    TD_FT_CHECK_STATUS ( TD_RCT_UL_Power_Control_Mode (AG8960, "ACT") );
    Sleep (200);

    if (power_value < temp_case->Min_power_high_dB)
    {
        passFlag = 1;
    }
    else
    {
        passFlag = 0;
    }

    sprintf (temp_str, "Min Power(dBm) : %.2f ( <%.2f ) %s", power_value, temp_case->Min_power_high_dB, result_str[passFlag]);
    TD_Report_Display (temp_str, 0);
    if ( passFlag == 0 )
    {
        goto Error;
    }

    return 0;
Error:
    return -1;
}


int AG8960_Check_OBW (S_TD_FT_CASE *temp_case)
{
    double OBW_Value = 0.0;
    int passFlag = 0;
    char result[2][10] = {"Fail", "Pass"};
    char temp_buf[100];

    TD_FT_CHECK_STATUS ( TD_RCT_OBW_Init (AG8960,
                                          2,   //avg_count,
                                          1,   //int timeslot,
                                          3,   //int timeout_sec,
                                          "OFF",        //char * continuous_mode,
                                          "MANual",   //char * control_mode,
                                          99  //int percent
                                         ) );
    TD_FT_CHECK_STATUS ( TD_RCT_OBW_Start (AG8960) );
    TD_FT_CHECK_STATUS ( TD_RCT_OBW_GetResult (AG8960, &OBW_Value, &passFlag) );
    TD_FT_CHECK_STATUS ( TD_RCT_OBW_Stop (AG8960) );

    OBW_Value = OBW_Value / 1000000.00; // to MHz
    if ( OBW_Value < temp_case->OBW_Max_MHz)
    {
        passFlag = 1;
    }
    else
    {
        passFlag = 0;
    }
    sprintf (temp_buf, "OBW(MHz): %.2f  ( <%.2f )  %s", OBW_Value, temp_case->OBW_Max_MHz, result[passFlag]);
    TD_Report_Display (temp_buf, 0);
    if (passFlag == 0)
    {
        goto Error;
    }

    return 0;
Error:
    return -1;
}


int AG8960_Check_ACLR (S_TD_FT_CASE *temp_case)
{
    double value[5];
    char pass_str[2][10] = {"Fail", "Pass"};
    char ADJ[5][10] = {"LOW3.2", "LOW1.6", "CURRENT", "UP1.6", "UP3.2"};
    double threshold[5];
    int passFlag = 0;
    int index = 0;
    char temp_buf[1024];
    char buf[1024];
    char final_buf[1024];

    strcpy (temp_buf, "");
    strcpy (buf, "");

    TD_FT_CHECK_STATUS ( TD_RCT_ACLR_Init ( AG8960,  //E_TD_INSTR instr,
                                            2,           //int avg_count,
                                            1,           //int timeslot,
                                            3,         //int timeout_sec,
                                            "OFF",     //char * continuous_mode,
                                            "MANual" // char * control_mode
                                          ) );
    //TD_FT_CHECK_STATUS ( TD_RCT_ACLR_Set_Threshold ( SP6010,
    //                                                                                           temp_case->ACLR_5M_dBc, //int upper1_dBc,
    //                                                                                           temp_case->ACLR_10M_dBc, //int upper2_dBc,
    //                                                                                            temp_case->ACLR_5M_dBc,   //int lower1_dBc,
    //                                                                                           temp_case->ACLR_10M_dBc  //int lower2_dBc
    //                                                                                         ) );
    TD_FT_CHECK_STATUS ( TD_RCT_ACLR_Start (AG8960) );
    TD_FT_CHECK_STATUS ( TD_RCT_ACLR_GetResult (AG8960, value, &passFlag) );
    TD_FT_CHECK_STATUS ( TD_RCT_ACLR_Stop (AG8960) );

    //sprintf (temp_buf, "ACLR : \t%s", pass_str[passFlag]);
    //TD_Report_Display (temp_buf, 0);

    threshold[0] = temp_case->ACLR_10M_dBc;
    threshold[1] = temp_case->ACLR_5M_dBc;
    threshold[2] = 0;
    threshold[3] = temp_case->ACLR_5M_dBc;
    threshold[4] = temp_case->ACLR_10M_dBc;

    passFlag = 1;
    for (index = 0; index < 5; index ++)
    {
        if ( index != 2 )
        {
            sprintf (temp_buf, "    %s(dBc) : \t%.3f (< %.3f)", ADJ[index], value[index], threshold[index]);
            if ( value[index] < threshold[index] )
            {
                sprintf (temp_buf, "%s, %s", temp_buf, "Pass");
            }
            else
            {
                sprintf (temp_buf, "%s, %s", temp_buf, "Fail");
                passFlag = 0;
            }
        }
        else
        {
            sprintf (temp_buf, "    %s : \t\t%.3f", ADJ[index], value[index]);
        }

        //TD_Report_Display (temp_buf, 0);
        strcat (buf, temp_buf);
        strcat (buf, "\n");
    }

    sprintf (final_buf, "ACLR : \t%s\n%s", pass_str[passFlag], buf);
    TD_Report_Display (final_buf, 0);

    if (passFlag == 0)
    {
        goto Error;
    }
    return 0;
Error:
    return -1;
}


int AG8960_Check_SEM (S_TD_FT_CASE *temp_case)
{
    int passFlag;
    char result_str[2][10] = {"Pass", "Fail"};
    char temp_str[128];

    TD_FT_CHECK_STATUS ( TD_RCT_SEM_Init (AG8960, 20, 1, 3, "OFF") );
    TD_FT_CHECK_STATUS ( TD_RCT_SEM_Start (AG8960) );
    TD_FT_CHECK_STATUS ( TD_RCT_SEM_Get_Result (AG8960, &passFlag) );
    TD_FT_CHECK_STATUS ( TD_RCT_SEM_Stop (AG8960) );

    sprintf (temp_str, "SEM : \t%s", result_str[passFlag]);
    TD_Report_Display (temp_str, 0);
    if ( passFlag == 1 )
    {
        goto Error;
    }

    return 0;
Error:
    return -1;
}


int AG8960_Check_WQulity (S_TD_FT_CASE *temp_case)
{
    int passFlag = 1;
    char temp_str[1024];

    double d_EVM = 0.0;
    double d_EVM_Peak = 0.0;
    double d_FE = 0.0;

    TD_FT_CHECK_STATUS ( TD_RCT_WQulity_Init(AG8960, 3, 0, 5, "OFF"));
    TD_FT_CHECK_STATUS ( TD_RCT_WQulity_Start (AG8960) );
    TD_FT_CHECK_STATUS ( TD_RCT_WQulity_Get_AVG_EVM (AG8960, &d_EVM) );
    TD_FT_CHECK_STATUS ( TD_RCT_WQulity_Get_Peak_EVM (AG8960, &d_EVM_Peak) );
    TD_FT_CHECK_STATUS ( TD_RCT_WQulity_Get_FE (AG8960, &d_FE) );
    TD_FT_CHECK_STATUS ( TD_RCT_WQulity_Stop (AG8960) );

    if (d_EVM > temp_case->EVM_AVG_Max_Percent)
    {
        sprintf (temp_str, "EVM AVG(percent): %.2f    (< %.2f) Fail", d_EVM, temp_case->EVM_AVG_Max_Percent);
        TD_Report_Display (temp_str, 0);
        passFlag = 0;
    }
    else
    {
        sprintf (temp_str, "EVM AVG(percent): %.2f    (< %.2f) Pass", d_EVM, temp_case->EVM_AVG_Max_Percent);
        TD_Report_Display (temp_str, 0);
    }

    if (d_EVM_Peak > temp_case->EVM_PK_Max_Percent)
    {
        sprintf (temp_str, "EVM PEAK(percent): %.2f    (< %.2f) Fail", d_EVM_Peak, temp_case->EVM_PK_Max_Percent);
        TD_Report_Display (temp_str, 0);
        passFlag = 0;
    }
    else
    {
        sprintf (temp_str, "EVM PEAK(percent): %.2f    (< %.2f) Pass", d_EVM_Peak, temp_case->EVM_PK_Max_Percent);
        TD_Report_Display (temp_str, 0);
    }

    if (d_FE > temp_case->frequency_error_peak_HZ || d_FE < -1 * temp_case->frequency_error_peak_HZ)
    {
        sprintf (temp_str, "FE(Hz): %.2f    ( %.2f ~ %.2f ) Fail", d_FE, -1 * temp_case->frequency_error_peak_HZ, temp_case->frequency_error_peak_HZ);
        TD_Report_Display (temp_str, 0);
        passFlag = 0;
    }
    else
    {
        sprintf (temp_str, "FE(Hz): %.2f    ( %.2f ~ %.2f ) Pass", d_FE, -1 * temp_case->frequency_error_peak_HZ, temp_case->frequency_error_peak_HZ);
        TD_Report_Display (temp_str, 0);
    }

    if ( passFlag == 0 )
    {
        goto Error;
    }

    return 0;
Error:
    return -1;
}


int AG8960_Check_OLPC (S_TD_FT_CASE *temp_case)
{
    int passFlag = 0;
    char result_str[2][10] = {"Pass", "Fail"};
    char temp_str[128];

    TD_FT_CHECK_STATUS ( TD_RCT_OLPC_Init (AG8960, 3) );
    Sleep (500);
    TD_FT_CHECK_STATUS ( TD_RCT_OLPC_Start (AG8960) );
    TD_FT_CHECK_STATUS ( TD_RCT_OLPC_Get_Result (AG8960, &passFlag) );
    TD_FT_CHECK_STATUS ( TD_RCT_OLPC_Stop (AG8960) );

    sprintf (temp_str, "CLPC : \t%s", result_str[passFlag]);
    TD_Report_Display (temp_str, 0);
    if ( passFlag == 1 )
    {
        goto Error;
    }

    return 0;
Error:
    return -1;
}


int AG8960_Check_BER (S_TD_FT_CASE *temp_case)
{
    double BER_Value = 0.0;
    int passFlag = 0;
    int return_value = 0;
    char pass_str[2][10] = {"Fail", "Pass"};
    char ber_conf_state[2][8] = {"OFF", "ON"};
    char temp_str[128];

    TD_FT_CHECK_STATUS ( TD_RCT_BER_Init(AG8960, temp_case->BER_Bit_Num, 20, temp_case->BER_Level_dBm) );
    TD_FT_CHECK_STATUS ( TD_RCT_BER_Start (AG8960, 20) );
    TD_FT_CHECK_STATUS ( TD_RCT_BER_Get_Result (AG8960, &BER_Value, &passFlag));
    TD_FT_CHECK_STATUS ( TD_RCT_BER_Stop (AG8960) );
    // Restore RFG power to normal
    TD_FT_CHECK_STATUS ( TD_RCT_Set_RFG_Transmit_Power (AG8960, -70) );

    if ( BER_Value <= temp_case->BER_Limit_Percent )
    {
        sprintf (temp_str, "BER(percent) : \t%.2f \t%s", BER_Value, "Pass");
        TD_Report_Display (temp_str, 0);
    }
    else
    {
        sprintf (temp_str, "BER(percent) : \t%.2f \t%s", BER_Value, "Fail");
        TD_Report_Display (temp_str, 0);
        goto Error;
    }

    return 0;
Error:
    return -1;
}








