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

//主界面
static int panelHandle;

//*************************************************************************************************************
//-------------------------------耦合测试---------------------------
//**************************************************************************************************************
//GPIB地址
char GPIB_ADDR_8960[MAX_PATHNAME_LEN]="";
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


ViString TrafficBand="";
int TrafficPower;

int TrafficPowerOffset;
float  TrafficPowerMax,TrafficPowerMin;

//*************************************************************************************************************
//-------------------------------从INI文件读取客户自定义参数---------------------------
//**************************************************************************************************************
//获得客户自定义设置
int GetCustomerSetupFile(void);
//客户自定义句柄
IniText g_CustomerSetupFile = 0;
//客户自定义文件名
char CustomerFileName[MAX_PATHNAME_LEN]="";

//*************************************************************************************************************
//-------------------------------串口操作---------------------------
//**************************************************************************************************************

//打开串口参数
int comport=2;
int baudrate = 115200;
int parity = 0;
int databits = 8;
int stopbits = 1;
int inputq = 32000;
int outputq = 32000;
int OpenComPort(void);
int CloseComPort(void);
void SendByte(ViString);
char CmdKey[400];
char write_buffer[400];

int iSends=0;	//已发送次数
//动态获得可用串口
int GetComPortDynamiclly(void);
//打开串口
int OpenComm(void);

int CommRec_OK();


ViString Version;

char ATTEST[400]="AT^GT_CM=TEST";//进入测试模式   TEST_OK
char ATVERSION[400]="AT^GT_CM=VERSION";//读取软件版本  [VERSION]GT02F_20_61DM2_B25E_R0_V02
char ATLINK[400]="AT^GT_CM=LINK";//获得LINK   LINK:6
char ATRFBAR[400]="AT^GT_CM=RF_BAR";			 //读RF  RF CODE PASS
char ATCFUN0[400]="AT+CFUN=0";   //关网
char ATCFUN1[400]="AT+CFUN=1";   //开网
char ATD112[400]="ATD112;";		 //拔打112
char ATH[400]="ATH;";			 //挂断
char ATWIMEI[400]="AT^GT_CM=IMEI,1,";			 //写IMEI
char ATRIMEI[400]="AT^GT_CM=IMEI";			 //读IMEI  IMEI:222222222222222

char ATCLEAR[400]="AT^GT_CM=CLEAR";			 //清除GPS定位点  OK!
char ATFACTORYALL[400]="AT^GT_CM=FACTORYALL";			 //恢复出厂设置 NVRAM执行成功! The terminal will restart after 60s!

//*************************************************************************************************************
//-------------------------------更新测试结果,设置总测试结果---------------------------
//**************************************************************************************************************
int UpdateResultMsg(ViString/*,int*/);

int SetTestResult(int);


int WriteIMEI();
char strIMEI[17];
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
			//SetCtrlAttribute (panelHandle, PANEL_IMEI, ATTR_CTRL_MODE, VAL_HOT);
		
			//初始化测试结果，开始测试
			SetTestResult(-1);
			UpdateResultMsg("<====开始耦合测试====>");
			//发送TEST指令
			strcpy(write_buffer, ATTEST);
			SendByte(write_buffer);
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
		if(strcmp(CmdKey,"")!=0)
		{

			strcpy(write_buffer, CmdKey);
			SendByte(write_buffer);
		}
	}
	else
	{
		iSends=0;
		//AT指令超时，测试结果失败
		SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDCMD, ATTR_ENABLED, 0);
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
			//关闭串口
			CloseComPort();
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
			//判断IMEI是否有效


			GetCtrlVal (panelHandle, PANEL_IMEI, strIMEI);
			char IMEI14[14];
			strncpy(IMEI14, strIMEI, 14);
			char checkSum=GetIMEICheckDigit(IMEI14);
			char scanCheckSum=strIMEI[14];
			if(checkSum==scanCheckSum)
			{
				//初始化测试结果，开始测试
				SetTestResult(-1);
				//UpdateResultMsg("<====开始耦合测试====>");
				//发送TEST指令
				strcpy(write_buffer, ATTEST);
				SendByte(write_buffer);
				//WriteIMEI();
			}
			else
			{
				MessagePopup("Error","IMEI无效！");
			}
			break;

	}
	return 0;
}

//打开串口
int OpenComm()
{
	GetCtrlVal (panelHandle, PANEL_COM_PORT_SETTING, &comport);
	CloseComPort();
	OpenComPort();
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
	char readBuf[256] = {0};
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
			UpdateResultMsg("<====进入测试模式====>");
			CommRec_OK();
			strcpy(write_buffer, ATVERSION);
			SendByte(write_buffer);
			UpdateResultMsg("<====开始获得终端软件版本号====>");
		}

	}
	else if(strcmp(CmdKey,ATVERSION)==0)
	{

		if (strpos(readBuf,Version,0)>=0)
		{
			char strVersion[400];
			sprintf(strVersion, "\t%s",Version);
			UpdateResultMsg(strVersion);

			CommRec_OK();
			strcpy(write_buffer, ATLINK);
			SendByte(write_buffer);
			UpdateResultMsg("<====开始获得LINK====>");
		}

	}
	else if(strcmp(CmdKey,ATLINK)==0)
	{
		if (strpos(readBuf,"LINK:6",0)>=0)
		{
			CommRec_OK();
			strcpy(write_buffer, ATRFBAR);
			SendByte(write_buffer);
			UpdateResultMsg("<====开始读取RF参数====>");

		}

	}
	else if(strcmp(CmdKey,ATRFBAR)==0)
	{

		if (strpos(readBuf,"RF CODE PASS",0)>=0)
		{
			CommRec_OK();
			UpdateResultMsg("<====开始耦合测试====>");
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
			UpdateResultMsg("<====开始开网====>");

		}

	}
	else if(strcmp(CmdKey,ATCFUN1)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			strcpy(write_buffer, ATD112);
			SendByte(write_buffer);
			UpdateResultMsg("<====开始拔打112====>");
		}

	}

	else if(strcmp(CmdKey,ATD112)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			UpdateResultMsg("<====开始查询TXP值====>");
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
			UpdateResultMsg(readBuf);
			ViString readImei=readBuf;
			char readImeiTemp[16];

			int StartPos=strpos(readImei,"IMEI:",0);

			substring(readImei,readImeiTemp,StartPos+strlen("IMEI:"),15);
			if(strcmp(readImeiTemp,strIMEI)==0)
			{
				CommRec_OK();
				UpdateResultMsg("<====清除最后一个点====>");
				strcpy(write_buffer,ATCLEAR);
				SendByte(write_buffer);
			}
			else{
				UpdateResultMsg("<====IMEI写入错误====>"); 
			}
		}

	}
	else if(strpos(CmdKey,ATCLEAR,0)>=0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			UpdateResultMsg("<====开始恢复出厂设置====>");
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
	//AG8960_Status = age1960_cmdInt32_Q (InstrHandle, "CALL:BIND?",&AG_Read_Int32);
	AG8960_Status = age1960_cmdString_Q (InstrHandle, "CALL:BIND?", 4,AG_Read_Str);
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	//AG8960_Status = age1960_cmd (InstrHandle, "CALL:TCH:BAND DCS");
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
	//AG8960_Status = age1960_cmd (InstrHandle, "SYST:CORR:SFR  1747.50 MHZ,1842.50 MHZ");
	if( AG8960_Status != 0)
	{
		goto Error;
	}


	AG8960_Status = age1960_cmd (InstrHandle, "SYST:CORR:SGA -19.00,-19.00");
	if( AG8960_Status != 0)
	{
		goto Error;
	}


	strcpy(write_buffer, ATCFUN0);
	SendByte(write_buffer);



	/*else
	{
		goto Error;
	} */
	return 0;
	//耦合测试失败

Error:
	SetTestResult(0);
	return (-1);

}
int QueryTXPValue()
{
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
		//atd_EmergencyCall_MMS();
	}
	//SetTestResult(-1);
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
	//age1960_cmdInt32_Q (InstrHandle, "CALL:STAT?", &AG_Read_Str);
	//AG_Read_Str="CALL:CONN:STAT?";
	AG8960_Status = age1960_cmdString_Q (InstrHandle, "CALL:STAT?", 5,AG_Read_Str);
	Delay(AG8960_DelayTime);
	//AG8960_Status = age1960_cmdString_Q (InstrHandle, "CALL:BIND?", 4,&AG_Read_Str);
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
		//AG_Read_Str="abcdabcdabcdabcdabcd";
		age1960_cmdString_Q (InstrHandle, "FETC:TXP?",20, AG_Read_Str);
		float value=getTXPValue(AG_Read_Str);
		//float value=atof(AG_Read_Str);
		//if(value<25.0f || value>35.0f)

		char DBValue[400];
		//strcpy(DBValue, "<====当前DB值:");
		//strcat(DBValue,value);
		//strcat(DBValue,"====>");
		sprintf(DBValue, "<====当前DB值:%5.2f====>", value);
		UpdateResultMsg(DBValue);
		if(value<=TrafficPowerMin || value>=TrafficPowerMax)
			//if(value<30.0f || value>36.0f)
			//if(value<20.0f)
		{
			//MessagePopup ("warning", "低于25。");
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

	//age1960_cmdInt32_Q (InstrHandle, "CALL:STAT?", &AG_Read_Str);
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
		//SetTestResult(1);


		//IMEI
		return 0;
	}
	else
	{
		goto Error;
	}

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
	SendByte(write_buffer);

	return 0;
}
int OpenComPort()
{
	int RS232Error;
	char devicename[30];
	//-----------Get COM port and Baurd rate--------
	//comport = MMS_INFO[WorkingMS].ComPort;
	// -------- Open the COM Port and Switch the MS to the PCS Band ----
	//comport=6;
	sprintf(devicename, "COM%d", comport);
	DisableBreakOnLibraryErrors();
	RS232Error = OpenComConfig (comport, devicename, baudrate, parity, databits, stopbits, inputq, outputq);
	EnableBreakOnLibraryErrors();
	if (RS232Error< 0)
	{
		MessagePopup ("COM INFORMATION", "OPEN COM PORT FAIL");
		return -1;
	}

	SetComTime (comport, 0.2);

	//--------------------Wrt AT+cfun=0; to target----------------------------

	FlushInQ (comport);
	FlushOutQ (comport);
	//InstallComCallback (comport, LWRS_RECEIVE, 2, 0, Event_Char_Func, 0);
	InstallComCallback(comport,LWRS_RXFLAG,0,10,Event_Char_Func,0);  //以回车为标志位，接收到回车就产生中断，调用中断函数UartComCall.
	return 0;
};
int CloseComPort()
{
	//-------------------- close COM port ----------------------------
	CloseCom (comport);
	return 0;
};

void SendByte(ViString ch)
{
	int RS232Error;
	/*if(port.port_open == 0)
		MessagePopup("Error","串口还未打开！");
	else */
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
	int test_channel;
	int cls_idx;
	char *Temp_pChar;
	int ReturnValue;
	//***********************************************************************************
	//--------Create a new Inifile object and read it from a file  ------------------
	//***********************************************************************************
	if (!(g_CustomerSetupFile = Ini_New (0)))
	{
		MessagePopup("Inifile","Error allocating memory for Inifile");
		goto Error;
	}
	//****************************************************************************
	// --------- Get Project pathname --------------------------
	//***************************************************************************
	GetProjectDir (CustomerFileName);

	strcat(CustomerFileName,"\\MTK_SETUP.ini");	//main
	//strcat(CustomerFileName,"\\Customer_Setup_B.txt");  //second
	//********************************************************************
	if (Ini_ReadFromFile (g_CustomerSetupFile, CustomerFileName))
	{
		MessagePopup("Inifile","Error reading Inifile");
		goto Error;
	}

	Ini_GetInt (g_CustomerSetupFile, "Calibration Setup","COM PORT", &comport);
	Ini_GetStringCopy (g_CustomerSetupFile, "Calibration Setup", "TrafficBand", &TrafficBand);
	Ini_GetInt (g_CustomerSetupFile, "Calibration Setup","TrafficPower", &TrafficPower);
	Ini_GetInt (g_CustomerSetupFile, "Calibration Setup","TrafficPowerOffset", &TrafficPowerOffset);
	Ini_GetStringCopy (g_CustomerSetupFile, "Calibration Setup", "Version", &Version);

	Ini_GetRawStringIntoBuffer (g_CustomerSetupFile, "System Setting", "MT8820 GPIB Address",GPIB_ADDR_8960,20 );


	TrafficPowerMax=TrafficPower+TrafficPowerOffset;
	TrafficPowerMin=TrafficPower-TrafficPowerOffset;
	//strcpy(GPIB_ADDR_8960, "GPIB0::14::INSTR");


	return 0;

Error:
	return -1;
}
int GetComPortDynamiclly(void)
{
	/*char DestString[10];
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
			goto Error;
		}
	}*/


	return 0;

Error:

	return -1;
}
int UpdateResultMsg(ViString Msg/*,int StartOrEnd=0*/)
{
	char buffer[5000];
	AddLog(Msg);
	//if(StartOrEnd==0){
	//sprintf(buffer,"\n\t-------------%s",Msg);
	//sprintf(buffer,"\n\t%s",Msg);
	//    SetCtrlVal (panelHandle, PANEL_RESULTS, buffer);
	//}
	InsertTextBoxLine (panelHandle, PANEL_RESULTS, -1, Msg);
	return 0;
}

int SetTestResult(int iResult)
{
	if(iResult==-1)
	{
		ResetTextBox (panelHandle, PANEL_RESULTS, "");
		strcpy(CmdKey,"");
		SetCtrlAttribute (panelHandle, PANEL_TEST, ATTR_DIMMED, 1);
		SetCtrlAttribute (panelHandle, PANEL_IMEI, ATTR_DIMMED, 1);
		//SetCtrlAttribute (panelHandle, PANEL_FAIL, ATTR_VISIBLE, 0);
		//SetCtrlAttribute (panelHandle, PANEL_PASS, ATTR_VISIBLE, 0);
		SetCtrlVal(panelHandle, PANEL_TESTRESULT, "");
		SetCtrlAttribute (panelHandle, PANEL_TESTRESULT, ATTR_TEXT_BGCOLOR , VAL_GRAY);
	}
	else if(iResult==0)
	{
		SetCtrlVal(panelHandle, PANEL_IMEI, "");
		SetCtrlAttribute (panelHandle, PANEL_TEST, ATTR_DIMMED, 0);
		SetCtrlAttribute (panelHandle, PANEL_IMEI, ATTR_DIMMED, 0);
		SetActiveCtrl ( panelHandle, PANEL_IMEI );
		//SetCtrlAttribute (panelHandle, PANEL_FAIL, ATTR_VISIBLE, 1);
		//SetCtrlAttribute (panelHandle, PANEL_PASS, ATTR_VISIBLE, 0);
		SetCtrlVal(panelHandle, PANEL_TESTRESULT, "F A I L");
		SetCtrlAttribute (panelHandle, PANEL_TESTRESULT, ATTR_TEXT_BGCOLOR , VAL_RED);
	}
	else if(iResult==1)
	{
		SetCtrlVal(panelHandle, PANEL_IMEI, "");
		SetCtrlAttribute (panelHandle, PANEL_TEST, ATTR_DIMMED, 0);
		SetCtrlAttribute (panelHandle, PANEL_IMEI, ATTR_DIMMED, 0);
		SetActiveCtrl ( panelHandle, PANEL_IMEI );

		//SetCtrlAttribute (panelHandle, PANEL_FAIL, ATTR_VISIBLE, 0);
		//SetCtrlAttribute (panelHandle, PANEL_PASS, ATTR_VISIBLE, 1);
		SetCtrlVal(panelHandle, PANEL_TESTRESULT, "P A S S");
		SetCtrlAttribute (panelHandle, PANEL_TESTRESULT, ATTR_TEXT_BGCOLOR , VAL_GREEN);

	}
	return 0;



}

