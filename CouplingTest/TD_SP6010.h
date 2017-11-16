#ifndef __TD_SP6010_H__
#define __TD_SP6010_H__

#include <visa.h>
#include "SP6010_Common.h"

#define SP6010_SUCCESS_STATUS 0xFFFF

typedef enum
{
    SP6010_POWER_MAX,
    SP6010_POWER_MIN,
    SP6010_POWER_CL
} SP6010_POWER_TYPE;

typedef enum
{
    SP6010_PVT_POWER_ON,
    SP6010_PVT_POWER_OFF
} SP6010_PVT_TYPE;

int SP6010_GPIB_Address;
ViSession SP6010_Handle;

ViStatus sp6010_QueryOpcFinished ( void );

int SP6010_Register_Start (void);
int SP6010_Wait_Register (int timeout_sec, int *stop);
int SP6010_Call_Originate (void);
int SP6010_Wait_Call_Connected (int timeout_sec, int *stop);
int SP6010_Call_Release (void);
int SP6010_Call_End ( void );
int SP6010_Wait_Call_Release (int timeout_sec);
int SP6010_Call_Service_Type (char *type);
int SP6010_Call_Operating_Mode (char *mode);
int SP6010_Call_Revision (char *revision);
int SP6010_Set_Downlink_Loss (double dBm);
int SP6010_Set_Uplink_Loss (double dBm);
int SP6010_Set_Uplink_Channel (int channel);

// ACLR
int SP6010_ACLR_Set_Avg_Count (int count);
int SP6010_ACLR_Set_TSlot (int timeslot);
int SP6010_ACLR_Set_Timeout (int timeout_sec);
int SP6010_ACLR_Set_Continuous_Mode (char * mode);
int SP6010_ACLR_Set_Control_Mode (char * mode);
int SP6010_ACLR_Set_Upper1_Threshold (double dBc);
int SP6010_ACLR_Set_Upper2_Threshold (double dBc);
int SP6010_ACLR_Set_Lower1_Threshold (double dBc);
int SP6010_ACLR_Set_Lower2_Threshold (double dBc);
int SP6010_ACLR_Start_Test (int timeout_sec);
int SP6010_ACLR_Get_Result ( double *value, int *passFlag);
int SP6010_ACLR_Stop_Test ( void );

// OBW
int SP6010_OBW_Set_Avg_Count (int count);
int SP6010_OBW_Set_TSlot (int timeslot);
int SP6010_OBW_Set_Timeout (int timeout_sec);
int SP6010_OBW_Set_Continuous_Mode(char * mode);
int SP6010_OBW_Set_Control_Mode (char *mode);
int SP6010_OBW_Set_Percent (int per);
int SP6010_OBW_Start_Test (int timeout_sec);
int SP6010_OBW_Get_Value (double *value, int *testFlag);
int SP6010_OBW_Stop_Test (void);

//BER
int SP6010_BER_Set_RFGenerator_Power (double dBm);
int SP6010_BER_Wait_Sync (int timeout_sec);
int SP6010_BER_Set_Conf_State (char *state);
int SP6010_BER_Set_Bit_Num (int bit_num);
int SP6010_BER_Set_Timeout (int timeout_sec);
int SP6010_BER_Start_Test (int timeout_sec);
int SP6010_BER_Get_Result (double *value, int *passFlag);
int SP6010_BER_Stop_Test (void);

//SEM
int SP6010_SEM_Set_Avg_Count (int count);
int SP6010_SEM_Set_TSlot (int timeslot);
int SP6010_SEM_Set_Timeout (int timeout_sec);
int SP6010_SEM_Set_Continuous_Mode(char * mode);
int SP6010_SEM_Start_Test (int timeout_sec);
int SP6010_SEM_Get_Result (int *passFlag);
int SP6010_SEM_Stop_Test (void);

//Power
int SP6010_Power_Set_Timeout  (int timeout_sec);
int SP6010_Power_Set_PControl_State  (char *state);
int SP6010_Power_Start_Test (int timeout_sec);
int SP6010_Power_Get_Result (SP6010_POWER_TYPE power_type, double *value, int *passFlag);
int SP6010_Power_Stop_Test (void);

// PVT
int SP6010_PVT_Set_Timeout  (int timeout_sec);
int SP6010_PVT_Start_Test (int timeout_sec);
int SP6010_PVT_Get_Result_Value (SP6010_PVT_TYPE pvt_type, double *value);
int SP6010_PVT_Get_Result (int *passFlag);
int SP6010_PVT_Stop_Test (void);

// Wave Quality
int SP6010_WQulity_Set_Timeout  (int timeout_sec);
int SP6010_WQulity_Start_Test (int timeout_sec);
int SP6010_WQulity_Get_AVG_EVM (double *d_EVM);
int SP6010_WQulity_Get_Peak_EVM (double *d_EVM);
int SP6010_WQulity_Get_FE (double *d_FE);
int SP6010_WQulity_Stop_Test (void);

//OLPC
int SP6010_OLPC_Set_Timeout (int timeout_sec);
int SP6010_OLPC_Start_Test (int timeout_sec);
int SP6010_OLPC_Get_Result (int *passFlag);
int SP6010_OLPC_Stop_Test (void);

//=========================================================================================
// Calibration
//=========================================================================================
int SP6010_Meas_Freq_Setup(int IF_Continuous, int Average_Count);//, int TimeOut_ms)
int SP6010_Meas_Freq_Init ( void );
int SP6010_Meas_Freq(double *pFreqError);
int SP6010_Meas_Freq_Abort ( void );
int SP6010_Meas_TxPower_Setup(int IF_Continuous, int Avg_Count,int Timeout_ms);
int SP6010_Meas_TxPower_Init (void);
int SP6010_Meas_TxPower(double *TxPower_dBm);
int SP6010_Meas_TxPower_Abort (void);

int SP6010_RSSI_Setup(int Channel, double *Cell_Power_dBm);


#endif
