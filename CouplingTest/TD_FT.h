#ifndef _TD_FT_H_
#define _TD_FT_H_

#include "inifile.h"
#include <formatio.h>
#include "TD_RCT.h"

#define TD_MAX_SUPPORTED_CASE_NUM 40
#define TD_NO_TEST -9999

#define TD_FT_CHECK_STATUS(status) if( 0!=(status) ){goto Error;}


//#define TD_CHECK_TEMINATE if(*TD_Terminate_Request==1){goto Error;}

/**
int TD_Report_Panel;
int TD_Report_Ctrl;
int TD_Report_Detail;
int *TD_Stop_Condition;
int *TD_Terminate_Request;
char *TD_Report_Handle;
**/

clock_t Time_Record[40];

typedef struct
{
    int check_max_power;
    int check_min_power;
    int check_PVT;
    int check_OBW;
    int check_ACLR;
    int check_SEM;
    int check_wave_quality;
    int check_BER;
    int check_OLPC;

    //int UL_Channel;
    //int DL_Channel;
    int test_channel;
    double input_loss_dB;
    double output_loss_dB;
    double Max_power_high_dB;
    double Max_power_low_dB;
    double Min_power_high_dB;
    double OBW_Max_MHz;
    double ACLR_5M_dBc;
    double ACLR_10M_dBc;
    double BER_Level_dBm;
    int BER_Bit_Num;
    int BER_Conf_State;
    double BER_Limit_Percent;
    double EVM_AVG_Max_Percent;
    double EVM_PK_Max_Percent;
    double frequency_error_peak_HZ;
} S_TD_FT_CASE;
S_TD_FT_CASE TD_FT_Cases[TD_MAX_SUPPORTED_CASE_NUM];
int TD_FT_Case_Num;

//Functions
void Load_TD_Setting (IniText FileHandle, char *SectionName, S_TD_FT_CASE *TestSet);
int Get_TD_FT_Cases (IniText FileHandle);

void TD_Report_Display ( char *msg, int detail_display);
int TD_FT_Initialize (E_TD_INSTR instr_type, char *resource_name);
int TD_FT_Preset (E_TD_INSTR instr_type, int bCal);
int TD_Final_Test (E_TD_INSTR instr_type);

// SP6010 Final Test
int SP6010_Inner_Loop_Test  (S_TD_FT_CASE *temp_case);
int SP6010_Check_ACLR (S_TD_FT_CASE *temp_case);
int SP6010_Check_OBW (S_TD_FT_CASE *temp_case);
int SP6010_Check_BER (S_TD_FT_CASE *temp_case);
int SP6010_Check_SEM (S_TD_FT_CASE *temp_case);
int SP6010_Check_Max_Power (S_TD_FT_CASE *temp_case);
int SP6010_Check_Min_Power (S_TD_FT_CASE *temp_case);
int SP6010_Check_PVT (S_TD_FT_CASE *temp_case);
int SP6010_Check_WQulity (S_TD_FT_CASE *temp_case);
int SP6010_Check_OLPC (S_TD_FT_CASE *temp_case);

// AG8960 Final Test
int AG8960_Inner_Loop_Test  (S_TD_FT_CASE *temp_case);
int AG8960_Check_Max_Power (S_TD_FT_CASE *temp_case);
int AG8960_Check_Min_Power (S_TD_FT_CASE *temp_case);
int AG8960_Check_OBW (S_TD_FT_CASE *temp_case);
int AG8960_Check_ACLR (S_TD_FT_CASE *temp_case);
int AG8960_Check_SEM (S_TD_FT_CASE *temp_case);
int AG8960_Check_WQulity (S_TD_FT_CASE *temp_case);
int AG8960_Check_OLPC (S_TD_FT_CASE *temp_case);
int AG8960_Check_BER (S_TD_FT_CASE *temp_case);

int ZY4923B_Inner_Loop_Test  (S_TD_FT_CASE *temp_case);


#endif

