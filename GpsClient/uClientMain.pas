unit uClientMain;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, WinSkinStore, WinSkinData, ScktComp, ExtCtrls, Menus, ActnList,
    StdCtrls, ComCtrls, Buttons, IniFiles, uGlobalVar, Mask, StrUtils, CheckLst,
    DB, MemDS, DBAccess, Uni, ADODB, ShellAPI, uLongWaitTrd, TlHelp32;

type
    TfrmClientMain = class(TForm)
        ClientSocket_0: TClientSocket;
        tmrSocket_0: TTimer;
        mmServer: TMainMenu;
        BasicSet: TMenuItem;
        FunctionTest: TMenuItem;
        GPSTest: TMenuItem;
        CoupleTest: TMenuItem;
        ParamDownload: TMenuItem;
        CartonBox: TMenuItem;
        N5: TMenuItem;
        N6: TMenuItem;
        N7: TMenuItem;
        N8: TMenuItem;
        N9: TMenuItem;
        N10: TMenuItem;
        N11: TMenuItem;
        ActionList1: TActionList;
        ac_UserType: TAction;
        ac_User: TAction;
        ac_TestPlan: TAction;
        ac_TestWrong: TAction;
        ac_ProductSet: TAction;
        ac_FunctionTest: TAction;
        status_Main: TStatusBar;
        PCForm: TPageControl;
        ts1: TTabSheet;
        N12: TMenuItem;
        ac_CartonBoxSet: TAction;
        N13: TMenuItem;
        ac_CartonBoxMan: TAction;
        pnlBottom: TPanel;
        grpSocketLog: TGroupBox;
        mmoTcpLog: TMemo;
        grpCommLog: TGroupBox;
        mmoCommLog: TMemo;
        ac_GPSTest: TAction;
        ac_CoupleTest: TAction;
        ac_WriteImeiTest: TAction;
        ac_ParamDownloadTest: TAction;
        TestParam: TMenuItem;
        ac_TestParam: TAction;
        tmrSocket_1: TTimer;
        tmrSocket_2: TTimer;
        tmrSocket_3: TTimer;
        tmrSocket_4: TTimer;
        ac_BasicTestParam: TAction;
        Twice: TMenuItem;
        ac_Twice: TAction;
        ac_AutoTestSetting: TAction;
        N1: TMenuItem;
        IMEI1: TMenuItem;
        ClientSocket_1: TClientSocket;
        ClientSocket_2: TClientSocket;
        ClientSocket_3: TClientSocket;
        ClientSocket_4: TClientSocket;
        DS_GpsTestParamter: TDataSource;
        UniQuery_GpsTestParamter: TUniQuery;
        intgrfldUniQuery_GpsTestParamterId: TIntegerField;
        intgrfldUniQuery_GpsTestParamterCoupleTestTestTime: TIntegerField;
        intgrfldUniQuery_GpsTestParamterParamDownloadTestTime: TIntegerField;
        intgrfldUniQuery_GpsTestParamterAutoTestTestTime: TIntegerField;
        intgrfldUniQuery_GpsTestParamterWriteImeiTestTime: TIntegerField;
        intgrfldUniQuery_GpsTestParamterTwiceTestTime: TIntegerField;
        intgrfldUniQuery_GpsTestParamterGPSNumbers: TIntegerField;
        intgrfldUniQuery_GpsTestParamterGPSDb: TIntegerField;
        SFUniQuery_GpsTestParamterEPOLatitude: TStringField;
        SFUniQuery_GpsTestParamterEPOLongitude: TStringField;
        SFUniQuery_GpsTestParamterEPOAltitude: TStringField;
        intgrfldUniQuery_GpsTestParamterCheckTestTime: TIntegerField;
        SFUniQuery_GpsTestParamterCheckTestAtCommand: TStringField;
        SFUniQuery_GpsTestParamterCheckTestAtReturn: TStringField;
        intgrfldUniQuery_GpsTestParamterCheckTestAtTimeOut: TIntegerField;
        intgrfldUniQuery_GpsTestParamterCheckTestAllowTestCount: TIntegerField;
        ac_AutoTest: TAction;
        ac_AutoTestSMT: TAction;
        SMT1: TMenuItem;
        UniQuery_GpsTestParamterSMT_AutoTestTestTime: TIntegerField;
        SMTIQC: TMenuItem;
        ac_SMTIQC: TAction;
        SDClientMain: TSkinData;
        SSClientMain: TSkinStore;
        spInsertOperRecord: TADOStoredProc;
        ac_IncomCheck: TAction;
        Incoming: TMenuItem;
        intgrfldUniQuery_GpsTestParamterPercentage: TIntegerField;
        btn1: TButton;
        btn2: TButton;
        btn3: TButton;
        ROM1: TMenuItem;
        DS_TestType: TDataSource;
        UniQuery_TestType: TUniQuery;
        UniQuery_TestTypeTypeId: TIntegerField;
        UniQuery_TestTypeTypeName: TStringField;
        UniQuery_TestTypeTypeDes: TStringField;
        UniQuery_TestTypeTestAutoTestSMT: TBooleanField;
        UniQuery_TestTypeTestSMTOQC: TBooleanField;
        UniQuery_TestTypeTestCouple: TBooleanField;
        UniQuery_TestTypeTestParamDownload: TBooleanField;
        UniQuery_TestTypeTestAutoTest: TBooleanField;
        UniQuery_TestTypeTestWriteImei: TBooleanField;
        UniQuery_TestTypeTestTwice: TBooleanField;
        UniQuery_TestTypeTestIncomCheck: TBooleanField;
        UniQuery_TestTypeTestReadBackRom: TBooleanField;
        UniQuery_TestTypeTestCartonBox: TBooleanField;
        UniQuery_TestType_MASK_FROM_V2: TBytesField;
        ParamConfig: TMenuItem;
        GiftBox: TMenuItem;
        ac_GiftBox: TAction;
        ac_DataRelative: TAction;
        N2: TMenuItem;
    spCheckTestedParamCpd1: TADOStoredProc;
        spGetUserInformation: TADOStoredProc;
    spCheckTested1: TADOStoredProc;
        spGetTempRid: TADOStoredProc;
    spCheckMustTest1: TADOStoredProc;
    spUpdateForm1: TADOStoredProc;
    spSMTUpdateForm1: TADOStoredProc;
        spCheckTestpass: TADOStoredProc;
        spCheckTestPass_WriteIMEI: TADOStoredProc;
        spDeleteImei: TADOStoredProc;
        spDeleteTestResult_ByImei: TADOStoredProc;
        spDeleteTestResult_ByRid: TADOStoredProc;
        spUpdateGpsSMT_TcData: TADOStoredProc;
        spUpdateGpsTcData: TADOStoredProc;
    spCheckTested: TUniStoredProc;
    spCheckMustTest: TUniStoredProc;
    spCheckTestedParamCpd: TUniStoredProc;
    spUpdateForm: TUniStoredProc;
    spParamDownUpdateForm1: TADOStoredProc;
    spParamDownUpdateForm: TUniStoredProc;
    spSMTUpdateForm: TUniStoredProc;
    SIM1: TMenuItem;
    ac_SIMRel: TAction; ////线程

        //==================================================================//
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormShow(Sender: TObject);
        //==================================================================//
        procedure btnStopTcpClick(Sender: TObject);
        procedure ClientSocket_0Connect(Sender: TObject;
            Socket: TCustomWinSocket);
        procedure ClientSocket_0Disconnect(Sender: TObject;
            Socket: TCustomWinSocket);
        procedure ClientSocket_0Error(Sender: TObject; Socket: TCustomWinSocket;
            ErrorEvent: TErrorEvent; var ErrorCode: Integer);
        procedure ClientSocket_0Read(Sender: TObject; Socket: TCustomWinSocket);
        procedure mmoCommLogKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure mmoTcpLogKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        //==================================================================//
        procedure tmrSocket_0Timer(Sender: TObject);
        procedure tmrSocket_1Timer(Sender: TObject);
        procedure tmrSocket_2Timer(Sender: TObject);
        procedure tmrSocket_3Timer(Sender: TObject);
        procedure tmrSocket_4Timer(Sender: TObject);
        //==================================================================//
        procedure MsgLogin(var msg: TMessage); message WM_Login;
        procedure MsgLoadFlashTool(var msg: TMessage); message WM_LoadFlashTool;
        //==================================================================//
        procedure ac_BasicTestParamExecute(Sender: TObject);
        procedure ac_FunctionTestExecute(Sender: TObject);
        procedure ac_GPSTestExecute(Sender: TObject);
        procedure ac_CoupleTestExecute(Sender: TObject);
        procedure ac_WriteImeiTestExecute(Sender: TObject);
        procedure ac_ParamDownloadTestExecute(Sender: TObject);
        procedure ac_AutoTestExecute(Sender: TObject);
        procedure ac_AutoTestSettingExecute(Sender: TObject);
        procedure ac_CartonBoxSetExecute(Sender: TObject);
        procedure ac_CartonBoxManExecute(Sender: TObject);
        procedure ac_TwiceExecute(Sender: TObject);

        procedure ClientSocket_1Read(Sender: TObject;
            Socket: TCustomWinSocket);
        procedure ClientSocket_2Read(Sender: TObject;
            Socket: TCustomWinSocket);
        procedure ClientSocket_3Read(Sender: TObject;
            Socket: TCustomWinSocket);
        procedure ClientSocket_4Read(Sender: TObject;
            Socket: TCustomWinSocket);
        procedure ClientSocket_1Error(Sender: TObject;
            Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
            var ErrorCode: Integer);
        procedure ClientSocket_2Error(Sender: TObject;
            Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
            var ErrorCode: Integer);
        procedure ClientSocket_3Error(Sender: TObject;
            Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
            var ErrorCode: Integer);
        procedure ClientSocket_4Error(Sender: TObject;
            Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
            var ErrorCode: Integer);
        procedure ac_AutoTestSMTExecute(Sender: TObject);

        //==================================================================//
        procedure MyException(Sender: TObject; E: Exception);
        procedure ac_SMTIQCExecute(Sender: TObject);
        procedure ac_IncomCheckExecute(Sender: TObject);
        procedure btn1Click(Sender: TObject);
        procedure btn2Click(Sender: TObject);
        procedure btn3Click(Sender: TObject);
        procedure ROM1Click(Sender: TObject);

        procedure ParamConfigClick(Sender: TObject);
        procedure ac_GiftBoxExecute(Sender: TObject);
        procedure ac_DataRelativeExecute(Sender: TObject);
    procedure ac_SIMRelExecute(Sender: TObject);

    private
        { Private declarations }
        procedure DeClientSocketReceieveData(CommIndex: Integer);

    public

        function GetHWndByPID(const hPID: THandle): THandle;
        procedure InitTestType;
        { Public declarations }
    end;

    {TMyThread = class(TThread)
    FMyThreadID:integer;
    public
        constructor Create(CreateSuspended:Boolean;MyThreadID:integer);overload;
        procedure execute;override;
    end;}

var
    frmClientMain: TfrmClientMain;
    LongWaitThread: TLongWaitTrd;
    Tid: THandle;
    thread1: Integer;
    fHandle: THandle;
    socket0, socket2, socket3, socket4, socket1: TCustomWinSocket;
function openFlash_tool(CommIndex: Integer): Boolean;

implementation
uses
    uPublicFunc, uClientLogin, uCartonBox, uCartonBoxSet, uCartonBoxMan, uModuleForm,
    uCoupleTest, uWriteImeiTest, uParamDownloadTest,
    uBasicTestParam, uClientDataModuleForm, uTwiceTest, uAutoTest, uDmMain,
    uAutoTestSMT, uSMTIQCTest, uIncomCheck, uReadBack, uParamLoadConfig,
    uGiftBoxMain, uCartonBoxLlf, uDataRelative, uSIMRel;

{$R *.dfm}
//==================================================================//

procedure TfrmClientMain.MyException(Sender: TObject; E: Exception);
begin
    //
end;

procedure TfrmClientMain.InitTestType;
var
    TestAutoTestSMT, TestSMTOQC, TestCouple, TestParamDownload,
        TestAutoTest, TestWriteImei, TestTwice, TestIncomCheck, TestReadBackRom, TestCartonBox: Boolean;

begin
    UniQuery_TestType.Params[0].AsString := Trim(User.UserType);
    UniQuery_TestType.Active := true;
    TestAutoTestSMT := UniQuery_TestType.FieldByName('TestAutoTestSMT').AsBoolean;
    TestSMTOQC := UniQuery_TestType.FieldByName('TestSMTOQC').AsBoolean;
    TestCouple := UniQuery_TestType.FieldByName('TestCouple').AsBoolean;
    TestParamDownload := UniQuery_TestType.FieldByName('TestParamDownload').AsBoolean;
    TestAutoTest := UniQuery_TestType.FieldByName('TestAutoTest').AsBoolean;
    TestWriteImei := UniQuery_TestType.FieldByName('TestWriteImei').AsBoolean;
    TestTwice := UniQuery_TestType.FieldByName('TestTwice').AsBoolean;
    TestIncomCheck := UniQuery_TestType.FieldByName('TestIncomCheck').AsBoolean;
    TestReadBackRom := UniQuery_TestType.FieldByName('TestReadBackRom').AsBoolean;
    TestCartonBox := UniQuery_TestType.FieldByName('TestCartonBox').AsBoolean;

    //菜单
    SMT1.Enabled := TestAutoTestSMT;
    SMTIQC.Enabled := TestSMTOQC;
    CoupleTest.Enabled := TestCouple;
    ParamDownload.Enabled := TestParamDownload;
    N1.Enabled := TestAutoTest;
    IMEI1.Enabled := TestWriteImei;
    Twice.Enabled := TestTwice;
    Incoming.Enabled := TestIncomCheck;
    ROM1.Enabled := TestReadBackRom;
    CartonBox.Enabled := TestCartonBox;

    if (User.UserType <> 'ParamConfig') and (User.UserType <> 'admin') and (User.UserType <> 'SuperAdmin') then
    begin
        ParamConfig.Visible := false;
    end;
end;

procedure TfrmClientMain.FormCreate(Sender: TObject);
var
    Count: Integer;
    ParamFilename: string;
    MyIniFile: Tinifile;
begin

    //加载默认的皮肤控件
    SDClientMain.LoadFromCollection(SSClientMain, 0);
    SDClientMain.Active := true;
    UniQuery_GpsTestParamter.Active := True;
    UniQuery_GpsTestParamter.First;

    New(ScanInfo);
    ScanInfo.bConnected := False;
    SendScanList := TList.Create;

    TestItemList := TStringList.Create;
    //创建各串口信息,创建发送至服务器/发送至串口的列表
    for Count := 0 to CommCount - 1 do
    begin
        //subitemlist为每个大项的测试子项
        //itemlist与itemList一样是测试大项，为了发指令设置的中间list
        TestSubItemList[Count] := TStringList.Create;
        TestItemLists[Count] := TStringList.Create;

        //保存测试时的DB值
        GpsDBValue[Count] := 0;

        //创建#号/:号分隔列表
        StrListNumberSign[Count] := TStringList.Create;
        strListColon[Count] := TStringList.Create;

        New(SerialInfo[Count]);
        New(AgilentSerialInfo[Count]);

        SendSrvList[Count] := TList.Create;
        SendCommList[Count] := TList.Create;
        SendAgilentCommList[Count] := TList.Create;

        iTestFinishTime[Count] := UniQuery_GpsTestParamter.FieldByName('CheckTestTime').AsInteger;
        strCheckTestAtCommand[Count] := UniQuery_GpsTestParamter.FieldByName('CheckTestAtCommand').AsString;
        strCheckTestAtCommandReturn[Count] := UniQuery_GpsTestParamter.FieldByName('CheckTestAtReturn').AsString;
        iSendAllowTestAtTimeOut[Count] := UniQuery_GpsTestParamter.FieldByName('CheckTestAtTimeOut').AsInteger;
        iAllowTestCount[Count] := UniQuery_GpsTestParamter.FieldByName('CheckTestAllowTestCount').AsInteger;
    end;
    GPSTestParam.GPSNumbers := UniQuery_GpsTestParamter.FieldByName('GPSNumbers').AsInteger;
    GPSTestParam.GPSDb := UniQuery_GpsTestParamter.FieldByName('GPSDb').AsInteger;
    GPSTestParam.GPSDbMin := StrToInt(ReadIni_GPS('GpsTC', 'MinDB', '0'));
    GPSTestParam.GPSDbMax := StrToInt(ReadIni_GPS('GpsTC', 'MaxDB', '0'));
    GPSTestParam.GPSDbMin2 := StrToInt(ReadIni_GPS('GpsTC', 'MinDB2', '0'));
    GPSTestParam.GPSDbMax2 := StrToInt(ReadIni_GPS('GpsTC', 'MaxDB2', '0'));
    GPSTestParam.GPSDbMin3 := StrToInt(ReadIni_GPS('GpsTC', 'MinDB3', '0'));
    GPSTestParam.GPSDbMax3 := StrToInt(ReadIni_GPS('GpsTC', 'MaxDB3', '0'));
    GPSTestParam.GPSDbMin4 := StrToInt(ReadIni_GPS('GpsTC', 'MinDB4', '0'));
    GPSTestParam.GPSDbMax4 := StrToInt(ReadIni_GPS('GpsTC', 'MaxDB4', '0'));
    GPSTestParam.GPSNumbers_DY := StrToInt(ReadIni_GPS('GpsNumberDY', 'num', '0'));
    GPSTestParam.GPSContTime := StrToInt(ReadIni_GPS('GPSContTime', 'Time', '5'));
    GPSTestParam.GPSSer := StrToInt(ReadIni_GPS('GPSSer', 'Ser', '10'));

    BasicTestParam.CoupleTestTestTime := UniQuery_GpsTestParamter.FieldByName('CoupleTestTestTime').AsInteger;
    BasicTestParam.ParamDownloadTestTime := UniQuery_GpsTestParamter.FieldByName('ParamDownloadTestTime').AsInteger;
    BasicTestParam.AutoTestTestTime := UniQuery_GpsTestParamter.FieldByName('AutoTestTestTime').AsInteger;
    BasicTestParam.SMT_AutoTestTestTime := UniQuery_GpsTestParamter.FieldByName('SMT_AutoTestTestTime').AsInteger;
    BasicTestParam.WriteImeiTestTime := UniQuery_GpsTestParamter.FieldByName('WriteImeiTestTime').AsInteger;
    BasicTestParam.TwiceTestTime := UniQuery_GpsTestParamter.FieldByName('TwiceTestTime').AsInteger;
    BasicTestParam.INPercentage := UniQuery_GpsTestParamter.FieldByName('Percentage').AsInteger;

    strAutoTestLatitude := UniQuery_GpsTestParamter.FieldByName('EPOLatitude').AsString;
    strAutoTestLongitude := UniQuery_GpsTestParamter.FieldByName('EPOLongitude').AsString;
    strAutoTestAltitude := UniQuery_GpsTestParamter.FieldByName('EPOAltitude').AsString;
    //从文件读取参数 (TCP/基本设置/GPS设置),并将其显示各控件上。
    ParamFilename := ExtractFilePath(Paramstr(0)) + 'Param.ini';
    MyIniFile := Tinifile.Create(ParamFilename);
    with MyIniFile do
    begin
        strTcpIp := ReadString('Tcp', 'Ip', '127.0.0.1');
        strTcpPort := ReadString('Tcp', 'Port', '8889');
        BasicTestParam.CompareVersion := ReadString('BasicTest', 'CompareVersion', '');
        BasicTestParam.FailContinueTest := ReadBool('BasicTest', 'FailContinueTest', False);
        strTESTAT := ReadString('TEST', 'TESTAT', 'AT^GT_CM=TEST');
        BasicTestParam.SleepTime := ReadInteger('BasicTest', 'SLEEP', 0);
        BasicTestParam.POSleepTime := ReadInteger('BasicTest', 'POSLEEP', 0);
        BasicTestParam.ATTimeOut := ReadInteger('BasicTest', 'ATTimeOut', 0);
        BasicTestParam.ATReSendCount := ReadInteger('BasicTest', 'ATReSendCount', 0);
        BasicTestParam.Factory := ReadInteger('Factory', 'DESAY', 0);
        if BasicTestParam.Factory = 1 then
            GPSTestParam.GPSNumbers := GPSTestParam.GPSNumbers_DY;
    end;
    MyIniFile.Free;

    Application.OnException := MyException;

end;

procedure TfrmClientMain.FormClose(Sender: TObject;
    var Action: TCloseAction);
var
    Count: Integer;
begin
    //相应的线程和列表释放
    ConnectSrvThread.Terminate;
    Sleep(100);
    ConnectSrvThread.Free;
    Sleep(10);
    //关闭子窗体
    if CurrentFrom <> nil then CurrentFrom.Close();
    Sleep(100);
    for Count := 0 to CommCount - 1 do
    begin
        SendSrvList[Count].Free;
        SendCommList[Count].Free;
        SendAgilentCommList[Count].Free;
        StrListNumberSign[Count].Free;
        strListColon[Count].Free;
        TestItemLists[Count].Free;
        TestSubItemList[Count].Free;
    end;
    TestItemList.Free;
    Application.Terminate;
end;

procedure TfrmClientMain.FormShow(Sender: TObject);
begin
    //设定子菜单的可见性
    //SetMenuEnable();
     //初始化工位
    InitTestType;
    //根据用户类型确定显示的子窗体
    if User.TestPlan = 'FuncTest' then
        ac_FunctionTest.Execute
    else
        if User.TestPlan = 'GPSTest' then
            ac_GPSTest.Execute
        else
            if User.TestPlan = 'CoupleTest' then
                ac_CoupleTest.Execute

            else
                if User.TestPlan = 'WriteImei' then
                    ac_WriteImeiTest.Execute
                else
                    if User.TestPlan = 'ParamDownload' then
                        ac_ParamDownloadTest.Execute
                    else
                        if User.TestPlan = 'CartonBox' then
                            ShowCartonBoxForm()
                        else
                            if User.TestPlan = 'AutoTest' then
                                ac_AutoTest.Execute
                            else
                                if User.TestPlan = 'TwiceTest' then
                                    ac_Twice.Execute;
end;
//==================================================================//

//==================================================================//

procedure TfrmClientMain.btnStopTcpClick(Sender: TObject);
begin
    try
        ClientSocket_0.Close;
        ClientSocket_1.Close;
        ClientSocket_2.Close;
        ClientSocket_3.Close;
        ClientSocket_4.Close;
    except
        MessageBox(0, ServerDisconnect, '信息提示', MB_ICONWARNING + MB_OK);
    end;
end;

procedure TfrmClientMain.ClientSocket_0Connect(Sender: TObject;
    Socket: TCustomWinSocket);
begin
    //连接服务器/断开服务器的有效性，红绿灯的显示
    {btnStartTcp.Enabled:=False;
    btnStopTcp.Enabled:=True;}

    //imgTCPGreen.Visible:=True;
    //imgTCPRed.Visible:=False;
end;

procedure TfrmClientMain.ClientSocket_0Disconnect(Sender: TObject;
    Socket: TCustomWinSocket);
begin
    //连接服务器/断开服务器的有效性，红绿灯的显示
    {btnStartTcp.Enabled:=True;
    btnStopTcp.Enabled:=False;}

    //imgTCPGreen.Visible:=False;
    //imgTCPRed.Visible:=True;
end;

procedure TfrmClientMain.ClientSocket_0Error(Sender: TObject;
    Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
    var ErrorCode: Integer);
var
    CommIndex: Integer;
    FileName: string;
begin
    CommIndex := 0;
    FileName := ExtractFilePath(Paramstr(0)) + 'SocketLog_' + IntToStr(CommIndex) + '.txt';
    AppendTxt(Format('服务器连接失败!%d', [ErrorCode]), FileName);
    ErrorCode := 0;
end;

procedure TfrmClientMain.ClientSocket_0Read(Sender: TObject;
    Socket: TCustomWinSocket);
var
    ReceiveText, StrXML, strSendText: string; //接收到的XML字符串
    CommIndex: Integer;
begin
    Application.ProcessMessages;
    CommIndex := 0;
    socket0 := Socket;
    ReceiveText := Socket.ReceiveText;
    NoteSocketLog(CommIndex, '[R:]====' + ReceiveText);

    //取各分隔符内容
    StrListNumberSign[CommIndex].Clear;
    strListColon[CommIndex].Clear;
    StrListNumberSign[CommIndex].Delimiter := '#';
    StrListNumberSign[CommIndex].DelimitedText := ReceiveText;

    DeClientSocketReceieveData(CommIndex);
end;

procedure TfrmClientMain.DeClientSocketReceieveData(CommIndex: Integer);
var
    strSendText: string;
    Socket: TCustomWinSocket;
    iRecordCount: Integer;
    iFuncTestPass, iGPSPass, iCoupleTestPass, iParamDownloadPass, iAutoPass: Integer;
begin
    case CommIndex of
        0:
            begin
                Socket := socket0;
            end;
        1:
            begin
                Socket := socket1;
            end;
        2:
            begin
                Socket := socket2;
            end;
        3:
            begin
                Socket := socket3;
            end;
        4:
            begin
                Socket := socket4;
            end;
    end;
    //取得发送给服务器的命令关键字
    strCmdKey[CommIndex] := GetSendedSrvCmdkey(CommIndex);
    if (Pos(strCmdKey[CommIndex], StrListNumberSign[CommIndex].DelimitedText) <= 0) and (Pos(strCmdKey[CommIndex], 'DeleteTestResult_Twice') <= 0)
        and (Pos(strCmdKey[CommIndex], 'CheckTested_SMT') <= 0) then Exit;
    try
        if (strCmdKey[CommIndex] = 'Login') then
        begin
            //--------------------------Action=Login#Username=%s%UserPwd=%s#--------------------------//
            //--------------------------Action=Login#UserDes=%s#UserType=%s#TestPlan=%s#Result=%d#--------------------------//
            if StrListNumberSign[CommIndex].Count > 1 then
            begin
                SendToServer(CommIndex);
                User.UserDes := StrListNumberSign[CommIndex].Values['UserDes'];
                User.UserType := StrListNumberSign[CommIndex].Values['UserType'];
                User.TestPlan := StrListNumberSign[CommIndex].Values['TestPlan'];
                SendMessage(Handle, WM_Login, StrToInt(StrListNumberSign[CommIndex].Values['Result']), 0);
            end
            else
                Exit;
        end
        else
            if strCmdKey[CommIndex] = 'CheckTestedParamCpd' then //2014.12.3新加流程检测是否跑过下载位
            begin
                if StrListNumberSign[CommIndex].Count > 1 then
                begin
                    SendToServer(CommIndex);
                    if StrToInt(StrListNumberSign[CommIndex].Values['iRecordCount']) <> 0 then
                    begin
                        strVersion[CommIndex] := StrListNumberSign[CommIndex].Values['VersionEx']; //跑过则把检测是否测试过版本替换为基础版本
                        if strPlanName = 'TwiceTest' then
                        begin
                            SendToComm(CommIndex);
                            SendToComm(CommIndex, 'AT', 'AT');
                        end
                        else
                        begin
                            {strSendText := Format('Action=CheckTested#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Tester=%s#',
                                [strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], User.UserName]);
                            SendToServer(CommIndex, 'CheckTested', strSendText, True, CTimeOut * 2); }
                            CheckTested(strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], iRecordCount);
                            if iRecordCount <> 0 then
                            begin
                                TfrmModule(CurrentFrom).SetResult(CommIndex, -4);
                            end
                            else
                            begin
                                {strSendText := Format('Action=CheckMustTest#PlanName=%s#SoftModel=%s#Tester=%s#', [strPlanName, strSoftModel[CommIndex], User.UserName]);
                                SendToServer(CommIndex, 'CheckMustTest', strSendText, True, CTimeOut * 2);  }

                                CheckMustTest(strPlanName, strSoftModel[CommIndex], iRecordCount);
                                if iRecordCount = 0 then
                                begin
                                    TfrmModule(CurrentFrom).SetDisplayResult(CommIndex, -5);
                                end
                                else
                                begin
                                    SendToComm(CommIndex, 'AT', 'AT');

                                end;

                            end;
                        end;
                    end
                    else
                    begin
                        if strPlanName = 'TwiceTest' then
                        begin
                            SendToComm(CommIndex);
                            SendToComm(CommIndex, 'AT', 'AT');
                        end
                        else
                        begin
                            {strSendText := Format('Action=CheckTested#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Tester=%s#',
                                [strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], User.UserName]);
                            SendToServer(CommIndex, 'CheckTested', strSendText, True, CTimeOut * 2); }

                            CheckTested(strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], iRecordCount);
                            NoteSocketLog(CommIndex, 'iRecordCount='+IntToStr(iRecordCount));
                            if iRecordCount <> 0 then
                            begin
                                TfrmModule(CurrentFrom).SetResult(CommIndex, -4);
                            end
                            else
                            begin
                                {strSendText := Format('Action=CheckMustTest#PlanName=%s#SoftModel=%s#Tester=%s#', [strPlanName, strSoftModel[CommIndex], User.UserName]);
                                SendToServer(CommIndex, 'CheckMustTest', strSendText, True, CTimeOut * 2);  }

                                CheckMustTest(strPlanName, strSoftModel[CommIndex], iRecordCount);
                                if iRecordCount = 0 then
                                begin
                                    TfrmModule(CurrentFrom).SetDisplayResult(CommIndex, -5);
                                end
                                else
                                begin
                                    SendToComm(CommIndex, 'AT', 'AT');

                                end;

                            end;
                        end;
                    end;
                end
                else
                    Exit;
            end
            else
                if strCmdKey[CommIndex] = 'CheckTested' then
                begin
                    //--------------------------Action=CheckTested#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s--------------------------//
                    //--------------------------Action=CheckTested#iRecordCount=0#--------------------------//
                    if StrListNumberSign[CommIndex].Count > 1 then
                    begin
                        SendToServer(CommIndex);
                        if StrToInt(StrListNumberSign[CommIndex].Values['iRecordCount']) <> 0 then
                        begin
                            TfrmModule(CurrentFrom).SetResult(CommIndex, -4);
                            //MessageBox(0,ISTESTED, '提示', MB_ICONWARNING + mb_OK);
                            //TfrmModule(CurrentFrom).SetDisplayResult(CommIndex,-4);
                        end
                        else
                        begin
                            strSendText := Format('Action=CheckMustTest#PlanName=%s#SoftModel=%s#Tester=%s#', [strPlanName, strSoftModel[CommIndex], User.UserName]);
                            SendToServer(CommIndex, 'CheckMustTest', strSendText, True, CTimeOut * 2);
                        end;
                    end
                    else
                        Exit;
                end
                else
                    if strCmdKey[CommIndex] = 'CheckTested_SetResult' then
                    begin
                        if StrListNumberSign[CommIndex].Count > 1 then
                        begin
                            SendToServer(CommIndex);
                            if StrToInt(StrListNumberSign[CommIndex].Values['iRecordCount']) <> 0 then
                            begin

                                TfrmModule(CurrentFrom).SetDisplayResult(CommIndex, 1);
                            end
                            else
                            begin
                                TfrmModule(CurrentFrom).SetDisplayResult(CommIndex, 0);
                            end;
                        end
                        else
                            Exit;
                    end
                    else
                        if strCmdKey[CommIndex] = 'CheckTested_SMT' then
                        begin
                            if StrListNumberSign[CommIndex].Count > 1 then
                            begin
                                SendToServer(CommIndex);
                                if StrToInt(StrListNumberSign[CommIndex].Values['iRecordCount']) <> 0 then
                                begin
                                    TfrmSMTIQCTest(CurrentFrom).MsgCheckTested_SMT_1(1, CommIndex);
                                end
                                else
                                begin
                                    TfrmSMTIQCTest(CurrentFrom).MsgCheckTested_SMT_1(0, CommIndex);
                                end;
                            end
                            else
                                Exit;
                        end
                        else
                            if strCmdKey[CommIndex] = 'GetTempRid' then
                            begin
                                if StrListNumberSign[CommIndex].Count > 1 then
                                begin
                                    SendToServer(CommIndex);
                                    if StrToInt(StrListNumberSign[CommIndex].Values['iRecordCount']) <> 0 then
                                    begin
                                        strChipRid[CommIndex] := StrListNumberSign[CommIndex].Values['Rid'];
                                    end
                                    else
                                    begin
                                        strChipRid[CommIndex] := '00000000000000000' + strIMEI[CommIndex];
                                    end;
                                    if strPlanName <> 'TwiceTest' then
                                    begin
                                        {strSendText:=Format('Action=CheckTested#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Tester=%s#',
                                                        [strPlanName,strChipRid[CommIndex],strSoftModel[CommIndex],strVersion[CommIndex],User.UserName]);
                                        SendToServer(CommIndex,'CheckTested',strSendText,True,CTimeOut*2); }
                                        CheckTested(strPlanName, strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex], iRecordCount);
                                        if iRecordCount <> 0 then
                                        begin
                                            TfrmModule(CurrentFrom).SetResult(CommIndex, -4);
                                        end
                                        else
                                        begin
                                            {strSendText := Format('Action=CheckMustTest#PlanName=%s#SoftModel=%s#Tester=%s#', [strPlanName, strSoftModel[CommIndex], User.UserName]);
                                            SendToServer(CommIndex, 'CheckMustTest', strSendText, True, CTimeOut * 2);  }

                                            CheckMustTest(strPlanName, strSoftModel[CommIndex], iRecordCount);
                                            if iRecordCount = 0 then
                                            begin
                                                TfrmModule(CurrentFrom).SetDisplayResult(CommIndex, -5);
                                            end
                                            else
                                            begin
                                                SendToComm(CommIndex, 'AT', 'AT');

                                            end;

                                        end;
                                    end
                                    else
                                        SendToComm(CommIndex, 'AT', 'AT');
                                end
                                else
                                    Exit;
                            end
                            else
                                if strCmdKey[CommIndex] = 'CheckMustTest' then
                                begin
                                    if StrListNumberSign[CommIndex].Count > 1 then
                                    begin
                                        SendToServer(CommIndex);
                                        if StrToInt(StrListNumberSign[CommIndex].Values['iRecordCount']) = 0 then
                                        begin
                                            TfrmModule(CurrentFrom).SetDisplayResult(CommIndex, -5);
                                        end
                                        else
                                        begin
                                            if strPlanName = 'WriteImei' then
                                            begin
                                                strSendText := Format('Action=CheckTestPass_WriteIMEI#ChipRid=%s#SoftModel=%s#Version=%s#',
                                                    [strChipRid[CommIndex], strSoftModel[CommIndex], strVersion[CommIndex]]);
                                                SendToServer(CommIndex, 'CheckTestPass_WriteIMEI', strSendText);
                                            end
                                            else
                                                if strPlanName = 'ParamDownload' then
                                                begin
                                                    strSendText := Format('Action=CheckTestedBySNAndVersion#PlanName=%s#ChipRid=%s#Version=%s#Tester=%s#', ['WriteImei', strChipRid[CommIndex], strVersion[CommIndex], User.UserName]);
                                                    SendToServer(CommIndex, 'CheckTestedBySNAndVersion', strSendText);

                                                end
                                                else
                                                begin
                                                    SendToComm(CommIndex, 'AT', 'AT');
                                                end;
                                        end;
                                    end
                                    else
                                        Exit;
                                end

                                else
                                    if strCmdKey[CommIndex] = 'CheckTestedBySNAndVersion' then
                                    begin
                                        if StrListNumberSign[CommIndex].Count > 1 then
                                        begin
                                            SendToServer(CommIndex);
                                            if StrToInt(StrListNumberSign[CommIndex].Values['iRecordCount']) = 0 then
                                            begin
                                                TfrmModule(CurrentFrom).SetResult(CommIndex, -7);
                                            end
                                            else
                                            begin
                                                SendToComm(CommIndex, 'AT', 'AT');
                                            end;
                                        end;
                                    end

                                    else
                                        if strCmdKey[CommIndex] = 'CheckTestPass_WriteIMEI' then
                                        begin
                                            if StrListNumberSign[CommIndex].Count > 1 then
                                            begin
                                                if StrListNumberSign[CommIndex].Count > 1 then
                                                begin
                                                    SendToServer(CommIndex);
                                                    TfrmWriteImeiTest(CurrentFrom).MsgTestPass(StrListNumberSign[CommIndex], CommIndex);
                                                end
                                                else
                                                    Exit;
                                            end;
                                        end
                                        else
                                            if strCmdKey[CommIndex] = 'GetTempImei' then
                                            begin
                                                if StrListNumberSign[CommIndex].Count > 1 then
                                                begin
                                                    SendToServer(CommIndex);
                                                    strIMEI[CommIndex] := StrListNumberSign[CommIndex].Values['TempImei'];
                                                    strChipRid[CommIndex] := StrListNumberSign[CommIndex].Values['TempSn'];
                                                    //GT02B使用的是SIM2卡,所以使用 AT+EGMR=2,7,"%s",其它使用AT+EGMR=1,7,"%s"
                                                    if (Pos('GT02B', strSoftModel[CommIndex]) > 0) or (Pos('TR02B', strSoftModel[CommIndex]) > 0) then
                                                    begin
                                                        SendToComm(CommIndex, 'ATEGMRT', Format('AT+EGMR=1,10,"%s"', [strIMEI[CommIndex]]), True, CTimeOut * 10);
                                                    end
                                                    else
                                                    begin
                                                        SendToComm(CommIndex, 'ATEGMRT', Format('AT+EGMR=1,7,"%s"', [strIMEI[CommIndex]]), True, CTimeOut * 10);
                                                    end;
                                                end
                                                else
                                                    Exit;
                                            end
                                            else
                                                if strCmdKey[CommIndex] = 'GetTestPlanItem' then
                                                begin
                                                    //--------------------------Action=GetTestPlanItem#SoftModel=GT06B#TestPlan=2#--------------------------//
                                                    //--------------------------'Action=GetTestPlanItem#%s#',[strTemp]--------------------------//
                                                    if StrListNumberSign[CommIndex].Count > 1 then
                                                    begin
                                                        SendToServer(CommIndex);
                                                        SendMessage(CurrentFrom.Handle, WM_GetTestPlanItem, wParam(StrListNumberSign[CommIndex]), CommIndex);
                                                    end
                                                    else
                                                        Exit;
                                                end
                                                else
                                                    if strCmdKey[CommIndex] = 'UpdateGpsTcData' then
                                                    begin
                                                        //--------------------------Action=GetTestPlanItem#SoftModel=GT06B#TestPlan=2#--------------------------//
                                                        //--------------------------'Action=GetTestPlanItem#%s#',[strTemp]--------------------------//
                                                        if StrListNumberSign[CommIndex].Count > 1 then
                                                        begin
                                                            SendToServer(CommIndex);
                                                        end
                                                        else
                                                            Exit;
                                                    end

                                                    else
                                                        if strCmdKey[CommIndex] = 'UpdateResult' then
                                                        begin
                                                            //--------------------------'Action=Tested#PlanName=%s#ChipRid=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s#'--------------------------//
                                                            //--------------------------Action=Tested#UpdateForm=%d#--------------------------//
                                                            if StrListNumberSign[CommIndex].Count > 1 then
                                                            begin
                                                                SendToServer(CommIndex);
                                                                if StrListNumberSign[CommIndex].Values['iRecordCount'] = '0' then
                                                                begin
                                                                    TfrmModule(CurrentFrom).SetResult(CommIndex, -2);
                                                                    MessageBox(0, UPDATEFORMERROR, '警告', MB_ICONWARNING + MB_OK);
                                                                end;
                                                            end
                                                            else
                                                                Exit;
                                                        end
                                                        else
                                                            if strCmdKey[CommIndex] = 'CheckTestPass' then
                                                            begin
                                                                //--------------------------'Action=CheckTestPass#IMEI=%s#'--------------------------//
                                                                //--------------------------Action=CheckTestPass#Result=%d#--------------------------//
                                                                if StrListNumberSign[CommIndex].Count > 1 then
                                                                begin
                                                                    SendToServer(CommIndex);
                                                                    if strPlanName = 'CartonBox' then
                                                                    begin
                                                                        Application.ProcessMessages;
                                                                        TfrmCartonBoxLlf(CurrentFrom).MsgTestPass(StrListNumberSign[CommIndex], CommIndex);
                                                                        Application.ProcessMessages;
                                                                    end
                                                                    else
                                                                        if strPlanName = 'DataRelative' then
                                                                        begin
                                                                            Application.ProcessMessages;
                                                                            TfrmDataRelative(CurrentFrom).MsgTestPass(StrListNumberSign[CommIndex], CommIndex);
                                                                            Application.ProcessMessages;

                                                                        end
                                                                        else
                                                                        if strPlanName = 'SIMRel' then
                                                                        begin
                                                                            Application.ProcessMessages;
                                                                            TfrmSIMRel(CurrentFrom).MsgTestPass(StrListNumberSign[CommIndex], CommIndex);
                                                                            Application.ProcessMessages;

                                                                        end
                                                                        else
                                                                        begin
                                                                            TfrmGiftBoxMain(CurrentFrom).MsgTestPass(StrListNumberSign[CommIndex], CommIndex);
                                                                        end;

                                                                end
                                                                else
                                                                    Exit;
                                                            end
                                                            else
                                                                if strCmdKey[CommIndex] = 'CheckIMEI' then
                                                                begin
                                                                    if StrListNumberSign[CommIndex].Count > 1 then
                                                                    begin
                                                                        SendToServer(CommIndex);
                                                                        SendMessage(CurrentFrom.Handle, WM_CheckIMEI, CommIndex, StrToInt(StrListNumberSign[CommIndex].Values['iRecordCount']));
                                                                    end
                                                                    else
                                                                        Exit;
                                                                end
                                                                else
                                                                    if strCmdKey[CommIndex] = 'DeleteImei' then
                                                                    begin
                                                                        //--------------------------'Action=DeleteImei#ChipRid=%s#Imei=%s',[strChipRid[CommIndex],strIMEI]--------------------------//
                                                                        //--------------------------Action=DeleteImei#iRecordCount=0#--------------------------//
                                                                        if StrListNumberSign[CommIndex].Count > 1 then
                                                                        begin
                                                                            SendToServer(CommIndex);
                                                                            bUpdateForm := False;
                                                                            if StrToInt(StrListNumberSign[CommIndex].Values['iRecordCount']) > 0 then
                                                                            begin
                                                                                //NoteCommLog(CommIndex,'[S:]====AutoTestDELETEIMEI');
                                                                                TfrmModule(CurrentFrom).SetResult(CommIndex, 0);
                                                                                MessageBox(0, IMEIINVALID, '提示', MB_ICONWARNING + mb_OK);
                                                                            end
                                                                            else
                                                                            begin
                                                                                TfrmModule(CurrentFrom).SetResult(CommIndex, 1);
                                                                            end;
                                                                        end
                                                                        else
                                                                            Exit;
                                                                    end
                                                                    else
                                                                        if (strCmdKey[CommIndex] = 'DeleteTestResult_Twice') then
                                                                        begin
                                                                            if StrListNumberSign[CommIndex].Count > 1 then
                                                                            begin
                                                                                SendToServer(CommIndex);
                                                                                TfrmModule(CurrentFrom).SetResult(CommIndex, 1);
                                                                            end
                                                                            else
                                                                                Exit;
                                                                        end
                                                                        else
                                                                            if (strCmdKey[CommIndex] = 'TwiceByUpdateVersion') then
                                                                            begin
                                                                                if StrListNumberSign[CommIndex].Count > 1 then
                                                                                begin
                                                                                    SendToServer(CommIndex);
                                                                                    SendMessage(CurrentFrom.Handle, WM_TwiceByUpdateVersion, wParam(StrListNumberSign[CommIndex]), lParam(Socket));

                                                                                end
                                                                                else
                                                                                    Exit;
                                                                            end
                                                                            else
                                                                                if (strCmdKey[CommIndex] = 'DeleteTestResult_ByBoxNo_Twice') then
                                                                                begin
                                                                                    if StrListNumberSign[CommIndex].Count > 1 then
                                                                                    begin
                                                                                        SendToServer(CommIndex);
                                                                                        SendMessage(frmIncomCheck.Handle, WM_TwiceByBoxNo, wParam(StrListNumberSign[CommIndex]), lParam(Socket));
                                                                                    end
                                                                                    else
                                                                                        Exit;
                                                                                end
                                                                                else
                                                                                    if (strCmdKey[CommIndex] = 'CalculateCRC') then
                                                                                    begin
                                                                                        if StrListNumberSign[CommIndex].Count > 1 then
                                                                                        begin
                                                                                            SendToServer(CommIndex);
                                                                                            TfrmParamDownloadTest(CurrentFrom).DisposeCRC(StrListNumberSign[CommIndex], CommIndex);
                                                                                        end
                                                                                        else
                                                                                            Exit;
                                                                                    end
                                                                                    else
                                                                                    begin
                                                                                        SendToServer(CommIndex);
                                                                                    end;
    except
        on EConvertError do Sleep(1);
    end;
    Application.ProcessMessages;
end;

procedure TfrmClientMain.mmoCommLogKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Shift = [ssCtrl]) and (Key = 65) then mmoCommLog.SelectAll;
end;

procedure TfrmClientMain.mmoTcpLogKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Shift = [ssCtrl]) and (Key = 65) then mmoTcpLog.SelectAll;
end;
//==================================================================//

//==================================================================//

procedure TfrmClientMain.tmrSocket_0Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 0;
    TTimer(FindComponent('tmrSocket_' + inttostr(CommIndex))).Enabled := False;
    if SendSrvList[CommIndex].Count < 1 then Exit;
    try
        New(SendSrvRecord[CommIndex]);
        SendSrvRecord[CommIndex] := SendSrvList[CommIndex].Items[0];
        if (SendSrvRecord[CommIndex].bWaitResponses) and (SendSrvRecord[CommIndex].iResendNum > 0) then
        begin
            if SendSrvRecord[CommIndex].iSendNum < SendSrvRecord[CommIndex].iResendNum then
            begin
                SendSrvRecord[CommIndex].bInvalidation := False;
                SendSrvRecord[CommIndex].iSendNum := SendSrvRecord[CommIndex].iSendNum + 1;
            end
            else
            begin
                if SendSrvRecord[CommIndex].sCmdKey = 'Login' then
                begin
                    MessageBox(0, LOGINTIMEOUT, '警告', MB_ICONWARNING + MB_OK);
                end
                else
                begin
                    if strPlanName <> 'CartonBox' then TfrmModule(CurrentFrom).SetResult(CommIndex, 0);
                end;
                SetStatusText(Format('发送至服务器超时!%s请查看网络是否连接!', [SendSrvRecord[CommIndex].sCmdKey]), 1);
            end;
        end;
    finally
        //Dispose(SendSrvRecord[CommIndex]);
    end;
    SendToServer(CommIndex);
end;

procedure TfrmClientMain.tmrSocket_1Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 1;
    TTimer(FindComponent('tmrSocket_' + inttostr(CommIndex))).Enabled := False;
    if SendSrvList[CommIndex].Count < 1 then Exit;
    try
        New(SendSrvRecord[CommIndex]);
        SendSrvRecord[CommIndex] := SendSrvList[CommIndex].Items[0];
        if (SendSrvRecord[CommIndex].bWaitResponses) and (SendSrvRecord[CommIndex].iResendNum > 0) then
        begin
            if SendSrvRecord[CommIndex].iSendNum < SendSrvRecord[CommIndex].iResendNum then
            begin
                SendSrvRecord[CommIndex].bInvalidation := False;
                SendSrvRecord[CommIndex].iSendNum := SendSrvRecord[CommIndex].iSendNum + 1;
            end
            else
            begin
                if SendSrvRecord[CommIndex].sCmdKey = 'Login' then
                begin
                    MessageBox(0, LOGINTIMEOUT, '警告', MB_ICONWARNING + MB_OK);
                end
                else
                begin
                    if strPlanName <> 'CartonBox' then TfrmModule(CurrentFrom).SetResult(CommIndex, 0);
                    NoteCommLog(CommIndex, '[S:]====AutoTestTMRSOCKET');
                end;
                SetStatusText(Format('发送至服务器超时!%s请查看网络是否连接!', [SendSrvRecord[CommIndex].sCmdKey]), 1);
            end;
        end;
    finally
        //Dispose(SendSrvRecord[CommIndex]);
    end;
    SendToServer(CommIndex);
end;

procedure TfrmClientMain.tmrSocket_2Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 2;
    TTimer(FindComponent('tmrSocket_' + inttostr(CommIndex))).Enabled := False;
    if SendSrvList[CommIndex].Count < 1 then Exit;
    try
        New(SendSrvRecord[CommIndex]);
        SendSrvRecord[CommIndex] := SendSrvList[CommIndex].Items[0];
        if (SendSrvRecord[CommIndex].bWaitResponses) and (SendSrvRecord[CommIndex].iResendNum > 0) then
        begin
            if SendSrvRecord[CommIndex].iSendNum < SendSrvRecord[CommIndex].iResendNum then
            begin
                SendSrvRecord[CommIndex].bInvalidation := False;
                SendSrvRecord[CommIndex].iSendNum := SendSrvRecord[CommIndex].iSendNum + 1;
            end
            else
            begin
                if SendSrvRecord[CommIndex].sCmdKey = 'Login' then
                begin
                    MessageBox(0, LOGINTIMEOUT, '警告', MB_ICONWARNING + MB_OK);
                end
                else
                begin
                    if strPlanName <> 'CartonBox' then TfrmModule(CurrentFrom).SetResult(CommIndex, 0);
                    NoteCommLog(CommIndex, '[S:]====AutoTestTMRSOCKET');
                end;
                SetStatusText(Format('发送至服务器超时!%s请查看网络是否连接!', [SendSrvRecord[CommIndex].sCmdKey]), 1);
            end;
        end;
    finally
        //Dispose(SendSrvRecord[CommIndex]);
    end;
    SendToServer(CommIndex);
end;

procedure TfrmClientMain.tmrSocket_3Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 3;
    TTimer(FindComponent('tmrSocket_' + inttostr(CommIndex))).Enabled := False;
    if SendSrvList[CommIndex].Count < 1 then Exit;
    try
        New(SendSrvRecord[CommIndex]);
        SendSrvRecord[CommIndex] := SendSrvList[CommIndex].Items[0];
        if (SendSrvRecord[CommIndex].bWaitResponses) and (SendSrvRecord[CommIndex].iResendNum > 0) then
        begin
            if SendSrvRecord[CommIndex].iSendNum < SendSrvRecord[CommIndex].iResendNum then
            begin
                SendSrvRecord[CommIndex].bInvalidation := False;
                SendSrvRecord[CommIndex].iSendNum := SendSrvRecord[CommIndex].iSendNum + 1;
            end
            else
            begin
                if SendSrvRecord[CommIndex].sCmdKey = 'Login' then
                begin
                    MessageBox(0, LOGINTIMEOUT, '警告', MB_ICONWARNING + MB_OK);
                end
                else
                begin
                    if strPlanName <> 'CartonBox' then TfrmModule(CurrentFrom).SetResult(CommIndex, 0);
                    NoteCommLog(CommIndex, '[S:]====AutoTestTMRSOCKET');
                end;
                SetStatusText(Format('发送至服务器超时!%s请查看网络是否连接!', [SendSrvRecord[CommIndex].sCmdKey]), 1);
            end;
        end;
    finally
        //Dispose(SendSrvRecord[CommIndex]);
    end;
    SendToServer(CommIndex);
end;

procedure TfrmClientMain.tmrSocket_4Timer(Sender: TObject);
var
    CommIndex: Integer;
begin
    CommIndex := 4;
    TTimer(FindComponent('tmrSocket_' + inttostr(CommIndex))).Enabled := False;
    if SendSrvList[CommIndex].Count < 1 then Exit;
    try
        New(SendSrvRecord[CommIndex]);
        SendSrvRecord[CommIndex] := SendSrvList[CommIndex].Items[0];
        if (SendSrvRecord[CommIndex].bWaitResponses) and (SendSrvRecord[CommIndex].iResendNum > 0) then
        begin
            if SendSrvRecord[CommIndex].iSendNum < SendSrvRecord[CommIndex].iResendNum then
            begin
                SendSrvRecord[CommIndex].bInvalidation := False;
                SendSrvRecord[CommIndex].iSendNum := SendSrvRecord[CommIndex].iSendNum + 1;
            end
            else
            begin
                if SendSrvRecord[CommIndex].sCmdKey = 'Login' then
                begin
                    MessageBox(0, LOGINTIMEOUT, '警告', MB_ICONWARNING + MB_OK);
                end
                else
                begin
                    if strPlanName <> 'CartonBox' then TfrmModule(CurrentFrom).SetResult(CommIndex, 0);
                    NoteCommLog(CommIndex, '[S:]====AutoTestTMRSOCKET');
                end;
                SetStatusText(Format('发送至服务器超时!%s请查看网络是否连接!', [SendSrvRecord[CommIndex].sCmdKey]), 1);
            end;
        end;
    finally
        //Dispose(SendSrvRecord[CommIndex]);
    end;
    SendToServer(CommIndex);
end;
//==================================================================//

//==================================================================//

procedure TfrmClientMain.MsgLogin(var msg: TMessage);
begin
    //<1登录失败,否则成功
    if msg.wParam < 1 then
    begin
        frmClientLogin.ModalResult := mrNo;
    end
    else
    begin
        frmClientLogin.ModalResult := mrOK;
        //生产售后监控系统(客户端)  <V1.0.0.9  2013-4-27>    登录用户:[管理员]
        frmClientMain.Caption := Format('%s<V%s  %s>    登录用户:[%s]', [frmClientMain.Caption, GetFileVersion(application.ExeName), GetFileTime(application.ExeName), User.UserDes]);
    end;
end;

procedure TfrmClientMain.MsgLoadFlashTool(var msg: TMessage);
begin
    if msg.Msg = WM_LoadFlashTool then
    begin
        openFlash_tool(1);
    end;
end;

//==================================================================//

//==================================================================//

procedure TfrmClientMain.ac_BasicTestParamExecute(Sender: TObject);
begin
    if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmBasicTestParam') then
    begin
        frmBasicTestParam := TfrmBasicTestParam.Create(Self);
        frmBasicTestParam.ShowModal;
    end;
end;

procedure TfrmClientMain.ac_FunctionTestExecute(Sender: TObject);
begin
    if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmFunctionTest') then
    begin
        //frmFunctionTest:=TfrmFunctionTest.Create(Self);
        //ShowForm(frmFunctionTest);
    end;
end;

procedure TfrmClientMain.ac_GPSTestExecute(Sender: TObject);
begin
    {if frmGPSTestMain<>nil then
    begin
        frmGPSTestMain.Close;
        FreeAndNil(frmGPSTestMain);
    end;
    if frmGPSTestMain=nil then  frmGPSTestMain:=TfrmGPSTestMain.Create(Self);
    ShowForm(frmGPSTestMain);}
end;

procedure TfrmClientMain.ac_CoupleTestExecute(Sender: TObject);
begin
    if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmCoupleTest') then
    begin
        frmCoupleTest := TfrmCoupleTest.Create(Self);
        ShowForm(frmCoupleTest);
    end;
end;

procedure TfrmClientMain.ac_WriteImeiTestExecute(Sender: TObject);
begin
    if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmWriteImeiTest') then
    begin
        frmWriteImeiTest := TfrmWriteImeiTest.Create(Self);
        ShowForm(frmWriteImeiTest);
    end;
end;

procedure TfrmClientMain.ac_ParamDownloadTestExecute(Sender: TObject);
begin
    if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmParamDownloadTest') then
    begin
        frmParamDownloadTest := TfrmParamDownloadTest.Create(Self);
        ShowForm(frmParamDownloadTest);
    end;
end;

procedure TfrmClientMain.ac_AutoTestExecute(Sender: TObject);
var
  iRecordCount:Integer;
  strVerEx:string;
begin
    if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmAutoTestMain') then
    begin
        frmAutoTestMain := TfrmAutoTestMain.Create(Self);
        ShowForm(frmAutoTestMain);

        //UpdateForm('AutoTest', 'rid', 'softmodel', 'version', 'versions', 'imei', 0, User.UserName,iRecordCount);
        //UpdateForm('ParamDownload', 'A2A199AB3977F8EBA9F6A832DDAF9A73', 'NT74_R0_V07', 'NT74_10_A1D_R0_V07', '', 1, User.UserName,iRecordCount);


    end;
end;

procedure TfrmClientMain.ac_AutoTestSettingExecute(Sender: TObject);
begin
    //{if frmAutoTestSetting=nil then } frmAutoTestSetting:=TfrmAutoTestSetting.Create(Self);
    //ShowForm(frmAutoTestSetting);
end;

procedure TfrmClientMain.ac_CartonBoxSetExecute(Sender: TObject);
begin
    if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmCartonBoxSet') then
    begin
        frmCartonBoxSet := TfrmCartonBoxSet.Create(Self);
        frmCartonBoxSet.ShowModal;
    end;
end;

procedure TfrmClientMain.ac_CartonBoxManExecute(Sender: TObject);
begin
    if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmCartonBoxMan') then
    begin
        frmCartonBoxMan := TfrmCartonBoxMan.Create(Self);
        frmCartonBoxMan.ShowModal;
    end;
end;

procedure TfrmClientMain.ac_TwiceExecute(Sender: TObject);
begin
    if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmTwiceTest') then
    begin
        frmTwiceTest := TfrmTwiceTest.Create(Self);
        ShowForm(frmTwiceTest);
    end;
end;

procedure TfrmClientMain.ac_IncomCheckExecute(Sender: TObject);
begin
    if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmIncomCheck') then
    begin
        frmIncomCheck := TfrmIncomCheck.Create(Self);
        ShowForm(frmIncomCheck);
    end;
end;

procedure TfrmClientMain.ROM1Click(Sender: TObject);
begin
    if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmReadBack') then
    begin
        frmReadBack := TfrmReadBack.Create(Self);
        ShowForm(frmReadBack);
    end;
end;

//--------------------------------------------------------------------------------------//

procedure TfrmClientMain.ClientSocket_1Read(Sender: TObject;
    Socket: TCustomWinSocket);
var
    ReceiveText, StrXML, strSendText: string; //接收到的XML字符串
    CommIndex: Integer;
begin
    Application.ProcessMessages;
    CommIndex := 1;
    socket1 := Socket;
    ReceiveText := Socket.ReceiveText;
    NoteSocketLog(CommIndex, '[R:]====' + ReceiveText);

    //取各分隔符内容
    StrListNumberSign[CommIndex].Clear;
    strListColon[CommIndex].Clear;
    StrListNumberSign[CommIndex].Delimiter := '#';
    StrListNumberSign[CommIndex].DelimitedText := ReceiveText;

    DeClientSocketReceieveData(CommIndex);
end;

procedure TfrmClientMain.ClientSocket_2Read(Sender: TObject;
    Socket: TCustomWinSocket);
var
    ReceiveText, StrXML, strSendText: string; //接收到的XML字符串
    CommIndex: Integer;
begin
    Application.ProcessMessages;
    CommIndex := 2;
    socket2 := Socket;
    ReceiveText := Socket.ReceiveText;
    NoteSocketLog(CommIndex, '[R:]====' + ReceiveText);

    //取各分隔符内容
    StrListNumberSign[CommIndex].Clear;
    strListColon[CommIndex].Clear;
    StrListNumberSign[CommIndex].Delimiter := '#';
    StrListNumberSign[CommIndex].DelimitedText := ReceiveText;

    DeClientSocketReceieveData(CommIndex);
end;

procedure TfrmClientMain.ClientSocket_3Read(Sender: TObject;
    Socket: TCustomWinSocket);
var
    ReceiveText, StrXML, strSendText: string; //接收到的XML字符串
    CommIndex: Integer;
begin
    Application.ProcessMessages;
    CommIndex := 3;
    socket3 := Socket;
    ReceiveText := Socket.ReceiveText;
    NoteSocketLog(CommIndex, '[R:]====' + ReceiveText);

    //取各分隔符内容
    StrListNumberSign[CommIndex].Clear;
    strListColon[CommIndex].Clear;
    StrListNumberSign[CommIndex].Delimiter := '#';
    StrListNumberSign[CommIndex].DelimitedText := ReceiveText;

    DeClientSocketReceieveData(CommIndex);
end;

procedure TfrmClientMain.ClientSocket_4Read(Sender: TObject;
    Socket: TCustomWinSocket);
var
    ReceiveText, StrXML, strSendText: string; //接收到的XML字符串
    CommIndex: Integer;
begin
    Application.ProcessMessages;
    CommIndex := 4;
    socket4 := Socket;
    ReceiveText := Socket.ReceiveText;
    NoteSocketLog(CommIndex, '[R:]====' + ReceiveText);

    //取各分隔符内容
    StrListNumberSign[CommIndex].Clear;
    strListColon[CommIndex].Clear;
    StrListNumberSign[CommIndex].Delimiter := '#';
    StrListNumberSign[CommIndex].DelimitedText := ReceiveText;

    DeClientSocketReceieveData(CommIndex);
end;

procedure TfrmClientMain.ClientSocket_1Error(Sender: TObject;
    Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
    var ErrorCode: Integer);
var
    CommIndex: Integer;
    FileName: string;
begin
    CommIndex := 1;
    FileName := ExtractFilePath(Paramstr(0)) + 'SocketLog_' + IntToStr(CommIndex) + '.txt';
    AppendTxt(Format('服务器连接失败!%d', [ErrorCode]), FileName);
    ErrorCode := 0;
end;

procedure TfrmClientMain.ClientSocket_2Error(Sender: TObject;
    Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
    var ErrorCode: Integer);
var
    CommIndex: Integer;
    FileName: string;
begin
    CommIndex := 2;
    FileName := ExtractFilePath(Paramstr(0)) + 'SocketLog_' + IntToStr(CommIndex) + '.txt';
    AppendTxt(Format('服务器连接失败!%d', [ErrorCode]), FileName);
    ErrorCode := 0;
end;

procedure TfrmClientMain.ClientSocket_3Error(Sender: TObject;
    Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
    var ErrorCode: Integer);
var
    CommIndex: Integer;
    FileName: string;
begin
    CommIndex := 3;
    FileName := ExtractFilePath(Paramstr(0)) + 'SocketLog_' + IntToStr(CommIndex) + '.txt';
    AppendTxt(Format('服务器连接失败!%d', [ErrorCode]), FileName);
    ErrorCode := 0;
end;

procedure TfrmClientMain.ClientSocket_4Error(Sender: TObject;
    Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
    var ErrorCode: Integer);
var
    CommIndex: Integer;
    FileName: string;
begin
    CommIndex := 4;
    FileName := ExtractFilePath(Paramstr(0)) + 'SocketLog_' + IntToStr(CommIndex) + '.txt';
    AppendTxt(Format('服务器连接失败!%d', [ErrorCode]), FileName);
    ErrorCode := 0;
end;

procedure TfrmClientMain.ac_AutoTestSMTExecute(Sender: TObject);
begin
    begin
        if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmAutoTestSMTMain') then
        begin
            frmAutoTestSMTMain := TfrmAutoTestSMTMain.Create(Self);
            ShowForm(frmAutoTestSMTMain);
        end;
    end;
end;

procedure TfrmClientMain.ac_SMTIQCExecute(Sender: TObject);
begin
    if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmSMTIQCTest') then
    begin
        frmSMTIQCTest := TfrmSMTIQCTest.Create(Self);
        ShowForm(frmSMTIQCTest);
    end;
end;

{
procedure TfrmClientMain.btn1Click(Sender: TObject);
var
  str:string;
  Filename:string;
  //hInstance:HINSTANCE;
begin
    //hInstance = ShellExecute(handle, NULL, "c:\\", NULL, NULL, SW_SHOWNORMAL);
    //HInstance:=ShellExecute(Handle,'Open',PChar('D:/FlashTool_v5.1348.00/Flash_tool.exe'),PChar('Hello World'),nil,SW_SHOWNORMAL);
    //dlgOpen1.Execute;

     //HInstance:=ShellExecute(Handle,'Open',PChar('F:\刘玉娇发来的文件\串口工具\sscom32.exe'),PChar('Hello World'),nil,SW_SHOWNORMAL);
    //strTemp:= LowerDir(ExtractFilePath(ParamStr(0)))+'GPS DB\GpsDB.ini';
    Filename:=ExtractFilePath(Paramstr(0))+'FlashTool_v5\Flash_tool.exe';
    HInstance:=ShellExecute(Handle,'Open',PChar(Filename),nil,nil,SW_SHOWNORMAL);

end;  }

function openFlash_tool(CommIndex: Integer): Boolean;
var
    fileName, strERROR: string;
    PreHinstance: Cardinal;
    p: Integer;
begin
    Result := True;
    p := CommIndex;
    PreHinstance := HInstance;
    Filename := ExtractFilePath(Paramstr(0)) + 'FlashTool_v5\Flash_tool.exe';
    HInstance := ShellExecute(frmClientMain.Handle, 'Open', PChar(Filename), nil, nil, SW_SHOWNORMAL);
    strERROR := IntToStr(HInstance);

    if HInstance < 32 then
    begin
        HInstance := PreHinstance;
        Result := False;
        MessageBox(frmClientMain.Handle, PChar(strERROR), '错误序号', MB_OKCANCEL);
    end;
    HInstance := PreHinstance;
end;

procedure TfrmClientMain.btn1Click(Sender: TObject);
var
    filename: string;
    param: string;
begin
    //filename:= 'FlashTool_v5\Flash_tool.exe';
    //thread1:=BeginThread(nil,0,@openFlash_tool,Pointer(Self),0,Tid);
    //BeginThread(nil, 0, @openFlash_tool, Pointer(Self), CREATE_SUSPENDED, Tid);
    //nil, @ThreadProc, Pointer(Self), FThreadID
    {LongWaitThread:=TLongWaitTrd.Create(FALSE);
    LongWaitThread.MainWin:=Handle;
    LongWaitThread.Resume;

    if (LongWaitThread<>nil) then
     //PostThreadMessage(LongWaitThread.ThreadID,WM_LoadFlashTool,0,0);
      begin
      SendMessage(Handle,WM_LoadFlashTool,0,0);
       //fHandle:=FindWindow(nil,PChar('FlashTool'));
       //SendMessage(fHandle,WM_KEYDOWN,VK_F10,0);
       //SendMessage(fHandle,WM_KEYUP,VK_F10,0);
      end;
    }
    param := '0';
    //BeginThread(nil, 0, @openFlash_tool(1), Pointer(1), 0,Tid);

end;

function TfrmClientMain.GetHWndByPID(const hPID: THandle): THandle;
type
    PEnumInfo = ^TEnumInfo;
    TEnumInfo = record
        ProcessID: DWORD;
        HWND: THandle;
    end;

    function EnumWindowsProc(Wnd: DWORD; var EI: TEnumInfo): Bool; stdcall;
    var
        PID: DWORD;
    begin
        GetWindowThreadProcessID(Wnd, @PID);
        Result := (PID <> EI.ProcessID) or
            (not IsWindowVisible(WND)) or
            (not IsWindowEnabled(WND));

        if not Result then EI.HWND := WND;
    end;

    function FindMainWindow(PID: DWORD): DWORD;
    var
        EI: TEnumInfo;
    begin
        EI.ProcessID := PID;
        EI.HWND := 0;
        EnumWindows(@EnumWindowsProc, Integer(@EI));
        Result := EI.HWND;
    end;
begin
    if hPID <> 0 then
        Result := FindMainWindow(hPID)
    else
        Result := 0;
end;

procedure TfrmClientMain.btn3Click(Sender: TObject);
var
    ProcessName: string; //进程名
    FSnapshotHandle: THandle; //进程快照句柄
    FProcessEntry32: TProcessEntry32; //进程入口的结构体信息
    ContinueLoop: BOOL;
    MyHwnd: THandle;
begin
    FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0); //创建一个进程快照
    FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
    ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32); //得到系统中第一个进程
    //循环例举
    while ContinueLoop do
    begin
        ProcessName := FProcessEntry32.szExeFile;

        if (ProcessName = 'Flash_tool.exe') then begin
            MyHwnd := GetHWndByPID(FProcessEntry32.th32ProcessID);
        end;
        ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
    end;
    CloseHandle(FSnapshotHandle); //   释放快照句柄
    //PostMessage(MyHwnd,WM_QUIT,0,0);
    //PostMessage(fHandle,KEYEVENTF_KEYUP,VK_,0);
    //PostMessage(fHandle,KEYEVENTF_KEYUP,VK_A,0);
    //PostMessage(fHandle,WM_KEYUP,VK_F10,0);
    //PostMessage(MyHwnd, WM_KEYDOWN , 32, 0);
    PostMessage(MyHwnd, WM_KEYFIRST, VK_F10, 0);
    //PostMessage(MyHwnd, WM_KEYLAST, VK_F10, 0);

end;

procedure TfrmClientMain.btn2Click(Sender: TObject);
var
    strSendText, str2, str3, str4, str5, str6: string;
begin
    strSendText := Format('Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#VersionS=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s#',
        ['ParamDownload', '9EFFAE19DB0F194A088674676887C5B4', 'TestTest', '', 'GT02ES_20_60DM2_B25E_R0_V20_WM', '', 0, 'q']);
    //strSendText:=Format('Action=CalculateCRC#ChipRid=%s#',
    //                       ['A5F9342FE3BDD9151BB4160FAE4089DC']);

    strSendText := Format('Action=CalculateCRC#ChipRid=%s#', ['A5F9342FE3BDD9151BB4160FAE4089DC']);

    SendToServer(1, 'CalculateCRC', strSendText, True, CTimeOut * 2);
    //====Action=UpdateResult#PlanName=ParamDownload#ChipRid=#SoftModel=TestTest#VersionS=#Version=GT02ES_20_60DM2_B25E_R0_V20_WM#Imei=#iResult=0#Tester=q#

end;

procedure TfrmClientMain.ParamConfigClick(Sender: TObject);
begin
    if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmParamDownLoadConfig') then
    begin
        frmParamDownLoadConfig := TfrmParamDownLoadConfig.Create(Self);
        ShowForm(frmParamDownLoadConfig);
    end;
end;

procedure TfrmClientMain.ac_GiftBoxExecute(Sender: TObject);
begin
    if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmGiftBoxMain') then
    begin
        frmGiftBoxMain := TfrmGiftBoxMain.Create(Self);
        ShowForm(frmGiftBoxMain);
    end;
end;

procedure TfrmClientMain.ac_DataRelativeExecute(Sender: TObject);
begin
    if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmDataRelative') then
    begin
        frmDataRelative := TfrmDataRelative.Create(Self);
        ShowForm(frmDataRelative);
    end;
end;

procedure TfrmClientMain.ac_SIMRelExecute(Sender: TObject);
begin
   if (CurrentFrom = nil) or (CurrentFrom.ClassName <> 'TfrmSIMRel') then
    begin
        frmSIMRel := TfrmSIMRel.Create(Self);
        ShowForm(frmSIMRel);
    end;
end;

end.

