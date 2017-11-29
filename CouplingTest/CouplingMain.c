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

#define MAX_SEND_LEN  512    /* ���͵���󳤶� */ 
#define MAX_REC_LEN  512    /* ���յ���󳤶� */


//���ڵĲ���
#define baudrate 115200
#define parity 0
#define databits 8
#define stopbits 1
#define inputq 32000
#define outputq 32000


#define ATTEST "AT^GT_CM=TEST" 				//�������ģʽ   TEST_OK
#define ATVERSION "AT^GT_CM=VERSION"		//��ȡ����汾  [VERSION]GT02F_20_61DM2_B25E_R0_V02
#define ATLINK "AT^GT_CM=LINK"				//���LINK   LINK:6
#define ATRFBAR "AT^GT_CM=RF_BAR"			//��RF  RF CODE PASS
#define ATCFUN0 "AT+CFUN=0"   				//����
#define ATCFUN1 "AT+CFUN=1"   				//����
#define ATD112 "ATD112;"		 			//�δ�112
#define ATH "ATH;"			 				//�Ҷ�
#define ATID "AT^GT_CM=ID,1"			 	//��ID
#define ATWIMEI "AT^GT_CM=IMEI,1,"			//дIMEI
#define ATRIMEI "AT^GT_CM=IMEI"			 	//��IMEI  IMEI:222222222222222
#define ATCLEAR "AT^GT_CM=CLEAR"			//���GPS��λ��  OK!
#define ATFACTORYALL "AT^GT_CM=FACTORYALL"	//�ָ��������� NVRAMִ�гɹ�! The terminal will restart after 60s!

//������
static int panelHandle;

//*************************************************************************************************************
//-------------------------------��ϲ���---------------------------
//**************************************************************************************************************

//GPIBͨѶ��ʱʱ��
static int GPIB_TIMEOUT_8960=5000;
//8960�Ķ�д�������
int AG8960_Status;
//8960��ѯ�Ľ����int,string��
int AG_Read_Int32;
char AG_Read_Str[20];
//8960�ӳ�ʱ��
int AG8960_DelayTime=2.0;
//�Ự��,����8960
static ViSession    InstrHandle = VI_NULL;

//��ʼ��ϲ���
int StartCouplingTest(void);
//��ѯTXPֵ
int QueryTXPValue();




//*************************************************************************************************************
//-------------------------------���ڲ���---------------------------
//**************************************************************************************************************
//�򿪴��ڲ���

int ComIsOpen=0; 

int OpenComPort(void);
int CloseComPort(void);
void SendByte(ViString);

char CmdKey[MAX_REC_LEN];
char write_buffer[MAX_SEND_LEN];

int iSends=0;	//�ѷ��ʹ���
//��̬��ÿ��ô���
int GetComPortDynamiclly(void);
//�򿪴���
int OpenComm(void);

int CommRec_OK();






//*************************************************************************************************************
//-------------------------------���²��Խ��,�����ܲ��Խ��---------------------------
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


int iTcpSends=0;	//�ѷ��ʹ���
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
//GPIB��ַ
char GPIB_ADDR_8960[MAX_PATHNAME_LEN]="";
int  portNum;
ViString TcpIp;
ViString reATLINK;
//*************************************************************************************************************
//-------------------------------��INI�ļ���ȡ�ͻ��Զ������---------------------------
//**************************************************************************************************************
//��ÿͻ��Զ�������
int GetCustomerSetupFile(void);
//�ͻ��Զ�����
IniText g_CustomerSetupFile = 0;
//�ͻ��Զ����ļ���
char CustomerFileName[MAX_PATHNAME_LEN]="";

int g_TestResult=-1;
char strLog[MAX_SEND_LEN];
//*************************************************************************************************************
//------------------------------------------Դ��--------------------------------------
//**************************************************************************************************************
int main (int argc, char *argv[])
{
	if (InitCVIRTE (0, argv, 0) == 0)
		return -1;	/* out of memory */
	if ((panelHandle = LoadPanel (0, "CouplingMain.uir", PANEL)) < 0)
		return -1;
	DisplayPanel (panelHandle);

	//LoadPanelǰ����Զ������
	GetCustomerSetupFile();
	//LoadPanelǰ��̬��ȡ���ô���
	GetComPortDynamiclly();

	//�򿪴���
	OpenComm();

	//TCP����
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
			//��ʼ�����Խ������ʼ����
			SetTestResult(-1);
			
			UpdateResultMsg("<====��ʼ��ϲ���====>");
			//����TESTָ��
			UpdateResultMsg("<====�������ģʽ====>"); 
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
			//���Ӵ���
			OpenComm();
			break;
	}
	return 0;
}
int  CVICALLBACK ComDisConnect(int panel, int control, int event, void *callbackData, int eventData1, int eventData2){
	switch (event)
	{
		case EVENT_COMMIT:
			//�Ͽ����� 
			CloseComPort(); 
			break;
	}
	return 0;
}
//����ATָ�ʱ
int CVICALLBACK sendcmd_timer (int panel, int control, int event,
							   void *callbackData, int eventData1, int eventData2)
{
	if(++iSends<=3)
	{
		sprintf(strLog,"���ڵ�%d�η���", iSends); 
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
		AddLog("ATָ�ʱ�����Խ��ʧ��");
		//ATָ�ʱ�����Խ��ʧ��
		SetCtrlAttribute (panelHandle, PANEL_TIMER_SENDCMD, ATTR_ENABLED, 0);
		SetTestResult(0);
	}
	return 0;
}
//����ATָ�ʱ
int CVICALLBACK sendTcpcmd_timer (int panel, int control, int event,
								  void *callbackData, int eventData1, int eventData2)
{
	if(++iTcpSends<=3)
	{
		if(strcmp(TcpCmdKey,"")!=0)
		{
			sprintf(strLog,"TCP��%d�η���", iTcpSends); 
			AddLog(strLog);
			
			SendToTcp(TcpCmdKey,TcpCmd);
		}
	}
	else
	{
		iTcpSends=0;
		//TCPָ�ʱ�����Խ��ʧ��
		AddLog("TCPָ�ʱ�����Խ��ʧ��");
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
			AddLog("�����˳�!"); 
			strcpy(CmdKey,"");
			strcpy(TcpCmdKey,"");
			//�رմ���
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
			//�б����ݸı���򿪴���
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
			UpdateResultMsg("<====IMEI������====>");
			
			GetCtrlVal (panelHandle, PANEL_IMEI, strIMEI);
			AddLog(strIMEI);
			
			//�ж�IMEI�Ƿ���Ч 
			char IMEI14[14];
			strncpy(IMEI14, strIMEI, 14);
			char checkSum=GetIMEICheckDigit(IMEI14);
			char scanCheckSum=strIMEI[14];
			if(checkSum==scanCheckSum)
			{
				AddLog("�Ϸ�IMEI");
				
				//��ʼ�����Խ������ʼ����
				SetTestResult(-1);
				
				sprintf(TcpCmd, "Action=CheckIMEI#IMEI=%s#Tester=%s#", strIMEI,Tester);
				SendToTcp("CheckIMEI",TcpCmd);
				
			}
			else
			{
				SetTestResultPrompt(-2,"IMEI��Ч��");
			}
			break;

	}
	return 0;
}

//�򿪴���
int OpenComm()
{
	GetCtrlVal (panelHandle, PANEL_COM_PORT_SETTING, &comport);
	sprintf(strLog,"ѡ��Ĵ���:%d", comport);
	AddLog(strLog);
	CloseComPort();
	OpenComPort();
	if(ComIsOpen==1){
		AddLog("���ڴ򿪳ɹ�!");
		SetCtrlAttribute (panelHandle, PANEL_COMCONNECT, ATTR_DIMMED, 1);
		SetCtrlAttribute (panelHandle, PANEL_COMDISCONNECT, ATTR_DIMMED, 0);
		SetCtrlVal(panelHandle, PANEL_IMEI, ""); 
		SetActiveCtrl ( panelHandle, PANEL_IMEI );
		SetCtrlVal(panelHandle, PANEL_TESTRESULT, "");  
	}
	else{
		AddLog("���ڴ�ʧ��!");
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
	UpdateResultMsg("�ɹ�");
	return 0;
}
//�����յ�����
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
			UpdateResultMsg("<====����ն�����汾��====>");
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
			UpdateResultMsg("<====��ȡ����ID====>");			
		}
		else{
			UpdateResultMsg("����汾����ȷ!");	
		}

	}
	else if(strcmp(CmdKey,ATID)==0)
	{
		if (strpos(readBuf,"RID:",0)>=0)
		{
			CommRec_OK();
			
			//ȡRID
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
			UpdateResultMsg("<====��ȡRF����====>"); 
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
			UpdateResultMsg("<====����====>");
		}
	}
	else if(strcmp(CmdKey,ATCFUN1)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			strcpy(write_buffer, ATD112);
			SendByte(write_buffer);
			UpdateResultMsg("<====�δ�112====>");
		}
	}
	else if(strcmp(CmdKey,ATD112)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			UpdateResultMsg("<====��ѯTXPֵ====>");
			QueryTXPValue();
		}
	}
	else if(strcmp(CmdKey,ATH)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();

			UpdateResultMsg("<====дIMEI====>");
			WriteIMEI();
		}

	}
	else if(strpos(CmdKey,ATWIMEI,0)>=0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			UpdateResultMsg("<====��IMEI====>");
			strcpy(write_buffer,ATRIMEI);
			SendByte(write_buffer);
		}

	}
	else if(strpos(CmdKey,ATRIMEI,0)>=0)
	{
		if (strpos(readBuf,"IMEI:",0)>=0)
		{
			//ȡ�����е�IMEI
			ViString readImei=readBuf;
			char readImeiTemp[16];
			int StartPos=strpos(readImei,"IMEI:",0);
			substring(readImei,readImeiTemp,StartPos+strlen("IMEI:"),15);
			UpdateResultMsg(readImeiTemp);
			
			if(strcmp(readImeiTemp,strIMEI)==0)
			{
				CommRec_OK();
				UpdateResultMsg("<====������һ����====>");
				strcpy(write_buffer,ATCLEAR);
				SendByte(write_buffer);
			}
			else
			{
				UpdateResultMsg("<====IMEI��ȡ��IMEI��д��Ĳ���ͬ====>");
			}
		}

	}
	else if(strpos(CmdKey,ATCLEAR,0)>=0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			UpdateResultMsg("<====�ָ���������====>");
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

//------------------------------------------��ʼ��ϲ���-------------------------------------- //
int StartCouplingTest()
{
	AddLog("StartCouplingTest Start");
	//AG8960��ʼ��
	AG8960_Status = age1960_init (GPIB_ADDR_8960, VI_FALSE, VI_TRUE, &InstrHandle);
	if( AG8960_Status != 0)
	{
		goto Error;
	}
	//���ó�ʱʱ��
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

	//����״̬VI_SUCCESS
	//����GPIB������
	AG8960_Status = age1960_cmd (InstrHandle, "SYST:COMM:GPIB:DEB ON");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	//�������ͣ��Զ�
	AG8960_Status = age1960_cmd (InstrHandle, "CALL:FUNC:CONN:TYPE AUTO");
	if( AG8960_Status != 0)
	{
		goto Error;
	}
	//�رշ�����
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

	//����ֵ+1
	AG8960_Status = age1960_cmdInt32_Q (InstrHandle, "SYST:SYNC?",&AG_Read_Int32);
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	//����?
	AG8960_Status = age1960_cmd (InstrHandle, "*CLS");
	if( AG8960_Status != 0)
	{
		goto Error;
	}

	//����DCS
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

	UpdateResultMsg("<====����====>");   
	strcpy(write_buffer, ATCFUN0);
	SendByte(write_buffer);
	AddLog("StartCouplingTest End");
	return 0;
	
	//��ϲ���ʧ��
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
	//��ѯ����״̬
	//����ֵ0
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

	//��ѯ����״̬��IDLE SREQ CONN
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
		sprintf(strLog, "<====��ǰDBֵ:%5.2f====>", value);
		UpdateResultMsg(strLog);
		if(value<=TrafficPowerMin || value>=TrafficPowerMax)
		{
			//�ж��ź�ֵ
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

	//��ϲ��Խ���
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
		UpdateResultMsg("<====��ϲ��Գɹ�====>");
		return 0;
	}
	else
	{
		goto Error;
	}
	AddLog("QueryTXPValue End"); 
	return 0;
	//��ϲ���ʧ��
Error:
	UpdateResultMsg("<====��ϲ���ʧ��====>");
	SetTestResult(0);
	return (-1);
}

int WriteIMEI()
{
	strcpy(write_buffer, ATWIMEI);
	strcat(write_buffer,strIMEI);
	sprintf(strLog,"д��IMEI:%s",strIMEI);
	AddLog(strIMEI);
	SendByte(write_buffer);
	return 0;
}
//**********************************************************************
//-------��̬��ÿ��ô���-------------------------
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
		AddLog("���Գ�ʼ��!"); 
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
		AddLog("����ʧ��!");
		sprintf(TcpCmd, "Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s","WriteImei",strRid,SoftModel,Version,strIMEI,iResult,Tester);
		SendToTcp("UpdateResult",TcpCmd);
	}
	else if(iResult==1)
	{
		AddLog("���Գɹ�!");
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

//TCP����
int TcpConnect()
{
	AddLog("�����������!");
	SetWaitCursor (1);
	if (ConnectToTCPServer (&g_hconversation, portNum, TcpIp, ClientTCPCB,
							NULL, 5000) < 0)
	{
		//MessagePopup("TCP Client", "Connection to server failed !");
		SetTestResultPrompt(-2,"�����������ʧ��!");
		g_connected=0;
	}
	else
	{
		AddLog("����������ӳɹ�!"); 
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
				SetTestResultPrompt(-2,"����ʧ��!");
			}
			else
			{
				receiveBuf[dataSize] = '\0';
				AddLog(receiveBuf);
				//�����յ�������
				if((strcmp(TcpCmdKey,"CheckIMEI")==0) || (strcmp(TcpCmdKey,"UpdateResult")==0) 
				  || (strcmp(TcpCmdKey,"CheckTested")==0))
				{
					//ȡ���
					char result[2];
					int StartPos=strpos(receiveBuf,"iRecordCount=",0);
					substring(receiveBuf,result,StartPos+strlen("iRecordCount="),1);
					int iResult=atoi(result);
					if(strcmp(TcpCmdKey,"CheckTested")==0)
					{
						if(iResult>=1)
						{
							SetTestResultPrompt(-2,"�˻����Ѳ��Թ�!");
						}
						else
						{	
							UpdateResultMsg("<====��ʼ��ϲ���====>");
							strcpy(write_buffer, ATLINK);
							SendByte(write_buffer);
							UpdateResultMsg("<====���LINK====>");
						}
					}
					else if(strcmp(TcpCmdKey,"CheckIMEI")==0)
					{

						if(iResult>=1)
						{
							SetTestResultPrompt(-2,"��IMEI����д��!");
						}
						else
						{
							//����TESTָ��
							UpdateResultMsg("<====�������ģʽ====>");
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
				SetTestResultPrompt(-2,"��������Ͽ�!");;
				SetCtrlVal (panelHandle, PANEL_CONNECTED, 0);
				g_connected = 0;
				break;
			}
			return 0;
	}
	return 1;
}

//�������������� TempTcpCmdKey:�ؼ��֡� SendMsg:���͵�����
int SendToTcp(ViString TempTcpCmdKey,ViString SendMsg)
{
	if(g_connected==0){
		SetTestResultPrompt(-2,"δ���ӷ�����!");
	}
	else{
	AddLog(SendMsg); 	
	strcpy(TcpCmdKey,TempTcpCmdKey);
	strcat (SendMsg, "\n");
	if (ClientTCPWrite (g_hconversation, SendMsg,strlen (SendMsg), 1000)<0)
	{
		SetTestResultPrompt(-2,"���ͷ�����ʧ��!");
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
		SetTestResultPrompt(-2,"�򿪴���ʧ��!");
		ComIsOpen=0;
		return -1;
	}
	ComIsOpen=1;
	SetComTime (comport, 0.2);
	FlushInQ (comport);
	FlushOutQ (comport);
	InstallComCallback(comport,LWRS_RXFLAG,0,10,Event_Char_Func,0);  //�Իس�Ϊ��־λ�����յ��س��Ͳ����жϣ������жϺ���UartComCall
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
		SetTestResultPrompt(-2,"���ڻ�δ��!");
	else
	{
		FlushOutQ(comport);  //��շ��ͻ�����
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

	//��ȡ����
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
	
	//��ȡ�Ĳ���д����־��
	sprintf(strLog, "COM PORT:%d\r\nTrafficBand:%s\r\nTrafficPower:%d+-TrafficPowerOffset:%d\r\nVersion:%s\r\nGPIB Address:%s\r\nTcpIp:%s\r\nportNum:%d\r\nreATLINK:%s\r\nTester:%s\r\n", 
			comport,TrafficBand,TrafficPower,TrafficPowerOffset,Version,GPIB_ADDR_8960,TcpIp,portNum,reATLINK,Tester);
	AddLog(strLog);
	
	return 0;
Error:
	return -1;
}

