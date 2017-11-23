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

//������
static int panelHandle;

//*************************************************************************************************************
//-------------------------------��ϲ���---------------------------
//**************************************************************************************************************
//GPIB��ַ
char GPIB_ADDR_8960[MAX_PATHNAME_LEN]="";
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


ViString TrafficBand="";
int TrafficPower;

int TrafficPowerOffset;
float  TrafficPowerMax,TrafficPowerMin;

//*************************************************************************************************************
//-------------------------------��INI�ļ���ȡ�ͻ��Զ������---------------------------
//**************************************************************************************************************
//��ÿͻ��Զ�������
int GetCustomerSetupFile(void);
//�ͻ��Զ�����
IniText g_CustomerSetupFile = 0;
//�ͻ��Զ����ļ���
char CustomerFileName[MAX_PATHNAME_LEN]="";

//*************************************************************************************************************
//-------------------------------���ڲ���---------------------------
//**************************************************************************************************************

//�򿪴��ڲ���
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

int iSends=0;	//�ѷ��ʹ���
//��̬��ÿ��ô���
int GetComPortDynamiclly(void);
//�򿪴���
int OpenComm(void);

int CommRec_OK();


ViString Version;

char ATTEST[400]="AT^GT_CM=TEST";//�������ģʽ   TEST_OK
char ATVERSION[400]="AT^GT_CM=VERSION";//��ȡ����汾  [VERSION]GT02F_20_61DM2_B25E_R0_V02
char ATLINK[400]="AT^GT_CM=LINK";//���LINK   LINK:6
char ATRFBAR[400]="AT^GT_CM=RF_BAR";			 //��RF  RF CODE PASS
char ATCFUN0[400]="AT+CFUN=0";   //����
char ATCFUN1[400]="AT+CFUN=1";   //����
char ATD112[400]="ATD112;";		 //�δ�112
char ATH[400]="ATH;";			 //�Ҷ�
char ATID[400]="AT^GT_CM=ID,1";			 //��ID 
char ATWIMEI[400]="AT^GT_CM=IMEI,1,";			 //дIMEI
char ATRIMEI[400]="AT^GT_CM=IMEI";			 //��IMEI  IMEI:222222222222222

char ATCLEAR[400]="AT^GT_CM=CLEAR";			 //���GPS��λ��  OK!
char ATFACTORYALL[400]="AT^GT_CM=FACTORYALL";			 //�ָ��������� NVRAMִ�гɹ�! The terminal will restart after 60s!

//*************************************************************************************************************
//-------------------------------���²��Խ��,�����ܲ��Խ��---------------------------
//**************************************************************************************************************
int UpdateResultMsg(ViString/*,int*/);

int SetTestResult(int);
ViString strRid="";

int WriteIMEI();
char strIMEI[17];

//*************************************************************************************************************
//-------------------------------TCP---------------------------
//**************************************************************************************************************
int  portNum;
ViString TcpIp;

int iTcpSends=0;	//�ѷ��ʹ���
char TcpCmdKey[400];

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
			//SetCtrlAttribute (panelHandle, PANEL_IMEI, ATTR_CTRL_MODE, VAL_HOT);

			//��ʼ�����Խ������ʼ����
			SetTestResult(-1);
			UpdateResultMsg("<====��ʼ��ϲ���====>");
			//����TESTָ��
			strcpy(write_buffer, ATTEST);
			SendByte(write_buffer);
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
		if(strcmp(CmdKey,"")!=0)
		{

			strcpy(write_buffer, CmdKey);
			SendByte(write_buffer);
		}
	}
	else
	{
		iSends=0;
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

			strcpy(write_buffer, TcpCmdKey);
			SendByte(write_buffer);
		}
	}
	else
	{
		iTcpSends=0;
		//ATָ�ʱ�����Խ��ʧ��
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
			//�رմ���
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
			//�ж�IMEI�Ƿ���Ч


			GetCtrlVal (panelHandle, PANEL_IMEI, strIMEI);
			char IMEI14[14];
			strncpy(IMEI14, strIMEI, 14);
			char checkSum=GetIMEICheckDigit(IMEI14);
			char scanCheckSum=strIMEI[14];
			if(checkSum==scanCheckSum)
			{
				//��ʼ�����Խ������ʼ����
				SetTestResult(-1);
				//UpdateResultMsg("<====��ʼ��ϲ���====>");
				//����TESTָ��
				strcpy(write_buffer, ATTEST);
				SendByte(write_buffer);
				//WriteIMEI();
			}
			else
			{
				MessagePopup("Error","IMEI��Ч��");
			}
			break;

	}
	return 0;
}

//�򿪴���
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
	UpdateResultMsg("�ɹ�");
	return 0;
}
//�����յ�����
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
			UpdateResultMsg("<====�������ģʽ====>");
			CommRec_OK();
			/*strcpy(write_buffer, ATVERSION);
			SendByte(write_buffer);
			UpdateResultMsg("<====��ʼ����ն�����汾��====>");*/
			strcpy(write_buffer, ATH);
			SendByte(write_buffer);
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
			UpdateResultMsg("<====��ʼ���LINK====>");
		}

	}
	else if(strcmp(CmdKey,ATLINK)==0)
	{
		if (strpos(readBuf,"LINK:6",0)>=0)
		{
			CommRec_OK();
			strcpy(write_buffer, ATRFBAR);
			SendByte(write_buffer);
			UpdateResultMsg("<====��ʼ��ȡRF����====>");

		}

	}
	else if(strcmp(CmdKey,ATRFBAR)==0)
	{

		if (strpos(readBuf,"RF CODE PASS",0)>=0)
		{
			CommRec_OK();
			UpdateResultMsg("<====��ʼ��ϲ���====>");
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
			UpdateResultMsg("<====��ʼ����====>");

		}

	}
	else if(strcmp(CmdKey,ATCFUN1)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			strcpy(write_buffer, ATD112);
			SendByte(write_buffer);
			UpdateResultMsg("<====��ʼ�δ�112====>");
		}

	}

	else if(strcmp(CmdKey,ATD112)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			UpdateResultMsg("<====��ʼ��ѯTXPֵ====>");
			QueryTXPValue();

		}

	}
	else if(strcmp(CmdKey,ATH)==0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();

			/*char TcpCmd[400];
			//ViString sendCmd="CALL:TCH:BAND DCS";
			sprintf(TcpCmd, "Action=CheckIMEI#IMEI=%s#Tester=%s#", "868120112589418","ZK");
			SendToTcp("CheckIMEI",TcpCmd);*/
			
			strcpy(write_buffer, ATID);
			SendByte(write_buffer);
			UpdateResultMsg("<====��ʼ��ȡ����ID====>");
		}

	}
	//AT^GT_CM=ID,1
	else if(strcmp(CmdKey,ATID)==0)
	{
		if (strpos(readBuf,"Chip RID:",0)>=0)
		{
			CommRec_OK();
			//ȡRID
			ViString readTemp=readBuf;
			char* data=strreplace(readTemp," ","");
			//printf("%s\n", data);
			//readTemp=
			//char rId[33];

			int StartPos=strpos(data,"ChipRID:",0);

			substring(data,strRid,StartPos+strlen("ChipRID:"),32);
			
			char TcpCmd[400];
			//ViString sendCmd="CALL:TCH:BAND DCS";
			sprintf(TcpCmd, "Action=CheckIMEI#IMEI=%s#Tester=%s#", "868120112589418","ZK");
			SendToTcp("CheckIMEI",TcpCmd);
		}

	}
	//AT^GT_CM=ID,1
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
			UpdateResultMsg(readBuf);
			ViString readImei=readBuf;
			char readImeiTemp[16];

			int StartPos=strpos(readImei,"IMEI:",0);

			substring(readImei,readImeiTemp,StartPos+strlen("IMEI:"),15);
			if(strcmp(readImeiTemp,strIMEI)==0)
			{
				CommRec_OK();
				UpdateResultMsg("<====������һ����====>");
				strcpy(write_buffer,ATCLEAR);
				SendByte(write_buffer);
			}
			else
			{
				UpdateResultMsg("<====IMEIд�����====>");
			}
		}

	}
	else if(strpos(CmdKey,ATCLEAR,0)>=0)
	{
		if (strpos(readBuf,"OK",0)>=0)
		{
			CommRec_OK();
			UpdateResultMsg("<====��ʼ�ָ���������====>");
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
	//��ϲ���ʧ��

Error:
	SetTestResult(0);
	return (-1);

}
int QueryTXPValue()
{
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

	//��ѯ����״̬��IDLE SREQ CONN
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
		//strcpy(DBValue, "<====��ǰDBֵ:");
		//strcat(DBValue,value);
		//strcat(DBValue,"====>");
		sprintf(DBValue, "<====��ǰDBֵ:%5.2f====>", value);
		UpdateResultMsg(DBValue);
		if(value<=TrafficPowerMin || value>=TrafficPowerMax)
			//if(value<30.0f || value>36.0f)
			//if(value<20.0f)
		{
			//MessagePopup ("warning", "����25��");
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
		UpdateResultMsg("<====��ϲ��Գɹ�====>");
		//SetTestResult(1);


		//IMEI
		return 0;
	}
	else
	{
		goto Error;
	}

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
	InstallComCallback(comport,LWRS_RXFLAG,0,10,Event_Char_Func,0);  //�Իس�Ϊ��־λ�����յ��س��Ͳ����жϣ������жϺ���UartComCall.
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
		MessagePopup("Error","���ڻ�δ�򿪣�");
	else */
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

	Ini_GetStringCopy (g_CustomerSetupFile, "Calibration Setup", "TcpIp", &TcpIp);
	Ini_GetInt (g_CustomerSetupFile, "Calibration Setup","TcpPort", &portNum);

	TrafficPowerMax=TrafficPower+TrafficPowerOffset;
	TrafficPowerMin=TrafficPower-TrafficPowerOffset;
	//strcpy(GPIB_ADDR_8960, "GPIB0::14::INSTR");


	return 0;

Error:
	return -1;
}
int GetComPortDynamiclly(void)
{
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
	}


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

//TCP����
int TcpConnect()
{
	//SetWaitCursor (1);
	if (ConnectToTCPServer (&g_hconversation, portNum, TcpIp, ClientTCPCB,
							NULL, 5000) < 0)
		MessagePopup("TCP Client", "Connection to server failed !");
	else
	{
		SetWaitCursor (0);
		g_connected = 1;

		/* We are successfully connected -- gather info */
		SetCtrlVal (panelHandle, PANEL_CONNECTED, 1);
		//SendToTcp("Connected");

		//strSendText:=Format('Action=CheckIMEI#IMEI=%s#Tester=%s#',[strIMEI[CommIndex],User.UserName]);
		//    SendToServer(CommIndex,'CheckIMEI',strSendText,True,CTimeOut*2);
		//strSendText:=Format('Action=CheckTestedParamCpd#ChipRid=%s#IMEI=%s#Version=%s#Tester=%s#',[strChipRid[CommIndex],'',strVersion[CommIndex],User.UserName]);
		//SendToServer(CommIndex,'CheckTestedParamCpd',strSendText,True,CTimeOut*2);
		/*if (GetTCPHostAddr (tempBuf, 256) >= 0)
			SetCtrlVal (g_hmainPanel, MAINPNL_CLIENT_IP, tempBuf);
		if (GetTCPHostName (tempBuf, 256) >= 0)
			SetCtrlVal (g_hmainPanel, MAINPNL_CLIENT_NAME, tempBuf);*/
		/*tcpChk (GetTCPPeerAddr (g_hconversation, tempBuf, 256));
		SetCtrlVal (g_hmainPanel, MAINPNL_SERVER_IP, tempBuf);
		tcpChk (GetTCPPeerName (g_hconversation, tempBuf, 256));
		SetCtrlVal (g_hmainPanel, MAINPNL_SERVER_NAME, tempBuf);*/

		/* display the panel and run the UI */
		//DisplayPanel (g_hmainPanel);
		//SetActiveCtrl (g_hmainPanel, MAINPNL_STRING);
		//RunUserInterface ();
	}

//Done:
	/* Disconnect from the TCP server */
//    if (g_connected)
//    	DisconnectFromTCPServer (g_hconversation);

	/* Free resources and return */
	//DiscardPanel (g_hmainPanel);
//    CloseCVIRTE ();
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
	char receiveBuf[256] = {0};
	ssize_t dataSize         = sizeof (receiveBuf) - 1;

	switch (event)
	{
		case TCP_DATAREADY:
			if ((dataSize = ClientTCPRead (g_hconversation, receiveBuf,
										   dataSize, 1000))
					< 0)
			{
				//SetCtrlVal (g_hmainPanel, MAINPNL_RECEIVE, "Receive Error\n");
			}
			else
			{
				receiveBuf[dataSize] = '\0';
				//�����յ�������
				if(strcmp(TcpCmdKey,"CheckIMEI")==0)
				{
					//ȡ���
					char result[2];

					int StartPos=strpos(receiveBuf,"iRecordCount=",0);

					substring(receiveBuf,result,StartPos+strlen("iRecordCount="),1);
					int iResult=atoi(result);
					if(iResult>=1)
					{
						MessagePopup ("Error", "����������д��������ϵ����Ա!");

					}
					else
					{
						UpdateResultMsg("<====дIMEI====>");
						WriteIMEI();
					}


					//SetCtrlVal (g_hmainPanel, MAINPNL_RECEIVE, receiveBuf);
				}
				break;
			case TCP_DISCONNECT:
				MessagePopup ("TCP Client", "Server has closed connection!");
				//SetCtrlVal (g_hmainPanel, MAINPNL_CONNECTED, 0);
				g_connected = 0;
				//MainPanelCB (0, EVENT_CLOSE, 0, 0, 0);
				break;
			}
			return 0;
	}
	return 1;
}

int SendToTcp(ViString TempTcpCmdKey,ViString SendMsg)
{
	char    transmitBuf[512] = {0};
	strcpy(TcpCmdKey,TempTcpCmdKey);

	strcpy(transmitBuf,SendMsg);
	//GetCtrlVal (panelHandle, MAINPNL_STRING, transmitBuf);
	strcat (transmitBuf, "\n");
	//SetCtrlVal (panelHandle, MAINPNL_TRANSMIT, transmitBuf);
	//SetCtrlVal (panelHandle, MAINPNL_STRING, "");
	if (ClientTCPWrite (g_hconversation, transmitBuf,
						strlen (transmitBuf), 1000) < 0)
		//SetCtrlVal (panelHandle, MAINPNL_TRANSMIT,
		//           "Transmit Error\n");
		;

	return 0;
}

