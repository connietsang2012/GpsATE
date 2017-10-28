unit uWriteImeiTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, ExtCtrls, SPComm, StdCtrls,uGlobalVar,
  ComCtrls, ComDrv32, DB, MemDS, DBAccess,StrUtils, Uni, Grids, DBGrids;

type
  TfrmWriteImeiTest = class(TfrmModule)

    lbl2: TLabel;
    EdtImei: TEdit;
    lblPrompt: TLabel;
    Label2: TLabel;
    Edt_PreImei: TEdit;
    Comm_Scan: TComm;
    tmrRecScanTimeOut: TTimer;
    grp3: TGroupBox;
    rbPowerFirst: TRadioButton;
    rbScanImei: TRadioButton;
    GrpTestPass: TGroupBox;
    chk_FuncTest: TCheckBox;
    chk_GPSTest: TCheckBox;
    chk_CoupleTest: TCheckBox;
    chk_ParamDownload: TCheckBox;
    chk_AutoTest: TCheckBox;
    grp1: TGroupBox;
    chkRF_BAR: TCheckBox;
    DS_TestItemParam_0: TDataSource;
    UniQuery_TestItemParam_ByItemName_0: TUniQuery;
    intgrfldUniQuery_TestItemParam_ByItemName_1Id: TIntegerField;
    strngfldUniQuery_TestItemParam_ByItemName_1ItemModel: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_1ItemName: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_1SubItemName: TStringField;
    UniQuery_TestItemParam_ByItemName_0SendAtComm: TBooleanField;
    strngfldUniQuery_TestItemParam_ByItemName_1AtComm: TStringField;
    strngfldUniQuery_TestItemParam_ByItemName_1ReturnText: TStringField;
    intgrfldUniQuery_TestItemParam_ByItemName_1ReSendNum: TIntegerField;
    intgrfldUniQuery_TestItemParam_ByItemName_1TestTimeOut: TIntegerField;
    UniQuery_TestItemParam_ByItemName_0Compare: TBooleanField;
    UniQuery_TestItemParam_ByItemName_0Remark1: TWideStringField;
    UniQuery_TestItemParam_ByItemName_0Remark2: TWideStringField;
    DS_TestResult_0: TDataSource;
    UniQuery_TestResult_0: TUniQuery;
    UniQuery_DstSubItem: TUniQuery;
    intgrfldUniQuery_DstSubItemId: TIntegerField;
    strngfldSFUniQuery_DstSubItemItemModel: TStringField;
    strngfldSFUniQuery_DstSubItemItemName: TStringField;
    DS_DstSubItem: TDataSource;
    grp2: TGroupBox;
    lbl3: TLabel;
    cbbComAgilent_1: TComboBox;
    btnScan: TButton;
    grp4: TGroupBox;
    pnl3: TPanel;
    pnl2: TPanel;
    pnlTestResult_1: TPanel;
    TestResultDetail_0: TDBGrid;
    SB_TestStatus_0: TStatusBar;
    intgrfldUniQuery_TestResult_0Id: TIntegerField;
    strngfldUniQuery_TestResult_0TestItem: TStringField;
    strngfldUniQuery_TestResult_0SubTestItem: TStringField;
    strngfldUniQuery_TestResult_0TestResult: TStringField;
    strngfldUniQuery_TestResult_0TestValue: TStringField;
    lbl4: TLabel;

    procedure FormCreate(Sender: TObject);
    {procedure Comm_0ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
    procedure Comm_0ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure EdtImeiKeyPress(Sender: TObject; var Key: Char);
    procedure MsgCheckIMEI(var msg:TMessage);message WM_CheckIMEI;
    procedure BtnReTestClick(Sender: TObject);
    procedure btnScanClick(Sender: TObject);
    procedure Comm_ScanReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure tmrRecScanTimeOutTimer(Sender: TObject);
    procedure EdtImeiChange(Sender: TObject);
    procedure rbPowerFirstClick(Sender: TObject);
    procedure rbScanImeiClick(Sender: TObject);
    procedure Comm_00ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure TestResultDetail_0DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
    function SendToScan(CmdKey:string;Cmd:string;WaitResponses:Boolean=True;
                        WaitResponseOverTime:Integer=3000*2;
                        ReturnText:string='';SubItemName:string='';
                        bCompare:Boolean=False;strCompare:string='';strRemark:string='';
                        bSendAtCommand:Boolean=True;
                        ResendNum:Integer=3;SendNum:Integer=0):Boolean;overload;    //发送内容至串口
    function SendToScan():Boolean;overload;
    procedure GetSendedScanCmdkey(var strReturnText:string;
                                    var strCmdCommKey:string;var bCompare:Boolean;
                                    var strCompare:string; var strRemark:string;
                                    var strSubTestItemName:string );                                          //获得发送至串口命令的关键字
  public
    { Public declarations }
    procedure StartTest(CommIndex:Integer);override;
    procedure ImeiPrompt(strPrompt:string);
    procedure SetResult(CommIndex:Integer;iResult:Integer);
    procedure MsgTestPass(var StrListNumberSign:TStringList;var comm:Integer);

    procedure DeComReceieveDataWriteImei(CommIndex:Integer);

    procedure TestDispose(CommIndex:Integer; bRedispose:Boolean);       //bRedispose:TRUE则还是当前测试大项，FALSE则为下一个测试大项
    procedure GetSubItemParam(CommIndex:Integer;strSubTestItem:string);  ///获得子项
    procedure SetTestItemResult(CommIndex:Integer; TestItem: string;
											TestResult: Integer;TestValue:string='';bSendNextCommand:Boolean=True);/////子项测试结果
    procedure InitAllControl(CommIndex:Integer);
    procedure AutoTest(CommIndex:Integer);
  end;

var
  frmWriteImeiTest: TfrmWriteImeiTest;
  bImeiEnable,bCommEnable:Boolean;          //IMEI有效,COMM口进入测试状态了
  strTempImei:string;       //烧入前扫描的IMEI
  sendtime:Integer;
implementation
uses uPublicFunc;
{$R *.dfm}
procedure TfrmWriteImeiTest.FormCreate(Sender: TObject);
var
    Count:Integer;
    CommList: TStrings;
    iCommIndex:Integer;
begin
  inherited;
    sendtime:=1;
    strTempImei:='';
    bCommEnable:=false;
    bImeiEnable:=False;

    CommList:= TStringList.Create;
    if GetSysComm(CommList) then
    begin
        for Count:= 0 to CommList.Count-1 do
        begin
            TComboBox(FindComponent('cbbComAgilent_1')).Items.Add(CommList[Count]);
            TComboBox(FindComponent('cbbComAgilent_1')).ItemIndex:=0;
        end;
    end;
    CommList.free;
    EdtImei.Enabled:=not rbPowerFirst.Checked;

    for iCommIndex:=0 to CommCount-1 do
    begin
      TestItemLists[iCommIndex].Clear;
      TestSubItemList[iCommIndex].Clear;
    end;

    if strAutoTestModel<>'' then
    begin
       //将测试大项放入数据列表中
      TestItemList.Clear;
      UniQuery_DstSubItem.Params.ParamByName('ItemModel').Value:=strAutoTestModel;
      UniQuery_DstSubItem.Open;
      UniQuery_DstSubItem.First;
      while not UniQuery_DstSubItem.Eof do
      begin
          TestItemList.Add(UniQuery_DstSubItem.FieldByName('ItemName').AsString);
          UniQuery_DstSubItem.Next;
      end;
    end;



end;
procedure TfrmWriteImeiTest.MsgTestPass(var StrListNumberSign:TStringList;var comm:Integer);
var
    CommIndex:Integer;
begin
    CommIndex:=comm;

    if StrToInt(StrListNumberSign.Values['Result'])<1 then
    begin
        Windows.Beep(2000,500);
        Windows.Beep(2000,500);
        ImeiPrompt('此机子其它测试项没测试通过');
        EdtImei.Text:='';
        strIMEI[CommIndex]:='';
        GrpTestPass.Visible:=True;
        if StrToInt(StrListNumberSign.Values['FunctionTest'])=0 then
        begin
            chk_FuncTest.Checked:=True;
        end;
        if StrToInt(StrListNumberSign.Values['GPS'])=0 then
        begin
            chk_GPSTest.Checked:=True;
        end;
        if StrToInt(StrListNumberSign.Values['CoupleTest'])=0 then
        begin
            chk_CoupleTest.Checked:=True;
        end;
        if StrToInt(StrListNumberSign.Values['ParamDownload'])=0 then
        begin
            chk_ParamDownload.Checked:=True;
        end;
        if StrToInt(StrListNumberSign.Values['AutoTest'])=0 then
        begin
            chk_AutoTest.Checked:=True;
        end;

    end
    else
    begin

      SendToComm(CommIndex,'AT','AT');
        //AutoTest(0);

        {if chkRF_BAR.Checked then
        begin
          SendToComm(CommIndex,'ATRFBAR','AT^GT_CM=RF_BAR');
        end
        else
        begin
          SendToComm(CommIndex,'AT','AT');
        end; }
    end;
end;
{procedure TfrmWriteImeiTest.Comm_0ReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Integer);}

procedure TfrmWriteImeiTest.Comm_00ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
    CommIndex:Integer;
begin
  inherited;
  CommIndex:=0;
  DeComReceieveDataWriteImei(CommIndex);

end;

procedure TfrmWriteImeiTest.Comm_0ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
var
    CommIndex:Integer;
    strSendText:string;
begin
  inherited;
    CommIndex:=0;
    DeComReceieveDataWriteImei(CommIndex);
end;

procedure TfrmWriteImeiTest.EdtImeiKeyPress(Sender: TObject;
  var Key: Char);
var
    CommIndex:Integer;
    strTemp,strSendText:string;
begin
    //只可输入数字和回车
    {if (((ord(key)<48) or (ord(key) >57)) and (key<>#13) and (key<>#8) ) then   key:=#0;

    if key=#13 then
    begin
        CommIndex:=0;
        strIMEI[CommIndex]:=EdtImei.Text;

        if (Length(strIMEI[CommIndex])=15) then
        begin
            if strIMEI[CommIndex]<>CheckImei(strIMEI[CommIndex]) then
            begin
                ImeiPrompt('条码不合法,请重新扫描!');
                EdtImei.Text:='';
                EdtImei.SetFocus;
                SendToScan('LON','LON',True,20000);
            end
            else
            begin
                if bCommEnable then
                begin
                    strSendText:=Format('Action=CheckIMEI#IMEI=%s#Tester=%s#',[strIMEI[CommIndex],User.UserName]);
                    SendToServer(CommIndex,'CheckIMEI',strSendText,True,CTimeOut*2);
                    EdtImei.Enabled:=False;
                    strTempImei:=EdtImei.Text;
                end
                else
                    strTempImei:=EdtImei.Text;
            end;
        end
        else
            Exit;
    end; }
end;
procedure TfrmWriteImeiTest.MsgCheckIMEI(var msg:TMessage);
var
  CommIndex:Integer;
  sendIMEITest:string;
begin
    CommIndex:=0;
    Application.ProcessMessages;
    bImeiEnable:=False;
    EdtImei.Enabled:=True;
    if msg.LParam>=1 then
    begin
        ImeiPrompt('此条码已烧写过，请联系管理员!');
        EdtImei.Text:='';
        strIMEI[CommIndex]:='';
        bImeiEnable:=False;
    end
    else
    begin
        ImeiPrompt('条码正在烧写，请稍等!');
        //msg.wParam为串口号
        //GT02B用的是SIM2,所以写指令为AT+EGMR=2,7,"%s"
        {if strTempImei<>'' then
        begin
          if (Pos('GT02B',strSoftModel[msg.wParam])>0) or (Pos('TR02B',strSoftModel[msg.wParam])>0) then
          //if strSoftModel[msg.wParam]='GT02B' then
          begin
              SendToComm(msg.WParam,'ATEGMR',Format('AT+EGMR=1,10,"%s"',[strTempImei]),True,CTimeOut*10);
          end
          else
          begin
              SendToComm(msg.WParam,'ATEGMR',Format('AT+EGMR=1,7,"%s"',[strTempImei]),True,CTimeOut*10);
          end;
        end;}

       GetSendedCommCmdkey(CommIndex,strCmdReturnText[CommIndex],strCmdCommKey[CommIndex],
                        bCompare[CommIndex],strCompare[CommIndex],strRemark[CommIndex],strSubTestItemName[CommIndex],strRemark2[CommIndex]);
       sendIMEITest:=Format('%s,%s',[strCmdCommKey[CommIndex],strTempImei]);

       SendToComm(CommIndex);
       SendToComm(msg.WParam,'ATEGMR',sendIMEITest,True,CTimeOut*5);
    end;
    Application.ProcessMessages;
end;
procedure TfrmWriteImeiTest.StartTest(CommIndex:Integer);
begin
    strPlanName:='WriteImei';
    ImeiPrompt('');
    if rbScanImei.Checked then
    begin
      EdtImei.Enabled:=True;
      EdtImei.SetFocus;
    end;
    bCommEnable:=False;
    GrpTestPass.Visible:=False;
    chk_AutoTest.Checked:=False;
    chk_CoupleTest.Checked:=False;
    chk_FuncTest.Checked:=False;
    chk_GPSTest.Checked:=False;
    chk_ParamDownload.Checked:=False;

    TfrmModule(CurrentFrom).SetResult(CommIndex,-2);
    BeginTest(CommIndex);
    //bGetTestItemed[CommIndex]:=True;
end;
procedure TfrmWriteImeiTest.ImeiPrompt(strPrompt:string);
begin
    lblPrompt.Caption:=strPrompt;
end;
procedure TfrmWriteImeiTest.SetResult(CommIndex:Integer;iResult:Integer);         //设置测试结果
begin

    //测试结束后,所有显示恢复开始状态
    if (iResult=0) or (iResult=-6) or(iResult=-5) or(iResult=-4) or (iResult=1) then
    begin
      TTimer(FindComponent('tmrCountdown_'+inttostr(CommIndex))).Enabled:=False;
      //TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Caption:='FAIL';
      //TPanel(FindComponent('TestResult'+inttostr(CommIndex))).Color:=clRed;
      ChectAllowStartTest(CommIndex);
      TStatusBar(FindComponent('SB_TestStatus_'+inttostr(CommIndex))).Panels[1].Text:='测试完成';
      TStatusBar(FindComponent('SB_TestStatus_'+inttostr(CommIndex))).Panels[2].Text:=Format('总耗测试时间:%f秒',[(GetTickCount-TestStartTickCount[CommIndex])/1000]);;
      bAppendResult[CommIndex]:=False;
      if iResult=1 then Edt_PreImei.Text:=EdtImei.Text;

      ImeiPrompt('');
      EdtImei.Text:='';
      strIMEI[CommIndex]:='';
      EdtImei.Enabled:=not rbPowerFirst.Checked;
      if EdtImei.Enabled then
        EdtImei.SetFocus;
      strTempImei:='';
      bCommEnable:=false;
      bImeiEnable:=False;
      Application.ProcessMessages;
    end;


end;
procedure TfrmWriteImeiTest.BtnReTestClick(Sender: TObject);
var
  CommIndex:Integer;
begin
  inherited;
    CommIndex:=0;
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

procedure TfrmWriteImeiTest.btnScanClick(Sender: TObject);
var
    strComPort:string;
begin
  inherited;
    Application.ProcessMessages;
    if btnScan.Caption='连接' then
    begin
        strComPort:=cbbComAgilent_1.Text;
        if strComPort='' then
        begin
            MessageDlg('请选择串口!',mtInformation,mbOKCancel,0);
            Exit;
        end;

        try
            Comm_Scan.CommName:= strComPort;
            cbbComAgilent_1.Enabled:=False;
            Comm_Scan.StartComm;
            Sleep(100);
            btnScan.Caption:='断开';
            btnScan.Enabled:=True;
            ScanInfo.bConnected:=True;
            SendToScan('SSET','SSET');
            {SendToScan('KEYENCE','KEYENCE');
            SendToScan('RP35','RP35');
            SendToScan('RP30','RP30');
            SendToScan('RP31','RP31');
            SendToScan('RP32','RP32');
            SendToScan('RP33','RP33');
            SendToScan('RP34','RP34');
            SendToScan('RP44','RP44');
            SendToScan('RP36','RP36');
            SendToScan('SEND','SEND');
            SendToScan('SSET','SSET');
            SendToScan('KEYENCE','KEYENCE');}
            SendToScan('SEND','SEND');
        except
            //on ECommsError do
            begin
                MessageDlg('端口不存在或已被占用或其它!',mtInformation,mbOKCancel,0);
                cbbComAgilent_1.Enabled:=True;
                btnScan.Caption:='连接';
                ScanInfo.bConnected:=False;
            end;
        end;
    end
    else if btnScan.Caption='断开'  then
    begin
        cbbComAgilent_1.Enabled:=True;
        try
            Comm_Scan.StopComm;
            btnScan.Caption:='连接';
            ScanInfo.bConnected:=False;
        except
            MessageDlg('端口断开失败!',mtInformation,mbOKCancel,0);
            btnScan.Caption:='断开';
            ScanInfo.bConnected:=True;
        end;
    end;
    Application.ProcessMessages;
end;

//============================发送数据至串口============================//
function TfrmWriteImeiTest.SendToScan(CmdKey:string;Cmd:string;WaitResponses:Boolean;
                        WaitResponseOverTime:Integer;
                        ReturnText:string;SubItemName:string;
                        bCompare:Boolean;strCompare:string;strRemark:string;
                        bSendAtCommand:Boolean;
                        ResendNum:Integer;SendNum:Integer):Boolean;    //发送内容至串口
var
  SendScanRecord:PSendCommRecord;                         //发送至扫描的命令
begin
    Result:=True;
    //若未连接串口则视为失败
    if not ScanInfo.bConnected then
    begin
        //MessageBox(0,'发送串口失败,查看串口是否连接!','警告',MB_ICONWARNING+MB_OK);
        Result:=False;
    end
    else
    begin
        //是否等待回应，若是则加入发送列表中，否则直接发送
        if WaitResponses then
        begin
            try
              New(SendScanRecord);
              SendScanRecord^.bInvalidation:=False;
              SendScanRecord^.sCmdKey:=CmdKey;
              SendScanRecord^.sCmd:=Cmd+#13;
              SendScanRecord^.sReturnText:=ReturnText;
              SendScanRecord^.bWaitResponses:=WaitResponses;
              SendScanRecord^.iWaitResponseOverTime:=WaitResponseOverTime;
              SendScanRecord^.iResendNum:=ResendNum;
              SendScanRecord^.iSendNum:=1;
              SendScanRecord^.sSubItemName:=SubItemName;
              SendScanRecord^.bCompare:=bCompare;
              SendScanRecord^.strCompare:=strCompare;
              SendScanRecord^.strRemark:=strRemark;
              SendScanRecord^.bSendAtCommand:=bSendAtCommand;

              SendScanList.Add(SendScanRecord);
            finally
              //Dispose(SendScanRecord);
            end;

            if SendScanList.Count<=1 then
            begin
               SendToScan();
            end;
            Application.ProcessMessages;
        end
        else
        begin
            NoteCommLog(10,'[S:]===='+Cmd);
            if bSendAtCommand then
            begin
                Comm_Scan.WriteCommData(PChar(Cmd+#13),StrLen(PChar(Cmd+#13)));
            end;
            Application.ProcessMessages;
        end;
    end;
    Application.ProcessMessages;
end;
//============================发送下一条内容至服务器============================//
function TfrmWriteImeiTest.SendToScan():Boolean;
label FindHead;
var
    strTemp:string;
    SendScanRecord:PSendCommRecord;                         //发送至扫描的命令
begin
    try
      tmrRecScanTimeOut.Enabled:=False;
FindHead:
      if SendScanList.Count>0 then
      begin
          New(SendScanRecord);
          SendScanRecord:=SendScanList.Items[0];
          if SendScanRecord^.bInvalidation then
          begin
              SendScanList.Delete(0);
              goto FindHead;
          end;
          SendScanRecord^.bInvalidation:=True;
          SendScanList.Delete(0);
          SendScanList.Insert(0,SendScanRecord);

          NoteCommLog(10,'[S:]===='+SendScanRecord^.sCmd);

          if SendScanRecord^.bSendAtCommand then
          begin
              Comm_Scan.WriteCommData(PChar(SendScanRecord.sCmd),StrLen(PChar(SendScanRecord.sCmd)));
          end;

          if (SendScanRecord^.bWaitResponses) and (SendScanRecord^.iWaitResponseOverTime>0) then
          begin
              tmrRecScanTimeOut.Interval:=SendScanRecord^.iWaitResponseOverTime;
              tmrRecScanTimeOut.Enabled:=True;
          end;
      end;
    finally
      //Dispose(SendScanRecord);
    end;
    Result:=True;
end;

procedure TfrmWriteImeiTest.Comm_ScanReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
var
    strSendText:string;
    strCmdReturnText,strReturnText,strCmdScanKey,strCompare,strRemark, strSubTestItemName:string;
    bCompare:Boolean;
    StrCommRecText:string;
begin
  inherited;
    SetLength(StrCommRecText,BufferLength);
    Move(Buffer^,PChar(StrCommRecText)^,BufferLength);

    StrCommRecText:=UpperCase(StrCommRecText);
    NoteCommLog(10,StrCommRecText);

    GetSendedScanCmdkey(strCmdReturnText,strCmdScanKey,
                            bCompare,strCompare,strRemark,strSubTestItemName);
    if strCmdScanKey= 'SSET' then
    begin
        if (pos('OK',StrCommRecText)>0) then
        begin
            SendToScan();
        end
        else
            Exit;
    end
    else if strCmdScanKey= 'SEND' then
    begin
        if (pos('OK',StrCommRecText)>0) then
        begin
            SendToScan();
        end
        else
            Exit;
    end
    else if strCmdScanKey= 'LON' then
    begin
        if Length(StrCommRecText)>=15 then
        begin
            SendToScan();
            if pos(#$D,StrCommRecText)<>0 then
                StrCommRecText:=stringreplace(StrCommRecText,#$D,'',[rfReplaceAll]);
            //strTempImei:=StrCommRecText;
            EdtImei.Text:=StrCommRecText;
        end
        else
            exit;
    end
    else if strCmdScanKey= 'LOFF' then
    begin
        if (pos('OK',StrCommRecText)>0) then
        begin
            SendToScan();
        end
        else
            Exit;
    end
    else
       SendToScan();
end;
//获得当前发送至串口命令的相关信息
procedure TfrmWriteImeiTest.GetSendedScanCmdkey(var strReturnText:string;
                                                    var strCmdCommKey:string;var bCompare:Boolean;
                                                    var strCompare:string; var strRemark:string;
                                                    var strSubTestItemName:string);
//strReturnText:返回值 strCmdCommKey:关键字,bCompare:是否需要比对,strCompare:比对值的范围,strRemark:字符分割符
//strSubTestItemName:子测试项名称
var
  SendScanRecord:PSendCommRecord;                         //发送至扫描的命令
begin
    strCmdCommKey:='';
    strReturnText:='';
    bCompare:=False;
    strCompare:='';
    strRemark:='';
    strSubTestItemName:='';
    if (SendScanList.Count>0) then
    begin
        try
          New(SendScanRecord);
          SendScanRecord:=SendScanList.Items[0];

          if {(SendCommRecord^.bWaitResponses) and} (SendScanRecord^.bInvalidation) then
          begin
              strCmdCommKey:=UpperCase(SendScanRecord^.sCmdKey);
              strReturnText:=UpperCase(SendScanRecord^.sReturnText);
              bCompare:=SendScanRecord^.bCompare;
              strCompare:=UpperCase(SendScanRecord^.strCompare);
              strRemark:=UpperCase(SendScanRecord^.strRemark);
              strSubTestItemName:=UpperCase(SendScanRecord^.sSubItemName);
          end;
        finally
          //Dispose(SendScanRecord);
        end;
    end;
end;

procedure TfrmWriteImeiTest.tmrRecScanTimeOutTimer(Sender: TObject);
var
  SendScanRecord:PSendCommRecord;                         //发送至扫描的命令
begin
  tmrRecScanTimeOut.Enabled:=False;
  if SendScanList.Count<1 then Exit;
  try
    New(SendScanRecord);
    SendScanRecord:=SendScanList.Items[0];
    if (SendScanRecord.bWaitResponses) and (SendScanRecord.iResendNum>0) then
    begin
      if SendScanRecord.iSendNum < SendScanRecord.iResendNum then
      begin
        SendScanRecord.bInvalidation:=False;
        SendScanRecord.iSendNum:=SendScanRecord.iSendNum+1;
        SendToScan();
      end
      else
      begin
        begin
          begin
            SetStatusText(Format('发送至扫描枪超时!%s请查看串口是否连接!',[SendScanRecord.sCmdKey]),0);
          end;
        end;
      end;
    end;
  finally
    //Dispose(SendScanRecord);
  end;
end;

procedure TfrmWriteImeiTest.EdtImeiChange(Sender: TObject);
var
  CommIndex:Integer;
  strTemp,strSendText:string;
begin
  inherited;
  CommIndex:=0;
  if (Length(EdtImei.Text)=15) {and bAllowChangeImei} then
  begin
    strIMEI[CommIndex]:=EdtImei.Text;
    if strIMEI[CommIndex]<>CheckImei(strIMEI[CommIndex]) then
    begin
      ImeiPrompt('条码不合法,请重新扫描!');
      EdtImei.Text:='';
      EdtImei.SetFocus;
      SendToScan('LON','LON',True,20000);
    end
    else
    begin
      if bCommEnable then
      begin
        strSendText:=Format('Action=CheckIMEI#IMEI=%s#Tester=%s#',[strIMEI[CommIndex],User.UserName]);
        SendToServer(CommIndex,'CheckIMEI',strSendText,True,CTimeOut*2);
        EdtImei.Enabled:=False;
        strTempImei:=EdtImei.Text;
      end
      else
        strTempImei:=EdtImei.Text;
    end;
  end
  else
    Exit;
end;

procedure TfrmWriteImeiTest.rbPowerFirstClick(Sender: TObject);
begin
  inherited;
  EdtImei.Enabled:=not rbPowerFirst.Checked;
end;

procedure TfrmWriteImeiTest.rbScanImeiClick(Sender: TObject);
begin
  inherited;
  EdtImei.Enabled:=not rbPowerFirst.Checked;
  if EdtImei.Enabled then EdtImei.SetFocus;
end;

procedure TfrmWriteImeiTest.DeComReceieveDataWriteImei(CommIndex:Integer);
var
  strSendText:string;

begin
   GetSendedCommCmdkey(CommIndex,strCmdReturnText[CommIndex],strCmdCommKey[CommIndex],
                            bCompare[CommIndex],strCompare[CommIndex],strRemark[CommIndex],strSubTestItemName[CommIndex],strRemark2[CommIndex]);
    if strCmdCommKey[CommIndex]= 'AT' then
    begin
        sendtime:=1;//这里置1，是因为机子已通过了RF校准，不然会累加
        if (pos('OK',StrCommRecText[CommIndex])>0) then
        begin
            SendToComm(CommIndex);
            AutoTest(CommIndex);
            //可以扫描条码
            //bAllowChangeImei:=True;
            {EdtImei.Enabled:=True;
            EdtImei.SetFocus;
            ImeiPrompt('请扫描条码!');
            SendToScan('LON','LON',True,20000);
            bCommEnable:=True;
            if strTempImei<>'' then
            begin
                strIMEI[CommIndex]:=strTempImei;
                strSendText:=Format('Action=CheckIMEI#IMEI=%s#Tester=%s#',[strIMEI[CommIndex],User.UserName]);
                SendToServer(CommIndex,'CheckIMEI',strSendText,True,CTimeOut*2);
                EdtImei.Enabled:=False;
                strTempImei:=EdtImei.Text;
            end; }

        end
        else
            Exit;
    end
    else if (Pos('SENSOR',StrCommRecText[CommIndex])>0) AND (strRemark[CommIndex]<>'SENSOR') then
    begin
      Sleep(1);
      Exit;
    end
    else if (strRemark[CommIndex]='IMEI') then
    begin
        bCheckTestWriteIMEI:=True;
        EdtImei.Enabled:=True;
        EdtImei.SetFocus;
        ImeiPrompt('请扫描条码!');
        SendToScan('LON','LON',True,20000);
        bCommEnable:=True;
        if strTempImei<>'' then
        begin
            strIMEI[CommIndex]:=strTempImei;
            strSendText:=Format('Action=CheckIMEI#IMEI=%s#Tester=%s#',[strIMEI[CommIndex],User.UserName]);
            SendToServer(CommIndex,'CheckIMEI',strSendText,True,CTimeOut*2);
            EdtImei.Enabled:=False;
            strTempImei:=EdtImei.Text;
        end;
        Exit;
    end

    {else if (strCmdCommKey[CommIndex]='AT+EGMR') then
    begin
        EdtImei.Enabled:=True;
        EdtImei.SetFocus;
        ImeiPrompt('请扫描条码!');
        SendToScan('LON','LON',True,20000);
        bCommEnable:=True;
        if strTempImei<>'' then
        begin
            strIMEI[CommIndex]:=strTempImei;
            strSendText:=Format('Action=CheckIMEI#IMEI=%s#Tester=%s#',[strIMEI[CommIndex],User.UserName]);
            SendToServer(CommIndex,'CheckIMEI',strSendText,True,CTimeOut*2);
            EdtImei.Enabled:=False;
            strTempImei:=EdtImei.Text;
        end;
        Exit;
    end }
    else if (strCmdCommKey[CommIndex]= 'ATEGMR') then
    begin
        if Pos('OK',StrCommRecText[CommIndex])>0 then
        begin
            //清除条码框内容
            //SendToComm(CommIndex);
            ImeiPrompt('');
            EdtImei.Enabled:=False;
            //Sleep(2000);
            //SendToComm(CommIndex,'ATFACTORY','AT^GT_CM=FACTORYALL',True,CTimeOut);
            SetTestItemResult(CommIndex,TestItemLists[CommIndex].Strings[0],1,'烧写成功');
            Sleep(2000);
        end
        else
            Exit;
    end
    else if (strRemark2[CommIndex]='CHKIMEI') then
    begin
      if Pos('+EGMR:',StrCommRecText[CommIndex])>0 then
      begin
        NoteCommLog(CommIndex,'[R:]====IMEI返回值===' + StrCommRecText[CommIndex]);
        if Pos(strTempImei,StrCommRecText[CommIndex])>0 then
        begin
            //SendToComm(CommIndex);
            SetTestItemResult(CommIndex,TestItemLists[CommIndex].Strings[0],1);
        end
      end
      else
      begin
         Exit;
      end;
    end
    {else if (strCmdCommKey[CommIndex]= 'ATFACTORY') then
    begin
        if Pos('OK',StrCommRecText[CommIndex])>0 then
        begin
            SendToComm(CommIndex);
            TfrmModule(CurrentFrom).SetResult(CommIndex,1);
        end
        else
            Exit;

    end}
    else if (pos(strCmdReturnText[CommIndex],StrCommRecText[CommIndex])>0) then
    begin
      if strCmdReturnText[CommIndex]='TEST' then
      begin
        if pos('AT^GT_CM-TEST',StrCommRecText[CommIndex])>0 then
        begin
          if MidStr(StrCommRecText[CommIndex],pos('AT^GT_CM-TEST',StrCommRecText[CommIndex])+strlen('AT^GT_CM-TEST'),4)<>'TEST'  then
          begin
            //SetTestItemResult(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0],0);
            Exit;
          end;
        end;
      end;
      if strCmdReturnText[CommIndex]<>'TEST_OK' then
      begin
        if TestItemLists[CommIndex].Count>0  then
        begin
          SetTestItemResult(CommIndex,TestItemLists[CommIndex].Strings[0],1,'');
        end;
      end;
    end;
    {else if (strCmdCommKey[CommIndex]='ATRFBAR') then
    begin
        if Pos('NONE',StrCommRecText[CommIndex])<>0 then
        begin
            SendToComm(CommIndex);
            ImeiPrompt('RF参数未校准!');
            TfrmModule(CurrentFrom).SetResult(CommIndex,0);
            ImeiPrompt('RF参数未校准!');

        end
        else if Pos('Fail',StrCommRecText[CommIndex])<>0 then
        begin
            SendToComm(CommIndex);
            ImeiPrompt('RF参数校准失败!');
            TfrmModule(CurrentFrom).SetResult(CommIndex,0);
            ImeiPrompt('RF参数校准失败!');
        end
        else if Pos('PASS',StrCommRecText[CommIndex])<>0 then
        begin
          SendToComm(CommIndex);
          SendToComm(CommIndex,'AT','AT',True,CTimeOut);
          //NoteCommLog(CommIndex,StrCommRecText[CommIndex]);
          //TfrmModule(CurrentFrom).SetResult(CommIndex,1);
        end
        else
          if sendtime=5 then //现在重发机制是5次，看SendToComm
          begin
             sendtime:=1;
             ImeiPrompt('未查到RF状态');
             TfrmModule(CurrentFrom).SetResult(CommIndex,0);
             ImeiPrompt('未查到RF状态');
          end
          else
          begin
             sendtime:=sendtime+1;
             Exit;
          end;
    end;}
end;

procedure TfrmWriteImeiTest.TestDispose(CommIndex:Integer; bRedispose:Boolean);
var
    strTestItem:string;
begin
    //一大测试项完成
    if (not bRedispose) then
    begin
        if TestItemLists[CommIndex].Count>=0 then
        begin
            //NoteErrorCommLog(CommIndex,TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0]);
            TestItemLists[CommIndex].Delete(0);
        end;
    end;

    if TestItemLists[CommIndex].Count<=0 then
    begin
        if bTestFail[CommIndex] then
        begin
            NoteCommLog(CommIndex,'[S:]====TestFailTESTDISPOSE');
            SetResult(CommIndex,0);
        end
        else
        begin
           if bCheckTestWriteIMEI then
           begin
              TfrmModule(CurrentFrom).SetResult(CommIndex,1);
              Exit;
           end
           else
           begin
              ImeiPrompt('未进行烧写IMEI指令');
                NoteCommLog(CommIndex,'[S:]====IEMIout');
               TfrmModule(CurrentFrom).SetResult(CommIndex,0);
              Exit;
           end;
        end;

    end;

    strTestItem:=TestItemLists[CommIndex].Strings[0];
    GetSubItemParam(CommIndex,strTestItem);

end;

procedure TfrmWriteImeiTest.GetSubItemParam(CommIndex:Integer; strSubTestItem:string);
var
  strTemp,strCmd,strSendText:string;
begin
   strTemp:=SysUtils.Format('ItemModel=''%s'' and ItemName=''%s''',[strAutoTestModel,strSubTestItem]);

    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Active:=False;
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Filter:=strTemp;
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Filtered:=True;
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Active:=True;
    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).First;
    TestSubItemList[CommIndex].Clear;
    while not TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Eof do
    begin
      strCmd:=(TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('SubItemName').AsString);
      NoteCommLog(CommIndex,TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('SubItemName').AsString);
      strCmd:=TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('AtComm').AsString;

      TestSubItemList[CommIndex].Add(TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('SubItemName').AsString);
     // strRemark[CommIndex]:=TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('Remark1').AsString;

      {if strRemark[CommIndex]='IMEI' then
      begin
          bCheckTestWriteIMEI:=True;
          EdtImei.Enabled:=True;
          EdtImei.SetFocus;
          ImeiPrompt('请扫描条码!');
          SendToScan('LON','LON',True,20000);
          bCommEnable:=True;
          if strTempImei<>'' then
          begin
              strIMEI[CommIndex]:=strTempImei;
              strSendText:=Format('Action=CheckIMEI#IMEI=%s#Tester=%s#',[strIMEI[CommIndex],User.UserName]);
              SendToServer(CommIndex,'CheckIMEI',strSendText,True,CTimeOut*2);
              EdtImei.Enabled:=False;
              strTempImei:=EdtImei.Text;
          end;
          Exit;
      end;}
      SendToComm(CommIndex,strCmd,strCmd+#13+#10,
                    True,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('TestTimeOut').AsInteger*1000,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('ReturnText').AsString,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('SubItemName').AsString,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('Compare').AsBoolean,
                    '',
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('Remark1').AsString,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('SendAtComm').AsBoolean,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('ReSendNum').AsInteger,
                    TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).FieldByName('Remark2').AsString);
      TUniQuery(FindComponent('UniQuery_TestItemParam_ByItemName_'+inttostr(CommIndex))).Next;

    end;
end;

procedure TfrmWriteImeiTest.SetTestItemResult(CommIndex:Integer; TestItem: string;
											TestResult: Integer;TestValue:string;bSendNextCommand:Boolean);
var
    strResult:string;
begin
    Sleep(10);
    GetSendedCommCmdkey(CommIndex,strCmdReturnText[CommIndex],strCmdCommKey[CommIndex],
                        bCompare[CommIndex],strCompare[CommIndex],strRemark[CommIndex],strSubTestItemName[CommIndex],strRemark2[CommIndex]);
    if (strCmdCommKey[CommIndex]<>'ATALLOWTEST')then
    begin
        case TestResult of
          0:
                begin
                    strResult:='FAIL';
                    bTestFail[CommIndex]:=True;
                end;
          1:
                begin
                  if strRemark[CommIndex]='DISPLAY' then
                  begin
                      TestValue:=StrCommRecText[CommIndex];
                  end;
                  strResult:='PASS';
                  //TestResultDetail_0.Columns[2].Color:=clLime;
                end;
        end;
        //TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Append;
        TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestResult').Value:=strResult;
        TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).FieldByName('TestValue').Value:=TestValue;
        TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Post;
        TUniQuery(FindComponent('UniQuery_TestResult_'+inttostr(CommIndex))).Last;
    end;

    //测试失败则终止测试,否则继续测试
    if (TestResult=0) and (not BasicTestParam.FailContinueTest) then
    begin
       SetResult(CommIndex,0);
        NoteCommLog(CommIndex,'[S:]====TestFail');
    end
    else
    begin
        if bSendNextCommand then
        begin
            strTestValue[CommIndex]:='';
            SendToComm(CommIndex);
            //NoteErrorCommLog(CommIndex,'SetTestItemResult'+TListBox(FindComponent('TesItem_Comm'+inttostr(CommIndex))).Items[0]);

            if TestSubItemList[CommIndex].Count>0 then
              TestSubItemList[CommIndex].Delete(0);

            //NoteErrorCommLog(CommIndex,'SetTestItemResult'+inttostr(TListBox(FindComponent('TestItemParam_Comm'+inttostr(CommIndex))).Count)+
                IntToStr(SendCommList[CommIndex].Count);
            //Sleep(100);
            if ((TestSubItemList[CommIndex].Count<=0) and
                (SendCommList[CommIndex].Count<=0)) then
            begin
              TestDispose(CommIndex,False);
            end
        end;
    end;


end;

procedure TfrmWriteImeiTest.InitAllControl(CommIndex:Integer);
var
    iIndex:Integer;
begin
    //删除测试详细结果
    UniQuery_TestResult_0.Open;
    UniQuery_TestResult_0.First;
    while not UniQuery_TestResult_0.Eof do
    begin
        UniQuery_TestResult_0.Delete;
    end;
    UniQuery_TestResult_0.Refresh;
    for iIndex := 1 to SB_TestStatus_0.Panels.Count-1 do
    begin
        SB_TestStatus_0.Panels[iIndex].Text:='';
    end;
    lblPrompt.Caption:='';

end;

procedure TfrmWriteImeiTest.AutoTest(CommIndex:Integer);
var
    Index: Integer;
    strTemp:string;
begin
    Application.ProcessMessages;
    bTestFail[CommIndex]:=False;
    bCheckTestWriteIMEI:=False;
    //恢复串口的测试状态
    bAppendResult[CommIndex]:=True;
    InitAllControl(CommIndex);
    TestItemLists[CommIndex].Clear;
    for Index := 0 to TestItemList.Count - 1 do
        TestItemLists[CommIndex].Add(TestItemList.Strings[index]);

    if TestItemLists[CommIndex].Count<=0 then
    begin
        MessageBox(Handle,'请选择测试项？','警告！',MB_ICONWARNING);
        SetResult(CommIndex,0);
    end
    else
    begin
        SerialInfo[CommIndex].bAllowTest:=True;
        //开始测试
        TestDispose(CommIndex,True);
    end;

end;

procedure TfrmWriteImeiTest.TestResultDetail_0DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    CommIndex:Integer;
begin
    CommIndex:=0;
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

end.
