unit uGlobalVar;

interface
    uses
        Messages,Forms;
const
    CommCount=5;
    LocalIP='192.168.0.240';
    WM_Login                        =   WM_USER+100;            //�û���¼
    WM_CheckTested                  =   WM_USER+101;            //����Ƿ���Թ�
    WM_UpdateResult                 =   WM_USER+102;            //���²��Խ��
    WM_CheckTestPass                =   WM_USER+103;            //�������Ƿ�ͨ��
    WM_DeleteImei                   =   WM_USER+104;            //ɾ��IEMI
    WM_DeleteTestResultByImeiTwice  =   WM_USER+107;            //ɾ�����Լ�¼(��IMEIΪ����)
    WM_DeleteTestResultByRidTwice   =   WM_USER+108;            //ɾ�����Լ�¼(��RIDΪ����)
    WM_GetTestPlanItem              =   WM_USER+109;            //��ò�������


    WM_TwiceByUpdateVersion         =   WM_USER+110;            //�����������
    WM_CheckMustTest                =   WM_USER+111;            //�ж��Ƿ���Ҫ����
    WM_CheckIMEI                    =   WM_USER+112;            //�ж�IMEI�Ƿ�ʹ�ù�
    WM_UpdateGpsTcData              =   WM_USER+113;            //GPS��λ���ݱ���
    
    WM_CheckTestedByImei            =   WM_USER+114;
    WM_GetTempImei                  =   WM_USER+115;
    WM_GetTempRid                   =   WM_USER+116;
    WM_CopyModelTestParam           =   WM_USER+117;            //�������ò����Ŀ���
    //WM_TestPass     =   WM_USER+102;
    //WM_ClientModify =   WM_USER+103;            //�ͻ����޸�/����/ɾ���Ĳ���
    //WM_DeleteTestResult =   WM_USER+104;        //ɾ�����Խ��(����λ)

    WM_UpdateGpsSMT_TcData          =   WM_USER+118;            //SMT_GPS��λ���ݱ���
    WM_CheckTested_SetResult        =   WM_USER+119;            //����Ƿ���Թ�
    WM_CheckTestPass_WriteIMEI      =   WM_USER+120;            //�������Ƿ�ͨ�� (IMEI��дλ)
    WM_TwiceByBoxNo                 =   WM_USER+121;            //������䷵�����

    WM_CheckTestedBySNAndVersion    =   WM_USER+122;            //��⹤λ�Ƿ���Թ���Ŀǰֻ������λʹ��

    WM_CalculateCRC                 =   WM_USER+123;            //����CRCУ����
    WM_CheckTestedParamCpd              =   WM_USER+124;            //�Ƿ���Թ�����λ���õ�֮ǰ�汾
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
type
  //iInteger=^Integer;
  pBytes=array of Byte;

var
    User:TUserRecord;               //��ǰ�û�
    bIsLoaclIp:Boolean;
    //sOperType : string;             //�������ͣ�1:�½���2:�༭��3:ɾ��
implementation
  
end.
 