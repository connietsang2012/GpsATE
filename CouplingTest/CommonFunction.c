#include <windows.h>
#include "inifile.h"
#include <userint.h>
#include <utility.h>
#include <formatio.h>
#include <ansi_c.h>
#include "meta.h"
#include "CommonFunc.h"
#include "age1960.h"

 




char logfilename[MAX_PATHNAME_LEN]="";

/* {{{ 查找字符串首次出现的位置，没有找到返回 -1，两个字符串相等返回 0
   在GCC下使用C99：
   int strpos(const char *haystack,const char *needle, _Bool ignorecase = 0)
   _Bool ignorecase =1 忽略大小写
   时间：2012-08-17 By Dewei
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
	char *date,*time;
	date = DateStr ();
	time = TimeStr ();

	int LogFile;
	GetProjectDir (logfilename);
	strcat(logfilename,"\\Log.txt");
	LogFile = OpenFile (logfilename, VAL_WRITE_ONLY, VAL_APPEND, VAL_ASCII);
	WriteFile (LogFile, date, StringLength (date));
	WriteFile (LogFile, "\t", StringLength ("\t"));
	WriteFile (LogFile, time, StringLength (time));
	WriteFile (LogFile, "\t", StringLength ("\t"));
	WriteFile (LogFile, LogMsg, StringLength (LogMsg));
	WriteFile (LogFile, "\r\n", StringLength ("\r\n"));
	CloseFile (LogFile);
	return 0;
}

//c算法
char GetIMEICheckDigit(char *pp_Imei)
{
	int i;
	int vl_Sum1 = 0, vl_Sum2 = 0, vl_Total = 0;
	int vl_Temp = 0;

	for (i = 0; i<14; i++)
	{
		/*(1)将奇数位数字相加(从1开始计数)*/
		if ((i % 2) == 0)
		{
			vl_Sum1 = vl_Sum1 + pp_Imei[i] - '0';
		}
		else
		{
			/*(2)将偶数位数字分别乘以2,分别计算个位数和十位数之和(从1开始计数)*/
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

	/*如果得出的数个位是0则校验位为0,否则为10减去个位数 */
	if ((vl_Total % 10) == 0)
	{
		return '0';
	}
	else
	{
		return (char)(10 - (vl_Total % 10) + '0');
	}
}
char * strreplace(char const * const original, 
    char const * const pattern, char const * const replacement) 
{
  size_t const replen = strlen(replacement);
  size_t const patlen = strlen(pattern);
  size_t const orilen = strlen(original);

  size_t patcnt = 0;
  const char * oriptr;
  const char * patloc;

  // find how many times the pattern occurs in the original string
  for (oriptr = original; (patloc = strstr(oriptr, pattern)); oriptr = patloc + patlen)
  {
    patcnt++;
  }

  {
    // allocate memory for the new string
    size_t const retlen = orilen + patcnt * (replen - patlen);
    char * const returned = (char *) malloc( sizeof(char) * (retlen + 1) );

    if (returned != NULL)
    {
      // copy the original string, 
      // replacing all the instances of the pattern
      char * retptr = returned;
      for (oriptr = original; (patloc = strstr(oriptr, pattern)); oriptr = patloc + patlen)
      {
        size_t const skplen = patloc - oriptr;
        // copy the section until the occurence of the pattern
        strncpy(retptr, oriptr, skplen);
        retptr += skplen;
        // copy the replacement 
        strncpy(retptr, replacement, replen);
        retptr += replen;
      }
      // copy the rest of the string.
      strcpy(retptr, oriptr);
    }
    return returned;
  }	
}


//https://github.com/CurryGuy/lua-player-plus/blob/7cb0f6056ead933289cf7dacffd6ce54243630b7/lpp-c%2B%2B/Libs/strreplace.c
char *strreplace2(const char *src, const char *from, const char *to)
{
   size_t size    = strlen(src) + 1;
   size_t fromlen = strlen(from);
   size_t tolen   = strlen(to);
   char *value = malloc(size);
   char *dst = value;
   if ( value != NULL )
   {
      for ( ;; )
      {
         const char *match = strstr(src, from);
         if ( match != NULL )
         {
            size_t count = match - src;
            char *temp;
            size += tolen - fromlen;
            temp = realloc(value, size);
            if ( temp == NULL )
            {
               free(value);
               return NULL;
            }
            dst = temp + (dst - value);
            value = temp;
            memmove(dst, src, count);
            src += count;
            dst += count;
            memmove(dst, to, tolen);
            src += fromlen;
            dst += tolen;
         }
         else /* No match found. */
         {
            strcpy(dst, src);
            break;
         }
      }
   }
   return value;
}


