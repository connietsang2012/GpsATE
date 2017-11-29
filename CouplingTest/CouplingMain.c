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
//-------------------------------耦合测试---------------------------
//**************************************************************************************************************

//GPIB通讯超时时间
static int GPIB_TIMEOUT_8960=5000;
//8960的读写操作结果
int AG8960_Status;
//8960查询的结果（int,string）
int AG_Read_Int32;
char AG_Read_Str[20];
//8960延迟时间
int AG8960_DelayTime=2.0;
//会话层,处理8960
static ViSession    InstrHandle = VI_NULL;

//开始耦合测试
int StartCouplingTest(void);
//查询TXP值
int QueryTXPValue();




//*************************************************************************************************************
//-------------------------------串口操作---------------------------
//**************************************************************************************************************
//打开串口参数

int ComIsOpen=0; 

int OpenComPort(void);
int CloseComPort(void);
void SendByte(ViString);

char CmdKey[MAX_REC_LEN];
char write_buffer[MAX_SEND_LEN];

int iSends=0;	//已发送次数
//动态获得可用串口
int GetComPortDynamiclly(void);
//打开串口
int OpenComm(void);

int CommRec_OK();






//*************************************************************************************************************
//-------------------------------更新测试结果,设置总测试结果---------------------------
//**************************************************************************************************************
int UpdateResultMsg(ViString/*,int*/);

int SetTestResult(int);
int SetTestResultPrompt(int,ViString);
char strRid[33];

int WriteIMEI();
char strIMEI[17];

//*************************************************************************************************************
//-------------------------------TCP---------------------------
//**************************************************************************************************************


int iTcpSends=0;	//已发送次数
char TcpCmdKey[MAX_SEND_LEN];
char TcpCmd[MAX_SEND_LEN];

int TcpConnect(void);
int SendToTcp(ViString,ViString);
static unsigned int g_hconversation;
static int			g_connected = 0;
static int			g_TCPError = 0;

/*---------------------------------------------------------------------------*/
/* Internal function prototypes                                              */
/*---------------------------------------------------------------------------*/
int CVICALLBACK ClientTCPCB (unsigned handle, int event, int error,
							 void *callbackData);
static void ReportTCPError (void);


int comport=2;
ViString TrafficBand="";
int TrafficPower;
int TrafficPowerOffset;
float  TrafficPowerMax,TrafficPowerMin;

ViString Version;
ViString SoftModel;
ViString Tester;
//GPIB地址
char GPIB_ADDR_8960[MAX_PATHNAME_LEN]="";
int  portNum;
ViString TcpIp;
ViString reATLINK;
//*************************************************************************************************************
//-------------------------------从INI文件读取客户自定义参数---------------------------
//**************************************************************************************************************
//获得客户自定义设置
int GetCustomerSetupFile(void);
//客户自定义句柄
IniText g_CustomerSetupFile = 0;
//客户自定义文件名
char CustomerFileName[MAX_PATHNAME_LEN]="";

int g_TestResult=-1;
char strLog[MAX_SEND_LEN];
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
	OpenComm();

	//TCP连接
	TcpConnect();

	RunUserInterface ();
	DiscardPanel (panelHandle);
	return 0;
}

int CVICALLBACK CouplingTest (int panel, int control, int event,
							  void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			//初始化测试结果，开始测试
			SetTestResult(-1);
			
			UpdateResultMsg("<====开始耦合测试====>");
			//发送TEST指令
			UpdateResultMsg("<====进入测试模式====>"); 
			strcpy(write_buffer, ATTEST);
			SendByte(write_buffer);
			break;
	}
	return 0;
}
int  CVICALLBACK ComConnect(int panel, int control, int event, void *callbackData, int eventData1, int eventData2){
	switch (event)
	{
		case EVENT_COMMIT:
			//连接串口
			OpenComm();
			break;
	}
	return 0;
}
int  CVICALLBACK ComDisConnect(int panel, int control, int event, void *callbackData, int eventData1, int eventData2){
	switch (event)
	{
		case EVENT_COMMIT:
			//断开串口 
			CloseComPort(); 
			break;
	}
	return 0;
}
//发送AT指令超时
int CVICALLBACK sendcmd_timer (int panel, int control, int event,
							   void *callbackData, int eventData1, int eventData2)
{
	if(++iSends<=3)
	{
		sprintf(strLog,"串口第%d次发送", iSends); 
		AddLog(strLog); 
		if(strcmp(CmdKey,"")!=0)
		{
			strcpy(write_buffer, CmdKey);
			SendByte(write_buffer);
		}
	}
	else
	{
		iSends=0;
		AddLog("AT指令超时，测试结果失败");
		//AT指令超时，测试结果失败
		SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDCMD, ATTR_ENABLED, 0);
		SetTestResult(0);
	}
	return 0;
}
//发送AT指令超时
int CVICALLBACK sendTcpcmd_timer (int panel, int control, int event,
								  void *callbackData, int eventData1, int eventData2)
{
	if(++iTcpSends<=3)
	{
		if(strcmp(TcpCmdKey,"")!=0)
		{
			sprintf(strLog,"TCP第%d次发送", iTcpSends); 
			AddLog(strLog);
			
			SendToTcp(TcpCmdKey,TcpCmd);
		}
	}
	else
	{
		iTcpSends=0;
		//TCP指令超时，测试结果失败
		AddLog("TCP指令超时，测试结果失败");
		SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDTCPCMD, ATTR_ENABLED, 0);
		SetTestResult(0);
	}
	return 0;
}

int CVICALLBACK Quit (int panel, int control, int event,
					  void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			AddLog("程序退出!"); 
			strcpy(CmdKey,"");
			strcpy(TcpCmdKey,"");
			//关闭串口
			CloseComPort();
			
			if (g_connected)
					DisconnectFromTCPServer (g_hconversation);
			
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
			OpenComm();
			break;
	}
	return 0;
}
int CVICALLBACK Get_IMEI (int panel, int control, int event,
						  void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			UpdateResultMsg("<====IMEI已输入====>");
			
			GetCtrlVal (panelHandle, PANEL_IMEI, strIMEI);
			AddLog(strIMEI);
			
			//判断IMEI是否有效 
			char IMEI14[14];
			strncpy(IMEI14, strIMEI, 14);
			char checkSum=GetIMEICheckDigit(IMEI14);
			char scanCheckSum=strIMEI[14];
			if(checkSum==scanCheckSum)
			{
				AddLog("合法IMEI");
				
				//初始化测试结果，开始测试
				SetTestResult(-1);
				
				sprintf(TcpCmd, "Action=CheckIMEI#IMEI=%s#Tester=%s#", strIMEI,Tester);
				SendToTcp("CheckIMEI",TcpCmd);
				
			}
			else
			{
				SetTestResultPrompt(-2,"IMEI无效！");
			}
			break;

	}
	return 0;
}

//打开串口
int OpenComm()
{
	GetCtrlVal (panelHandle, PANEL_COM_PORT_SETTING, &comport);
	sprintf(strLog,"选择的串口:%d", comport);
	AddLog(strLog);
	CloseComPort();
	OpenComPort();
	if(ComIsOpen==1){
		AddLog("串口打开成功!");
		SetCtrlAttribute (panelHandle, PANEL_COMCONNECT, ATTR_DIMMED, 1);
		SetCtrlAttribute (panelHandle, PANEL_COMDISCONNECT, ATTR_DIMMED, 0);
		SetCtrlVal(panelHandle, PANEL_IMEI, ""); 
		SetActiveCtrl ( panelHandle, PANEL_IMEI );
		SetCtrlVal(panelHandle, PANEL_TESTRESULT, "");  
	}
	else{
		AddLog("串口打开失败!");
		SetCtrlAttribute (panelHandle, PANEL_COMCONNECT, ATTR_DIMMED, 0);
		SetCtrlAttribute (panelHandle, PANEL_COMDISCONNECT, ATTR_DIMMED, 1);
	}
	
	return 0;
}
int CommRec_OK()
{
	iSends=0;
	strcpy(CmdKey,"");
	SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDCMD, ATTR_ENABLED, 0);
	UpdateResultMsg("成功");
	return 0;
}
//串口收到数据
void CVICALLBACK Event_Char_Func(int portNo, int eventMask, void *callbackData)
{
	char readBuf[MAX_REC_LEN*2] = {0};
	int strLen;

	strLen = GetInQLen(portNo);
	ComRd(portNo,readBuf,strLen);
	AddLog(readBuf);

	if (strpos(readBuf,"Sensor_OK",0)>=0)
	{
		return ;
	}
	if(strcmp(CmdKey,ATTEST)==0)
	{
		if (strpos(readBuf,"TEST_OK",0)>=0)
		{
			CommRec_OK();
			strcpy(write_buffer, ATVERSION);
			SendByte(write_buffer);
			UpdateResultMsg("<====获得终端软件版本号====>");
		}

	}
	else if(strcmp(CmdKey,ATVERSION)==0)
	{

		if (strpos(readBuf,Version,0)>=0)
		{
			sprintf(strLog, "\t%s",Version);
			UpdateResultMsg(strLog);

			CommRec_OK();
			strcpy(write_buffer, ATID);
			SendByte(write_buffer);
			UpdateResultMsg("<====读取基带ID====>");			
		}
		else{
			UpdateResultMsg("软件版本不正确!");	
		}

	}
	else if(strcmp(CmdKey,ATID)==0)
	{
		if (strpos(readBuf,"RID:",0)>=0)
		{
			CommRec_OK();
			
			//取RID
			ViString readTemp=readBuf;
			char* data=strreplace(readTemp," ","");
			int StartPos=strpos(data,"ChipRID:",0);
			substring(data,strRid,StartPos+strlen("ChipRID:"),32);
			
			sprintf(TcpCmd, "Action=CheckTested#PlanName=WriteImei#ChipRid=%s#SoftModel=%s#Version=%s#Tester=%s#", 
				   strRid,SoftModel,Version,Tester);
			SendToTcp("CheckTested",TcpCmd);
		}
	}
	else if(strcmp(CmdKey,ATLINK)==0)
	{
		if (strpos(readBuf,reATLINK,0)>=0)
		{
			CommRec_OK();
			strcpy(write_buffer, ATRFBAR);
			SendByte(write_buffer);
			UpdateResultMsg("<====读取RF参数====>"); 
		}

	}
	else if(strcmp(CmdKey,ATRFBAR)==0)
	{
		if (strpos(readBuf,"RF CODE PASS",0)>=0)
		{
			CommRec_OK();

			StartCouplingTest();
		}
	}
	
	else if(strcmp(CmdKey,ATCFUN0)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			strcpy(write_buffer, ATCFUN1);
			SendByte(write_buffer);
			UpdateResultMsg("<====开网====>");
		}
	}
	else if(strcmp(CmdKey,ATCFUN1)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			strcpy(write_buffer, ATD112);
			SendByte(write_buffer);
			UpdateResultMsg("<====拔打112====>");
		}
	}
	else if(strcmp(CmdKey,ATD112)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			UpdateResultMsg("<====查询TXP值====>");
			QueryTXPValue();
		}
	}
	else if(strcmp(CmdKey,ATH)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();

			UpdateResultMsg("<====写IMEI====>");
			WriteIMEI();
		}

	}
	else if(strpos(CmdKey,ATWIMEI,0)>=0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			UpdateResultMsg("<====读IMEI====>");
			strcpy(write_buffer,ATRIMEI);
			SendByte(write_buffer);
		}

	}
	else if(strpos(CmdKey,ATRIMEI,0)>=0)
	{
		if (strpos(readBuf,"IMEI:",0)>=0)
		{
			//取机子中的IMEI
			ViString readImei=readBuf;
			char readImeiTemp[16];
			int StartPos=strpos(readImei,"IMEI:",0);
			substring(readImei,readImeiTemp,StartPos+strlen("IMEI:"),15);
			UpdateResultMsg(readImeiTemp);
			
			if(strcmp(readImeiTemp,strIMEI)==0)
			{
				CommRec_OK();
				UpdateResultMsg("<====清除最后一个点====>");
				strcpy(write_buffer,ATCLEAR);
				SendByte(write_buffer);
			}
			else
			{
				UpdateResultMsg("<====IMEI读取的IMEI与写入的不相同====>");
			}
		}

	}
	else if(strpos(CmdKey,ATCLEAR,0)>=0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			UpdateResultMsg("<====恢复出厂设置====>");
			strcpy(write_buffer,ATFACTORYALL);
			SendByte(write_buffer);
		}
	}
	else if(strpos(CmdKey,ATFACTORYALL,0)>=0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			SetTestResult(1);
		}

	}
}

//------------------------------------------开始耦合测试-------------------------------------- //
int StartCouplingTest()
{
	AddLog("StartCouplingTest Start");
	//AG8960初始化
	AG8960_Status = age1960_init (GPIB_ADDR_8960, VI_FALSE, VI_TRUE, &InstrHandle);
	if( AG8960_Status != 0)
	{
		goto Error;
	}
	//设置超时时间
	AG8960_Status=age1960_timeOut (InstrHandle, GPIB_TIMEOUT_8960);
	if( AG8960_Status != 0)
	{
		goto Error;
	}
	//AG8960_Handle = InstrHandle;
	/*AG8960_Status=age1960_reset (InstrHandle);
	if( AG8960_Status != 0)
	{
		goto Error;
	}*/

	//返回状态VI_SUCCESS
	//开启GPIB调试器
	AG8960_Status = age1960_cmd (InstrHandle, "SYST:COMM:GPIB:DEB ON");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	//连接类型：自动
	AG8960_Status = age1960_cmd (InstrHandle, "CALL:FUNC:CONN:TYPE AUTO");
	if( AG8960_Status != 0)
	{
		goto Error;
	}
	//关闭蜂鸣器
	AG8960_Status = age1960_cmd (InstrHandle, "SYST:BEEP:STAT OFF");
	if( AG8960_Status != 0)
	{
		goto Error;
	}


	AG8960_Status = age1960_cmd (InstrHandle, "SET:CONT:OFF");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	//CALL:POW %f
	AG8960_Status = age1960_cmd (InstrHandle, "CALL:POW -35.000000");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	AG8960_Status = age1960_cmd (InstrHandle, "CALL:MS:TADV 0");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	//返回值+1
	AG8960_Status = age1960_cmdInt32_Q (InstrHandle, "SYST:SYNC?",&AG_Read_Int32);
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	//清屏?
	AG8960_Status = age1960_cmd (InstrHandle, "*CLS");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	//返回DCS
	AG8960_Status = age1960_cmdString_Q (InstrHandle, "CALL:BIND?", 4,AG_Read_Str);
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	ViString sendCmd="CALL:TCH:BAND DCS";
	sprintf(sendCmd, "CALL:TCH:BAND %s", TrafficBand);
	AG8960_Status = age1960_cmd (InstrHandle, sendCmd);
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	AG8960_Status = age1960_cmd (InstrHandle, "CALL:TCH:DCS 698");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	//CALL:MS:TXL %d
	AG8960_Status = age1960_cmd (InstrHandle, "CALL:MS:TXL 0");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	AG8960_Status = age1960_cmd (InstrHandle, "SYST:MEAS:RES");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	AG8960_Status = age1960_cmd (InstrHandle, "SYST:CORR:SFR  1747.40 MHZ,1842.40 MHZ");
	if( AG8960_Status != 0)
	{
		goto Error;
	}


	AG8960_Status = age1960_cmd (InstrHandle, "SYST:CORR:SGA -19.00,-19.00");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	UpdateResultMsg("<====关网====>");   
	strcpy(write_buffer, ATCFUN0);
	SendByte(write_buffer);
	AddLog("StartCouplingTest End");
	return 0;
	
	//耦合测试失败
Error:
	AddLog("StartCouplingTest Error");
	SetTestResult(0);
	return (-1);

}
int QueryTXPValue()
{
	AddLog("QueryTXPValue Start"); 
	bool testResult=TRUE;
	int Count=0,AgainCount=0,RequestTXPCount=0;
	//查询连接状态
	//返回值0
	age1960_cmdInt32_Q (InstrHandle, "CALL:CONN:STAT?", &AG_Read_Int32);
	if(AG_Read_Int32 ==0)
	{
		AG8960_Status = age1960_cmd (InstrHandle, "CALL:MS:REP:CLE");
		if( AG8960_Status != 0)
		{
			goto Error;
		}
	}
CallAgain:
	AG8960_Status = age1960_cmd (InstrHandle, "CALL:CONN:TIM 10 S");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	AG8960_Status = age1960_cmd (InstrHandle, "CALL:CONN:ARM");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	//查询呼叫状态　IDLE SREQ CONN
	AG8960_Status = age1960_cmdString_Q (InstrHandle, "CALL:STAT?", 5,AG_Read_Str);
	Delay(AG8960_DelayTime);
	UpdateResultMsg(AG_Read_Str);
	Count=0;
	while(strcmp(AG_Read_Str,"CONN")!=0)
	{
		if(++Count>5)
		{
			if(++AgainCount>6)
			{
				testResult=FALSE;
				goto CouplingEnd;
				Delay(AG8960_DelayTime*2);
			}
			goto CallAgain;
		}
		AG8960_Status = age1960_cmdString_Q (InstrHandle, "CALL:STAT?", 5,AG_Read_Str);
	}
RequestTXP:
	AG8960_Status = age1960_cmd (InstrHandle, "SET:TXP:TIM:STIM 10");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	AG8960_Status = age1960_cmd (InstrHandle, "SET:TXP:COUN:SNUM 3");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	AG8960_Status = age1960_cmd (InstrHandle, "INIT:TXP");
	if( AG8960_Status != 0)
	{
		goto Error;
	}
GetTXPValue:
	age1960_cmdString_Q (InstrHandle, "INIT:DONE?",4, AG_Read_Str);
	if(strcmp(AG_Read_Str,"TXP")==0)
	{
		age1960_cmdString_Q (InstrHandle, "FETC:TXP?",20, AG_Read_Str);
		float value=getTXPValue(AG_Read_Str);
		sprintf(strLog, "<====当前DB值:%5.2f====>", value);
		UpdateResultMsg(strLog);
		if(value<=TrafficPowerMin || value>=TrafficPowerMax)
		{
			//判断信号值
			if(++RequestTXPCount<4)
			{
				AG8960_Status = age1960_cmd (InstrHandle, "INIT:TXP:OFF");
				if( AG8960_Status != 0)
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

		AG8960_Status = age1960_cmd (InstrHandle, "INIT:TXP:OFF");
		if( AG8960_Status != 0)
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
	AG8960_Status = age1960_cmd (InstrHandle, "*CLS");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	AG8960_Status = age1960_cmd (InstrHandle, "CALL:END");
	if( AG8960_Status != 0)
	{
		goto Error;
	}
	AG8960_Status = age1960_cmdString_Q (InstrHandle, "CALL:STAT?", 5,AG_Read_Str);
	if(strcmp(AG_Read_Str,"IDLE")!=0)
	{
		goto Error;
	}
	if(testResult)
	{
		strcpy(write_buffer, ATH);
		SendByte(write_buffer);
		UpdateResultMsg("<====耦合测试成功====>");
		return 0;
	}
	else
	{
		goto Error;
	}
	AddLog("QueryTXPValue End"); 
	return 0;
	//耦合测试失败
Error:
	UpdateResultMsg("<====耦合测试失败====>");
	SetTestResult(0);
	return (-1);
}

int WriteIMEI()
{
	strcpy(write_buffer, ATWIMEI);
	strcat(write_buffer,strIMEI);
	sprintf(strLog,"写入IMEI:%s",strIMEI);
	AddLog(strIMEI);
	SendByte(write_buffer);
	return 0;
}
//**********************************************************************
//-------动态获得可用串口-------------------------
//********************************************************************
int GetComPortDynamiclly(void)
{
	AddLog("GetComPortDynamiclly start");      
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
			goto Error;
			MessagePopup("FAIL","Get Com Port Fail");
			AddLog("Get Com Port Fail");
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
		if ( result < 0 )
		{
			MessagePopup ("Com", "Fail");
			AddLog("Fail");
			goto Error;
		}
	}
	return 0;
Error:
	return -1;
}
int UpdateResultMsg(ViString Msg)
{
	AddLog(Msg);
	SetCtrlVal (panelHandle, PANEL_RESULTS, Msg);
	InsertTextBoxLine (panelHandle, PANEL_RESULTS, -1, "");
	return 0;
}

int SetTestResult(int iResult)
{
	sprintf(strLog,"SetTestResult:%d",iResult);
	AddLog(strLog);
	g_TestResult=iResult;
	if(iResult==-1)
	{
		AddLog("测试初始化!"); 
		ResetTextBox (panelHandle, PANEL_RESULTS, "");
		strcpy(CmdKey,"");
		strcpy(TcpCmdKey,"");
		strcpy(strRid,"");
		SetCtrlAttribute (panelHandle, PANEL_TEST, ATTR_DIMMED, 1);
		SetCtrlAttribute (panelHandle, PANEL_IMEI, ATTR_DIMMED, 1);
		SetCtrlVal(panelHandle, PANEL_TESTRESULT, "");
		SetCtrlAttribute (panelHandle, PANEL_TESTRESULT, ATTR_TEXT_BGCOLOR , VAL_GRAY);
	}
	else if(iResult==0)
	{
		AddLog("测试失败!");
		sprintf(TcpCmd, "Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s","WriteImei",strRid,SoftModel,Version,strIMEI,iResult,Tester);
		SendToTcp("UpdateResult",TcpCmd);
	}
	else if(iResult==1)
	{
		AddLog("测试成功!");
		sprintf(TcpCmd, "Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s","WriteImei",strRid,SoftModel,Version,strIMEI,iResult,Tester);
		SendToTcp("UpdateResult",TcpCmd);
	}
	return 0;
}
int SetTestResultPrompt(int iResult,ViString prompt)
{
	sprintf(strLog,"SetTestResultPrompt:%d,%s",iResult,prompt);
	AddLog(strLog);
	
	SetCtrlAttribute (panelHandle, PANEL_TEST, ATTR_DIMMED, 0);
	SetCtrlAttribute (panelHandle, PANEL_IMEI, ATTR_DIMMED, 0);
	SetCtrlVal(panelHandle, PANEL_TESTRESULT, prompt);
	strcpy(CmdKey,"");
	strcpy(TcpCmdKey,"");
	SetCtrlVal(panelHandle, PANEL_IMEI, "");
	SetActiveCtrl ( panelHandle, PANEL_IMEI );
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
	return 0;
}

//TCP连接
int TcpConnect()
{
	AddLog("与服务器连接!");
	SetWaitCursor (1);
	if (ConnectToTCPServer (&g_hconversation, portNum, TcpIp, ClientTCPCB,
							NULL, 5000) < 0)
	{
		//MessagePopup("TCP Client", "Connection to server failed !");
		SetTestResultPrompt(-2,"与服务器连接失败!");
		g_connected=0;
	}
	else
	{
		AddLog("与服务器连接成功!"); 
		g_connected = 1;
		SetCtrlVal (panelHandle, PANEL_CONNECTED, 1);
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
	char receiveBuf[MAX_REC_LEN] = {0};
	
	ssize_t dataSize         = sizeof (receiveBuf) - 1;

	switch (event)
	{
		case TCP_DATAREADY:
			if ((dataSize = ClientTCPRead (g_hconversation, receiveBuf,
										   dataSize, 1000))< 0)
			{
				SetTestResultPrompt(-2,"接收失败!");
			}
			else
			{
				receiveBuf[dataSize] = '\0';
				AddLog(receiveBuf);
				//处理收到的数据
				if((strcmp(TcpCmdKey,"CheckIMEI")==0) || (strcmp(TcpCmdKey,"UpdateResult")==0) 
				  || (strcmp(TcpCmdKey,"CheckTested")==0))
				{
					//取结果
					char result[2];
					int StartPos=strpos(receiveBuf,"iRecordCount=",0);
					substring(receiveBuf,result,StartPos+strlen("iRecordCount="),1);
					int iResult=atoi(result);
					if(strcmp(TcpCmdKey,"CheckTested")==0)
					{
						if(iResult>=1)
						{
							SetTestResultPrompt(-2,"此机子已测试过!");
						}
						else
						{	
							UpdateResultMsg("<====开始耦合测试====>");
							strcpy(write_buffer, ATLINK);
							SendByte(write_buffer);
							UpdateResultMsg("<====获得LINK====>");
						}
					}
					else if(strcmp(TcpCmdKey,"CheckIMEI")==0)
					{

						if(iResult>=1)
						{
							SetTestResultPrompt(-2,"此IMEI已烧写过!");
						}
						else
						{
							//发送TEST指令
							UpdateResultMsg("<====进入测试模式====>");
							strcpy(write_buffer, ATTEST);
							SendByte(write_buffer);
						}
					}
					else if(strcmp(TcpCmdKey,"UpdateResult")==0)
					{
						if((iResult>=1) && (g_TestResult==1))
						{
							SetTestResultPrompt(1,"P A S S");
						}
						else
						{
							SetTestResultPrompt(0,"F A I L");
						}
					}
				}
				break;
			case TCP_DISCONNECT:
				SetTestResultPrompt(-2,"与服务器断开!");;
				SetCtrlVal (panelHandle, PANEL_CONNECTED, 0);
				g_connected = 0;
				break;
			}
			return 0;
	}
	return 1;
}

//发送至服务器　 TempTcpCmdKey:关键字　 SendMsg:发送的内容
int SendToTcp(ViString TempTcpCmdKey,ViString SendMsg)
{
	if(g_connected==0){
		SetTestResultPrompt(-2,"未连接服务器!");
	}
	else{
	AddLog(SendMsg); 	
	strcpy(TcpCmdKey,TempTcpCmdKey);
	strcat (SendMsg, "\n");
	if (ClientTCPWrite (g_hconversation, SendMsg,strlen (SendMsg), 1000)<0)
	{
		SetTestResultPrompt(-2,"发送服务器失败!");
	}
	}
	return 0;
}
int OpenComPort()
{
	AddLog("OpenComPort Start");
	int RS232Error;
	char devicename[30];
	sprintf(devicename, "COM%d", comport);
	DisableBreakOnLibraryErrors();
	RS232Error = OpenComConfig (comport, devicename, baudrate, parity, databits, stopbits, inputq, outputq);
	EnableBreakOnLibraryErrors();
	if (RS232Error< 0)
	{
		SetTestResultPrompt(-2,"打开串口失败!");
		ComIsOpen=0;
		return -1;
	}
	ComIsOpen=1;
	SetComTime (comport, 0.2);
	FlushInQ (comport);
	FlushOutQ (comport);
	InstallComCallback(comport,LWRS_RXFLAG,0,10,Event_Char_Func,0);  //以回车为标志位，接收到回车就产生中断，调用中断函数UartComCall
	AddLog("OpenComPort End");
	return 0;
};
int CloseComPort()
{
	AddLog("CloseComPort Start");
	ComIsOpen=0;
	CloseCom (comport);
	if(ComIsOpen==1){
		
		SetCtrlAttribute (panelHandle, PANEL_COMCONNECT, ATTR_DIMMED, 1);
		SetCtrlAttribute (panelHandle, PANEL_COMDISCONNECT, ATTR_DIMMED, 0);
	}
	else{
		SetCtrlAttribute (panelHandle, PANEL_COMCONNECT, ATTR_DIMMED, 0);
		SetCtrlAttribute (panelHandle, PANEL_COMDISCONNECT, ATTR_DIMMED, 1);
	}
	AddLog("CloseComPort End"); 
	return 0;
};

void SendByte(ViString ch)
{
	int RS232Error;
	if(ComIsOpen == 0)
		SetTestResultPrompt(-2,"串口还未打开!");
	else
	{
		FlushOutQ(comport);  //清空发送缓存区
		strcpy(CmdKey,ch);
		strcat(ch,"\r\n");
		RS232Error = ComWrt (comport, ch,strlen(ch));
		SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDCMD, ATTR_ENABLED, 1);
	}
}

//**********************************************************************
//-------Get Customer Setup File Informations-------------------------
//********************************************************************
int GetCustomerSetupFile()
{
	AddLog("GetCustomerSetupFile Start");
	//***********************************************************************************
	//--------Create a new Inifile object and read it from a file  ------------------
	//***********************************************************************************
	if (!(g_CustomerSetupFile = Ini_New (0)))
	{
		AddLog("Error allocating memory for Inifile");
		goto Error;
	}
	//****************************************************************************
	// --------- Get Project pathname --------------------------
	//***************************************************************************
	GetProjectDir (CustomerFileName);

	strcat(CustomerFileName,"\\MTK_SETUP.ini");
	AddLog(CustomerFileName);
	//********************************************************************
	if (Ini_ReadFromFile (g_CustomerSetupFile, CustomerFileName))
	{
		AddLog("Error reading Inifile"); 
		goto Error;
	}

	//读取参数
	Ini_GetInt (g_CustomerSetupFile, "Coupling Setup","COM PORT", &comport);
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
	sprintf(strLog, "COM PORT:%d\r\nTrafficBand:%s\r\nTrafficPower:%d+-TrafficPowerOffset:%d\r\nVersion:%s\r\nGPIB Address:%s\r\nTcpIp:%s\r\nportNum:%d\r\nreATLINK:%s\r\nTester:%s\r\n", 
			comport,TrafficBand,TrafficPower,TrafficPowerOffset,Version,GPIB_ADDR_8960,TcpIp,portNum,reATLINK,Tester);
	AddLog(strLog);
	
	return 0;
Error:
	return -1;
}

