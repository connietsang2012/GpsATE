unit uGlobalVar;

interface
    uses
        Messages,Forms;
const
    CommCount=5;
    LocalIP='192.168.0.240';
    WM_Login                        =   WM_USER+100;            //用户登录
    WM_CheckTested                  =   WM_USER+101;            //检测是否测试过
    WM_UpdateResult                 =   WM_USER+102;            //更新测试结果
    WM_CheckTestPass                =   WM_USER+103;            //检测测试是否通过
    WM_DeleteImei                   =   WM_USER+104;            //删除IEMI
    WM_DeleteTestResultByImeiTwice  =   WM_USER+107;            //删除测试记录(以IMEI为索引)
    WM_DeleteTestResultByRidTwice   =   WM_USER+108;            //删除测试记录(以RID为索引)
    WM_GetTestPlanItem              =   WM_USER+109;            //获得测试子项


    WM_TwiceByUpdateVersion         =   WM_USER+110;            //软件升级返工
    WM_CheckMustTest                =   WM_USER+111;            //判断是否需要测试
    WM_CheckIMEI                    =   WM_USER+112;            //判断IMEI是否使用过
    WM_UpdateGpsTcData              =   WM_USER+113;            //GPS定位数据保存
    
    WM_CheckTestedByImei            =   WM_USER+114;
    WM_GetTempImei                  =   WM_USER+115;
    WM_GetTempRid                   =   WM_USER+116;
    WM_CopyModelTestParam           =   WM_USER+117;            //机型设置参数的拷贝
    //WM_TestPass     =   WM_USER+102;
    //WM_ClientModify =   WM_USER+103;            //客户端修改/新增/删除的操作
    //WM_DeleteTestResult =   WM_USER+104;        //删除测试结果(返工位)

    WM_UpdateGpsSMT_TcData          =   WM_USER+118;            //SMT_GPS定位数据保存
    WM_CheckTested_SetResult        =   WM_USER+119;            //检测是否测试过
    WM_CheckTestPass_WriteIMEI      =   WM_USER+120;            //检测测试是否通过 (IMEI烧写位)
    WM_TwiceByBoxNo                 =   WM_USER+121;            //入库整箱返工结果

    WM_CheckTestedBySNAndVersion    =   WM_USER+122;            //检测工位是否测试过，目前只在下载位使用

    WM_CalculateCRC                 =   WM_USER+123;            //计算CRC校验码
    WM_CheckTestedParamCpd              =   WM_USER+124;            //是否测试过下载位，得到之前版本
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
type
  //iInteger=^Integer;
  pBytes=array of Byte;

var
    User:TUserRecord;               //当前用户
    bIsLoaclIp:Boolean;
    //sOperType : string;             //操作类型，1:新建、2:编辑、3:删除
implementation
  
end.
 