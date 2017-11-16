
#ifndef __SP6010_COMMON_H__
#define __SP6010_COMMON_H__

#define VISA_BUF_LEN 32767
#define SP6010_CHECK_STATUS(status) if(VI_SUCCESS!=(status)){return -1;}

extern ViSession SP6010_Handle;

typedef enum
{
    DT_NONE = 0,
    DT_INT = 1,	        // int
    DT_FLOAT = 2,        // double	=> double
    DT_CHAR = 3,         // char
    DT_PIC = 4,          // picture
} Data_Type;

ViStatus SP6010_Initialization (ViRsrc resourceName);
ViStatus SP6010_SendGpibCmd(char* pGpibCmd);
ViStatus SP6010_GetData (Data_Type DataType, unsigned long ulDataLen, void* pDataValue);
ViStatus SP6010_Close ( void );
ViStatus sp6010_QuerySystemError (int *b_HasError);

int SP6010_Reset ( void );
int SP6010_System_Type(char * SystemType);

#endif

