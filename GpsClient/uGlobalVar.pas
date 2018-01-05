unit uGlobalVar;

interface
    uses Classes,Forms,IniFiles,uClientSendThread,Messages,Types;

    //用户结构
    Type
    PUserRecord=^TUserRecord;
    TUserRecord = record
        UserName        :string;        //用户名
        UserPassword    :string;        //用户密码
        UserDes         :string;        //用户描述
        UserType        :string;        //用户类型
        TestPlan        :string;        //测试计划
    end;

    //发送至服务器端的命令
    type
        PSendSrvRecord=^stuSendSrvRecord;
        stuSendSrvRecord = record
            sCmdKey:string;                     //命令关键字
            sCmd:string;                        //要发送的命令
            bWaitResponses:Boolean;             //是否等待回应标志
            iWaitResponseOverTime:Integer;      //等待服务器回应超时时间
            iResendNum:Integer;                 //重发次数
            iSendNum:Integer;                   //已发次数
            bInvalidation:Boolean;              //无效标志

    end;

    //发送至串口的命令
    type
        PSendCommRecord=^stuSendCommRecord;
        stuSendCommRecord = record
            sCmdKey:string;                     //命令关键字
            sCmd:string;                        //要发送的命令
            sReturnText:string;                 //接收值
            bWaitResponses:Boolean;             //是否等待回应标志
            iWaitResponseOverTime:Integer;      //等待服务器回应超时时间
            iResendNum:Integer;                 //重发次数
            iSendNum:Integer;                   //已发次数
            bInvalidation:Boolean;              //无效标志
            sSubItemName:string;                //子测试项名称
            bCompare:Boolean;                   //是否比对
            strCompare:string;                  //比对范围
            strRemark:string;                   //比对字符
            bSendAtCommand:Boolean;             //是否发送AT指令
            strRemark2:string;                  //备注2
    end;

    //串口信息
    type
        PSerialInfo=^stuSerialInfo;
        stuSerialInfo=record
            bAllowTest:Boolean;         //是否允许测试
            bEnterTestState:Boolean;    //进入测试状态
            bConnectedComm:Boolean;     //是否连接
            strChipRid:string;          //基带ID
            iCheckCommNo:Integer;      //第几次检测到
            bAllowCheck:boolean;
     end;
     //自动扫描枪
     type
        PScanInfo=^stuScanInfo;
        stuScanInfo=record
           bConnected:Boolean;     //是否连接
     end;


    //GPS测试参数
    Type
    PGPSTestParam=^TGPSTestParam;
    TGPSTestParam = record
        GPSNumbers          :Integer;           //GPS卫星数
        GPSDb               :Integer;           //GPS强度
        GPSContTime         :Integer;           //GPS持续时长
        GPSSer              :Integer;           //GPS误码率
        GPSDbMin            :Integer;           //GPS最小值
        GPSDbMax            :Integer;           //GPS最大值
        GPSDbMin2            :Integer;           //GPS最小值
        GPSDbMax2            :Integer;           //GPS最大值
        GPSDbMin3            :Integer;           //GPS最小值
        GPSDbMax3            :Integer;           //GPS最大值
        GPSDbMin4            :Integer;           //GPS最小值
        GPSDbMax4            :Integer;           //GPS最大值
        GPSNumbers_DY          :Integer;           //GPS卫星数（DESAY）

    end;

    //其它测试参数
    Type
    PBasicTestParam=^TBasicTestParam;
    TBasicTestParam = record
        CoupleTestTestTime      :Integer;
        ParamDownloadTestTime   :Integer;
        AutoTestTestTime        :Integer;
        WriteImeiTestTime       :Integer;
        TwiceTestTime           :Integer;
        CompareVersion          :string;            //比对版本
        FailContinueTest        :Boolean;           //失败接着测试
        SMT_AutoTestTestTime        :Integer;
        INPercentage              :Integer;        //2014-8-5入库位百分比设置
        Factory                  :Integer;
        SleepTime                :Integer;//2014-6-26向串口发送指令时加延时时间
        POSleepTime              :Integer;//2014-7-8检测到POW ON加延迟时间
        ATTimeOut                :Integer;//2014-7-19，AT指令超时时间
        ATReSendCount            :Integer;//2014-7-19,AT指令重发次数

    end;
type
  //iInteger=^Integer;
  pBytes=array of Byte;
  
const
    CommCount=5;
    LoginError='用户名或密码错误,请确认输入是否正确!';
    ServerDisconnect='目标服务器断开失败!';
    ISTESTED='此机子已测试过，请换另一个机子！';
    NOTNEED='此机子在此工站无需测试，请换另一个机子！';
    UPDATEFORMERROR='更新结果至数据库失败！请联系管理员';
    IMEIINVALID='记录中不存在此IMEI';
    LOGINTIMEOUT='登录请求超时,请查看网络是否连接!';
    SERVERSENDFAIL='发送服务器失败,查看是否与服务器连接!';
    VERSIONERROR='此机子软件版本不在测试范围内！请联系负责人！';
    IMEIUNTEST='此机子未烧写IMEI!';
    IMEIRANGERROR='此机子IMEI号不在测试范围内！';

    WM_Login        =   WM_USER+100;              //用户登录
    WM_CheckTested  =   WM_USER+101;      //检测是否测试过
    WM_TestPass     =   WM_USER+102;
    WM_ClientModify =   WM_USER+103;            //客户端修改/新增/删除的操作
    WM_GetTestPlanItem =   WM_USER+105;        //获得子测试项
    WM_TwiceByUpdateVersion =   WM_USER+106;        //软件更新返工
    WM_CheckIMEI            =   WM_USER+107;        //查看IMEI是否使用过
    WM_BarPrint            =   WM_USER+108;        //查看IMEI是否使用过
    WM_TwiceByBoxNo        =   WM_USER+109;        //入库整箱返工
    WM_AllowPrint            =   WM_USER+110;        //可以打印

    WM_LoadFlashTool       =   WM_USER+120;
    WM_TestCount           =   WM_USER+121;         ///OCQ工位测试数量处理
    WM_CalculateCRC        =   WM_USER+122;         ///计算CRC码

    MTKEPO_SV_NUMBER=32;
    MTKEPO_RECORD_SIZE=576;
    MTKEPO_SEGMENT_NUM=(30 * 4);

var
    ConnectSrvThread:tClientSend;
    User:TUserRecord;                                                           //当前用户
    strAutoTestLatitude,strAutoTestLongitude,strAutoTestAltitude:string;        //自动测试位经纬高度值

    strComm:array[0..CommCount-1] of string;                                    //各串口的串口号
    SerialInfo:array[0..CommCount-1] of PSerialInfo;                            //各串口信息
    AgilentSerialInfo:array[0..CommCount-1] of PScanInfo;                       //Agilent各串口信息
    ScanInfo: PScanInfo;                                                        //扫描枪信息
    //各测试窗口相关信息
    bTestFail:array[0..CommCount-1] of Boolean;                                 //测试失败
    TestStartTickCount:array[0..CommCount-1] of Cardinal;                       //开始测试时间
    strSubTestItemName:array[0..CommCount-1] of string;                         //子测试项名称
    strTestValue:array[0..CommCount-1] of string;                               //子测试项测试值
    iSendAtTestCount:array[0..CommCount-1] of Integer;                          //检测设备的测试
    iTestFinishTime:array[0..CommCount-1] of Integer;                           //各测试窗口测试时间
    strCheckTestAtCommand:array[0..CommCount-1] of string;                      //检测设备的AT指令
    strCheckTestAtCommandReturn:array[0..CommCount-1] of string;                //检测设备的返回值
    iSendAllowTestAtTimeOut:array[0..CommCount-1] of Integer;                   //检测设备的超时时间
    iAllowTestCount:array[0..CommCount-1] of Integer;                           //检测设备的测试次数
    bAppendResult:array[0..CommCount-1] of Boolean;                             //添加测试结果
    //bGetTestItemed:array[0..CommCount-1] of Boolean;                            //是否获得测试参数
    iPassdNum : array[1..CommCount] of Integer;                                 //每个窗口GPS通过的次数
    iFaildNum : array[1..CommCount] of Integer;                                 //每个窗口GPS失败的次数
    bFirstCount : array[1..CommCount] of Boolean;                               //每个窗口GPS是否第一次通过
    iTimerCircleTime : array[1..CommCount] of Integer;                          //每个窗口GPS检测误码率周期时长
    bGPSTestPass:array[1..CommCount] of Boolean;                               //每个窗口的GPS是否通过

    //GPS透传信息
    GpsDBValue:array[1..CommCount-1] of Integer;                                //GPS测试DB值
    strFixNumber:array[0..CommCount-1,0..11] of string;                         //GPS透传卫星定位数
    strOperatingMode,strFixMode:array[0..CommCount-1] of string;                //GPS透传定位模式
    //服务器的相关信息
    SendSrvList:array[0..CommCount-1] of TList;                                 //发送至服务器的命令列表
    strCmdKey:array[0..CommCount-1] of string;                                  //发送至服务器的命令关键字
    StrListNumberSign:array[0..CommCount-1] of TStringList;                     //#号分隔内容
    strListColon:array[0..CommCount-1] of TStringList;                          //:号分隔内容
    SendSrvRecord:array[0..CommCount-1] of PSendSrvRecord;                      //发送至服务器的命令



    //串口的相关信息
    SendCommList:array[0..CommCount-1] of TList;                                //发送至串口的命令列表
    strCmdCommKey:array[0..CommCount-1]of string;                               //发送串口的关键字
    StrCommRecText:array[0..CommCount-1]of string;                              //各串口收到的数据
    strChipRid:array[0..CommCount-1]of string;                                  //各串口对应的基带ID
    strSoftModel:array[0..CommCount-1]of string;                                //各串口对应的机型
    strVersion:array[0..CommCount-1]of string;                                  //各串口对应的软件版本
    strVersionS:array[0..CommCount-1]of string;                                 //20141203各串口下载位新版本
    strCmdReturnText:array[0..CommCount-1] of string;                           //发送串口的返回值
    bCompare:array[0..CommCount-1]of Boolean;                                   //是否需要比对值
    strCompare:array[0..CommCount-1]of string;                                  //比对值范围
    strRemark:array[0..CommCount-1]of string;                                   //备注截取字段
    strRemark2:array[0..CommCount-1] of string;                                 //备注二
    strCmdCommLink:array[0..CommCount-1] of string;

    StrListCompare_ParamDownload:array[1..CommCount-1] of TStringList;          //比对（范围）        -1
    StrListCompare_Name_ParamDownload:array[1..CommCount-1] of TStringList;     //比对项目(名称)
    StrListCompareChar_ParamDownload:array[1..CommCount-1] of TStringList;      //比对（范围）
    StrListCompareChar_Name_ParamDownload:array[1..CommCount-1] of TStringList; //比对项目(名称)

    CountDown:array[0..CommCount-1] of Integer;                                 //各串口倒计时
    PositionGpsTime:array[0..CommCount-1] of Double;                            //各串口的GPS透传定位时间
    strIMEI:array[0..CommCount-1] of string;                                    //各串口上读回的IMEI号

    //Agilent的相关信息
    SendAgilentCommList:array[0..CommCount-1] of TList;                         //发送至Agilent的命令列表
    strAgilentCmdCommKey:array[0..CommCount-1]of string;                        //发送Agilent的关键字
    StrAgilentCommRecText:array[0..CommCount-1]of string;                       //Agilent收到的数据
    strCmdCommKey_Aglient:array[1..CommCount]of string;                         //发送至Agilent的关键字
    strCmdReturnText_Aglient:array[0..CommCount-1] of string;                   //发送至Agilent的返回值
    bCompare_Aglient:array[0..CommCount-1]of Boolean;                           //至Agilent是否需要比对值
    strCompare_Aglient:array[0..CommCount-1]of string;                          //至Agilent比对值范围
    strRemark_Aglient:array[0..CommCount-1]of string;                           //至Agilent备注截取字段

    //扫描枪的相关信息
    SendScanList:TList;                                                         //发送至扫描的命令列表

    strTcpPort,strTcpIp:string;                                                 //服务器端IP和端口
    GPSTestParam:TGPSTestParam;                                                 //GPS测试参数
    BasicTestParam:TBasicTestParam;                                             //基本测试参数
    strTESTAT:string;                                                           //进入测试模式的AT
    bTcpAuto:Boolean;                                                           //TCP自动连接
    CurrentFrom:TForm;                                                          //当前显示的子窗体
    strPlanName:string;                                                         //测试工位
    strAutoTestModel:string;                                                    //测试机型
    bReadRID:Boolean;                                                           //是否读取基带ID
    bUsbReceieveData:Boolean;                                                   //2014-7-25 SPComm无法接收USB线连接的数据，切换TCommport
    bAllowChangeImei:Boolean;                                                   //是否允许改变IMEI
    bUpdateForm:Boolean;                                                        //是否更新测试数据到数据库
    strIMEIStart:string;                                                        //2014-10-28 参数下载位IMEI起始号
    strIMEIEnd:string;                                                          //2014-10-28 参数下载位IMEI结束号
    strParamAutoTestModel:string;                                               //2014-10-29 参数下载位的测试机型不在读机子获得，通过IMEI号段获得
    strTempVersion:array[0..CommCount-1]of string;                              //临时软件版本

    TestItemList:TStringList; //测试大项
    TestItemLists:array[0..CommCount-1] of TStringList;//四个串口测试大项
    TestSubItemList:array[0..CommCount-1] of TStringList;//测试子项

    bCheckTestWriteIMEI:Boolean; //IMEI烧写位检测是否有烧写IMEI
Const
    CTimeOut=3000;          //通信超时时间3S
    CSleepTime=500;        //睡眠时间,1S
    TOP_COUNT = 135;
    HEIGHT_COUNT = 10;
    AUTO_STRING = '自动';
    MAU_STRING = '手动';
    FIXNO_STRING = '未定位';
    FIX2D_STRING = '2D定位';
    FIX3D_STRING = '3D定位';
    UNKNOWN_STRING = '未知';
implementation

end.
