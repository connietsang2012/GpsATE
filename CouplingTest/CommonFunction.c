#include <windows.h> 
#include <utility.h>
#include <formatio.h>
#include <ansi_c.h>
#include "meta.h"
#include "CommonFunc.h"
#include "age1960.h"

char logfilename[MAX_PATHNAME_LEN]="";

/* {{{ �����ַ����״γ��ֵ�λ�ã�û���ҵ����� -1�������ַ�����ȷ��� 0
   ��GCC��ʹ��C99��
   int strpos(const char *haystack,const char *needle, _Bool ignorecase = 0)
   _Bool ignorecase =1 ���Դ�Сд
   ʱ�䣺2012-08-17 By Dewei
*/
int strpos(const char *haystack,const char *needle, _Bool ignorecase )
{
	register unsigned char c, needc;
	unsigned char const *from, *end;
	int len = strlen(haystack);
	int needlen = strlen(needle);
	from = (unsigned char *)haystack;
	end = (unsigned char *)haystack + len;
	const char *findreset = needle;
	for (int i = 0; from < end; ++i)
	{
		c = *from++;
		needc = *needle;
		if (ignorecase)
		{
			if (c >= 65 && c < 97)
				c += 32;
			if (needc >= 65 && needc < 97)
				needc += 32;
		}
		if(c == needc)
		{
			++needle;
			if(*needle == '\0')
			{
				if (len == needlen)
					return 0;
				else
					return i - needlen+1;
			}
		}
		else
		{
			if(*needle == '\0' && needlen > 0)
				return i - needlen +1;
			needle = findreset;
		}
	}
	return  -1;
}

void substring(char *pSrc,char *pDes,int StartPos,int Len)
{
	if(StartPos > strlen(pSrc))
		return ;
	Len = (strlen(pSrc) - StartPos) > Len ? Len:(strlen(pSrc) - StartPos);
	strncpy(pDes, pSrc+StartPos, Len);
	pDes[Len] = '\0';
}
float getTXPValue(ViString AG_Read_Str)
{
	ViString TXPValue=AG_Read_Str;
	//ViString AG_Read_Str="+0,+2.11651300E+001";

	int StartPos=strpos(AG_Read_Str,",",0);
	int Len=strlen(AG_Read_Str)-StartPos;

	substring(AG_Read_Str,TXPValue,StartPos+1,Len-StartPos+1);
	float dValue = atof(TXPValue);
	return dValue;
}

int AddLog(ViString LogMsg)
{
	int LogFile;
	GetProjectDir (logfilename);
	strcat(logfilename,"\\Log.txt");
	LogFile = OpenFile (logfilename, VAL_WRITE_ONLY, VAL_APPEND, VAL_ASCII);
	WriteFile (LogFile, LogMsg, StringLength (LogMsg));
	WriteFile (LogFile, "\r\n", StringLength ("\r\n"));
	CloseFile (LogFile);
	return 0;
}

//c�㷨
char GetIMEICheckDigit(char *pp_Imei)
{
    int i;
    int vl_Sum1 = 0, vl_Sum2 = 0, vl_Total = 0;
    int vl_Temp = 0;

    for (i = 0; i<14; i++)
    {
        /*(1)������λ�������(��1��ʼ����)*/
        if ((i % 2) == 0)
        {
            vl_Sum1 = vl_Sum1 + pp_Imei[i] - '0';
        }
        else
        {
            /*(2)��ż��λ���ֱַ����2,�ֱ�����λ����ʮλ��֮��(��1��ʼ����)*/
            vl_Temp = (pp_Imei[i] - '0') * 2;
            if (vl_Temp < 10)
            {
                vl_Sum2 = vl_Sum2 + vl_Temp;
            }
            else
            {
                vl_Sum2 = vl_Sum2 + 1 + vl_Temp - 10;
            }
        }
    }

    /*(1)+(2)*/
    vl_Total = vl_Sum1 + vl_Sum2;

    /*����ó�������λ��0��У��λΪ0,����Ϊ10��ȥ��λ�� */
    if ((vl_Total % 10) == 0)
    {
        return '0';
    }
    else
    {
        return (char)(10 - (vl_Total % 10) + '0');
    }
}





