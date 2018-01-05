unit uGlobalVar;

interface
    uses Classes,Forms,IniFiles,uClientSendThread,Messages,Types;

    //�û��ṹ
    Type
    PUserRecord=^TUserRecord;
    TUserRecord = record
        UserName        :string;        //�û���
        UserPassword    :string;        //�û�����
        UserDes         :string;        //�û�����
        UserType        :string;        //�û�����
        TestPlan        :string;        //���Լƻ�
    end;

    //�������������˵�����
    type
        PSendSrvRecord=^stuSendSrvRecord;
        stuSendSrvRecord = record
            sCmdKey:string;                     //����ؼ���
            sCmd:string;                        //Ҫ���͵�����
            bWaitResponses:Boolean;             //�Ƿ�ȴ���Ӧ��־
            iWaitResponseOverTime:Integer;      //�ȴ���������Ӧ��ʱʱ��
            iResendNum:Integer;                 //�ط�����
            iSendNum:Integer;                   //�ѷ�����
            bInvalidation:Boolean;              //��Ч��־

    end;

    //���������ڵ�����
    type
        PSendCommRecord=^stuSendCommRecord;
        stuSendCommRecord = record
            sCmdKey:string;                     //����ؼ���
            sCmd:string;                        //Ҫ���͵�����
            sReturnText:string;                 //����ֵ
            bWaitResponses:Boolean;             //�Ƿ�ȴ���Ӧ��־
            iWaitResponseOverTime:Integer;      //�ȴ���������Ӧ��ʱʱ��
            iResendNum:Integer;                 //�ط�����
            iSendNum:Integer;                   //�ѷ�����
            bInvalidation:Boolean;              //��Ч��־
            sSubItemName:string;                //�Ӳ���������
            bCompare:Boolean;                   //�Ƿ�ȶ�
            strCompare:string;                  //�ȶԷ�Χ
            strRemark:string;                   //�ȶ��ַ�
            bSendAtCommand:Boolean;             //�Ƿ���ATָ��
            strRemark2:string;                  //��ע2
    end;

    //������Ϣ
    type
        PSerialInfo=^stuSerialInfo;
        stuSerialInfo=record
            bAllowTest:Boolean;         //�Ƿ��������
            bEnterTestState:Boolean;    //�������״̬
            bConnectedComm:Boolean;     //�Ƿ�����
            strChipRid:string;          //����ID
            iCheckCommNo:Integer;      //�ڼ��μ�⵽
            bAllowCheck:boolean;
     end;
     //�Զ�ɨ��ǹ
     type
        PScanInfo=^stuScanInfo;
        stuScanInfo=record
           bConnected:Boolean;     //�Ƿ�����
     end;


    //GPS���Բ���
    Type
    PGPSTestParam=^TGPSTestParam;
    TGPSTestParam = record
        GPSNumbers          :Integer;           //GPS������
        GPSDb               :Integer;           //GPSǿ��
        GPSContTime         :Integer;           //GPS����ʱ��
        GPSSer              :Integer;           //GPS������
        GPSDbMin            :Integer;           //GPS��Сֵ
        GPSDbMax            :Integer;           //GPS���ֵ
        GPSDbMin2            :Integer;           //GPS��Сֵ
        GPSDbMax2            :Integer;           //GPS���ֵ
        GPSDbMin3            :Integer;           //GPS��Сֵ
        GPSDbMax3            :Integer;           //GPS���ֵ
        GPSDbMin4            :Integer;           //GPS��Сֵ
        GPSDbMax4            :Integer;           //GPS���ֵ
        GPSNumbers_DY          :Integer;           //GPS��������DESAY��

    end;

    //�������Բ���
    Type
    PBasicTestParam=^TBasicTestParam;
    TBasicTestParam = record
        CoupleTestTestTime      :Integer;
        ParamDownloadTestTime   :Integer;
        AutoTestTestTime        :Integer;
        WriteImeiTestTime       :Integer;
        TwiceTestTime           :Integer;
        CompareVersion          :string;            //�ȶ԰汾
        FailContinueTest        :Boolean;           //ʧ�ܽ��Ų���
        SMT_AutoTestTestTime        :Integer;
        INPercentage              :Integer;        //2014-8-5���λ�ٷֱ�����
        Factory                  :Integer;
        SleepTime                :Integer;//2014-6-26�򴮿ڷ���ָ��ʱ����ʱʱ��
        POSleepTime              :Integer;//2014-7-8��⵽POW ON���ӳ�ʱ��
        ATTimeOut                :Integer;//2014-7-19��ATָ�ʱʱ��
        ATReSendCount            :Integer;//2014-7-19,ATָ���ط�����

    end;
type
  //iInteger=^Integer;
  pBytes=array of Byte;
  
const
    CommCount=5;
    LoginError='�û������������,��ȷ�������Ƿ���ȷ!';
    ServerDisconnect='Ŀ��������Ͽ�ʧ��!';
    ISTESTED='�˻����Ѳ��Թ����뻻��һ�����ӣ�';
    NOTNEED='�˻����ڴ˹�վ������ԣ��뻻��һ�����ӣ�';
    UPDATEFORMERROR='���½�������ݿ�ʧ�ܣ�����ϵ����Ա';
    IMEIINVALID='��¼�в����ڴ�IMEI';
    LOGINTIMEOUT='��¼����ʱ,��鿴�����Ƿ�����!';
    SERVERSENDFAIL='���ͷ�����ʧ��,�鿴�Ƿ������������!';
    VERSIONERROR='�˻�������汾���ڲ��Է�Χ�ڣ�����ϵ�����ˣ�';
    IMEIUNTEST='�˻���δ��дIMEI!';
    IMEIRANGERROR='�˻���IMEI�Ų��ڲ��Է�Χ�ڣ�';

    WM_Login        =   WM_USER+100;              //�û���¼
    WM_CheckTested  =   WM_USER+101;      //����Ƿ���Թ�
    WM_TestPass     =   WM_USER+102;
    WM_ClientModify =   WM_USER+103;            //�ͻ����޸�/����/ɾ���Ĳ���
    WM_GetTestPlanItem =   WM_USER+105;        //����Ӳ�����
    WM_TwiceByUpdateVersion =   WM_USER+106;        //������·���
    WM_CheckIMEI            =   WM_USER+107;        //�鿴IMEI�Ƿ�ʹ�ù�
    WM_BarPrint            =   WM_USER+108;        //�鿴IMEI�Ƿ�ʹ�ù�
    WM_TwiceByBoxNo        =   WM_USER+109;        //������䷵��
    WM_AllowPrint            =   WM_USER+110;        //���Դ�ӡ

    WM_LoadFlashTool       =   WM_USER+120;
    WM_TestCount           =   WM_USER+121;         ///OCQ��λ������������
    WM_CalculateCRC        =   WM_USER+122;         ///����CRC��

    MTKEPO_SV_NUMBER=32;
    MTKEPO_RECORD_SIZE=576;
    MTKEPO_SEGMENT_NUM=(30 * 4);

var
    ConnectSrvThread:tClientSend;
    User:TUserRecord;                                                           //��ǰ�û�
    strAutoTestLatitude,strAutoTestLongitude,strAutoTestAltitude:string;        //�Զ�����λ��γ�߶�ֵ

    strComm:array[0..CommCount-1] of string;                                    //�����ڵĴ��ں�
    SerialInfo:array[0..CommCount-1] of PSerialInfo;                            //��������Ϣ
    AgilentSerialInfo:array[0..CommCount-1] of PScanInfo;                       //Agilent��������Ϣ
    ScanInfo: PScanInfo;                                                        //ɨ��ǹ��Ϣ
    //�����Դ��������Ϣ
    bTestFail:array[0..CommCount-1] of Boolean;                                 //����ʧ��
    TestStartTickCount:array[0..CommCount-1] of Cardinal;                       //��ʼ����ʱ��
    strSubTestItemName:array[0..CommCount-1] of string;                         //�Ӳ���������
    strTestValue:array[0..CommCount-1] of string;                               //�Ӳ��������ֵ
    iSendAtTestCount:array[0..CommCount-1] of Integer;                          //����豸�Ĳ���
    iTestFinishTime:array[0..CommCount-1] of Integer;                           //�����Դ��ڲ���ʱ��
    strCheckTestAtCommand:array[0..CommCount-1] of string;                      //����豸��ATָ��
    strCheckTestAtCommandReturn:array[0..CommCount-1] of string;                //����豸�ķ���ֵ
    iSendAllowTestAtTimeOut:array[0..CommCount-1] of Integer;                   //����豸�ĳ�ʱʱ��
    iAllowTestCount:array[0..CommCount-1] of Integer;                           //����豸�Ĳ��Դ���
    bAppendResult:array[0..CommCount-1] of Boolean;                             //��Ӳ��Խ��
    //bGetTestItemed:array[0..CommCount-1] of Boolean;                            //�Ƿ��ò��Բ���
    iPassdNum : array[1..CommCount] of Integer;                                 //ÿ������GPSͨ���Ĵ���
    iFaildNum : array[1..CommCount] of Integer;                                 //ÿ������GPSʧ�ܵĴ���
    bFirstCount : array[1..CommCount] of Boolean;                               //ÿ������GPS�Ƿ��һ��ͨ��
    iTimerCircleTime : array[1..CommCount] of Integer;                          //ÿ������GPS�������������ʱ��
    bGPSTestPass:array[1..CommCount] of Boolean;                               //ÿ�����ڵ�GPS�Ƿ�ͨ��

    //GPS͸����Ϣ
    GpsDBValue:array[1..CommCount-1] of Integer;                                //GPS����DBֵ
    strFixNumber:array[0..CommCount-1,0..11] of string;                         //GPS͸�����Ƕ�λ��
    strOperatingMode,strFixMode:array[0..CommCount-1] of string;                //GPS͸����λģʽ
    //�������������Ϣ
    SendSrvList:array[0..CommCount-1] of TList;                                 //�������������������б�
    strCmdKey:array[0..CommCount-1] of string;                                  //������������������ؼ���
    StrListNumberSign:array[0..CommCount-1] of TStringList;                     //#�ŷָ�����
    strListColon:array[0..CommCount-1] of TStringList;                          //:�ŷָ�����
    SendSrvRecord:array[0..CommCount-1] of PSendSrvRecord;                      //������������������



    //���ڵ������Ϣ
    SendCommList:array[0..CommCount-1] of TList;                                //���������ڵ������б�
    strCmdCommKey:array[0..CommCount-1]of string;                               //���ʹ��ڵĹؼ���
    StrCommRecText:array[0..CommCount-1]of string;                              //�������յ�������
    strChipRid:array[0..CommCount-1]of string;                                  //�����ڶ�Ӧ�Ļ���ID
    strSoftModel:array[0..CommCount-1]of string;                                //�����ڶ�Ӧ�Ļ���
    strVersion:array[0..CommCount-1]of string;                                  //�����ڶ�Ӧ������汾
    strVersionS:array[0..CommCount-1]of string;                                 //20141203����������λ�°汾
    strCmdReturnText:array[0..CommCount-1] of string;                           //���ʹ��ڵķ���ֵ
    bCompare:array[0..CommCount-1]of Boolean;                                   //�Ƿ���Ҫ�ȶ�ֵ
    strCompare:array[0..CommCount-1]of string;                                  //�ȶ�ֵ��Χ
    strRemark:array[0..CommCount-1]of string;                                   //��ע��ȡ�ֶ�
    strRemark2:array[0..CommCount-1] of string;                                 //��ע��
    strCmdCommLink:array[0..CommCount-1] of string;

    StrListCompare_ParamDownload:array[1..CommCount-1] of TStringList;          //�ȶԣ���Χ��        -1
    StrListCompare_Name_ParamDownload:array[1..CommCount-1] of TStringList;     //�ȶ���Ŀ(����)
    StrListCompareChar_ParamDownload:array[1..CommCount-1] of TStringList;      //�ȶԣ���Χ��
    StrListCompareChar_Name_ParamDownload:array[1..CommCount-1] of TStringList; //�ȶ���Ŀ(����)

    CountDown:array[0..CommCount-1] of Integer;                                 //�����ڵ���ʱ
    PositionGpsTime:array[0..CommCount-1] of Double;                            //�����ڵ�GPS͸����λʱ��
    strIMEI:array[0..CommCount-1] of string;                                    //�������϶��ص�IMEI��

    //Agilent�������Ϣ
    SendAgilentCommList:array[0..CommCount-1] of TList;                         //������Agilent�������б�
    strAgilentCmdCommKey:array[0..CommCount-1]of string;                        //����Agilent�Ĺؼ���
    StrAgilentCommRecText:array[0..CommCount-1]of string;                       //Agilent�յ�������
    strCmdCommKey_Aglient:array[1..CommCount]of string;                         //������Agilent�Ĺؼ���
    strCmdReturnText_Aglient:array[0..CommCount-1] of string;                   //������Agilent�ķ���ֵ
    bCompare_Aglient:array[0..CommCount-1]of Boolean;                           //��Agilent�Ƿ���Ҫ�ȶ�ֵ
    strCompare_Aglient:array[0..CommCount-1]of string;                          //��Agilent�ȶ�ֵ��Χ
    strRemark_Aglient:array[0..CommCount-1]of string;                           //��Agilent��ע��ȡ�ֶ�

    //ɨ��ǹ�������Ϣ
    SendScanList:TList;                                                         //������ɨ��������б�

    strTcpPort,strTcpIp:string;                                                 //��������IP�Ͷ˿�
    GPSTestParam:TGPSTestParam;                                                 //GPS���Բ���
    BasicTestParam:TBasicTestParam;                                             //�������Բ���
    strTESTAT:string;                                                           //�������ģʽ��AT
    bTcpAuto:Boolean;                                                           //TCP�Զ�����
    CurrentFrom:TForm;                                                          //��ǰ��ʾ���Ӵ���
    strPlanName:string;                                                         //���Թ�λ
    strAutoTestModel:string;                                                    //���Ի���
    bReadRID:Boolean;                                                           //�Ƿ��ȡ����ID
    bUsbReceieveData:Boolean;                                                   //2014-7-25 SPComm�޷�����USB�����ӵ����ݣ��л�TCommport
    bAllowChangeImei:Boolean;                                                   //�Ƿ�����ı�IMEI
    bUpdateForm:Boolean;                                                        //�Ƿ���²������ݵ����ݿ�
    strIMEIStart:string;                                                        //2014-10-28 ��������λIMEI��ʼ��
    strIMEIEnd:string;                                                          //2014-10-28 ��������λIMEI������
    strParamAutoTestModel:string;                                               //2014-10-29 ��������λ�Ĳ��Ի��Ͳ��ڶ����ӻ�ã�ͨ��IMEI�Ŷλ��
    strTempVersion:array[0..CommCount-1]of string;                              //��ʱ����汾

    TestItemList:TStringList; //���Դ���
    TestItemLists:array[0..CommCount-1] of TStringList;//�ĸ����ڲ��Դ���
    TestSubItemList:array[0..CommCount-1] of TStringList;//��������

    bCheckTestWriteIMEI:Boolean; //IMEI��дλ����Ƿ�����дIMEI
Const
    CTimeOut=3000;          //ͨ�ų�ʱʱ��3S
    CSleepTime=500;        //˯��ʱ��,1S
    TOP_COUNT = 135;
    HEIGHT_COUNT = 10;
    AUTO_STRING = '�Զ�';
    MAU_STRING = '�ֶ�';
    FIXNO_STRING = 'δ��λ';
    FIX2D_STRING = '2D��λ';
    FIX3D_STRING = '3D��λ';
    UNKNOWN_STRING = 'δ֪';
implementation

end.
