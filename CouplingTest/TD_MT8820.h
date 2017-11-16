
#ifndef __TD_MT8820_H__
#define __TD_MT8820_H__

extern ViSession MT8820_Handle;

int MT8820_Initialization (ViRsrc resourceName);
ViStatus MT8820_Close ( void );
int MT8820_Reset ( void );

int MT8820_Call_Service_Mode (char *mode);
int MT8820_Call_Operating_Mode (char *mode);
int MT8820_Set_Cell_Power (double cell_power_dBm);
int MT8820_Call_Target_Power (double target_power_dBm);

#endif

