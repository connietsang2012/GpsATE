
#ifndef __TD_AG8960_H__
#define __TD_AG8960_H__


typedef enum
{
    TD_TRIGGER_AUTO,
    TD_TRIGGER_IMMEDIATE,
    TD_TRIGGER_RF_RISE,
    TD_TRIGGER_EXTERNAL,
    TD_TRIGGER_PROTOCOL
} E_8960_TD_TRIGGER_SOURCE;

typedef enum
{
    TD_8960_STATUS_IDLE = 0,
    TD_8960_STATUS_PAG,
    TD_8960_STATUS_APR,
    TD_8960_STATUS_SREQ,
    TD_8960_STATUS_REG,
    TD_8960_STATUS_CONN,
    TD_8960_STATUS_HAND,
    TD_8960_STATUS_REL
} E_8960_TD_STATUS;

int AG8960_GPIB_Address;
ViSession AG8960_Handle;

int AG8960_Initialization (ViRsrc resourceName);
ViStatus AG8960_SendGpibCmd(char* pGpibCmd);
ViStatus AG8960_Close ( void );
int AG8960_Reset ( void );
int AG8960_Get_Current_Status (E_8960_TD_STATUS *status);
int AG8960_Call_Service_Mode (char *mode);
int AG8960_Call_Operating_Mode (char *mode);
int AG8960_Channel_Type ( char *type );
int AG8960_Call_Originate ( void );
int AG8960_Call_Originate_Complete ( int *status );
int AG8960_Call_Release ( void );
int AG8960_Set_Cell_Power (double cell_power_dBm);
int AG8960_Receiver_Power_Control (char *mode);
int AG8960_Receiver_Manual_Power (double manual_power_dBm);
int AG8960_Call_Target_Power (double target_power_dBm);
int AG8960_Call_UL_Power_Control_Mode (char *mode);
int AG8960_Set_Test_Channel (int channel);
int AG8960_Set_Cable_Loss ( int start_channel, int end_channel, double power_dB );

//
int AG8960_Init_Measurement ( char *item );
int AG8960_Get_Measurement_State ( char *item );
int AG8960_Abort_Measurement ( char *item );


//Wave Quality
int AG8960_WQulity_Set_Continuous_Mode ( char *mode );
int AG8960_WQulity_Set_Count_Number ( int count );
int AG8960_WQulity_Set_Timeout ( double timeout, char *unit );
int AG8960_WQulity_Set_Trigger_Delay ( double delay, char *unit );
int AG8960_WQulity_Set_Trigger_Source ( E_8960_TD_TRIGGER_SOURCE trigger);
int AG8960_WQulity_Get_FE_AVG ( double *FE_Hz );
int AG8960_WQulity_Get_EVM_AVG ( double *d_EVM );
int AG8960_WQulity_Get_EVM_Peak ( double *d_EVM );

//TCP
int AG8960_TCP_Set_Continuous_Mode ( char *mode );
int AG8960_TCP_Set_Count_Number ( int count );
int AG8960_TCP_Set_Timeout ( double timeout, char *unit );
int AG8960_TCP_Set_Trigger_Delay ( double delay, char *unit );
int AG8960_TCP_Set_Trigger_Source ( E_8960_TD_TRIGGER_SOURCE trigger);
int AG8960_TCP_Get_Power_AVG ( double *power_dBm );
int AG8960_TCP_Get_Power_Max ( double *power_dBm );
int AG8960_TCP_Get_Power_Min ( double *power_dBm );

// ACLR
int AG8960_ACLR_Set_Continuous_Mode ( char *mode );
int AG8960_ACLR_Set_Timeout ( double timeout, char *unit );
int AG8960_ACLR_Set_Count_Number ( int count );
int AG8960_ACLR_Set_Trigger_Source ( E_8960_TD_TRIGGER_SOURCE trigger);
int AG8960_ACLR_Get_Result ( double *value, int *passFlag);

// OBW
int AG8960_OBW_Set_Continuous_Mode ( char *mode );
int AG8960_OBW_Set_Count_Number ( int count );
int AG8960_OBW_Set_Timeout ( double timeout, char *unit );
int AG8960_OBW_Set_Trigger_Source ( E_8960_TD_TRIGGER_SOURCE trigger);
int AG8960_OBW_Set_Percent (int per);
int AG8960_OBW_Get_Value (double *value, int *testFlag);

// SEM
int AG8960_SEM_Set_Continuous_Mode ( char *mode );
int AG8960_SEM_Set_Count_Number ( int count );
int AG8960_SEM_Set_Timeout ( double timeout, char *unit );
int AG8960_SEM_Set_Trigger_Source ( E_8960_TD_TRIGGER_SOURCE trigger);
int AG8960_SEM_Get_Result (int *passFlag);

// CLPC
int AG8960_CLPC_Set_Trigger_Source ( E_8960_TD_TRIGGER_SOURCE trigger);
int AG8960_CLPC_Get_Result (int *passFlag);
int AG8960_CLPC_Set_Timeout ( double timeout, char *unit );

// BER
int AG8960_BER_Set_Confidence_State ( char *state );
int AG8960_BER_Set_Continuous_Mode ( char *mode );
int AG8960_BER_Set_Timeout ( double timeout, char *unit );
int AG8960_BER_Set_Bits_Number ( int bits_number );
int AG8960_BER_Get_Result (double *result);

#endif

