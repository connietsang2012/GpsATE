#ifndef __TD_ZY4923B_H__
#define __TD_ZY4923B_H__

extern int ZY4923B_GPIB_Address;
extern ViSession ZY4923B_Handle;

ViStatus ZY4923B_Initialization (ViRsrc resourceName);
ViStatus ZY4923B_Close ( void );

int ZY4923B_Set_System_Mode (char *mode);
int ZY4923B_Set_System_Port (char *port);
int ZY4923B_Set_Uplink_CableLoss (double loss_dB);
int ZY4923B_Set_Downlink_CableLoss (double loss_dB);
int ZY4923B_Set_Operating_Mode (char *mode);
int ZY4923B_Set_Channel_Number (int channel);
int ZY4923B_Set_Cell_Power (double dBm);
int ZY4923B_Set_MS_Power (double dBm);
int ZY4923B_Init_Item_State (char *item, char *state);
int ZY4923B_Start_Item_Test (char *item);
int ZY4923B_Set_Item_Continuous_Mode (char *item, char *mode);
int ZY4923B_Set_Item_Timeout (char *item, float timeout_sec);
int ZY4923B_Set_Item_Signal_Type (char *item, char *type);
int ZY4923B_Set_Item_Count_State_Number (char *item, char * state, int count);
int ZY4923B_AFC_Fetch_FOFFSet_AVG (double *freqErr);
int ZY4923B_APC_Set_Input_Level (float level_dBm);
int ZY4923B_APC_Set_Threshold_Level (float level_dBm);
int ZY4923B_APC_Fetch_Power_AVG (double *result_dBm);


int ZY4923B_Set_Mesurement_Continuous_Mode (char *mode);
int ZY4923B_Set_FS_Slot_Number (int slot_num);
int ZY4923B_Set_RSL_Count_Number (int num);
int ZY4923B_Set_CLPC_Step_Number (int num);
int ZY4923B_Start_Register (void);
int ZY4923B_Wait_Register (int timeout_sec, int *stop);
int ZY4923B_Originate_Call (void);
int ZY4923B_Release_Call (void);
int ZY4923B_Wait_Call_Connected (int timeout_sec, int *stop);


#endif

