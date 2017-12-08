#include <tcpsupp.h>
#include "inifile.h"
#include <rs232.h>
#include <utility.h>
#include <formatio.h>
#include "age1960.h"
#include <visa.h>
#include <ansi_c.h>
#include <cvirte.h>
#include <userint.h>
#include "CouplingMain.h"
#include "com_enum.h"
#include "meta.h"
#include <stdio.h>
#include <string.h>
#include "CommonFunc.h"

#define MAX_SEND_LEN  512    /* 发送的最大长度 */
#define MAX_REC_LEN  512    /* 接收的最大长度 */

//测试目标数
#define TESTTARGET 2		/* 总测试目标 */
#define FIRSTTARGET 0		/* 测试目标1 */
#define SECONDTARGET 1		/* 测试目标2 */

//串口的参数
#define baudrate 115200
#define parity 0
#define databits 8
#define stopbits 1
#define inputq 32000
#define outputq 32000


#define ATTEST "AT^GT_CM=TEST" 				//进入测试模式   TEST_OK
#define ATVERSION "AT^GT_CM=VERSION"		//读取软件版本  [VERSION]GT02F_20_61DM2_B25E_R0_V02
#define ATLINK "AT^GT_CM=LINK"				//获得LINK   LINK:6
#define ATRFBAR "AT^GT_CM=RF_BAR"			//读RF  RF CODE PASS
#define ATCFUN0 "AT+CFUN=0"   				//关网
#define ATCFUN1 "AT+CFUN=1"   				//开网
#define ATD112 "ATD112;"		 			//拔打112
#define ATH "ATH;"			 				//挂断
#define ATID "AT^GT_CM=ID,1"			 	//读ID
#define ATWIMEI "AT^GT_CM=IMEI,1,"			//写IMEI
#define ATRIMEI "AT^GT_CM=IMEI"			 	//读IMEI  IMEI:222222222222222
#define ATCLEAR "AT^GT_CM=CLEAR"			//清除GPS定位点  OK!
#define ATFACTORYALL "AT^GT_CM=FACTORYALL"	//恢复出厂设置 NVRAM执行成功! The terminal will restart after 60s!

//主界面
static int panelHandle;

//*************************************************************************************************************
//-------------------------------界面显示---------------------------
//**************************************************************************************************************
//动态获得可用串口
int GetComPortDynamiclly(void);

//*************************************************************************************************************
//-------------------------------更新数据库所需内容---------------------------
//**************************************************************************************************************
char strRid[TESTTARGET][33];					//基带ID
char strIMEI[TESTTARGET][17];					//写入IMEI
ViString Version;
ViString SoftModel;
ViString Tester;
//*************************************************************************************************************
//-------------------------------耦合测试---------------------------
//**************************************************************************************************************
//GPIB地址
char GPIB_ADDR_8960[MAX_PATHNAME_LEN]="";
//GPIB通讯超时时间
static int GPIB_TIMEOUT_8960=5000;
//8960的读写操作结果
int AG8960_Status[TESTTARGET];
//8960查询的结果（int,string）
int AG_Read_Int32[TESTTARGET];
char AG_Read_Str[TESTTARGET][20];
//8960延迟时间
int AG8960_DelayTime=2.0;
//会话层,处理8960
static ViSession    InstrHandle[TESTTARGET] = {VI_NULL,VI_NULL};

//开始耦合测试
//int StartCouplingTest(int);
//查询TXP值
int CVICALLBACK QueryTXPValue(int);
int CVICALLBACK QueryTXPValue_2(int);

//通信信道
ViString TrafficBand="";
//信号值
int TrafficPower;
int TrafficPowerOffset;
float  TrafficPowerMax,TrafficPowerMin;

ViBoolean Testing[TESTTARGET]= {VI_FALSE,VI_FALSE};
//*************************************************************************************************************
//-------------------------------串口操作---------------------------
//**************************************************************************************************************
//对应的串口号
int comport[TESTTARGET]= {2,3};
//串口是否打开标志
int ComIsOpen[TESTTARGET]= {0,0};
//打开串口
int OpenComm(int);
int OpenComPort(int);
//关闭串口
int CloseComPort(int);

//串口发送数据
void SendByte(int,ViString);					//发送数据
char CmdKey[TESTTARGET][MAX_REC_LEN];			//发送串口关键字
char write_buffer[TESTTARGET][MAX_SEND_LEN];	//发送串口内容
int iSends[TESTTARGET]= {0,0};					//已发送次数
int WriteIMEI(int);

//串口发送成功
int CommRec_OK(int);

ViString reATLINK;								//ATLINK返回的值
//*************************************************************************************************************
//-------------------------------更新测试结果,设置总测试结果---------------------------
//**************************************************************************************************************
int g_TestResult[TESTTARGET]= {-1,-1};
int UpdateResultMsg(int,ViString);
int SetTestResult(int,int);
int SetTestResultPrompt(int,int,ViString,bool);

//*************************************************************************************************************
//-------------------------------TCP---------------------------
//**************************************************************************************************************
int portNum;				//TCP端口
ViString TcpIp;				//TCP IP

int iTcpSends[TESTTARGET]= {0,0};	//已发送次数
char TcpCmdKey[TESTTARGET][MAX_SEND_LEN];
char TcpCmd[TESTTARGET][MAX_SEND_LEN];

int TcpConnect(int);
int SendToTcp(int,ViString,ViString);
static unsigned int g_hconversation[TESTTARGET];
static int	g_connected[TESTTARGET] = {0,0};
//static int	g_TCPError[TESTTARGET] = {0,0};

/*---------------------------------------------------------------------------*/
/* Internal function prototypes                                              */
/*---------------------------------------------------------------------------*/
int CVICALLBACK ClientTCPCB (unsigned handle, int event, int error,
							 void *callbackData);
int CVICALLBACK ClientTCPCB_2 (unsigned handle, int event, int error,
							   void *callbackData);

//*************************************************************************************************************
//-------------------------------从INI文件读取客户自定义参数---------------------------
//**************************************************************************************************************
//获得客户自定义设置
int GetCustomerSetupFile(void);
//客户自定义句柄
IniText g_CustomerSetupFile = 0;
//客户自定义文件名
char CustomerFileName[MAX_PATHNAME_LEN]="";


char strLog[MAX_SEND_LEN];

int CVIFUNC SetActiveCtrlMySelf(int panel, int control);
int GetFocusCtrol=0;

static int   couplingTestStartflag[TESTTARGET] = {0,0};
int functionId[TESTTARGET];
int CVICALLBACK StartCouplingTest(int);
int CVICALLBACK StartCouplingTest_2(int);
int StartTest(int);
//*************************************************************************************************************
//------------------------------------------源码--------------------------------------
//**************************************************************************************************************
int main (int argc, char *argv[])
{
	if (InitCVIRTE (0, argv, 0) == 0)
		return -1;	/* out of memory */
	if ((panelHandle = LoadPanel (0, "CouplingMain.uir", PANEL)) < 0)
		return -1;
	DisplayPanel (panelHandle);

	//LoadPanel前获得自定义参数
	GetCustomerSetupFile();
	//LoadPanel前动态获取可用串口
	GetComPortDynamiclly();

	//打开串口
	//OpenComm(0);
	//OpenComm(1);

	//TCP连接
	TcpConnect(FIRSTTARGET);
	TcpConnect(SECONDTARGET);

	RunUserInterface ();
	DiscardPanel (panelHandle);
	return 0;
}

int CVICALLBACK StartTestThreadFunction (void *functionData)
{
	while(1)
	{

	}

	return 0;
}

int CVICALLBACK CouplingTest (int panel, int control, int event,
							  void *callbackData, int eventData1, int eventData2)
{
	int Target=0;

	switch(control)
	{
		case PANEL_TEST:
			Target=0;
			break;
		case PANEL_TEST_2:
			Target=1;
			break;
	}
	switch (event)
	{
		case EVENT_COMMIT:
			//初始化测试结果，开始测试
			SetTestResult(Target,-1);

			StartTest(Target);
			break;
	}
	return 0;
}
int StartTest(int Target){
	int att; 
	
	//发送TEST指令
			UpdateResultMsg(Target,"<====进入测试模式====>");
			strcpy(write_buffer[Target], ATTEST);
			SendByte(Target,write_buffer[Target]);
			
	if (Target==0){
	GetCtrlAttribute (panelHandle, PANEL_IMEI_2, ATTR_DIMMED,&att);
			if(att==0)
			{
				SetActiveCtrlMySelf ( panelHandle, PANEL_IMEI_2 );
			}
	}
	else if (Target==1){
	GetCtrlAttribute (panelHandle, PANEL_IMEI, ATTR_DIMMED,&att);
			if(att==0)
			{
				SetActiveCtrlMySelf ( panelHandle, PANEL_IMEI );
			}
	}
	return 0;
}
int CVICALLBACK EnterCouplingTestAgain (int panel, int control, int event,
										void *callbackData, int eventData1, int eventData2)
{
	sprintf(strLog,"EnterCouplingTestAgain:%d",control);
	AddLog_All( strLog);
	int Target=0;
	switch(control)
	{
		case PANEL_COUPLINGTESTTIMER:
			Target=0;
			SetCtrlAttribute (panelHandle, PANEL_COUPLINGTESTTIMER, ATTR_ENABLED, 0);
			CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE, StartCouplingTest, Target, &functionId[FIRSTTARGET]); 
			break;
		case PANEL_COUPLINGTESTTIMER_2:
			Target=1;
			SetCtrlAttribute (panelHandle, PANEL_COUPLINGTESTTIMER_2, ATTR_ENABLED, 0);
			CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE, StartCouplingTest_2, Target, &functionId[SECONDTARGET]); 
			break;
		default:
			return 0;
	}
	//CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE, StartCouplingTest, Target, &functionId[FIRSTTARGET]);
	//StartCouplingTest(Target);
	return 0;
}
int  CVICALLBACK ComConnect(int panel, int control, int event, void *callbackData, int eventData1, int eventData2)
{
	int Target=0;
	switch(control)
	{
		case PANEL_COMCONNECT:
			Target=0;
			break;
		case PANEL_COMCONNECT_2:
			Target=1;
			break;
	}
	switch (event)
	{
		case EVENT_COMMIT:
			//连接串口
			OpenComm(Target);
			break;
	}
	return 0;
}

int  CVICALLBACK ComDisConnect(int panel, int control, int event, void *callbackData, int eventData1, int eventData2)
{
	int Target=0;
	switch(control)
	{
		case PANEL_COMDISCONNECT:
			Target=0;
			break;
		case PANEL_COMDISCONNECT_2:
			Target=1;
			break;
	}
	switch (event)
	{
		case EVENT_COMMIT:
			//断开串口
			CloseComPort(Target);
			break;
	}
	return 0;
}

//发送AT指令超时
int CVICALLBACK sendcmd_timer (int panel, int control, int event,
							   void *callbackData, int eventData1, int eventData2)
{
	int Target=0;
	switch(control)
	{
		case PANEL_TIMER_SENDCMD:
			Target=0;
			break;
		case PANEL_TIMER_SENDCMD_2:
			Target=1;
			break;
	}
	if(++iSends[Target]<=3)
	{
		sprintf(strLog,"串口第%d次发送", iSends[Target]);
		AddLog(Target,strLog);
		if(strcmp(CmdKey[Target],"")!=0)
		{
			strcpy(write_buffer[Target], CmdKey[Target]);
			SendByte(Target,write_buffer[Target]);
		}
	}
	else
	{
		iSends[Target]=0;
		AddLog(Target, "AT指令超时，测试结果失败");
		//AT指令超时，测试结果失败
		if(Target==0)
		{
			SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDCMD, ATTR_ENABLED, 0);
		}
		else
		{
			SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDCMD_2, ATTR_ENABLED, 0);
		}
		SetTestResult(Target,0);
	}
	return 0;
}
//发送AT指令超时
int CVICALLBACK sendTcpcmd_timer (int panel, int control, int event,
								  void *callbackData, int eventData1, int eventData2)
{
	int Target=0;
	switch(control)
	{
		case PANEL_TIMER_SENDTCPCMD:
			Target=0;
			break;
		case PANEL_TIMER_SENDTCPCMD_2:
			Target=1;
			break;
	}

	if(++iTcpSends[Target]<=3)
	{
		if(strcmp(TcpCmdKey[Target],"")!=0)
		{
			sprintf(strLog,"TCP第%d次发送", iTcpSends[Target]);
			AddLog(Target, strLog);

			SendToTcp(Target,TcpCmdKey[Target],TcpCmd[Target]);
		}
	}
	else
	{
		iTcpSends[Target]=0;
		//TCP指令超时，测试结果失败
		AddLog(Target, "TCP指令超时，测试结果失败");
		if(Target==0)
		{
			SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDTCPCMD, ATTR_ENABLED, 0);
		}
		else
		{
			SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDTCPCMD_2, ATTR_ENABLED, 0);
		}
		if(strcmp(TcpCmdKey[Target],"UpdateResult")<0)
		{
			SetTestResult(Target,0);
		}
		else
		{
			SetTestResultPrompt(Target,0,"F A I L",VI_TRUE);
		}
	}
	return 0;
}

int CVICALLBACK Quit (int panel, int control, int event,
					  void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			AddLog_All("程序退出!");
			SetCtrlAttribute (panelHandle, PANEL_COUPLINGTESTTIMER, ATTR_ENABLED, 0);
			SetCtrlAttribute (panelHandle, PANEL_COUPLINGTESTTIMER_2, ATTR_ENABLED, 0);

			strcpy(CmdKey[FIRSTTARGET],"");
			strcpy(TcpCmdKey[FIRSTTARGET],"");

			strcpy(CmdKey[SECONDTARGET],"");
			strcpy(TcpCmdKey[SECONDTARGET],"");
			//关闭串口
			CloseComPort(FIRSTTARGET);
			CloseComPort(SECONDTARGET);

			if (g_connected[FIRSTTARGET])
				DisconnectFromTCPServer (g_hconversation[FIRSTTARGET]);
			if (g_connected[SECONDTARGET])
				DisconnectFromTCPServer (g_hconversation[SECONDTARGET]);

			QuitUserInterface (0);
			break;
	}
	return 0;
}

int CVICALLBACK ListComPortDynamiclly (int panel, int control, int event,
									   void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_LEFT_CLICK:
			//GetComPortDynamiclly();
			break;
			//列表内容改变则打开串口
		case EVENT_VAL_CHANGED:
			switch(control)
			{
				case PANEL_COM_PORT_SETTING:
					OpenComm(FIRSTTARGET);
					break;
				case PANEL_COM_PORT_SETTING_2:
					OpenComm(SECONDTARGET);
					break;
			}
			break;
	}
	return 0;
}
int CVICALLBACK Get_IMEI (int panel, int control, int event,
						  void *callbackData, int eventData1, int eventData2)
{
	int Target=0;
	ViString strValue="请扫描目标1!";
	switch(control)
	{
		case PANEL_IMEI:
			Target=0;
			break;
		case PANEL_IMEI_2:
			Target=1;
			break;
	}
	switch (event)
	{
		case EVENT_COMMIT:
			UpdateResultMsg(Target,"<====IMEI已输入====>");

			if(Target==0)
			{
				GetCtrlVal (panelHandle, PANEL_IMEI, strIMEI[Target]);
			}
			else
			{
				GetCtrlVal (panelHandle, PANEL_IMEI_2, strIMEI[Target]);
			}
			AddLog(Target, strIMEI[Target]);

			//判断IMEI是否有效
			char IMEI14[14];
			strncpy(IMEI14, strIMEI[Target], 14);
			char checkSum=GetIMEICheckDigit(IMEI14);
			char scanCheckSum=strIMEI[Target][14];
			if(checkSum==scanCheckSum)
			{
				AddLog(Target, "合法IMEI");

				//初始化测试结果，开始测试
				SetTestResult(Target,-1);

				sprintf(TcpCmd[Target], "Action=CheckIMEI#IMEI=%s#Tester=%s#", strIMEI[Target],Tester);
				SendToTcp(Target,"CheckIMEI",TcpCmd[Target]);

			}
			else
			{
				SetTestResultPrompt(Target,-2,"IMEI无效！",VI_TRUE);
			}
			break;
		case EVENT_GOT_FOCUS:
			GetFocusCtrol=control;
			if(Target==0)
			{
				SetCtrlVal (panelHandle, PANEL_CONTENT, "请扫描目标1!");
			}
			else
			{
				SetCtrlVal (panelHandle, PANEL_CONTENT, "请扫描目标2!");
			}
			break;
		case EVENT_LOST_FOCUS:
			/*if(Target==0)
			{
				GetCtrlVal (panelHandle, PANEL_CONTENT, strValue);
				if(strcmp(strValue,"请扫描目标1!")==0)
				{
					SetActiveCtrlMySelf ( panelHandle, PANEL_IMEI );
					//return 1;
				}

			}
			else
			{
				GetCtrlVal (panelHandle, PANEL_CONTENT, strValue);
				if(strcmp(strValue,"请扫描目标2!")==0)
				{
					SetActiveCtrlMySelf ( panelHandle, PANEL_IMEI_2 );
					//return 1;
				}
			}*/
			GetFocusCtrol=0;
			break;

	}
	return 0;
}

//打开串口
int OpenComm(int Target)
{
	if(Target==0)
	{
		GetCtrlVal (panelHandle, PANEL_COM_PORT_SETTING, &comport[Target]);
	}
	else
	{
		GetCtrlVal (panelHandle, PANEL_COM_PORT_SETTING_2, &comport[Target]);
	}
	/*if(comport[0]==comport[1]){
		return 0;
	}*/
	sprintf(strLog,"选择的串口:%d", comport[Target]);
	AddLog(Target, strLog);
	//CloseComPort(Target);
	OpenComPort(Target);
	if(Target==0)
	{
		if(ComIsOpen[Target]==1)
		{
			AddLog(Target, "串口打开成功!");
			SetCtrlAttribute (panelHandle, PANEL_COMCONNECT, ATTR_DIMMED, 1);
			SetCtrlAttribute (panelHandle, PANEL_COMDISCONNECT, ATTR_DIMMED, 0);
			SetCtrlVal(panelHandle, PANEL_IMEI, "");
			SetActiveCtrlMySelf ( panelHandle, PANEL_IMEI );
			SetCtrlVal(panelHandle, PANEL_TESTRESULT, "");
		}
		else
		{
			AddLog(Target, "串口打开失败!");
			SetCtrlAttribute (panelHandle, PANEL_COMCONNECT, ATTR_DIMMED, 0);
			SetCtrlAttribute (panelHandle, PANEL_COMDISCONNECT, ATTR_DIMMED, 1);
		}
	}
	else
	{
		if(ComIsOpen[Target]==1)
		{
			AddLog(Target, "串口打开成功!");
			SetCtrlAttribute (panelHandle, PANEL_COMCONNECT_2, ATTR_DIMMED, 1);
			SetCtrlAttribute (panelHandle, PANEL_COMDISCONNECT_2, ATTR_DIMMED, 0);
			SetCtrlVal(panelHandle, PANEL_IMEI_2, "");
			SetActiveCtrlMySelf ( panelHandle, PANEL_IMEI_2 );
			SetCtrlVal(panelHandle, PANEL_TESTRESULT_2, "");
		}
		else
		{
			AddLog(Target, "串口打开失败!");
			SetCtrlAttribute (panelHandle, PANEL_COMCONNECT_2, ATTR_DIMMED, 0);
			SetCtrlAttribute (panelHandle, PANEL_COMDISCONNECT_2, ATTR_DIMMED, 1);
		}
	}

	return 0;
}

int CommRec_OK(int Target)
{
	iSends[Target]=0;
	strcpy(CmdKey[Target],"");
	if(Target==0)
	{
		SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDCMD, ATTR_ENABLED, 0);
	}
	else
	{
		SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDCMD_2, ATTR_ENABLED, 0);
	}
	UpdateResultMsg(Target,"成功");
	return 0;
}
//串口收到数据
void CVICALLBACK Event_Char_Func(int portNo, int eventMask, void *callbackData)
{
	int Target=FIRSTTARGET;
	char readBuf[MAX_REC_LEN*2] = {0};
	int strLen;
	

	strLen = GetInQLen(portNo);
	ComRd(portNo,readBuf,strLen);
	AddLog(Target, readBuf);

	if (strpos(readBuf,"Sensor_OK",0)>=0)
	{
		return ;
	}
	if(strcmp(CmdKey[Target],ATTEST)==0)
	{
		if (strpos(readBuf,"TEST_OK",0)>=0)
		{
			CommRec_OK(Target);

			strcpy(write_buffer[Target], ATVERSION);
			SendByte(Target,write_buffer[Target]);
			UpdateResultMsg(Target,"<====获得终端软件版本号====>");
		}

	}
	else if(strcmp(CmdKey[Target],ATVERSION)==0)
	{

		if (strpos(readBuf,Version,0)>=0)
		{
			sprintf(strLog, "\t%s",Version);
			UpdateResultMsg(Target,strLog);

			CommRec_OK(Target);
			strcpy(write_buffer[Target], ATID);
			SendByte(Target,write_buffer[Target]);
			UpdateResultMsg(Target,"<====读取基带ID====>");
		}
		else
		{
			UpdateResultMsg(Target,"软件版本不正确!");
		}

	}
	else if(strcmp(CmdKey[Target],ATID)==0)
	{
		if (strpos(readBuf,"RID:",0)>=0)
		{
			

			//取RID
			ViString readTemp=readBuf;
			readTemp=strreplace(readTemp,"\r\n",""); 
			char* data=strreplace(readTemp," ","");
			int StartPos=strpos(data,"ChipRID:",0);
			if(strlen (data)>=32+strlen("ChipRID:")){ 
				substring(data,strRid[Target],StartPos+strlen("ChipRID:"),32);
				CommRec_OK(Target);
			}
			else 
			{
				return;
			}
			sprintf(TcpCmd[Target], "Action=CheckTested#PlanName=WriteImei#ChipRid=%s#SoftModel=%s#Version=%s#Tester=%s#",
					strRid[Target],SoftModel,Version,Tester);
			SendToTcp(Target,"CheckTested",TcpCmd[Target]);
		}
	}
	else if(strcmp(CmdKey[Target],ATLINK)==0)
	{
		if (strpos(readBuf,reATLINK,0)>=0)
		{
			CommRec_OK(Target);
			strcpy(write_buffer[Target], ATRFBAR);
			SendByte(Target,write_buffer[Target]);
			UpdateResultMsg(Target,"<====读取RF参数====>");
		}

	}
	else if(strcmp(CmdKey[Target],ATRFBAR)==0)
	{
		if (strpos(readBuf,"RF CODE PASS",0)>=0)
		{
			CommRec_OK(Target);

			CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE, StartCouplingTest, Target, &functionId[FIRSTTARGET]);
			UpdateResultMsg(Target,"<====进入偶合测试====>");

			//StartCouplingTest(Target);
		}
	}

	else if(strcmp(CmdKey[Target],ATCFUN0)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK(Target);
			strcpy(write_buffer[Target], ATCFUN1);
			SendByte(Target,write_buffer[Target]);
			UpdateResultMsg(Target,"<====开网====>");
		}
	}
	else if(strcmp(CmdKey[Target],ATCFUN1)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK(Target);
			strcpy(write_buffer[Target], ATD112);
			SendByte(Target,write_buffer[Target]);
			UpdateResultMsg(Target,"<====拔打112====>");
		}
	}
	else if(strcmp(CmdKey[Target],ATD112)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK(Target);
			UpdateResultMsg(Target,"<====查询TXP值====>");
			CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE, QueryTXPValue, Target, &functionId[FIRSTTARGET]); 
			//QueryTXPValue(Target);
		}
	}
	else if(strcmp(CmdKey[Target],ATH)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK(Target);

			UpdateResultMsg(Target,"<====写IMEI====>");
			WriteIMEI(Target);
		}

	}
	else if(strpos(CmdKey[Target],ATWIMEI,0)>=0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK(Target);
			UpdateResultMsg(Target,"<====读IMEI====>");
			strcpy(write_buffer[Target],ATRIMEI);
			SendByte(Target,write_buffer[Target]);
		}

	}
	else if(strpos(CmdKey[Target],ATRIMEI,0)>=0)
	{
		if (strpos(readBuf,"IMEI:",0)>=0)
		{
			//取机子中的IMEI
			ViString readImei=readBuf;
			char readImeiTemp[16];
			int StartPos=strpos(readImei,"IMEI:",0);
			substring(readImei,readImeiTemp,StartPos+strlen("IMEI:"),15);
			UpdateResultMsg(Target,readImeiTemp);

			if(strcmp(readImeiTemp,strIMEI[Target])==0)
			{
				CommRec_OK(Target);
				UpdateResultMsg(Target,"<====清除最后一个点====>");
				strcpy(write_buffer[Target],ATCLEAR);
				SendByte(Target,write_buffer[Target]);
			}
			else
			{
				UpdateResultMsg(Target,"<====IMEI读取的IMEI与写入的不相同====>");
			}
		}

	}
	else if(strpos(CmdKey[Target],ATCLEAR,0)>=0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK(Target);
			UpdateResultMsg(Target,"<====恢复出厂设置====>");
			strcpy(write_buffer[Target],ATFACTORYALL);
			SendByte(Target,write_buffer[Target]);
		}
	}
	else if(strpos(CmdKey[Target],ATFACTORYALL,0)>=0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK(Target);
			SetTestResult(Target,1);
		}

	}
}
//串口收到数据
void CVICALLBACK Event_Char_Func_2(int portNo, int eventMask, void *callbackData)
{
	int Target=SECONDTARGET;
	char readBuf[MAX_REC_LEN*2] = {0};
	int strLen;
	//int att;

	strLen = GetInQLen(portNo);
	ComRd(portNo,readBuf,strLen);
	AddLog(Target, readBuf);

	if (strpos(readBuf,"Sensor_OK",0)>=0)
	{
		return ;
	}
	if(strcmp(CmdKey[Target],ATTEST)==0)
	{
		if (strpos(readBuf,"TEST_OK",0)>=0)
		{
			CommRec_OK(Target);

			strcpy(write_buffer[Target], ATVERSION);
			SendByte(Target,write_buffer[Target]);
			UpdateResultMsg(Target,"<====获得终端软件版本号====>");
		}

	}
	else if(strcmp(CmdKey[Target],ATVERSION)==0)
	{

		if (strpos(readBuf,Version,0)>=0)
		{
			sprintf(strLog, "\t%s",Version);
			UpdateResultMsg(Target,strLog);

			CommRec_OK(Target);
			strcpy(write_buffer[Target], ATID);
			SendByte(Target,write_buffer[Target]);
			UpdateResultMsg(Target,"<====读取基带ID====>");
		}
		else
		{
			UpdateResultMsg(Target,"软件版本不正确!");
		}

	}
	else if(strcmp(CmdKey[Target],ATID)==0)
	{
		if (strpos(readBuf,"RID:",0)>=0)
		{
			//CommRec_OK(Target);

			//取RID
			ViString readTemp=readBuf;
			readTemp=strreplace(readTemp,"\r\n",""); 
			char* data=strreplace(readTemp," ","");
			int StartPos=strpos(data,"ChipRID:",0);
			
			if(strlen (data)>=32+strlen("ChipRID:")){ 
				substring(data,strRid[Target],StartPos+strlen("ChipRID:"),32);
				CommRec_OK(Target);
			}
			else 
			{
				return;
			}
			
			sprintf(TcpCmd[Target], "Action=CheckTested#PlanName=WriteImei#ChipRid=%s#SoftModel=%s#Version=%s#Tester=%s#",
					strRid[Target],SoftModel,Version,Tester);
			SendToTcp(Target,"CheckTested",TcpCmd[Target]);
		}
	}
	else if(strcmp(CmdKey[Target],ATLINK)==0)
	{
		if (strpos(readBuf,reATLINK,0)>=0)
		{
			CommRec_OK(Target);
			strcpy(write_buffer[Target], ATRFBAR);
			SendByte(Target,write_buffer[Target]);
			UpdateResultMsg(Target,"<====读取RF参数====>");
		}

	}
	else if(strcmp(CmdKey[Target],ATRFBAR)==0)
	{
		if (strpos(readBuf,"RF CODE PASS",0)>=0)
		{
			CommRec_OK(Target);
			CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE, StartCouplingTest_2, Target, &functionId[SECONDTARGET]);
			UpdateResultMsg(Target,"<====进入偶合测试====>"); 
			
			//StartCouplingTest(Target);
		}
	}

	else if(strcmp(CmdKey[Target],ATCFUN0)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK(Target);
			strcpy(write_buffer[Target], ATCFUN1);
			SendByte(Target,write_buffer[Target]);
			UpdateResultMsg(Target,"<====开网====>");
		}
	}
	else if(strcmp(CmdKey[Target],ATCFUN1)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK(Target);
			strcpy(write_buffer[Target], ATD112);
			SendByte(Target,write_buffer[Target]);
			UpdateResultMsg(Target,"<====拔打112====>");
		}
	}
	else if(strcmp(CmdKey[Target],ATD112)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK(Target);
			UpdateResultMsg(Target,"<====查询TXP值====>");
			CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE, QueryTXPValue_2, Target, &functionId[SECONDTARGET]);
			//QueryTXPValue(Target);
		}
	}
	else if(strcmp(CmdKey[Target],ATH)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK(Target);

			UpdateResultMsg(Target,"<====写IMEI====>");
			WriteIMEI(Target);
		}

	}
	else if(strpos(CmdKey[Target],ATWIMEI,0)>=0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK(Target);
			UpdateResultMsg(Target,"<====读IMEI====>");
			strcpy(write_buffer[Target],ATRIMEI);
			SendByte(Target,write_buffer[Target]);
		}

	}
	else if(strpos(CmdKey[Target],ATRIMEI,0)>=0)
	{
		if (strpos(readBuf,"IMEI:",0)>=0)
		{
			//取机子中的IMEI
			ViString readImei=readBuf;
			char readImeiTemp[16];
			int StartPos=strpos(readImei,"IMEI:",0);
			substring(readImei,readImeiTemp,StartPos+strlen("IMEI:"),15);
			UpdateResultMsg(Target,readImeiTemp);

			if(strcmp(readImeiTemp,strIMEI[Target])==0)
			{
				CommRec_OK(Target);
				UpdateResultMsg(Target,"<====清除最后一个点====>");
				strcpy(write_buffer[Target],ATCLEAR);
				SendByte(Target,write_buffer[Target]);
			}
			else
			{
				UpdateResultMsg(Target,"<====IMEI读取的IMEI与写入的不相同====>");
			}
		}

	}
	else if(strpos(CmdKey[Target],ATCLEAR,0)>=0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK(Target);
			UpdateResultMsg(Target,"<====恢复出厂设置====>");
			strcpy(write_buffer[Target],ATFACTORYALL);
			SendByte(Target,write_buffer[Target]);
		}
	}
	else if(strpos(CmdKey[Target],ATFACTORYALL,0)>=0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK(Target);
			SetTestResult(Target,1);
		}

	}
}
//------------------------------------------开始耦合测试-------------------------------------- //
int CVICALLBACK StartCouplingTest(int Target)
{
//int StartCouplingTest(int Target)
	//AddLog(Target,  Testing[SECONDTARGET]);
	
	if(Target==FIRSTTARGET)
	{
		if (Testing[SECONDTARGET]==VI_TRUE)
		{
			SetCtrlAttribute (panelHandle, PANEL_COUPLINGTESTTIMER, ATTR_ENABLED, 1);
			return -1; 
		}
	}
	else
	{
		if (Testing[FIRSTTARGET]==VI_TRUE)
		{
			SetCtrlAttribute (panelHandle, PANEL_COUPLINGTESTTIMER_2, ATTR_ENABLED, 1);
			return -1; 
		}
	}
	//Delay(AG8960_DelayTime*2); 
	Testing[Target]=VI_TRUE;
	AddLog(Target, "StartCouplingTest Start");
	//AG8960初始化
	AG8960_Status[Target] = age1960_init (GPIB_ADDR_8960, VI_FALSE, VI_TRUE, &InstrHandle[FIRSTTARGET]);
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}
	//设置超时时间
	AG8960_Status[Target]=age1960_timeOut (InstrHandle[FIRSTTARGET], GPIB_TIMEOUT_8960);
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}
	//AG8960_Handle = InstrHandle;
	/*AG8960_Status[Target]=age1960_reset (InstrHandle);
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}*/

	//返回状态VI_SUCCESS
	//开启GPIB调试器
	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "SYST:COMM:GPIB:DEB ON");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	//连接类型：自动
	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "CALL:FUNC:CONN:TYPE AUTO");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}
	//关闭蜂鸣器
	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "SYST:BEEP:STAT OFF");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}


	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "SET:CONT:OFF");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	//CALL:POW %f
	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "CALL:POW -35.000000");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "CALL:MS:TADV 0");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	//返回值+1
	AG8960_Status[Target] = age1960_cmdInt32_Q (InstrHandle[FIRSTTARGET], "SYST:SYNC?",&AG_Read_Int32[Target]);
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	//清屏?
	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "*CLS");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	//返回DCS
	AG8960_Status[Target] = age1960_cmdString_Q (InstrHandle[FIRSTTARGET], "CALL:BIND?", 4,AG_Read_Str[Target]);
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	ViString sendCmd="CALL:TCH:BAND DCS";
	sprintf(sendCmd, "CALL:TCH:BAND %s", TrafficBand);
	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], sendCmd);
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "CALL:TCH:DCS 698");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	//CALL:MS:TXL %d
	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "CALL:MS:TXL 0");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "SYST:MEAS:RES");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "SYST:CORR:SFR  1747.40 MHZ,1842.40 MHZ");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}


	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "SYST:CORR:SGA -19.00,-19.00");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	UpdateResultMsg(Target,"<====关网====>");
	strcpy(write_buffer[Target], ATCFUN0);
	SendByte(Target,write_buffer[Target]);
	AddLog(Target, "StartCouplingTest End");
	return 0;

	//耦合测试失败
Error:
	AddLog(Target, "StartCouplingTest Error");
	SetTestResult(Target,0);
	Testing[Target]=VI_FALSE;
	return (-1);

}
//------------------------------------------开始耦合测试-------------------------------------- //
int CVICALLBACK StartCouplingTest_2(int Target)
{
//int StartCouplingTest(int Target)
	//
	if(Target==FIRSTTARGET)
	{
		if (Testing[SECONDTARGET]==VI_TRUE)
		{
			SetCtrlAttribute (panelHandle, PANEL_COUPLINGTESTTIMER, ATTR_ENABLED, 1);
			return -1; 
		}
	}
	else if(Target==SECONDTARGET) 
	{
		if (Testing[FIRSTTARGET]==VI_TRUE)
		{
			AddLog(Target,  "目标1在测试！");
			SetCtrlAttribute (panelHandle, PANEL_COUPLINGTESTTIMER_2, ATTR_ENABLED, 1);
			return -1; 
		}
	}
	//Delay(AG8960_DelayTime*2); 
	Testing[Target]=VI_TRUE;
	AddLog(Target, "StartCouplingTest Start");
	//AG8960初始化
	AG8960_Status[Target] = age1960_init (GPIB_ADDR_8960, VI_FALSE, VI_TRUE, &InstrHandle[SECONDTARGET]);
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}
	//设置超时时间
	AG8960_Status[Target]=age1960_timeOut (InstrHandle[SECONDTARGET], GPIB_TIMEOUT_8960);
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}
	//AG8960_Handle = InstrHandle;
	/*AG8960_Status[Target]=age1960_reset (InstrHandle);
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}*/

	//返回状态VI_SUCCESS
	//开启GPIB调试器
	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "SYST:COMM:GPIB:DEB ON");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	//连接类型：自动
	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "CALL:FUNC:CONN:TYPE AUTO");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}
	//关闭蜂鸣器
	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "SYST:BEEP:STAT OFF");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}


	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "SET:CONT:OFF");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	//CALL:POW %f
	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "CALL:POW -35.000000");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "CALL:MS:TADV 0");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	//返回值+1
	AG8960_Status[Target] = age1960_cmdInt32_Q (InstrHandle[SECONDTARGET], "SYST:SYNC?",&AG_Read_Int32[Target]);
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	//清屏?
	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "*CLS");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	//返回DCS
	AG8960_Status[Target] = age1960_cmdString_Q (InstrHandle[SECONDTARGET], "CALL:BIND?", 4,AG_Read_Str[Target]);
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	ViString sendCmd="CALL:TCH:BAND DCS";
	sprintf(sendCmd, "CALL:TCH:BAND %s", TrafficBand);
	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], sendCmd);
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "CALL:TCH:DCS 698");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	//CALL:MS:TXL %d
	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "CALL:MS:TXL 0");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "SYST:MEAS:RES");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "SYST:CORR:SFR  1747.40 MHZ,1842.40 MHZ");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}


	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "SYST:CORR:SGA -19.00,-19.00");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	UpdateResultMsg(Target,"<====关网====>");
	strcpy(write_buffer[Target], ATCFUN0);
	SendByte(Target,write_buffer[Target]);
	AddLog(Target, "StartCouplingTest End");
	return 0;

	//耦合测试失败
Error:
	AddLog(Target, "StartCouplingTest Error");
	SetTestResult(Target,0);
	Testing[Target]=VI_FALSE;
	return (-1);

}
int CVICALLBACK QueryTXPValue(int Target)
{
	Target=FIRSTTARGET;
	AddLog(Target, "QueryTXPValue Start");
	bool testResult=TRUE;
	int Count=0,AgainCount=0,RequestTXPCount=0;
	//查询连接状态
	//返回值0
	age1960_cmdInt32_Q (InstrHandle, "CALL:CONN:STAT?", &AG_Read_Int32[Target]);
	if(AG_Read_Int32[Target] ==0)
	{
		AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "CALL:MS:REP:CLE");
		if( AG8960_Status[Target] != 0)
		{
			goto Error;
		}
	}
CallAgain:
	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "CALL:CONN:TIM 10 S");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "CALL:CONN:ARM");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	//查询呼叫状态　IDLE SREQ CONN
	AG8960_Status[Target] = age1960_cmdString_Q (InstrHandle[FIRSTTARGET], "CALL:STAT?", 5,AG_Read_Str[Target]);
	Delay(AG8960_DelayTime);
	UpdateResultMsg(Target,AG_Read_Str[Target]);
	Count=0;
	while(strcmp(AG_Read_Str[Target],"CONN")!=0)
	{
		if(++Count>5)
		{
			if(++AgainCount>6)
			{
				testResult=FALSE;
				goto CouplingEnd;
				//Delay(AG8960_DelayTime*2);
			}
			goto CallAgain;
		}
		AG8960_Status[Target] = age1960_cmdString_Q (InstrHandle[FIRSTTARGET], "CALL:STAT?", 5,AG_Read_Str[Target]);
	}
RequestTXP:
	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "SET:TXP:TIM:STIM 10");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "SET:TXP:COUN:SNUM 3");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "INIT:TXP");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}
GetTXPValue:
	age1960_cmdString_Q (InstrHandle[FIRSTTARGET], "INIT:DONE?",4, AG_Read_Str[Target]);
	if(strcmp(AG_Read_Str[Target],"TXP")==0)
	{
		age1960_cmdString_Q (InstrHandle[FIRSTTARGET], "FETC:TXP?",20, AG_Read_Str[Target]);
		float value=getTXPValue(AG_Read_Str[Target]);
		sprintf(strLog, "<====当前DB值:%5.2f====>", value);
		UpdateResultMsg(Target,strLog);
		if(value<=TrafficPowerMin || value>=TrafficPowerMax)
		{
			//判断信号值
			if(++RequestTXPCount<4)
			{
				AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "INIT:TXP:OFF");
				if( AG8960_Status[Target] != 0)
				{
					goto Error;
				}
				goto  RequestTXP;
			}
			else
			{
				goto Error;
			}
		}

		AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "INIT:TXP:OFF");
		if( AG8960_Status[Target] != 0)
		{
			goto Error;
		}
		goto CouplingEnd;
	}
	else
	{
		goto GetTXPValue;
	}

	//耦合测试结束
CouplingEnd:
	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "*CLS");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[FIRSTTARGET], "CALL:END");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}
	AG8960_Status[Target] = age1960_cmdString_Q (InstrHandle[FIRSTTARGET], "CALL:STAT?", 5,AG_Read_Str[Target]);
	if(strcmp(AG_Read_Str[Target],"IDLE")!=0)
	{
		goto Error;
	}
	if(testResult)
	{
		strcpy(write_buffer[Target], ATH);
		SendByte(Target,write_buffer[Target]);
		UpdateResultMsg(Target,"<====耦合测试成功====>");
		Testing[Target]=VI_FALSE;
		return 0;
	}
	else
	{
		goto Error;
	}

	//耦合测试失败
Error:
	UpdateResultMsg(Target,"<====耦合测试失败====>");
	SetTestResult(Target,0);
	Testing[Target]=VI_FALSE;
	return (-1);
}
int CVICALLBACK QueryTXPValue_2(int Target)
{
	Target=SECONDTARGET;
	AddLog(Target, "QueryTXPValue Start");
	bool testResult=TRUE;
	int Count=0,AgainCount=0,RequestTXPCount=0;
	//查询连接状态
	//返回值0
	age1960_cmdInt32_Q (InstrHandle[SECONDTARGET], "CALL:CONN:STAT?", &AG_Read_Int32[Target]);
	if(AG_Read_Int32[Target] ==0)
	{
		AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "CALL:MS:REP:CLE");
		if( AG8960_Status[Target] != 0)
		{
			goto Error;
		}
	}
CallAgain:
	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "CALL:CONN:TIM 10 S");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "CALL:CONN:ARM");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	//查询呼叫状态　IDLE SREQ CONN
	AG8960_Status[Target] = age1960_cmdString_Q (InstrHandle[SECONDTARGET], "CALL:STAT?", 5,AG_Read_Str[Target]);
	Delay(AG8960_DelayTime);
	UpdateResultMsg(Target,AG_Read_Str[Target]);
	Count=0;
	while(strcmp(AG_Read_Str[Target],"CONN")!=0)
	{
		if(++Count>5)
		{
			if(++AgainCount>6)
			{
				testResult=FALSE;
				goto CouplingEnd;
				//Delay(AG8960_DelayTime*2);
			}
			goto CallAgain;
		}
		AG8960_Status[Target] = age1960_cmdString_Q (InstrHandle[SECONDTARGET], "CALL:STAT?", 5,AG_Read_Str[Target]);
	}
RequestTXP:
	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "SET:TXP:TIM:STIM 10");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "SET:TXP:COUN:SNUM 3");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "INIT:TXP");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}
GetTXPValue:
	age1960_cmdString_Q (InstrHandle[SECONDTARGET], "INIT:DONE?",4, AG_Read_Str[Target]);
	if(strcmp(AG_Read_Str[Target],"TXP")==0)
	{
		age1960_cmdString_Q (InstrHandle[SECONDTARGET], "FETC:TXP?",20, AG_Read_Str[Target]);
		float value=getTXPValue(AG_Read_Str[Target]);
		sprintf(strLog, "<====当前DB值:%5.2f====>", value);
		UpdateResultMsg(Target,strLog);
		if(value<=TrafficPowerMin || value>=TrafficPowerMax)
		{
			//判断信号值
			if(++RequestTXPCount<4)
			{
				AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "INIT:TXP:OFF");
				if( AG8960_Status[Target] != 0)
				{
					goto Error;
				}
				goto  RequestTXP;
			}
			else
			{
				goto Error;
			}
		}

		AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "INIT:TXP:OFF");
		if( AG8960_Status[Target] != 0)
		{
			goto Error;
		}
		goto CouplingEnd;
	}
	else
	{
		goto GetTXPValue;
	}

	//耦合测试结束
CouplingEnd:
	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "*CLS");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}

	AG8960_Status[Target] = age1960_cmd (InstrHandle[SECONDTARGET], "CALL:END");
	if( AG8960_Status[Target] != 0)
	{
		goto Error;
	}
	AG8960_Status[Target] = age1960_cmdString_Q (InstrHandle[SECONDTARGET], "CALL:STAT?", 5,AG_Read_Str[Target]);
	if(strcmp(AG_Read_Str[Target],"IDLE")!=0)
	{
		goto Error;
	}
	if(testResult)
	{
		strcpy(write_buffer[Target], ATH);
		SendByte(Target,write_buffer[Target]);
		UpdateResultMsg(Target,"<====耦合测试成功====>");
		Testing[Target]=VI_FALSE;
		return 0;
	}
	else
	{
		goto Error;
	}

	//耦合测试失败
Error:
	UpdateResultMsg(Target,"<====耦合测试失败====>");
	SetTestResult(Target,0);
	Testing[Target]=VI_FALSE;
	return (-1);
}
int WriteIMEI(int Target)
{
	strcpy(write_buffer[Target], ATWIMEI);
	strcat(write_buffer[Target],strIMEI[Target]);
	sprintf(strLog,"写入IMEI:%s",strIMEI[Target]);
	AddLog(Target, strIMEI[Target]);
	SendByte(Target,write_buffer[Target]);
	return 0;
}
//**********************************************************************
//-------动态获得可用串口-------------------------
//********************************************************************
int GetComPortDynamiclly(void)
{
	int Target=0;
	AddLog(Target,  "GetComPortDynamiclly start");
	char DestString[10];
	int i = 0, result = 0;
	unsigned short ComPortArray[255] = {0};
	unsigned short ComPortCount = 255;
	int flag = 0;
	int tempCom = 0;

	if( panelHandle < 0 )
	{
		MessagePopup("Error","Load main panel fail");
		goto Error;
	}
	GetCtrlVal (panelHandle, PANEL_COM_PORT_SETTING, &tempCom);
	ClearListCtrl (panelHandle, PANEL_COM_PORT_SETTING); 					 // clear the com port value
	GetCtrlVal (panelHandle, PANEL_COM_PORT_SETTING_2, &tempCom);
	ClearListCtrl (panelHandle, PANEL_COM_PORT_SETTING_2); 					 // clear the com port value
	//InsertListItem(panelHandle_main,panelMain_eCOMPort,0,"USB VCOM",17);	 // insert the usb com first

	result = ComPortEnumerate(ComPortArray, &ComPortCount);
	if(result != COM_ENUM_OK)
	{
		if( result == COM_ENUM_NO_COM_PORT_FOUND||result ==COM_ENUM_ERROR)                            // find no COM port, some NB will have no COM.but why ComPortEnumerate return COM_ENUM_ERROR, so add this
		{
			ComPortCount = 0;
		}
		else
		{
			MessagePopup("FAIL","Get Com Port Fail");
			AddLog(Target,  "Get Com Port Fail");
			goto Error;

		}
	}


	for(i = 0; i < ComPortCount; i++)	// show all com port got dynamiclly
	{
		if ( ComPortArray[i] == tempCom ) //if com port selected last time still exists
		{
			flag = 1;
		}
		sprintf(DestString,"COM%d", ComPortArray[i]);
		result = InsertListItem (panelHandle, PANEL_COM_PORT_SETTING, i, DestString, ComPortArray[i]);  // update UI COM list
		result = InsertListItem (panelHandle, PANEL_COM_PORT_SETTING_2, i, DestString, ComPortArray[i]);  // update UI COM list
		if ( result < 0 )
		{
			MessagePopup ("Com", "Fail");
			AddLog(Target,  "Fail");
			goto Error;
		}
	}

	return 0;
Error:
	return -1;
}
int UpdateResultMsg(int Target,ViString Msg)
{
	AddLog(Target, Msg);
	if(Target==0)
	{
		SetCtrlVal (panelHandle, PANEL_RESULTS, Msg);
		InsertTextBoxLine (panelHandle, PANEL_RESULTS, -1, "");
	}
	else
	{
		SetCtrlVal (panelHandle, PANEL_RESULTS_2, Msg);
		InsertTextBoxLine (panelHandle, PANEL_RESULTS_2, -1, "");
	}
	return 0;
}

int SetTestResult(int Target,int iResult)
{
	sprintf(strLog,"SetTestResult:%d",iResult);
	AddLog(Target, strLog);
	g_TestResult[Target]=iResult;
	if(Target==0){
	SetCtrlAttribute (panelHandle, PANEL_COUPLINGTESTTIMER, ATTR_ENABLED, 0);
	}
	else if(Target==1){ 
	SetCtrlAttribute (panelHandle, PANEL_COUPLINGTESTTIMER_2, ATTR_ENABLED, 0);
	}
	if(iResult==-1)
	{
		AddLog(Target,  "测试初始化!");
		if(Target==0){
		ResetTextBox (panelHandle, PANEL_RESULTS, "");
		}
		else if(Target==1){
		ResetTextBox (panelHandle, PANEL_RESULTS_2, "");
		}
		strcpy(CmdKey[Target],"");
		strcpy(TcpCmdKey[Target],"");
		strcpy(strRid[Target],"");
		if(Target==0)
		{
			SetCtrlAttribute (panelHandle, PANEL_TEST, ATTR_DIMMED, 1);
			SetCtrlAttribute (panelHandle, PANEL_IMEI, ATTR_DIMMED, 1);
			SetCtrlVal(panelHandle, PANEL_TESTRESULT, "");
			SetCtrlAttribute (panelHandle, PANEL_TESTRESULT, ATTR_TEXT_BGCOLOR , VAL_GRAY);
		}
		else
		{
			SetCtrlAttribute (panelHandle, PANEL_TEST_2, ATTR_DIMMED, 1);
			SetCtrlAttribute (panelHandle, PANEL_IMEI_2, ATTR_DIMMED, 1);
			SetCtrlVal(panelHandle, PANEL_TESTRESULT_2, "");
			SetCtrlAttribute (panelHandle, PANEL_TESTRESULT_2, ATTR_TEXT_BGCOLOR , VAL_GRAY);
		}
	}
	else if(iResult==0)
	{
		AddLog(Target,  "测试失败!");
		if(strlen(strRid[Target])>=32)
		{
			sprintf(TcpCmd[Target], "Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s","WriteImei",strRid[Target],SoftModel,Version,strIMEI[Target],iResult,Tester);
			SendToTcp(Target,"UpdateResult",TcpCmd[Target]);
		}
		else
		{
			SetTestResultPrompt(Target,0,"F A I L",VI_TRUE);
		}
	}
	else if(iResult==1)
	{
		AddLog(Target,  "测试成功!");
		if(strlen(strRid[Target])>=32)
		{
			sprintf(TcpCmd[Target], "Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s","WriteImei",strRid[Target],SoftModel,Version,strIMEI[Target],iResult,Tester);
			SendToTcp(Target,"UpdateResult",TcpCmd[Target]);
		}
		else
		{
			SetTestResultPrompt(Target,1,"P A S S",VI_TRUE);
		}
	}
	return 0;
}
int SetTestResultPrompt(int Target,int iResult,ViString prompt,bool focus)
{
	sprintf(strLog,"SetTestResultPrompt:%d,%s",iResult,prompt);
	AddLog(Target, strLog);

	if(Target==0)
	{
		SetCtrlAttribute (panelHandle, PANEL_TEST, ATTR_DIMMED, 0);
		SetCtrlAttribute (panelHandle, PANEL_IMEI, ATTR_DIMMED, 0);
		SetCtrlVal(panelHandle, PANEL_TESTRESULT, prompt);
		SetCtrlVal(panelHandle, PANEL_IMEI, "");
		//SetActiveCtrlMySelf ( panelHandle, PANEL_IMEI );
	}
	else
	{
		SetCtrlAttribute (panelHandle, PANEL_TEST_2, ATTR_DIMMED, 0);
		SetCtrlAttribute (panelHandle, PANEL_IMEI_2, ATTR_DIMMED, 0);
		SetCtrlVal(panelHandle, PANEL_TESTRESULT_2, prompt);
		SetCtrlVal(panelHandle, PANEL_IMEI_2, "");
		//SetActiveCtrlMySelf ( panelHandle, PANEL_IMEI_2 );
	}
	strcpy(CmdKey[Target],"");
	strcpy(TcpCmdKey[Target],"");

	if(Target==0)
	{
		if(iResult==-2)
		{
			//SetCtrlAttribute (panelHandle, PANEL_IMEI,ATTR_SELECTED,1);
			SetCtrlAttribute (panelHandle, PANEL_TESTRESULT, ATTR_TEXT_BGCOLOR , VAL_GRAY);
		}
		else if(iResult==0)
		{
			SetCtrlAttribute (panelHandle, PANEL_TESTRESULT, ATTR_TEXT_BGCOLOR , VAL_RED);
		}
		else if(iResult==1)
		{
			SetCtrlAttribute (panelHandle, PANEL_TESTRESULT, ATTR_TEXT_BGCOLOR , VAL_GREEN);
		}
	}
	else
	{
		if(iResult==-2)
		{
			//SetCtrlAttribute (panelHandle, PANEL_IMEI,ATTR_SELECTED,1);
			SetCtrlAttribute (panelHandle, PANEL_TESTRESULT_2, ATTR_TEXT_BGCOLOR , VAL_GRAY);
		}
		else if(iResult==0)
		{
			SetCtrlAttribute (panelHandle, PANEL_TESTRESULT_2, ATTR_TEXT_BGCOLOR , VAL_RED);
		}
		else if(iResult==1)
		{
			SetCtrlAttribute (panelHandle, PANEL_TESTRESULT_2, ATTR_TEXT_BGCOLOR , VAL_GREEN);
		}
	}

	if(focus)
	{
		if(Target==FIRSTTARGET)
		{
			SetActiveCtrlMySelf ( panelHandle, PANEL_IMEI );
		}
		else
		{
			SetActiveCtrlMySelf ( panelHandle, PANEL_IMEI_2 );
		}
	}
	return 0;
}

//TCP连接
int TcpConnect(int Target)
{
	AddLog(Target,  "与服务器连接!");
	SetWaitCursor (1);
	if(Target==0)
	{
		if (ConnectToTCPServer (&g_hconversation[Target], portNum, TcpIp, ClientTCPCB,
								NULL, 5000) < 0)
		{
			//MessagePopup("TCP Client", "Connection to server failed !");
			SetTestResultPrompt(Target,-2,"与服务器连接失败!",VI_FALSE);
			g_connected[Target]=0;
		}
		else
		{
			AddLog(Target,  "与服务器连接成功!");
			g_connected[Target] = 1;
			if( Target==0)
			{

				SetCtrlVal (panelHandle, PANEL_CONNECTED, 1);
			}
			else
			{
				SetCtrlVal (panelHandle, PANEL_CONNECTED_2, 1);
			}
		}
	}
	else
	{
		if (ConnectToTCPServer (&g_hconversation[Target], portNum, TcpIp, ClientTCPCB_2,
								NULL, 5000) < 0)
		{
			//MessagePopup("TCP Client", "Connection to server failed !");
			SetTestResultPrompt(Target,-2,"与服务器连接失败!",VI_FALSE);
			g_connected[Target]=0;
		}
		else
		{
			AddLog(Target,  "与服务器连接成功!");
			g_connected[Target] = 1;
			if( Target==0)
			{

				SetCtrlVal (panelHandle, PANEL_CONNECTED, 1);
			}
			else
			{
				SetCtrlVal (panelHandle, PANEL_CONNECTED_2, 1);
			}
		}
	}
	SetWaitCursor (0);
	return 0;
}

/*---------------------------------------------------------------------------*/
/* This is the TCP client's TCP callback.  This function will receive event  */
/* notification, similar to a UI callback, whenever a TCP event occurs.      */
/* We'll respond to the DATAREADY event and read in the available data from  */
/* the server and display it.  We'll also respond to DISCONNECT events, and  */
/* tell the user when the server disconnects us.                             */
/*---------------------------------------------------------------------------*/
int CVICALLBACK ClientTCPCB (unsigned handle, int event, int error,
							 void *callbackData)
{
	int Target=0;
	char receiveBuf[MAX_REC_LEN] = {0};

	ssize_t dataSize         = sizeof (receiveBuf) - 1;

	switch (event)
	{
		case TCP_DATAREADY:
			if ((dataSize = ClientTCPRead (g_hconversation[Target], receiveBuf,
										   dataSize, 1000))< 0)
			{
				SetTestResultPrompt(Target,-2,"接收失败!",VI_FALSE);
			}
			else
			{
				receiveBuf[dataSize] = '\0';
				AddLog(Target, receiveBuf);
				//处理收到的数据
				if((strcmp(TcpCmdKey[Target],"CheckIMEI")==0) || (strcmp(TcpCmdKey[Target],"UpdateResult")==0)
						|| (strcmp(TcpCmdKey[Target],"CheckTested")==0))
				{
					SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDTCPCMD, ATTR_ENABLED, 0);
					//取结果
					char result[2];
					int StartPos=strpos(receiveBuf,"iRecordCount=",0);
					substring(receiveBuf,result,StartPos+strlen("iRecordCount="),1);
					int iResult=atoi(result);
					if(strcmp(TcpCmdKey[Target],"CheckTested")==0)
					{
						if(iResult>=1)
						{
							SetTestResultPrompt(Target,-2,"此机子已测试过!",VI_TRUE);
						}
						else
						{
							UpdateResultMsg(Target,"<====开始耦合测试====>");
							strcpy(write_buffer[Target], ATLINK);
							SendByte(Target,write_buffer[Target]);
							UpdateResultMsg(Target,"<====获得LINK====>");
						}
					}
					else if(strcmp(TcpCmdKey[Target],"CheckIMEI")==0)
					{

						if(iResult>=1)
						{
							SetTestResultPrompt(Target,-2,"此IMEI已烧写过!",VI_TRUE);
						}
						else
						{
							//发送TEST指令
							StartTest(Target);
						}
					}
					else if(strcmp(TcpCmdKey[Target],"UpdateResult")==0)
					{
						if((iResult>=1) && (g_TestResult[Target]==1))
						{
							SetTestResultPrompt(Target,1,"P A S S",VI_TRUE);
						}
						else
						{
							SetTestResultPrompt(Target,0,"F A I L",VI_TRUE);
						}
					}
				}
				break;
			case TCP_DISCONNECT:
				SetTestResultPrompt(Target,-2,"与服务器断开!",VI_FALSE);;
				SetCtrlVal (panelHandle, PANEL_CONNECTED, 0);
				g_connected[Target] = 0;
				break;
			}
			return 0;
	}
	return 1;
}
int CVICALLBACK ClientTCPCB_2 (unsigned handle, int event, int error,
							   void *callbackData)
{
	int Target=1;
	char receiveBuf[MAX_REC_LEN] = {0};

	ssize_t dataSize         = sizeof (receiveBuf) - 1;

	switch (event)
	{
		case TCP_DATAREADY:
			if ((dataSize = ClientTCPRead (g_hconversation[Target], receiveBuf,
										   dataSize, 1000))< 0)
			{
				SetTestResultPrompt(Target,-2,"接收失败!",VI_FALSE);
			}
			else
			{
				receiveBuf[dataSize] = '\0';
				AddLog(Target, receiveBuf);
				//处理收到的数据
				if((strcmp(TcpCmdKey[Target],"CheckIMEI")==0) || (strcmp(TcpCmdKey[Target],"UpdateResult")==0)
						|| (strcmp(TcpCmdKey[Target],"CheckTested")==0))
				{
					SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDTCPCMD_2, ATTR_ENABLED, 0);
					//取结果
					char result[2];
					int StartPos=strpos(receiveBuf,"iRecordCount=",0);
					substring(receiveBuf,result,StartPos+strlen("iRecordCount="),1);
					int iResult=atoi(result);
					if(strcmp(TcpCmdKey[Target],"CheckTested")==0)
					{
						if(iResult>=1)
						{
							SetTestResultPrompt(Target,-2,"此机子已测试过!",VI_TRUE);
						}
						else
						{
							UpdateResultMsg(Target,"<====开始耦合测试====>");
							strcpy(write_buffer[Target], ATLINK);
							SendByte(Target,write_buffer[Target]);
							UpdateResultMsg(Target,"<====获得LINK====>");
						}
					}
					else if(strcmp(TcpCmdKey[Target],"CheckIMEI")==0)
					{

						if(iResult>=1)
						{
							SetTestResultPrompt(Target,-2,"此IMEI已烧写过!",VI_TRUE);
						}
						else
						{
							StartTest(Target);
						}
					}
					else if(strcmp(TcpCmdKey[Target],"UpdateResult")==0)
					{
						if((iResult>=1) && (g_TestResult[Target]==1))
						{
							SetTestResultPrompt(Target,1,"P A S S",VI_TRUE);
						}
						else
						{
							SetTestResultPrompt(Target,0,"F A I L",VI_TRUE);
						}
					}
				}
				break;
			case TCP_DISCONNECT:
				SetTestResultPrompt(Target,-2,"与服务器断开!",VI_FALSE);;
				SetCtrlVal (panelHandle, PANEL_CONNECTED, 0);
				g_connected[Target] = 0;
				break;
			}
			return 0;
	}
	return 1;
}
//发送至服务器　 TempTcpCmdKey[Target]:关键字　 SendMsg:发送的内容
int SendToTcp(int Target,ViString TempTcpCmdKey,ViString SendMsg)
{
	if(g_connected[Target]==0)
	{
		SetTestResultPrompt(Target,-2,"未连接服务器!",VI_FALSE);
	}
	else
	{
		AddLog(Target, SendMsg);
		strcpy(TcpCmdKey[Target],TempTcpCmdKey);
		strcat (SendMsg, "\n");
		if (ClientTCPWrite (g_hconversation[Target], SendMsg,strlen (SendMsg), 1000)<0)
		{
			SetTestResultPrompt(Target,-2,"发送服务器失败!",VI_FALSE);
		}
		else
		{
			if(Target==0)
			{
				SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDTCPCMD, ATTR_ENABLED, 1);
			}
			else
			{
				SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDTCPCMD_2, ATTR_ENABLED, 1);
			}
		}
	}
	return 0;
}
int OpenComPort(int Target)
{
	AddLog(Target,  "OpenComPort Start");
	int RS232Error;
	char devicename[30];
	sprintf(devicename, "COM%d", comport[Target]);
	DisableBreakOnLibraryErrors();
	RS232Error = OpenComConfig (comport[Target], devicename, baudrate, parity, databits, stopbits, inputq, outputq);
	EnableBreakOnLibraryErrors();
	if (RS232Error< 0)
	{
		SetTestResultPrompt(Target,-2,"打开串口失败!",VI_FALSE);
		ComIsOpen[Target]=0;
		return -1;
	}
	ComIsOpen[Target]=1;
	SetComTime (comport[Target], 0.2);
	FlushInQ (comport[Target]);
	FlushOutQ (comport[Target]);
	if(Target==0)
	{
		InstallComCallback(comport[Target],LWRS_RXFLAG,0,10,Event_Char_Func,0);  //以回车为标志位，接收到回车就产生中断，调用中断函数UartComCall
	}
	else
	{
		InstallComCallback(comport[Target],LWRS_RXFLAG,0,10,Event_Char_Func_2,0);  //以回车为标志位，接收到回车就产生中断，调用中断函数UartComCall
	}
	AddLog(Target,  "OpenComPort End");
	return 0;
};

int CloseComPort(int Target)
{
	AddLog(Target,  "CloseComPort Start");
	ComIsOpen[Target]=0;
	CloseCom (comport[Target]);
	if(Target==0)
	{
		if(ComIsOpen[Target]==1)
		{

			SetCtrlAttribute (panelHandle, PANEL_COMCONNECT, ATTR_DIMMED, 1);
			SetCtrlAttribute (panelHandle, PANEL_COMDISCONNECT, ATTR_DIMMED, 0);
		}
		else
		{
			SetCtrlAttribute (panelHandle, PANEL_COMCONNECT, ATTR_DIMMED, 0);
			SetCtrlAttribute (panelHandle, PANEL_COMDISCONNECT, ATTR_DIMMED, 1);
		}
	}
	else
	{
		if(ComIsOpen[Target]==1)
		{

			SetCtrlAttribute (panelHandle, PANEL_COMCONNECT_2, ATTR_DIMMED, 1);
			SetCtrlAttribute (panelHandle, PANEL_COMDISCONNECT_2, ATTR_DIMMED, 0);
		}
		else
		{
			SetCtrlAttribute (panelHandle, PANEL_COMCONNECT_2, ATTR_DIMMED, 0);
			SetCtrlAttribute (panelHandle, PANEL_COMDISCONNECT_2, ATTR_DIMMED, 1);
		}
	}
	AddLog(Target,  "CloseComPort End");
	return 0;
};


void SendByte(int Target,ViString ch)
{
	int RS232Error;
	if(ComIsOpen[Target] == 0)
	{
		SetTestResultPrompt(Target,-2,"串口还未打开!",VI_FALSE);
	}
	else
	{
		FlushOutQ(comport[Target]);  //清空发送缓存区
		strcpy(CmdKey[Target],ch);
		strcat(ch,"\r\n");
		RS232Error = ComWrt (comport[Target], ch,strlen(ch));
		if(Target==0)
		{
			SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDCMD, ATTR_ENABLED, 1);
		}
		else
		{
			SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDCMD_2, ATTR_ENABLED, 1);
		}
	}
}

//**********************************************************************
//-------Get Customer Setup File Informations-------------------------
//********************************************************************
int GetCustomerSetupFile()
{
	AddLog_All( "GetCustomerSetupFile Start");
	//***********************************************************************************
	//--------Create a new Inifile object and read it from a file  ------------------
	//***********************************************************************************
	if (!(g_CustomerSetupFile = Ini_New (0)))
	{
		AddLog_All(  "Error allocating memory for Inifile");
		goto Error;
	}
	//****************************************************************************
	// --------- Get Project pathname --------------------------
	//***************************************************************************
	GetProjectDir (CustomerFileName);

	strcat(CustomerFileName,"\\MTK_SETUP.ini");
	AddLog_All( CustomerFileName);
	//********************************************************************
	if (Ini_ReadFromFile (g_CustomerSetupFile, CustomerFileName))
	{
		AddLog_All( "Error reading Inifile");
		goto Error;
	}

	//读取参数
	Ini_GetInt (g_CustomerSetupFile, "Coupling Setup","COM PORT_1", &comport[0]);
	Ini_GetInt (g_CustomerSetupFile, "Coupling Setup","COM PORT_2", &comport[1]);
	Ini_GetStringCopy (g_CustomerSetupFile, "Coupling Setup", "TrafficBand", &TrafficBand);
	Ini_GetInt (g_CustomerSetupFile, "Coupling Setup","TrafficPower", &TrafficPower);
	Ini_GetInt (g_CustomerSetupFile, "Coupling Setup","TrafficPowerOffset", &TrafficPowerOffset);
	Ini_GetStringCopy (g_CustomerSetupFile, "Coupling Setup", "Version", &Version);
	Ini_GetStringCopy (g_CustomerSetupFile, "Coupling Setup", "SoftModel", &SoftModel);
	Ini_GetRawStringIntoBuffer (g_CustomerSetupFile, "Coupling Setup", "GPIB Address",GPIB_ADDR_8960,20 );
	Ini_GetStringCopy (g_CustomerSetupFile, "Coupling Setup", "TcpIp", &TcpIp);
	Ini_GetInt (g_CustomerSetupFile, "Coupling Setup","TcpPort", &portNum);
	TrafficPowerMax=TrafficPower+TrafficPowerOffset;
	TrafficPowerMin=TrafficPower-TrafficPowerOffset;
	Ini_GetStringCopy (g_CustomerSetupFile, "Coupling Setup","ATLINK", &reATLINK);
	Ini_GetStringCopy (g_CustomerSetupFile, "Coupling Setup","Tester", &Tester);

	//读取的参数写入日志中
	sprintf(strLog, "COM PORT1:%d\r\nCOM PORT2:%d\r\nTrafficBand:%s\r\nTrafficPower:%d+-TrafficPowerOffset:%d\r\nVersion:%s\r\nGPIB Address:%s\r\nTcpIp:%s\r\nportNum:%d\r\nreATLINK:%s\r\nTester:%s\r\n",
			comport[0],comport[1],TrafficBand,TrafficPower,TrafficPowerOffset,Version,GPIB_ADDR_8960,TcpIp,portNum,reATLINK,Tester);
	AddLog_All(strLog);

	return 0;
Error:
	return -1;
}
int CVIFUNC SetActiveCtrlMySelf(int panel, int control)
{
	int otherAtt,curAtt;	//对方属性，自己属性
	int activeControl;	//焦点控件

	//、对方可输入则不变换焦点
	//GetCtrlAttribute (panel, control, ATTR_DIMMED,&curAtt);

	//activeControl=GetActiveCtrl(panel);
	if(GetFocusCtrol==control)
	{
		return 0;
	}
	else
	{
		if(control== PANEL_IMEI)
		{
			GetCtrlAttribute (panel, PANEL_IMEI_2, ATTR_DIMMED,&otherAtt);
			if((otherAtt==0) && (GetFocusCtrol==PANEL_IMEI_2))
			{
				SetActiveCtrl ( panel, PANEL_IMEI_2 );
				return 0;
			}

		}
		else if(control== PANEL_IMEI_2)
		{
			GetCtrlAttribute (panel, PANEL_IMEI, ATTR_DIMMED,&otherAtt);
			if((otherAtt==0) && (GetFocusCtrol==PANEL_IMEI))
			{
				SetActiveCtrl ( panel, PANEL_IMEI );
				return 0;
			}

		}
	}
	/*if(control== PANEL_IMEI){
		GetCtrlAttribute (panel, PANEL_IMEI_2, ATTR_DIMMED,&otherAtt);
		if(otherAtt==0){

			return 0;
		}

	}
	else
	if(control== PANEL_IMEI_2){
		GetCtrlAttribute (panel, PANEL_IMEI, ATTR_DIMMED,&otherAtt);
		if(otherAtt==0){
			return 0;
		}

	}

	if(control== PANEL_IMEI){
					if(curAtt==0){
						SetActiveCtrl ( panel, PANEL_IMEI_2 );
					}
					return 0;

	}
	else if(control== PANEL_IMEI_2){

					if(curAtt==0){
						SetActiveCtrl ( panel, PANEL_IMEI );
					}
					return 0;
	}*/
	SetActiveCtrl ( panel, control );
	return 1;
}

