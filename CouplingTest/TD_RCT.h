#ifndef __TD_RCT_H__
#define __TD_RCT_H__

#include "TD_SP6010.h"
#include "TD_AG8960.h"
#include "TD_MT8820.h"
#include "TD_ZY4923B.h"

#define TD_INSTR_NOT_SUPPORT -99

typedef enum
{
    SP6010 = 0,
    AG8960,
    MT8820,
    ZY4923B,

    TD_INSTR_UNKOWN
} E_TD_INSTR;
E_TD_INSTR TD_Instr;

//double TD_CableLoss_Input[E_TD_A_NVRAM_BAND_NUM];
//double TD_CableLoss_Output[E_TD_A_NVRAM_BAND_NUM];

int TD_RCT_Init (E_TD_INSTR instr, char *resource_name);
int TD_RCT_Close (E_TD_INSTR instr);
int TD_RCT_Service_Mode (E_TD_INSTR instr, int mode);

int TD_RCT_Reset (E_TD_INSTR instr);
int TD_RCT_Call_Operating_Mode (E_TD_INSTR instr, char *mode);
int TD_RCT_Call_Service_Type (E_TD_INSTR instr, char *type);
int TD_RCT_Set_Downlink_Cable_Loss (E_TD_INSTR instr, double dB, int channel);
int TD_RCT_Set_Uplink_Cable_Loss (E_TD_INSTR instr, double dB, int start_channel, int end_channel);
int TD_RCT_Register (E_TD_INSTR instr, int *stop);
int TD_RCT_StartOrEndCall(E_TD_INSTR instr, int bStart);
int TD_RCT_Call_Origenate ( E_TD_INSTR instr, int timeout_sec, int *stop );
int TD_RCT_Call_Release (E_TD_INSTR instr);
int TD_RCT_Set_Uplink_Channel (E_TD_INSTR instr, int channel);
int TD_RCT_Receiver_Power_Control (E_TD_INSTR instr, char *mode);
int TD_RCT_Receiver_Manual_Power (E_TD_INSTR instr, double manual_power_dBm);
int TD_RCT_MS_Target_Power (E_TD_INSTR instr, double target_power_dBm);
int TD_RCT_Preset_Ex (E_TD_INSTR instr, int contin_mode);
int TD_RCT_UL_Power_Control_Mode (E_TD_INSTR instr, char *mode);

int TD_RCT_SetCellMode(E_TD_INSTR instr, char CellMode[]);
//int TD_RCT_SetCableloss(E_TD_INSTR instr, E_TD_A_NVRAM_BAND_T band);
int TD_RCT_SetChannel(E_TD_INSTR instr, int TestChannel);
int TD_RCT_Meas_Freq_Setup(E_TD_INSTR instr, int IF_Continuous, int Average_Count, int TimeOut_ms);
int TD_RCT_Meas_Freq_Init_Pre (E_TD_INSTR instr);
int TD_RCT_Meas_Freq_Init (E_TD_INSTR instr);
int TD_RCT_Meas_Freq(E_TD_INSTR instr, double *FreqError);
int TD_RCT_Meas_Freq_Abort (E_TD_INSTR instr);
int TD_RCT_Meas_TxPower_Setup(E_TD_INSTR instr, int IF_Continuous, int Average_Count, int TimeOut_ms);
int TD_RCT_Meas_TxPower_Init (E_TD_INSTR instr);
int TD_RCT_Meas_TxPower(E_TD_INSTR instr, double *pTxPower);
int TD_RCT_Meas_TxPower_Abort (E_TD_INSTR instr);


//OBW
int TD_RCT_OBW_Init (E_TD_INSTR instr, int avg_count, int timeslot,
                     int timeout_sec, char *continuous_mode, char *control_mode, int percent);
int TD_RCT_OBW_Start (E_TD_INSTR instr);
int TD_RCT_OBW_GetResult (E_TD_INSTR instr, double *value, int *passFlag);
int TD_RCT_OBW_Stop (E_TD_INSTR instr);

//ACLR
int TD_RCT_ACLR_Init (E_TD_INSTR instr, int avg_count, int timeslot,
                      int timeout_sec, char *continuous_mode, char *control_mode);
int TD_RCT_ACLR_Set_Threshold (E_TD_INSTR instr, int upper1_dBc, int upper2_dBc, int lower1_dBc, int lower2_dBc);
int TD_RCT_ACLR_Start (E_TD_INSTR instr);
int TD_RCT_ACLR_GetResult(E_TD_INSTR instr, double *value, int *passFlag);
int TD_RCT_ACLR_Stop (E_TD_INSTR instr);

// BER
int TD_RCT_BER_Init (E_TD_INSTR instr, int bit_number, int timeout_sec, double cell_power);
int TD_RCT_BER_Set_Timeout (E_TD_INSTR instr, int timeout_sec);
int TD_RCT_Set_RFG_Transmit_Power (E_TD_INSTR instr, double dBm);
int TD_RCT_BER_Wait_Sync (E_TD_INSTR instr, int timeout_sec);
int TD_RCT_BER_Set_Conf_State (E_TD_INSTR instr, char *state);
int TD_RCT_BER_Set_Bit_Num (E_TD_INSTR instr, int bit_num);
int TD_RCT_BER_Start (E_TD_INSTR instr, int timeout_sec);
int TD_RCT_BER_Get_Result (E_TD_INSTR instr, double *value, int *passFlag);
int TD_RCT_BER_Stop (E_TD_INSTR instr);

//SEM
int TD_RCT_SEM_Init (E_TD_INSTR instr, int avg_count, int timeslot,
                     int timeout_sec, char *continuous_mode);
int TD_RCT_SEM_Start (E_TD_INSTR instr);
int TD_RCT_SEM_Get_Result (E_TD_INSTR instr, int *passFlag);
int TD_RCT_SEM_Stop (E_TD_INSTR instr);

// Power
int TD_RCT_Power_Set_Timeout (E_TD_INSTR instr, int timeout_sec);
int TD_RCT_Power_Set_State (E_TD_INSTR instr, char *state);
int TD_RCT_Power_Set_Count (E_TD_INSTR instr, int count);
int TD_RCT_Power_Set_Trigger_Source (E_TD_INSTR instr, E_8960_TD_TRIGGER_SOURCE trigger);
int TD_RCT_Power_Init(E_TD_INSTR instr);
int TD_RCT_Power_Start (E_TD_INSTR instr);
int TD_RCT_Power_Get_Result (E_TD_INSTR instr, SP6010_POWER_TYPE power_type, double *value, int *passFlag);
int TD_RCT_Power_Stop (E_TD_INSTR instr);

//PVT
int TD_RCT_PVT_Set_Timeout(E_TD_INSTR instr, int timeout_sec);
int TD_RCT_PVT_Start (E_TD_INSTR instr);
int TD_RCT_PVT_Get_Result (E_TD_INSTR instr, int *passFlag);
int TD_RCT_PVT_Stop (E_TD_INSTR instr);

//WQulity
int TD_RCT_WQulity_Set_Timeout (E_TD_INSTR instr, int timeout_sec);
int TD_RCT_WQulity_Init (E_TD_INSTR instr, int avg_count, int timeslot,
                         int timeout_sec, char *continuous_mode);
int TD_RCT_WQulity_Start (E_TD_INSTR instr);
int TD_RCT_WQulity_Get_AVG_EVM (E_TD_INSTR instr, double *d_EVM);
int TD_RCT_WQulity_Get_Peak_EVM (E_TD_INSTR instr, double *d_EVM);
int TD_RCT_WQulity_Get_FE (E_TD_INSTR instr, double *d_FE);
int TD_RCT_WQulity_Stop (E_TD_INSTR instr);

//OLPC
int TD_RCT_OLPC_Init (E_TD_INSTR instr,  int timeout_sec);
int TD_RCT_OLPC_Start (E_TD_INSTR instr);
int TD_RCT_OLPC_Get_Result (E_TD_INSTR instr, int *passFlag);
int TD_RCT_OLPC_Stop (E_TD_INSTR instr);

#endif
