unit uCoupleTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, ExtCtrls, SPComm, StdCtrls,uGlobalVar,uPublicFunc,
  ComCtrls, Grids, DBGrids, DB, MemDS, DBAccess, Uni, ComDrv32;

type
  TfrmCoupleTest = class(TfrmModule)
    UniQuery_TestResult_1: TUniQuery;
    intgrfldUniQuery_TestResult1Id: TIntegerField;
    SFUniQuery_TestResult1TestItem: TStringField;
    SFUniQuery_TestResult1SubTestItem: TStringField;
    SFUniQuery_TestResult1TestResult: TStringField;
    SFUniQuery_TestResult1TestValue: TStringField;
    DS_TestResult_1: TDataSource;
    UniQuery_TestResult_2: TUniQuery;
    intgrfldUniQuery_1Id: TIntegerField;
    SFUniQuery_1TestItem: TStringField;
    SFUniQuery_1SubTestItem: TStringField;
    SFUniQuery_1TestResult: TStringField;
    SFUniQuery_1TestValue: TStringField;
    DS_TestResult_2: TDataSource;
    UniQuery_TestResult_3: TUniQuery;
    intgrfld5: TIntegerField;
    SF11: TStringField;
    SF12: TStringField;
    SF13: TStringField;
    SF14: TStringField;
    DS_TestResult_3: TDataSource;
    UniQuery_TestResult_4: TUniQuery;
    intgrfld6: TIntegerField;
    SF15: TStringField;
    SF16: TStringField;
    SF17: TStringField;
    SF18: TStringField;
    DS_TestResult_4: TDataSource;
    pnl1: TPanel;
    grp1: TGroupBox;
    pnl3: TPanel;
    pnl2: TPanel;
    pnl4: TPanel;
    lbl7: TLabel;
    imgCommGreen: TImage;
    imgCommRed: TImage;
    cbbCom_1: TComboBox;
    btnStart_1: TButton;
    btnReTest1: TButton;
    btnBtn_ResultEnable: TButton;
    pnlTestResult_1: TPanel;
    TestResultDetail_1: TDBGrid;
    TestResult1: TPanel;
    SB_TestStatus_1: TStatusBar;
    grp2: TGroupBox;
    pnlResult1: TPanel;
    pnlResult2: TPanel;
    pnlResult3: TPanel;
    lbl4: TLabel;
    img1: TImage;
    img2: TImage;
    cbbCom_2: TComboBox;
    btnStart_2: TButton;
    btnReTest2: TButton;
    pnlTestResult_2: TPanel;
    TestResultDetail_2: TDBGrid;
    TestResult2: TPanel;
    SB_TestStatus_2: TStatusBar;
    grp3: TGroupBox;
    pnlResult4: TPanel;
    pnlResult5: TPanel;
    pnlTestResult_3: TPanel;
    TestResultDetail_3: TDBGrid;
    TestResult3: TPanel;
    SB_TestStatus_3: TStatusBar;
    grp4: TGroupBox;
    pnlResult9: TPanel;
    pnlResult10: TPanel;
    pnlResult11: TPanel;
    lbl3: TLabel;
    img5: TImage;
    img6: TImage;
    cbbCom_4: TComboBox;
    btnStart_4: TButton;
    btnReTest4: TButton;
    pnlTestResult_4: TPanel;
    TestResultDetail_4: TDBGrid;
    TestResult4: TPanel;
    SB_TestStatus_4: TStatusBar;
    cbbComAgilent_1: TComboBox;
    btnStartAgilent_1: TButton;
    pnlResult6: TPanel;
    lbl2: TLabel;
    img3: TImage;
    img4: TImage;
    cbbCom_3: TComboBox;
    btnStart_3: TButton;
    btnReTest3: TButton;
    cbbComAgilent_2: TComboBox;
    btnStartAgilent_2: TButton;
    cbbComAgilent_3: TComboBox;
    btnStartAgilent_3: TButton;
    cbbComAgilent_4: TComboBox;
    btnStartAgilent_4: TButton;
    CheckBoxAutoTestCom1: TCheckBox;
    CheckBoxAutoTestCom2: TCheckBox;
    CheckBoxAutoTestCom3: TCheckBox;
    CheckBoxAutoTestCom4: TCheckBox;
    cbbComAgilent_5: TComboBox;
    tmrCheckComm1: TTimer;
    tmrCheckComm2: TTimer;
    tmrCheckComm3: TTimer;
    tmrCheckComm4: TTimer;
    Panel1: TPanel;
    rbUseBox: TRadioButton;
    rbDisUseBox: TRadioButton;
    procedure BtnReTestClick(Sender: TObject);
    procedure btnStart_1Click(Sender: TObject);
    procedure btnStart_2Click(Sender: TObject);
    procedure btnStart_3Click(Sender: TObject);
    procedure btnStart_4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TestResultDetail_1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnBtn_ResultEnableClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnStartAgilent_1Click(Sender: TObject);
    procedure CommAgilent_1ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);

    procedure btnReTest1Click(Sender: TObject);
    procedure btnReTest2Click(Sender: TObject);
    procedure btnReTest3Click(Sender: TObject);
    procedure btnReTest4Click(Sender: TObject);
    procedure btnStartAgilent_2Click(Sender: TObject);
    procedure btnStartAgilent_3Click(Sender: TObject);
    procedure btnStartAgilent_4Click(Sender: TObject);
    procedure CommAgilent_2ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure CommAgilent_3ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure CommAgilent_4ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    {procedure Comm_1ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure Comm_2ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure Comm_3ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure Comm_4ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
    procedure Comm_1ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Comm_2ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Comm_3ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Comm_4ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure TestResultDetail_2DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure TestResultDetail_3DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure TestResultDetail_4DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure tmrCheckComm1Timer(Sender: TObject);
    procedure tmrCheckComm2Timer(Sender: TObject);
    procedure tmrCheckComm3Timer(Sender: TObject);
    procedure tmrCheckComm4Timer(Sender: TObject);
    procedure rbUseBoxClick(Sender: TObject);
    procedure rbDisUseBoxClick(Sender: TObject);
    procedure Comm_01ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure Comm_02ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure Comm_03ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure Comm_04ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure StartTest(CommIndex:Integer);override;
    procedure ResumeTestState(CommIndex:Integer);
    procedure InitAllControl(CommIndex:Integer);
    procedure SetResult(CommIndex:Integer;iResult:Integer);
    procedure SetTestItemResult(CommIndex:Integer; TestItem: string; TestResult: Integer;TestValue:string);
    procedure AutoTest(CommIndex:Integer);
    procedure StartAgilentComm(CommIndex:Integer);
    procedure SetDisplayResult(CommIndex:Integer;iResult:Integer);         //设置测试结果

    procedure FindCommStart(CommIndex:Integer);
    procedure DeComReceieveDataCoupleTest(CommIndex:Integer);
  end;

var
  frmCoupleTest: TfrmCoupleTest;
  bUseBox:Boolean;
  strCallNo:string;

implementation

uses uClientMain;

{$R *.dfm}

procedure TfrmCoupleTest.StartTest(CommIndex:Integer);
begin
    strPlanName:='CoupleTest';
    ResumeTestState(CommIndex);
    SendToComm_Agilent(CommIndex,'TRIGGER ABORT','TRIGger:ABORt',False);
    Sleep(100);
    SendToComm_Agilent(CommIndex,'MS RELEASE','TESTs:MANual:MEASure:MSRelease',False);
    Sleep(100);
    SendToComm_Agilent(CommIndex,'MS CALL','TESTs:MANual:MEASure:MSCall',False);
    //bGetTestItemed[CommIndex]:=True;
    BeginTest(CommIndex);
end;
//恢复测试初始状态
procedure TfrmCoupleTest.ResumeTestState(CommIndex:Integer);
begin
    //删除测试详细结果
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Open;
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).First;
    while not TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Eof do
    begin
        TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Delete;
    end;
    //初始化各控件显示
    InitAllControl(CommIndex);
    //测试结果初始化
    TfrmModule(CurrentFrom).SetResult(CommIndex,-2);
end;
procedure TfrmCoupleTest.InitAllControl(CommIndex:Integer);
var
    iIndex:Integer;
begin
    for iIndex := 1 to TStatusBar(FindComponent('SB_TestStatus_'+inttostr(CommIndex))).Panels.Count-1 do
    begin
        TStatusBar(FindComponent('SB_TestStatus_'+inttostr(CommIndex))).Panels[iIndex].Text:='';
    end;
end;
procedure TfrmCoupleTest.BtnReTestClick(Sender: TObject);
begin
    StartTest(0);
end;

procedure TfrmCoupleTest.btnStart_1Click(Sender: TObject);
begin
  inherited;
    StartComm(1);
end;

procedure TfrmCoupleTest.btnStart_2Click(Sender: TObject);
begin
  inherited;
    StartComm(2);
end;

procedure TfrmCoupleTest.btnStart_3Click(Sender: TObject);
begin
  inherited;
    StartComm(3);
end;

procedure TfrmCoupleTest.btnStart_4Click(Sender: TObject);
begin
  inherited;
    StartComm(4);
end;

procedure TfrmCoupleTest.FormCreate(Sender: TObject);
var
    iCommIndex,Count:Integer;
    CommList: TStrings;
begin
    for iCommindex := 1 to CommCount-1 do
    begin
        CommList:= TStringList.Create;
        if GetSysComm(CommList) then
        begin
            for Count:= 0 to CommList.Count-1 do
            begin
                TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).Items.Add(CommList[Count]);
                TComboBox(FindComponent('cbbComAgilent_'+inttostr(iCommindex))).Items.Add(CommList[Count]);
            end;
            TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).ItemIndex:=0;
            TComboBox(FindComponent('cbbComAgilent_'+inttostr(iCommindex))).ItemIndex:=0;
        end;
        CommList.free;
    end;

    if strAutoTestModel='' then
    begin
        Application.MessageBox('请在测试参数设置选项中选择要测试的机型!','警告',MB_OK+MB_ICONWARNING);
        frmClientMain.ac_BasicTestParam.Execute();
    end;

    if rbUseBox.Checked then
    begin
      bUseBox:=True;
      strCallNo:='ATD112;';
    end
    else
    begin
      bUseBox:=False;
      strCallNo:='ATD13800138000;';
    end;


end;
{
iResult<  -2->初始状态  1->成功  0->失败  3->无须测试或测试过的>
}
procedure TfrmCoupleTest.SetResult(CommIndex:Integer;iResult:Integer);
var
    strTestTime,strSendText:String;
    hWindow:HWND;
begin
    Application.ProcessMessages;
    case iResult of
        -3,-2,-4,-5,-6:
            begin
                SetDisplayResult(CommIndex,iResult);
            end;
        1:
            begin
                if (not (strChipRid[CommIndex]='')) and bUpdateForm then
                begin
                    strSendText:=Format('Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s',
                                    [strPlanName,strChipRid[CommIndex],strSoftModel[CommIndex],strVersion[CommIndex],strIMEI[CommIndex],iResult,User.UserName]);
                    SendToServer(CommIndex,'UpdateResult',strSendText,True,CTimeOut*2);

                    strSendText:=Format('Action=CheckTested_SetResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Tester=%s#',
              		        [strPlanName,strChipRid[CommIndex],strSoftModel[CommIndex],strVersion[CommIndex],User.UserName]);
                    SendToServer(CommIndex,'CheckTested_SetResult',strSendText,True,CTimeOut*2);
                end
                else
                  SetDisplayResult(CommIndex,iResult);
            end;
        0:
            begin
                if (not (strChipRid[CommIndex]='')) and bUpdateForm then
                begin
                        strSendText:=Format('Action=UpdateResult#PlanName=%s#ChipRid=%s#SoftModel=%s#Version=%s#Imei=%s#iResult=%d#Tester=%s',
                                        [strPlanName,strChipRid[CommIndex],strSoftModel[CommIndex],strVersion[CommIndex],strIMEI[CommIndex],iResult,User.UserName]);
                    SendToServer(CommIndex,'UpdateResult',strSendText,True,CTimeOut*2);
                end;
                SetDisplayResult(CommIndex,iResult);
            end;
    end;
    Application.ProcessMessages;
end;
{
iResult<  -2->初始状态  1->成功  0->失败  3->无须测试或测试过的>
}
procedure TfrmCoupleTest.SetDisplayResult(CommIndex:Integer;iResult:Integer);
var
    strTestTime,strSendText:String;
    hWindow:HWND;
begin
    Application.ProcessMessages;
    SerialInfo[CommIndex].bAllowTest:=False;
    if (iResult=0) or (iResult=1) then
    begin
        TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
        SendCommList[CommIndex].Clear;
        SendAgilentCommList[CommIndex].Clear;
        TStatusBar(FindComponent('SB_TestStatus_'+inttostr(CommIndex))).Panels[1].Text:='测试完成';
        strTestTime:=Format('总耗测试时间:%f秒',[(GetTickCount-TestStartTickCount[CommIndex])/1000]);
        TStatusBar(FindComponent('SB_TestStatus_'+inttostr(CommIndex))).Panels[2].Text:=strTestTime;

        SendToComm_Agilent(CommIndex,'TRIGGER ABORT','TRIGger:ABORt',False);
        SendToComm_Agilent(CommIndex,'MS RELEASE','TESTs:MANual:MEASure:MSRelease',False);
    end;

    case iResult of
     -6:
    begin
      Application.ProcessMessages;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:=VERSIONERROR;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clYellow;
      TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
      ChectAllowStartTest(CommIndex);
    end;
    -5: //为了不弹出框
    begin
      Application.ProcessMessages;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:=NOTNEED;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clYellow;
      TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
      ChectAllowStartTest(CommIndex);
    end;
        -4://为了不弹出框
    begin
      Application.ProcessMessages;
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='此机子已测试过！';
      TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clYellow;
      TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
      ChectAllowStartTest(CommIndex);
    end;
        -3:
            begin
                Application.ProcessMessages;
                TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='';
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clSilver;
                ChectAllowStartTest(CommIndex);
                Application.ProcessMessages;
            end;
        -2:
            begin
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='';
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clSilver;
            end;
        1:
            begin
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='PASS';
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clGreen;
                
                TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
                ChectAllowStartTest(CommIndex);
                Application.ProcessMessages;
            end;
        0:
            begin
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='FAIL';
                TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clRed;

                TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
                ChectAllowStartTest(CommIndex);
                Application.ProcessMessages;
            end;
    end;
    if TCheckBox(FindComponent('CheckBoxAutoTestCom'+inttostr(CommIndex))).Checked then
    begin
      if (iResult=0) or (iResult=1)then
      begin
        if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='断开'  then
        begin
           TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
           FindCommStart(CommIndex);
        end;
      end;
    end;
    Application.ProcessMessages;
end;
//设置子测试项测试结果
//CommIndex:串口号   TestItem:测试项目  TestResult:测试结果
procedure TfrmCoupleTest.SetTestItemResult(CommIndex:Integer; TestItem: string; TestResult: Integer;TestValue:string);
var
    strResult:string;
begin
    Application.ProcessMessages;
    case TestResult of
      0:
            begin
                strResult:='FAIL';
                bTestFail[CommIndex]:=True;
            end;
      1:
            begin
              strResult:='PASS';
            end;
    end;
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Append;
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestItem').Value:=TestItem;
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('SubTestItem').Value:=TestItem;
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').Value:=strResult;
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestValue').Value:=TestValue;
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Post;
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Last;
    TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Refresh;
    TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='';
    TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clSilver;
    //测试失败则终止测试,否则继续测试
    if (TestResult=0) and (not BasicTestParam.FailContinueTest) then
        SetResult(CommIndex,0);
    Application.ProcessMessages;
end;
//开始测试
procedure TfrmCoupleTest.AutoTest(CommIndex:Integer);
var
    Index: Integer;
    strTemp:string;
begin
    Application.ProcessMessages;
    bTestFail[CommIndex]:=False;
    TPanel(FindComponent('pnlTestResult_'+inttostr(CommIndex))).Enabled:=False;
    //恢复串口的测试状态
    ResumeTestState(CommIndex);
    //SendToComm_Agilent(CommIndex,'MS CALL','TESTs:MANual:MEASure:MSCall',False);
    Application.ProcessMessages;
end;
procedure TfrmCoupleTest.TestResultDetail_1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    CommIndex:Integer;
begin
    CommIndex:=1;
    if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='FAIL' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clYellow;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
    else if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='PASS' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clLime;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
end;

procedure TfrmCoupleTest.btnBtn_ResultEnableClick(Sender: TObject);
var
    CommIndex:Integer;
begin
  inherited;
    for CommIndex := 1 to CommCount-1 do
    begin
        TPanel(FindComponent('pnlTestResult_'+inttostr(CommIndex))).Enabled:=True;
    end;
end;

procedure TfrmCoupleTest.FormResize(Sender: TObject);
begin
  inherited;
    pnl1.Left:=30;
    pnl1.Top:=0;
end;

procedure TfrmCoupleTest.StartAgilentComm(CommIndex:Integer);
var
    strComPort:string;
begin
    Application.ProcessMessages;
    if TButton(FindComponent('btnStartAgilent_'+inttostr(CommIndex))).Caption='连接' then
    begin
        strComPort:=TComboBox(FindComponent('cbbComAgilent_'+inttostr(CommIndex))).Text;
        if strComPort='' then
        begin
            MessageDlg('请选择串口!',mtInformation,mbOKCancel,0);
            Exit;
        end;

        try
            TComm(FindComponent('CommAgilent_'+inttostr(CommIndex))).CommName:= strComPort;
            TComboBox(FindComponent('cbbComAgilent_'+inttostr(CommIndex))).Enabled:=False;
            TComm(FindComponent('CommAgilent_'+inttostr(CommIndex))).StartComm;
            Sleep(100);
            TButton(FindComponent('btnStartAgilent_'+inttostr(CommIndex))).Caption:='断开';
            TButton(FindComponent('btnStartAgilent_'+inttostr(CommIndex))).Enabled:=True;
            AgilentSerialInfo[CommIndex].bConnected:=True;
            SendToComm_Agilent(CommIndex,'Connect','*IDN?')
        except
            //on ECommsError do
            begin
                MessageDlg('端口不存在或已被占用或其它!',mtInformation,mbOKCancel,0);
                TComboBox(FindComponent('cbbComAgilent_'+inttostr(CommIndex))).Enabled:=True;
                TButton(FindComponent('btnStartAgilent_'+inttostr(CommIndex))).Caption:='连接';
                //TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Enabled:=True;
                AgilentSerialInfo[CommIndex].bConnected:=False;
            end;
        end;
    end
    else if TButton(FindComponent('btnStartAgilent_'+inttostr(CommIndex))).Caption='断开'  then
    begin
        TComboBox(FindComponent('cbbComAgilent_'+inttostr(CommIndex))).Enabled:=True;
        try
            TComm(FindComponent('CommAgilent_'+inttostr(CommIndex))).StopComm;
            TButton(FindComponent('btnStartAgilent_'+inttostr(CommIndex))).Caption:='连接';
            AgilentSerialInfo[CommIndex].bConnected:=False;
        except
            MessageDlg('端口断开失败!',mtInformation,mbOKCancel,0);
            TButton(FindComponent('btnStartAgilent_'+inttostr(CommIndex))).Caption:='断开';
            AgilentSerialInfo[CommIndex].bConnected:=True;
        end;
    end;
    Application.ProcessMessages;
end;
procedure TfrmCoupleTest.btnStartAgilent_1Click(Sender: TObject);
begin
  inherited;
  StartAgilentComm(1);
end;

procedure TfrmCoupleTest.CommAgilent_1ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
var
    CommIndex:Integer;
    strTxPower:string;
begin
  inherited;
   Application.ProcessMessages;
    CommIndex:=1;

    SetLength(StrAgilentCommRecText[CommIndex],BufferLength);
    Move(Buffer^,PChar(StrAgilentCommRecText[CommIndex])^,BufferLength);

    StrAgilentCommRecText[CommIndex]:=UpperCase(StrAgilentCommRecText[CommIndex]);
    NoteAgilentCommLog(CommIndex,StrAgilentCommRecText[CommIndex]);

    if pos(#$D,StrAgilentCommRecText[CommIndex])<>0 then
        StrAgilentCommRecText[CommIndex]:=stringreplace(StrAgilentCommRecText[CommIndex],#$D,'',[rfReplaceAll]);
    if pos(#$A,StrAgilentCommRecText[CommIndex])<>0 then
        StrAgilentCommRecText[CommIndex]:=stringreplace(StrAgilentCommRecText[CommIndex],#$A,'',[rfReplaceAll]);

    GetSendedAgilentCommCmdkey(CommIndex,strCmdReturnText_Aglient[CommIndex],strCmdCommKey_Aglient[CommIndex],
                            bCompare_Aglient[CommIndex],strCompare_Aglient[CommIndex],strRemark_Aglient[CommIndex]);
    strCmdCommKey_Aglient[CommIndex]:=UpperCase(strCmdCommKey_Aglient[CommIndex]);

    if (strCmdCommKey_Aglient[CommIndex]= 'CONNECT') then
    begin
        if (pos('E6392B',StrAgilentCommRecText[CommIndex])>0) then
            SendToComm_Agilent(CommIndex)
        else
            Exit;
    end
    else if (strCmdCommKey_Aglient[CommIndex]= 'STATE')  then
    begin
        {bit 0 (1): Idle
        bit 1 (2): Attached
        bit 2 (4): Connect
        bit 3 (8): Time Out Error
        bit 4 (16): Measurement End}
        if (pos('2',StrAgilentCommRecText[CommIndex])>0) then
        begin
            SendToComm_Agilent(CommIndex);
            SetTestItemResult(CommIndex,'BS Call',1,'连接');
            SendToComm_Agilent(CommIndex,'TPOWER1','TESTs:MANual:TXAMplitude:RESults:TPOWer?');
        end
        else
            Exit;
    end
    else if (strCmdCommKey_Aglient[CommIndex]= 'TPOWER1')  then
    begin
        if (pos('1,1,-99.9',StrAgilentCommRecText[CommIndex])>0) then
        begin
            SendToComm_Agilent(CommIndex);
            SendToComm_Agilent(CommIndex,'TRIG','TRIG:IMM',False);
            SendToComm_Agilent(CommIndex,'TPOWER','TESTs:MANual:TXAMplitude:RESults:TPOWer?');
        end
        else
            Exit;
    end
    else if (strCmdCommKey_Aglient[CommIndex]= 'TPOWER')  then
    begin
        if (pos('0,0,',StrAgilentCommRecText[CommIndex])>0) then
        begin
            SendToComm_Agilent(CommIndex);
            strTxPower:=stringreplace(StrAgilentCommRecText[CommIndex],'0,0,','',[rfReplaceAll]);
            SetTestItemResult(CommIndex,'Tx Power',1,strTxPower);
            SendToComm_Agilent(CommIndex,'TRIGGER ABORT','TRIGger:ABORt',False);
            SendToComm_Agilent(CommIndex,'MS RELEASE','TESTs:MANual:MEASure:MSRelease',False);
            SetResult(CommIndex,1);
        end
        else if (pos('1,1,-99.9',StrAgilentCommRecText[CommIndex])>0) then
        begin
          SendToComm_Agilent(CommIndex);
          SendToComm_Agilent(CommIndex,'TPOWER','TESTs:MANual:TXAMplitude:RESults:TPOWer?');
        end
        else
            Exit;
    end;

end;

{procedure TfrmCoupleTest.Comm_1ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
procedure TfrmCoupleTest.Comm_1ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
var
    CommIndex:Integer;
begin
  inherited;
  CommIndex:=1;
  DeComReceieveDataCoupleTest(CommIndex);
end;

procedure TfrmCoupleTest.btnReTest1Click(Sender: TObject);
var
  CommIndex:Integer;
begin
  inherited;
    CommIndex:=1;
    if TCheckBox(FindComponent('CheckBoxAutoTestCom'+inttostr(CommIndex))).Checked then
    begin
      begin
        if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='断开'  then
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
           SerialInfo[CommIndex].bAllowTest:=True;
           TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
           Sleep(1000);
           if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='连接'  then
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
        end;
      end;
    end;
    StartTest(CommIndex);
end;

procedure TfrmCoupleTest.btnReTest2Click(Sender: TObject);
var
  CommIndex:Integer;
begin
  inherited;
    CommIndex:=2;
    if TCheckBox(FindComponent('CheckBoxAutoTestCom'+inttostr(CommIndex))).Checked then
    begin
      begin
        if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='断开'  then
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
           SerialInfo[CommIndex].bAllowTest:=True;
           TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
           Sleep(1000);
           if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='连接'  then
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
        end;
      end;
    end;
    StartTest(CommIndex);
end;

procedure TfrmCoupleTest.btnReTest3Click(Sender: TObject);
var
  CommIndex:Integer;
begin
  inherited;
    CommIndex:=3;
    if TCheckBox(FindComponent('CheckBoxAutoTestCom'+inttostr(CommIndex))).Checked then
    begin
      begin
        if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='断开'  then
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
           SerialInfo[CommIndex].bAllowTest:=True;
           TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
           Sleep(1000);
           if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='连接'  then
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
        end;
      end;
    end;
    StartTest(CommIndex);
end;

procedure TfrmCoupleTest.btnReTest4Click(Sender: TObject);
var
  CommIndex:Integer;
begin
  inherited;
    CommIndex:=4;
    if TCheckBox(FindComponent('CheckBoxAutoTestCom'+inttostr(CommIndex))).Checked then
    begin
      begin
        if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='断开'  then
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
           SerialInfo[CommIndex].bAllowTest:=True;
           TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
           Sleep(1000);
           if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='连接'  then
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
        end;
      end;
    end;
    StartTest(CommIndex);
end;

procedure TfrmCoupleTest.btnStartAgilent_2Click(Sender: TObject);
begin
  inherited;
  StartAgilentComm(2);
end;

procedure TfrmCoupleTest.btnStartAgilent_3Click(Sender: TObject);
begin
  inherited;
  StartAgilentComm(3);
end;

procedure TfrmCoupleTest.btnStartAgilent_4Click(Sender: TObject);
begin
  inherited;
  StartAgilentComm(4);
end;

procedure TfrmCoupleTest.CommAgilent_2ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
var
    CommIndex:Integer;
    strTxPower:string;
begin
  inherited;
   Application.ProcessMessages;
    CommIndex:=2;

    SetLength(StrAgilentCommRecText[CommIndex],BufferLength);
    Move(Buffer^,PChar(StrAgilentCommRecText[CommIndex])^,BufferLength);

    StrAgilentCommRecText[CommIndex]:=UpperCase(StrAgilentCommRecText[CommIndex]);
    NoteAgilentCommLog(CommIndex,StrAgilentCommRecText[CommIndex]);

    if pos(#$D,StrAgilentCommRecText[CommIndex])<>0 then
        StrAgilentCommRecText[CommIndex]:=stringreplace(StrAgilentCommRecText[CommIndex],#$D,'',[rfReplaceAll]);
    if pos(#$A,StrAgilentCommRecText[CommIndex])<>0 then
        StrAgilentCommRecText[CommIndex]:=stringreplace(StrAgilentCommRecText[CommIndex],#$A,'',[rfReplaceAll]);

    GetSendedAgilentCommCmdkey(CommIndex,strCmdReturnText_Aglient[CommIndex],strCmdCommKey_Aglient[CommIndex],
                            bCompare_Aglient[CommIndex],strCompare_Aglient[CommIndex],strRemark_Aglient[CommIndex]);
    strCmdCommKey_Aglient[CommIndex]:=UpperCase(strCmdCommKey_Aglient[CommIndex]);

    if (strCmdCommKey_Aglient[CommIndex]= 'CONNECT') then
    begin
        if (pos('E6392B',StrAgilentCommRecText[CommIndex])>0) then
            SendToComm_Agilent(CommIndex)
        else
            Exit;
    end
    else if (strCmdCommKey_Aglient[CommIndex]= 'STATE')  then
    begin
        {bit 0 (1): Idle
        bit 1 (2): Attached
        bit 2 (4): Connect
        bit 3 (8): Time Out Error
        bit 4 (16): Measurement End}
        if (pos('2',StrAgilentCommRecText[CommIndex])>0) then
        begin
            SendToComm_Agilent(CommIndex);
            SetTestItemResult(CommIndex,'BS Call',1,'连接');
            SendToComm_Agilent(CommIndex,'TPOWER1','TESTs:MANual:TXAMplitude:RESults:TPOWer?');
        end
        else
            Exit;
    end
    else if (strCmdCommKey_Aglient[CommIndex]= 'TPOWER1')  then
    begin
        if (pos('1,1,-99.9',StrAgilentCommRecText[CommIndex])>0) then
        begin
            SendToComm_Agilent(CommIndex);
            SendToComm_Agilent(CommIndex,'TRIG','TRIG:IMM',False);
            SendToComm_Agilent(CommIndex,'TPOWER','TESTs:MANual:TXAMplitude:RESults:TPOWer?');
        end
        else
            Exit;
    end
    else if (strCmdCommKey_Aglient[CommIndex]= 'TPOWER')  then
    begin
        if (pos('0,0,',StrAgilentCommRecText[CommIndex])>0) then
        begin
            SendToComm_Agilent(CommIndex);
            strTxPower:=stringreplace(StrAgilentCommRecText[CommIndex],'0,0,','',[rfReplaceAll]);
            SetTestItemResult(CommIndex,'Tx Power',1,strTxPower);
            SendToComm_Agilent(CommIndex,'TRIGGER ABORT','TRIGger:ABORt',False);
            SendToComm_Agilent(CommIndex,'MS RELEASE','TESTs:MANual:MEASure:MSRelease',False);
            SetResult(CommIndex,1);
        end
        else if (pos('1,1,-99.9',StrAgilentCommRecText[CommIndex])>0) then
        begin
          SendToComm_Agilent(CommIndex);
          SendToComm_Agilent(CommIndex,'TPOWER','TESTs:MANual:TXAMplitude:RESults:TPOWer?');
        end
        else
            Exit;
    end;

end;

procedure TfrmCoupleTest.CommAgilent_3ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
var
    CommIndex:Integer;
    strTxPower:string;
begin
  inherited;
   Application.ProcessMessages;
    CommIndex:=3;

    SetLength(StrAgilentCommRecText[CommIndex],BufferLength);
    Move(Buffer^,PChar(StrAgilentCommRecText[CommIndex])^,BufferLength);

    StrAgilentCommRecText[CommIndex]:=UpperCase(StrAgilentCommRecText[CommIndex]);
    NoteAgilentCommLog(CommIndex,StrAgilentCommRecText[CommIndex]);

    if pos(#$D,StrAgilentCommRecText[CommIndex])<>0 then
        StrAgilentCommRecText[CommIndex]:=stringreplace(StrAgilentCommRecText[CommIndex],#$D,'',[rfReplaceAll]);
    if pos(#$A,StrAgilentCommRecText[CommIndex])<>0 then
        StrAgilentCommRecText[CommIndex]:=stringreplace(StrAgilentCommRecText[CommIndex],#$A,'',[rfReplaceAll]);

    GetSendedAgilentCommCmdkey(CommIndex,strCmdReturnText_Aglient[CommIndex],strCmdCommKey_Aglient[CommIndex],
                            bCompare_Aglient[CommIndex],strCompare_Aglient[CommIndex],strRemark_Aglient[CommIndex]);
    strCmdCommKey_Aglient[CommIndex]:=UpperCase(strCmdCommKey_Aglient[CommIndex]);

    if (strCmdCommKey_Aglient[CommIndex]= 'CONNECT') then
    begin
        if (pos('E6392B',StrAgilentCommRecText[CommIndex])>0) then
            SendToComm_Agilent(CommIndex)
        else
            Exit;
    end
    else if (strCmdCommKey_Aglient[CommIndex]= 'STATE')  then
    begin
        {bit 0 (1): Idle
        bit 1 (2): Attached
        bit 2 (4): Connect
        bit 3 (8): Time Out Error
        bit 4 (16): Measurement End}
        if (pos('2',StrAgilentCommRecText[CommIndex])>0) then
        begin
            SendToComm_Agilent(CommIndex);
            SetTestItemResult(CommIndex,'BS Call',1,'连接');
            SendToComm_Agilent(CommIndex,'TPOWER1','TESTs:MANual:TXAMplitude:RESults:TPOWer?');
        end
        else
            Exit;
    end
    else if (strCmdCommKey_Aglient[CommIndex]= 'TPOWER1')  then
    begin
        if (pos('1,1,-99.9',StrAgilentCommRecText[CommIndex])>0) then
        begin
            SendToComm_Agilent(CommIndex);
            SendToComm_Agilent(CommIndex,'TRIG','TRIG:IMM',False);
            SendToComm_Agilent(CommIndex,'TPOWER','TESTs:MANual:TXAMplitude:RESults:TPOWer?');
        end
        else
            Exit;
    end
    else if (strCmdCommKey_Aglient[CommIndex]= 'TPOWER')  then
    begin
        if (pos('0,0,',StrAgilentCommRecText[CommIndex])>0) then
        begin
            SendToComm_Agilent(CommIndex);
            strTxPower:=stringreplace(StrAgilentCommRecText[CommIndex],'0,0,','',[rfReplaceAll]);
            SetTestItemResult(CommIndex,'Tx Power',1,strTxPower);
            SendToComm_Agilent(CommIndex,'TRIGGER ABORT','TRIGger:ABORt',False);
            SendToComm_Agilent(CommIndex,'MS RELEASE','TESTs:MANual:MEASure:MSRelease',False);
            SetResult(CommIndex,1);
        end
        else if (pos('1,1,-99.9',StrAgilentCommRecText[CommIndex])>0) then
        begin
          SendToComm_Agilent(CommIndex);
          SendToComm_Agilent(CommIndex,'TPOWER','TESTs:MANual:TXAMplitude:RESults:TPOWer?');
        end
        else
            Exit;
    end;

end;

procedure TfrmCoupleTest.CommAgilent_4ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
var
    CommIndex:Integer;
    strTxPower:string;
begin
  inherited;
   Application.ProcessMessages;
    CommIndex:=4;

    SetLength(StrAgilentCommRecText[CommIndex],BufferLength);
    Move(Buffer^,PChar(StrAgilentCommRecText[CommIndex])^,BufferLength);

    StrAgilentCommRecText[CommIndex]:=UpperCase(StrAgilentCommRecText[CommIndex]);
    NoteAgilentCommLog(CommIndex,StrAgilentCommRecText[CommIndex]);

    if pos(#$D,StrAgilentCommRecText[CommIndex])<>0 then
        StrAgilentCommRecText[CommIndex]:=stringreplace(StrAgilentCommRecText[CommIndex],#$D,'',[rfReplaceAll]);
    if pos(#$A,StrAgilentCommRecText[CommIndex])<>0 then
        StrAgilentCommRecText[CommIndex]:=stringreplace(StrAgilentCommRecText[CommIndex],#$A,'',[rfReplaceAll]);

    GetSendedAgilentCommCmdkey(CommIndex,strCmdReturnText_Aglient[CommIndex],strCmdCommKey_Aglient[CommIndex],
                            bCompare_Aglient[CommIndex],strCompare_Aglient[CommIndex],strRemark_Aglient[CommIndex]);
    strCmdCommKey_Aglient[CommIndex]:=UpperCase(strCmdCommKey_Aglient[CommIndex]);

    if (strCmdCommKey_Aglient[CommIndex]= 'CONNECT') then
    begin
        if (pos('E6392B',StrAgilentCommRecText[CommIndex])>0) then
            SendToComm_Agilent(CommIndex)
        else
            Exit;
    end
    else if (strCmdCommKey_Aglient[CommIndex]= 'STATE')  then
    begin
        {bit 0 (1): Idle
        bit 1 (2): Attached
        bit 2 (4): Connect
        bit 3 (8): Time Out Error
        bit 4 (16): Measurement End}
        if (pos('2',StrAgilentCommRecText[CommIndex])>0) then
        begin
            SendToComm_Agilent(CommIndex);
            SetTestItemResult(CommIndex,'BS Call',1,'连接');
            SendToComm_Agilent(CommIndex,'TPOWER1','TESTs:MANual:TXAMplitude:RESults:TPOWer?');
        end
        else
            Exit;
    end
    else if (strCmdCommKey_Aglient[CommIndex]= 'TPOWER1')  then
    begin
        if (pos('1,1,-99.9',StrAgilentCommRecText[CommIndex])>0) then
        begin
            SendToComm_Agilent(CommIndex);
            SendToComm_Agilent(CommIndex,'TRIG','TRIG:IMM',False);
            SendToComm_Agilent(CommIndex,'TPOWER','TESTs:MANual:TXAMplitude:RESults:TPOWer?');
        end
        else
            Exit;
    end
    else if (strCmdCommKey_Aglient[CommIndex]= 'TPOWER')  then
    begin
        if (pos('0,0,',StrAgilentCommRecText[CommIndex])>0) then
        begin
            SendToComm_Agilent(CommIndex);
            strTxPower:=stringreplace(StrAgilentCommRecText[CommIndex],'0,0,','',[rfReplaceAll]);
            SetTestItemResult(CommIndex,'Tx Power',1,strTxPower);
            SendToComm_Agilent(CommIndex,'TRIGGER ABORT','TRIGger:ABORt',False);
            SendToComm_Agilent(CommIndex,'MS RELEASE','TESTs:MANual:MEASure:MSRelease',False);
            SetResult(CommIndex,1);
        end
        else if (pos('1,1,-99.9',StrAgilentCommRecText[CommIndex])>0) then
        begin
          SendToComm_Agilent(CommIndex);
          SendToComm_Agilent(CommIndex,'TPOWER','TESTs:MANual:TXAMplitude:RESults:TPOWer?');
        end
        else
            Exit;
    end;

end;

{procedure TfrmCoupleTest.Comm_2ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
procedure TfrmCoupleTest.Comm_2ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
var
    CommIndex:Integer;
begin
  inherited;
    CommIndex:=2;
      DeComReceieveDataCoupleTest(CommIndex);
end;

{procedure TfrmCoupleTest.Comm_3ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
procedure TfrmCoupleTest.Comm_3ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
var
    CommIndex:Integer;
begin
  inherited;
    CommIndex:=3;
    DeComReceieveDataCoupleTest(CommIndex);
end;

{procedure TfrmCoupleTest.Comm_4ReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Integer);}
procedure TfrmCoupleTest.Comm_4ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
var
    CommIndex:Integer;
begin
  inherited;
    CommIndex:=4;
    DeComReceieveDataCoupleTest(CommIndex);
end;

procedure TfrmCoupleTest.TestResultDetail_2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    CommIndex:Integer;
begin
    CommIndex:=2;
    if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='FAIL' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clYellow;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
    else if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='PASS' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clLime;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
end;

procedure TfrmCoupleTest.TestResultDetail_3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    CommIndex:Integer;
begin
    CommIndex:=3;
    if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='FAIL' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clYellow;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
    else if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='PASS' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clLime;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
end;

procedure TfrmCoupleTest.TestResultDetail_4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    CommIndex:Integer;
begin
    CommIndex:=4;
    if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='FAIL' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clYellow;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
    else if TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').AsString ='PASS' then
    begin
        if DataCol = 2 then
        begin
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Brush.Color :=clLime;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).Canvas.Pen.Mode:=pmMask;
            TDBGrid(FindComponent('TestResultDetail_'+inttostr(CommIndex))).DefaultDrawColumnCell(Rect,DataCol,Column,State);
        end;
    end
end;
procedure TfrmCoupleTest.FindCommStart(CommIndex:Integer);
begin
    Application.ProcessMessages;
    iSendAtTestCount[CommIndex]:=0;
    TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Interval:=1*1000;
    TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
    SerialInfo[CommIndex].iCheckCommNo:=0;
    SerialInfo[CommIndex].bAllowCheck:=false;
    Application.ProcessMessages;
end;

procedure TfrmCoupleTest.tmrCheckComm1Timer(Sender: TObject);
var
   CommList: TStrings;
   strcommF:string;
   iCommindex,Count:Integer;
   CommIndex:Integer;
begin
      CommIndex:=1;
      TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
      //清除串口信息
      SerialInfo[CommIndex].bAllowTest:=False;
      SerialInfo[CommIndex].strChipRid:='';
      SendCommList[CommIndex].Clear;
      //获取当前存在串口
      CommList:= TStringList.Create;
      strcommF:='';
      if GetSysComm(CommList) then
      begin
          for Count:= 0 to CommList.Count-1 do
          begin
            if Count=0 then   strcommF:=CommList[Count]
            else  strcommF:=strcommF+','+CommList[Count];
          end;
      end;
      CommList.free;

      if (Pos(strComm[CommIndex],strcommF)>0) then   //第一次检测到COmm
      begin
        if SerialInfo[CommIndex].bAllowCheck then
        begin
          SerialInfo[CommIndex].iCheckCommNo:= SerialInfo[CommIndex].iCheckCommNo+1;
          Sleep(2000);
          if SerialInfo[CommIndex].iCheckCommNo<=1 then
          begin
            TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
            Exit;
          end
          else
          begin
            if  TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text='' then
            begin
              TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:=strComm[CommIndex];
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
              {if TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).Connected then
                StartTest(CommIndex);}
               {if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                StartTest(CommIndex);}
                if bUsbReceieveData then
                begin
                  if TCommPortDriver(FindComponent('Comm_0'+inttostr(CommIndex))).Connected then
                    StartTest(CommIndex);
                end
                else
                begin
                  if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                    StartTest(CommIndex);
                end;
            end
          end;
        end
        else
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
        end;
      end
      else
      begin
         TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:='';
         TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
         SerialInfo[CommIndex].bAllowCheck:=true;
      end;
end;

procedure TfrmCoupleTest.tmrCheckComm2Timer(Sender: TObject);
var
   CommList: TStrings;
   strcommF:string;
   iCommindex,Count:Integer;
   CommIndex:Integer;
begin
      CommIndex:=2;
      TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
      //清除串口信息
      SerialInfo[CommIndex].bAllowTest:=False;
      SerialInfo[CommIndex].strChipRid:='';
      SendCommList[CommIndex].Clear;
      //获取当前存在串口
      CommList:= TStringList.Create;
      strcommF:='';
      if GetSysComm(CommList) then
      begin
          for Count:= 0 to CommList.Count-1 do
          begin
            if Count=0 then   strcommF:=CommList[Count]
            else  strcommF:=strcommF+','+CommList[Count];
          end;
      end;
      CommList.free;

      if (Pos(strComm[CommIndex],strcommF)>0) then   //第一次检测到COmm
      begin
        if SerialInfo[CommIndex].bAllowCheck then
        begin
          SerialInfo[CommIndex].iCheckCommNo:= SerialInfo[CommIndex].iCheckCommNo+1;
          Sleep(2000);
          if SerialInfo[CommIndex].iCheckCommNo<=1 then
          begin
            TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
            Exit;
          end
          else
          begin
            if  TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text='' then
            begin
              TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:=strComm[CommIndex];
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
              {if TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).Connected then
                StartTest(CommIndex);}
               {if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                StartTest(CommIndex);  }
                if bUsbReceieveData then
              begin
                if TCommPortDriver(FindComponent('Comm_0'+inttostr(CommIndex))).Connected then
                  StartTest(CommIndex);
              end
              else
              begin
                if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                  StartTest(CommIndex);
              end;
            end
          end;
        end
        else
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
        end;
      end
      else
      begin
         TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:='';
         TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
         SerialInfo[CommIndex].bAllowCheck:=true;
      end;
end;

procedure TfrmCoupleTest.tmrCheckComm3Timer(Sender: TObject);
var
   CommList: TStrings;
   strcommF:string;
   iCommindex,Count:Integer;
   CommIndex:Integer;
begin
      CommIndex:=3;
      TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
      //清除串口信息
      SerialInfo[CommIndex].bAllowTest:=False;
      SerialInfo[CommIndex].strChipRid:='';
      SendCommList[CommIndex].Clear;
      //获取当前存在串口
      CommList:= TStringList.Create;
      strcommF:='';
      if GetSysComm(CommList) then
      begin
          for Count:= 0 to CommList.Count-1 do
          begin
            if Count=0 then   strcommF:=CommList[Count]
            else  strcommF:=strcommF+','+CommList[Count];
          end;
      end;
      CommList.free;

      if (Pos(strComm[CommIndex],strcommF)>0) then   //第一次检测到COmm
      begin
        if SerialInfo[CommIndex].bAllowCheck then
        begin
          SerialInfo[CommIndex].iCheckCommNo:= SerialInfo[CommIndex].iCheckCommNo+1;
          Sleep(2000);
          if SerialInfo[CommIndex].iCheckCommNo<=1 then
          begin
            TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
            Exit;
          end
          else
          begin
            if  TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text='' then
            begin
              TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:=strComm[CommIndex];
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
              {if TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).Connected then
                StartTest(CommIndex);}
                { if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                StartTest(CommIndex); }
                if bUsbReceieveData then
              begin
                if TCommPortDriver(FindComponent('Comm_0'+inttostr(CommIndex))).Connected then
                  StartTest(CommIndex);
              end
              else
              begin
                if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                  StartTest(CommIndex);
              end;
            end
          end;
        end
        else
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
        end;
      end
      else
      begin
         TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:='';
         TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
         SerialInfo[CommIndex].bAllowCheck:=true;
      end;
end;

procedure TfrmCoupleTest.tmrCheckComm4Timer(Sender: TObject);
var
   CommList: TStrings;
   strcommF:string;
   iCommindex,Count:Integer;
   CommIndex:Integer;
begin
      CommIndex:=4;
      TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=False;
      //清除串口信息
      SerialInfo[CommIndex].bAllowTest:=False;
      SerialInfo[CommIndex].strChipRid:='';
      SendCommList[CommIndex].Clear;
      //获取当前存在串口
      CommList:= TStringList.Create;
      strcommF:='';
      if GetSysComm(CommList) then
      begin
          for Count:= 0 to CommList.Count-1 do
          begin
            if Count=0 then   strcommF:=CommList[Count]
            else  strcommF:=strcommF+','+CommList[Count];
          end;
      end;
      CommList.free;

      if (Pos(strComm[CommIndex],strcommF)>0) then   //第一次检测到COmm
      begin
        if SerialInfo[CommIndex].bAllowCheck then
        begin
          SerialInfo[CommIndex].iCheckCommNo:= SerialInfo[CommIndex].iCheckCommNo+1;
          Sleep(2000);
          if SerialInfo[CommIndex].iCheckCommNo<=1 then
          begin
            TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
            Exit;
          end
          else
          begin
            if  TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text='' then
            begin
              TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:=strComm[CommIndex];
              TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Click;
              {if TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).Connected then
                StartTest(CommIndex);}
                { if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                StartTest(CommIndex); }
                if bUsbReceieveData then
              begin
                if TCommPortDriver(FindComponent('Comm_0'+inttostr(CommIndex))).Connected then
                  StartTest(CommIndex);
              end
              else
              begin
                if TComm(FindComponent('Comm_'+inttostr(CommIndex))).Handle>0 then
                  StartTest(CommIndex);
              end;
            end
          end;
        end
        else
        begin
           TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
        end;
      end
      else
      begin
         TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text:='';
         TTimer(FindComponent('tmrCheckComm'+inttostr(CommIndex))).Enabled:=True;
         SerialInfo[CommIndex].bAllowCheck:=true;
      end;
end;

procedure TfrmCoupleTest.rbUseBoxClick(Sender: TObject);
begin
  inherited;
  bUseBox:=True;
  if bUseBox then
  begin
    strCallNo:='ATD112;';
  end
  else
  begin
    strCallNo:='ATD13800138000;';
  end;

end;

procedure TfrmCoupleTest.rbDisUseBoxClick(Sender: TObject);
begin
  inherited;
  bUseBox:=False;
  if bUseBox then
  begin
    strCallNo:='ATD112;';
  end
  else
  begin
    strCallNo:='ATD13800138000;';
  end;
end;

procedure TfrmCoupleTest.DeComReceieveDataCoupleTest(CommIndex:Integer);
begin
    if (strCmdCommKey[CommIndex]= 'AT') then
    begin
        if (pos('OK',StrCommRecText[CommIndex])>0) then
        begin
            SendToComm(CommIndex);
            if rbUseBox.Checked then
            begin
              SendToComm(CommIndex,'ATCFUN0','AT+CFUN=0',True,3000);
              SendToComm(CommIndex,'ATCFUN1','AT+CFUN=1',True,3000);
            end;
            SendToComm(CommIndex,'ATD',strCallNo,True,3000);
        end
        else
            Exit;
    end
    else if ((strCmdCommKey[CommIndex]= 'ATCFUN0') or (strCmdCommKey[CommIndex]= 'ATCFUN1')) then
    begin
        if (pos('OK',StrCommRecText[CommIndex])>0) then
        begin
            SendToComm(CommIndex);
        end
        else
            Exit;
    end
    else if (strCmdCommKey[CommIndex]= 'ATD') then
    begin
        if (pos('OK',StrCommRecText[CommIndex])>0) and (pos('ATD',StrCommRecText[CommIndex])>0) then
        begin
            if (pos('CARRIER',StrCommRecText[CommIndex])>0) then Exit;
            SendToComm(CommIndex);
            SendToComm_Agilent(CommIndex,'TPOWER1','TESTs:MANual:TXAMplitude:RESults:TPOWer?');
        end
        else
            Exit;
    end
    else if (pos('NO CARRIER',StrCommRecText[CommIndex])>0) and SerialInfo[CommIndex].bAllowTest then
    begin

        SendToComm(CommIndex,'ATD',strCallNo,True,3000);
    end
    else if (strCmdCommKey[CommIndex]= 'ATCOPS') then
    begin
        if (pos('00101',StrCommRecText[CommIndex])>0) then
        begin
            SendToComm(CommIndex);

            Sleep(100);
            SendToComm(CommIndex,'ATD',strCallNo);
            Sleep(100);
            //SendToComm_Agilent(CommIndex,'TPOWER1','TESTs:MANual:TXAMplitude:RESults:TPOWer?');
        end
        else
            Exit;
    end;
end;
procedure TfrmCoupleTest.Comm_01ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
    CommIndex:Integer;
begin
  inherited;
  CommIndex:=1;
  Application.ProcessMessages;
  DeComReceieveDataCoupleTest(CommIndex);
end;

procedure TfrmCoupleTest.Comm_02ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
    CommIndex:Integer;
begin
  inherited;
  CommIndex:=2;
  
  Application.ProcessMessages;
  DeComReceieveDataCoupleTest(CommIndex);
end;

procedure TfrmCoupleTest.Comm_03ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
    CommIndex:Integer;
begin
  inherited;
  CommIndex:=3;
  
  Application.ProcessMessages;
  DeComReceieveDataCoupleTest(CommIndex);
end;

procedure TfrmCoupleTest.Comm_04ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
    CommIndex:Integer;
begin
  inherited;
  CommIndex:=4;
  Application.ProcessMessages;
  DeComReceieveDataCoupleTest(CommIndex);
end;

end.
