
#ifndef _CommonFunc_
#define _CommonFunc_

#include "meta.h"
#include "age1960.h"
//#include "arraylist.h"

#define VISA_BUF_LEN 32767

typedef enum
{
    GMSK=0,
    EPSK,
    MOD_COUNT
} E_MODULATION;

typedef struct
{
	ViString sCmdKey;
	ViString sCmd;
	ViString sReturnText;
	bool bWaitResponses;
	int iWaitResponseOverTime;
	int iResendNum;
	int iSendNum;
	bool bInvalidation;
	bool bSendAtCommand;
} PSendCommRecord,*SendCommList;

/*int _ArrayString_Parse( char *src, char* dst, short* dst_pos );
int IsFreqBankSupported(char asFreqBank[], FrequencyBand fb);
int String_To_Array_double_SP6010( char *src, double *array, int max_count );
int String_To_Array_double( char *src, double* array, int max_count );
int String_To_Array_Integer( char *src, int* array, int max_count );
int String_To_Array_UnsignedInteger( char *src, unsigned int* array, int max_count );

int   String_To_Array_UnsignedChar( char *src, unsigned char* array, int max_count );
int   String_To_Array_Char( char *src, char* array, int max_count );
int   String_To_Array_UnsignedShort( char *src, unsigned short* array, int max_count );
int String_To_Array_double_MT8820( char *src, double *array, int max_count );  //qxt 20111114 */

//int String_To_Array_Char_2( char *src, char* array, int max_count );

//»ñµÃTXPÖµ
float getTXPValue(ViString AG_Read_Str); 
void substring(char *pSrc,char *pDes,int StartPos,int Len); 
int strpos(const char *haystack,const char *needle, _Bool ignorecase ); 


 
int AddLog(ViString);
char GetIMEICheckDigit(char *);
#endif
