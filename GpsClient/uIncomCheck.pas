unit uIncomCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, MemDS, DBAccess, Uni,uGlobalVar, uPublicFunc,SPComm,IniFiles,StrUtils,ComDrv32;

type
  TfrmIncomCheck = class(TForm)
    pnlBox: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    edtBoxNo: TEdit;
    edtPercentage: TEdit;
    edtTCount: TEdit;
    pnlTestResultBox: TPanel;
    grp1: TGroupBox;
    lbl7: TLabel;
    cbbCom_1: TComboBox;
    lbl1: TLabel;
    cbbCom_2: TComboBox;
    lbl4: TLabel;
    lbl5: TLabel;
    cbbCom_3: TComboBox;
    lbl6: TLabel;
    cbbCom_4: TComboBox;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    btn_twiceAll: TButton;
    btnStart_1: TButton;
    btnStart_2: TButton;
    btnStart_3: TButton;
    btnStart_4: TButton;
    lbl10: TLabel;
    ds1: TDataSource;
    unqry_BoxCount: TUniQuery;
    ds2: TDataSource;
    unqry_LoadSMTIncomingBOXNO: TUniQuery;
    Comm_1: TComm;
    Comm_2: TComm;
    Comm_3: TComm;
    Comm_4: TComm;
    Comm_01: TCommPortDriver;
    Comm_02: TCommPortDriver;
    Comm_03: TCommPortDriver;
    Comm_04: TCommPortDriver;
    tmrCheckAllowTest_1: TTimer;
    tmrCheckAllowTest_2: TTimer;
    tmrCheckAllowTest_3: TTimer;
    tmrCheckAllowTest_4: TTimer;
    unqry_LoadSMTIncomingBOXNOBoxNo: TStringField;
    unqry_LoadSMTIncomingBOXNOSN: TStringField;
    unqry_LoadSMTIncomingBOXNOID: TIntegerField;
    tmrRecCommTimeOut_1: TTimer;
    tmrRecCommTimeOut_2: TTimer;
    tmrRecCommTimeOut_3: TTimer;
    tmrRecCommTimeOut_4: TTimer;
    unqry_TestResult_2: TUniQuery;
    unqry_TestResult_1: TUniQuery;
    unqry_TestResult_3: TUniQuery;
    unqry_TestResult_4: TUniQuery;
    dsDS_TestResult_1: TDataSource;
    dsDS_TestResult_2: TDataSource;
    dsDS_TestResult_3: TDataSource;
    dsDS_TestResult_4: TDataSource;
    btnReTest_1: TButton;
    btnReTest_2: TButton;
    btnReTest_3: TButton;
    btnReTest_4: TButton;
    procedure edtBoxNoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnStart_1Click(Sender: TObject);
    procedure btnStart_2Click(Sender: TObject);
    procedure btnStart_3Click(Sender: TObject);
    procedure btnStart_4Click(Sender: TObject);
    procedure Comm_1ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Comm_01ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure Comm_2ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Comm_3ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Comm_4ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure tmrCheckAllowTest_1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrCheckAllowTest_2Timer(Sender: TObject);
    procedure tmrRecCommTimeOut_1Timer(Sender: TObject);
    procedure tmrCheckAllowTest_3Timer(Sender: TObject);
    procedure tmrCheckAllowTest_4Timer(Sender: TObject);
    procedure tmrRecCommTimeOut_2Timer(Sender: TObject);
    procedure tmrRecCommTimeOut_3Timer(Sender: TObject);
    procedure tmrRecCommTimeOut_4Timer(Sender: TObject);
    procedure Comm_02ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure Comm_03ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure Comm_04ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure btn_twiceAllClick(Sender: TObject);
    procedure btnReTest_1Click(Sender: TObject);
    procedure btnReTest_2Click(Sender: TObject);
    procedure btnReTest_3Click(Sender: TObject);
    procedure btnReTest_4Click(Sender: TObject);
    //procedure ResumeTestStatus();

  private
    { Private declarations }
    {function SendToComm_TestParam(CommIndex:Integer;CmdKey:string;Cmd:string;WaitResponses:Boolean=True;
                        WaitResponseOverTime:Integer=3000*2;
                        ReturnText:string='';SubItemName:string='';
                        bCompare:Boolean=False;strCompare:string='';strRemark:string='';
                        bSendAtCommand:Boolean=True;
                        ResendNum:Integer=3;SendNum:Integer=0):Boolean;overload;    //发送内容至串口
    function SendToComm_TestParam(CommIndex:Integer):Boolean;overload;     }
  public
    { Public declarations }
  procedure StartComm(CommIndex:Integer);                            //打开串口
  procedure DeComReceieveDataIncomCheck(CommIndex:Integer);
  procedure CompareChipId(CommIndex:Integer;chipID:string);
  procedure SetDisplayResult(CommIndex:Integer;iResult:Integer);
  function SendToComm_TestParam(CommIndex:Integer;CmdKey:string;Cmd:string;WaitResponses:Boolean=True;
                        WaitResponseOverTime:Integer=3000;
                        ReturnText:string='';SubItemName:string='';
                        bCompare:Boolean=False;strCompare:string='';strRemark:string='';
                        bSendAtCommand:Boolean=True;
                        ResendNum:Integer=3;strRemark2:string='';SendNum:Integer=0):Boolean;overload;    //发送内容至串口

    function SendToComm_TestParam(CommIndex:Integer):Boolean;overload;
    procedure ChectAllowStartTest(CommIndex:Integer);
    procedure InitAllControl(CommIndex:Integer);
    procedure StartTest(CommIndex:Integer);
    procedure MsgTwiceByBoxNox(var msg:TMessage);message WM_TwiceByBoxNo;
  end;

var
  frmIncomCheck: TfrmIncomCheck;
  TextCount:Integer;
  Percentage:Integer;
  TestPassContList:TStringList;
implementation

uses uClientMain;
//uses
 // uPublicFunc,uClientMain;
{$R *.dfm}

procedure TfrmIncomCheck.edtBoxNoKeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then
    begin
      if edtBoxNo.Text='' then
      begin
        MessageBox(0, '输入或扫描箱号', '错误', MB_OK + MB_OKCANCEL);
        Exit;
      end;

      unqry_LoadSMTIncomingBOXNO.Open;
      unqry_LoadSMTIncomingBOXNO.First;
      while not unqry_LoadSMTIncomingBOXNO.Eof do
      begin
        unqry_LoadSMTIncomingBOXNO.Delete;
      end;
        unqry_BoxCount.Active:=False;
        unqry_BoxCount.Params[0].AsString:=Trim(edtBoxNo.Text);
        unqry_BoxCount.Active:=True;
        //edtPercentage.Text:=IntToStr(unqry_BoxCount.RecordCount);
        TextCount:=unqry_BoxCount.RecordCount*StrToInt(edtPercentage.Text);
        TextCount:=Trunc(TextCount*0.01);
        //edtTCount.Text
        unqry_BoxCount.First;
      while not unqry_BoxCount.Eof do
      begin
        unqry_LoadSMTIncomingBOXNO.Last;
        unqry_LoadSMTIncomingBOXNO.Append;
        unqry_LoadSMTIncomingBOXNO.FieldByName('BoxNo').Value:= unqry_BoxCount.FieldByName('BoxNo').AsString;
        unqry_LoadSMTIncomingBOXNO.FieldByName('SN').Value:= unqry_BoxCount.FieldByName('SN').AsString;
        unqry_BoxCount.Next;
        unqry_LoadSMTIncomingBOXNO.Post;
      end;
      edtTCount.Text :=IntToStr(TextCount);
      if TextCount=0 then
      begin
         MessageBox(0, '测试台数为0，无须测试！', '提示', MB_OK + MB_OKCANCEL);
      end;
    end;

end;



procedure TfrmIncomCheck.FormCreate(Sender: TObject);
var
  iCommindex,Count:Integer;
    CommList: TStrings;
begin

    if strAutoTestModel='' then
    begin
        Application.MessageBox('请在测试参数设置选项中选择要测试的机型!','警告',MB_OK+MB_ICONWARNING);
        frmClientMain.ac_BasicTestParam.Execute();
    end;
    Percentage:=BasicTestParam.INPercentage;
    TextCount:=0;
    edtPercentage.Text:=IntToStr(BasicTestParam.INPercentage);
     for iCommindex := 1 to CommCount-1 do
    begin
        CommList:= TStringList.Create;
        if GetSysComm(CommList) then
        begin
            for Count:= 0 to CommList.Count-1 do
            begin
                TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).Items.Add(CommList[Count]);
            end;
            TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).ItemIndex:=0;
        end;
        CommList.free;
    end;

    {if strAutoTestModel='' then
    begin
        Application.MessageBox('请在测试参数设置选项中选择要测试的机型!','警告',MB_OK+MB_ICONWARNING);
        frmClientMain.ac_BasicTestParam.Execute();
    end;}
    TestPassContList:=TStringList.Create;
end;

procedure TfrmIncomCheck.btnStart_1Click(Sender: TObject);
begin
   StartComm(1);
end;

procedure TfrmIncomCheck.btnStart_2Click(Sender: TObject);
begin
   StartComm(2);
end;

procedure TfrmIncomCheck.btnStart_3Click(Sender: TObject);
begin
  StartComm(3);
end;

procedure TfrmIncomCheck.btnStart_4Click(Sender: TObject);
begin
 StartComm(4);
end;

procedure TfrmIncomCheck.StartComm(CommIndex:Integer);
var
  strComPort:string;
begin
    Application.ProcessMessages;
     if edtBoxNo.Text=''then
     begin
        pnlTestResultBox.Caption:='箱号位空，请扫描箱号!';
        pnlTestResultBox.Color:=clRed;
        Exit;
     end;
     {if TextCount=0 then
     begin
        pnlTestResultBox.Caption:='PASS';
        pnlTestResultBox.Color:=clGreen;
        Exit;
     end; }
     if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='连接' then
    begin
        strComPort:=TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text;
        //strComPort:=stringreplace(strComPort,'COM','',[rfReplaceAll]);
        if strComPort='' then
        begin
            MessageDlg('请选择串口!',mtInformation,mbOKCancel,0);
            Exit;
        end;

        try
            if(bUsbReceieveData) then
            begin
              strComPort:=stringreplace(strComPort,'COM','',[rfReplaceAll]);
              TCommPortDriver(FindComponent('Comm_0'+inttostr(CommIndex))).Disconnect;
              TCommPortDriver(FindComponent('Comm_0'+inttostr(CommIndex))).ComPort:= TComPortNumber(StrToInt(strComPort));
              TCommPortDriver(FindComponent('Comm_0'+inttostr(CommIndex))).ComPortSpeed:=TComPortBaudRate(12);
              TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Enabled:=False;
              TCommPortDriver(FindComponent('Comm_0'+inttostr(CommIndex))).Connect;
            end
            else
            begin
              TComm(FindComponent('Comm_'+inttostr(CommIndex))).CommName:= strComPort;
              TComm(FindComponent('Comm_'+inttostr(CommIndex))).BaudRate:=115200;
              TComm(FindComponent('Comm_'+inttostr(CommIndex))).StopBits:=_1;
              TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Enabled:=False;
              TComm(FindComponent('Comm_'+inttostr(CommIndex))).StartComm;
            end;

            {TComm(FindComponent('Comm_'+inttostr(CommIndex))).CommName:= strComPort;
            TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Enabled:=False;
            TComm(FindComponent('Comm_'+inttostr(CommIndex))).StartComm;

            {TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).ComPort:= TComPortNumber(StrToInt(strComPort));
            TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).ComPortSpeed:=TComPortBaudRate(12);
            TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Enabled:=False;
            TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).Connect;}
            Sleep(100);
            TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption:='断开';
            TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Enabled:=True;
            SerialInfo[CommIndex].bConnectedComm:=True;
            strComm[CommIndex]:=TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Text;
             Sleep(1000);
            ChectAllowStartTest(CommIndex);

        except
            //on ECommsError do
            begin
                MessageDlg('端口不存在或已被占用或其它!',mtInformation,mbOKCancel,0);
                TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Enabled:=True;
                TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption:='连接';
                //TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Enabled:=True;
                SerialInfo[CommIndex].bConnectedComm:=False;
            end;
        end;
    end
    else if TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption='断开'  then
    begin
        TComboBox(FindComponent('cbbCom_'+inttostr(CommIndex))).Enabled:=True;
        try

            if(bUsbReceieveData) then
            begin
              if TCommPortDriver(FindComponent('Comm_0'+inttostr(CommIndex))).ComHandle>0 then
              TCommPortDriver(FindComponent('Comm_0'+inttostr(CommIndex))).Disconnect;
            end
            else
            begin
              TComm(FindComponent('Comm_'+inttostr(CommIndex))).StopComm;
            end;
            TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption:='连接';
            //TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Enabled:=False;
            SerialInfo[CommIndex].bConnectedComm:=False;
        except
            MessageDlg('端口断开失败!',mtInformation,mbOKCancel,0);
            TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption:='断开';
            //TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Enabled:=True;
            SerialInfo[CommIndex].bConnectedComm:=True;
        end;
    end;
    Application.ProcessMessages;
end;

procedure TfrmIncomCheck.DeComReceieveDataIncomCheck(CommIndex:Integer);
var
 iCount,i:Integer;  //iCount用于定义能否读取基带ID数组长度 ,i数组元素位置
 strTemp:string;
begin
  if pos('=',StrCommRecText[CommIndex])<>0 then
  	StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],'=','-',[rfReplaceAll]);
  if pos(#$D,StrCommRecText[CommIndex])<>0 then
    StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],#$D,'',[rfReplaceAll]);
  if pos(#$A,StrCommRecText[CommIndex])<>0 then
    StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],#$A,'',[rfReplaceAll]);

  GetSendedCommCmdkey(CommIndex,strCmdReturnText[CommIndex],strCmdCommKey[CommIndex],
  			bCompare[CommIndex],strCompare[CommIndex],strRemark[CommIndex],strSubTestItemName[CommIndex],strRemark2[CommIndex]);

  strCmdReturnText[CommIndex]:=UpperCase(strCmdReturnText[CommIndex]);
  strCmdCommKey[CommIndex]:=UpperCase(strCmdCommKey[CommIndex]);

  if  strCmdCommKey[CommIndex]= 'ATALLOWTEST'  then
        begin
            if Pos(strCmdReturnText[CommIndex],StrCommRecText[CommIndex])>0 then
            begin
                SendToComm_TestParam(CommIndex);
                if iSendAtTestCount[CommIndex]>=iAllowTestCount[CommIndex] then
                begin
                    StartTest(CommIndex);
                end
                else
                begin
                    ChectAllowStartTest(CommIndex);
                end;
                Exit;
            end
            else
                Exit;
        end;

   //是否允许测试，如果否串口上的数据不做任何判断
    if not SerialInfo[CommIndex].bAllowTest then  Exit;

    if (Pos('SENSOR_OK',StrCommRecText[CommIndex])>0) AND (strRemark[CommIndex]<>'SENSOR') then
    begin
      //Sleep(1);
      //Exit;
      StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],'SENSOR_OK','',[rfReplaceAll]);

    end;

  if strCmdCommKey[CommIndex]= 'ATID' then
  begin
        if pos(' ',StrCommRecText[CommIndex])<>0 then
                StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],' ','',[rfReplaceAll]);
        if (pos('CHIPRID:',StrCommRecText[CommIndex])>0) then
        begin
            SendToComm_TestParam(CommIndex);
            strChipRid[CommIndex]:=MidStr(StrCommRecText[CommIndex],pos('CHIPRID:',StrCommRecText[CommIndex])+Length('CHIPRID:'),32);
            if pos('00000000000000000000000000000000',strChipRid[CommIndex])<>0 then Exit;
        end
        else
        	Exit;

       if (strChipRid[CommIndex]<>'') and (Length(strChipRid[CommIndex])=32) then
          begin
            NoteCommLog(CommIndex,'----SN----'+strChipRid[CommIndex]);
            CompareChipId(CommIndex, strChipRid[CommIndex]);
          end;
  end;

end;

procedure  TfrmIncomCheck.CompareChipId(CommIndex:Integer;chipId:string);
begin
  //unqry_LoadSMTIncomingBOXNO.Active:=True;
  //unqry_LoadSMTIncomingBOXNO.SQL.Clear;
  //unqry_LoadSMTIncomingBOXNO.SQL.Add('select * from t_AutoTest_IncomingBoxNo where SN = ''' + chipId + '''');
  TUniQuery(FindComponent('unqry_TestResult_'+inttostr(CommIndex))).Active:=False;
  TUniQuery(FindComponent('unqry_TestResult_'+inttostr(CommIndex))).Params[0].AsString:=chipID;
  TUniQuery(FindComponent('unqry_TestResult_'+inttostr(CommIndex))).Active:=True;
  //unqry_LoadSMTIncomingBOXNO.Params[0].AsString:=chipID;
 // unqry_LoadSMTIncomingBOXNO.Active:=True;
  {
  try
    unqry_LoadSMTIncomingBOXNO.Open;
  except
    MessageBox(0,'错误','错误',MB_OK + MB_OKCANCEL);
  end;}
  if TUniQuery(FindComponent('unqry_TestResult_'+inttostr(CommIndex))).RecordCount<>0 then
  begin
     //TextCount:=TextCount-1;
     SetDisplayResult(CommIndex,1);
  end
  else
  begin
    btn_twiceAll.Enabled:=True;
    SetDisplayResult(CommIndex,0);
  end;

end;  


procedure TfrmIncomCheck.SetDisplayResult(CommIndex:Integer;iResult:Integer);
begin
   case iResult of
   1:
   begin
      Application.ProcessMessages;
      TPanel(FindComponent('pnl'+inttostr(CommIndex))).Caption:='PASS';
      TPanel(FindComponent('pnl'+inttostr(CommIndex))).Color:=clGreen;
       ChectAllowStartTest(CommIndex);
      TextCount:=TextCount-1;
      if(TextCount=0)then
      begin
         pnlTestResultBox.Caption:='PASS';
         pnlTestResultBox.Color:=clGreen;
         btn_twiceAll.Enabled:=False;
      end;
      //edtTCount.Text :=IntToStr(TextCount);
   end;
   0:
   begin
      Application.ProcessMessages;
      TPanel(FindComponent('pnl'+inttostr(CommIndex))).Caption:='FAIL';
      TPanel(FindComponent('pnl'+inttostr(CommIndex))).Color:=clRed;
      TTimer(FindComponent('tmrCheckAllowTest_'+inttostr(CommIndex))).Enabled:=true;
      pnlTestResultBox.Caption:='FAIL';
      pnlTestResultBox.Color:=clRed;
      btn_twiceAll.Enabled:=True;
   end;
   end;
end;

//============================发送数据至串口============================//
function TfrmIncomCheck.SendToComm_TestParam(CommIndex:Integer;CmdKey:string;Cmd:string;WaitResponses:Boolean;
                        WaitResponseOverTime:Integer;
                        ReturnText:string;SubItemName:string;
                        bCompare:Boolean;strCompare:string;strRemark:string;
                        bSendAtCommand:Boolean;
                        ResendNum:Integer;strRemark2:string;SendNum:Integer):Boolean;    //发送内容至串口
var
  SendCommRecord:PSendCommRecord;                         //发送至串口的命令
begin
    Result:=True;
    //若未连接串口则视为失败
    //if not SerialInfo[CommIndex].bConnectedComm then
    {if TCommPortDriver(FindComponent('Comm_'+inttostr(CommIndex))).ComHandle=INVALID_HANDLE_VALUE then
    begin
        //MessageBox(0,'发送串口失败,查看串口是否连接!','警告',MB_ICONWARNING+MB_OK);
        Result:=False;
    end
    else}
    begin
        //是否等待回应，若是则加入发送列表中，否则直接发送
        if WaitResponses then
        begin
            try
               New(SendCommRecord);
                SendCommRecord^.bInvalidation:=False;
                SendCommRecord^.sCmdKey:=CmdKey;
                SendCommRecord^.sCmd:=Cmd+#13+#10;
                SendCommRecord^.sReturnText:=ReturnText;
                SendCommRecord^.bWaitResponses:=WaitResponses;
                SendCommRecord^.iWaitResponseOverTime:=WaitResponseOverTime;
                SendCommRecord^.iResendNum:=ResendNum;
                SendCommRecord^.iSendNum:=1;
                SendCommRecord^.sSubItemName:=SubItemName;
                SendCommRecord^.bCompare:=bCompare;
                SendCommRecord^.strCompare:=strCompare;
                SendCommRecord^.strRemark:=strRemark;
                SendCommRecord^.bSendAtCommand:=bSendAtCommand;
                SendCommRecord^.strRemark2:=strRemark2;
                SendCommList[CommIndex].Add(SendCommRecord);

              //SendCommList[CommIndex].Add(SendCommRecord);
            finally
              //Dispose(SendCommRecord);
            end;

            if SendCommList[CommIndex].Count<=1 then
            begin
               SendToComm_TestParam(CommIndex);
            end;
            Application.ProcessMessages;
        end;

    end;
    Application.ProcessMessages;
end;

function TfrmIncomCheck.SendToComm_TestParam(CommIndex:Integer):Boolean;
label FindHead;
var
    strTemp:string;
    SendCommRecord:PSendCommRecord;                         //发送至串口的命令
begin
    try
      //tmrRecCommTimeOut_0.Enabled:=False;
      case CommIndex of
      1: tmrRecCommTimeOut_1.Enabled:=False;
      2: tmrRecCommTimeOut_2.Enabled:=False;
      3: tmrRecCommTimeOut_3.Enabled:=False;
      4: tmrRecCommTimeOut_4.Enabled:=False;
    end;
FindHead:
      if SendCommList[CommIndex].Count>0 then
      begin
        New(SendCommRecord);
        SendCommRecord:=SendCommList[CommIndex].Items[0];
        if SendCommRecord^.bInvalidation then
        begin
            SendCommList[CommIndex].Delete(0);
            goto FindHead;
        end;
        SendCommRecord^.bInvalidation:=True;
        SendCommList[CommIndex].Delete(0);
        SendCommList[CommIndex].Insert(0,SendCommRecord);

         NoteCommLog(CommIndex,'[S:]===='+SendCommRecord^.sCmd);
        if SendCommRecord^.bSendAtCommand then
        begin
        {strCompar:= 'AT^GT_CM=TEST' + #13+#10;
        if SendCommRecord^.sCmd<> strCompar  then}
        
        if SendCommRecord^.sCmdKey<>'ATALLOWTEST' then
        begin
          Sleep(BasicTestParam.SleepTime);
        end;

        if bUsbReceieveData then
                  begin
                      case CommIndex of

                        1: Comm_01.SendString(PChar(SendCommRecord.sCmd));
                        2: Comm_02.SendString(PChar(SendCommRecord.sCmd));
                        3: Comm_03.SendString(PChar(SendCommRecord.sCmd));
                        4: Comm_04.SendString(PChar(SendCommRecord.sCmd));
                      end;
                  end
            else
                  begin
                      case CommIndex of

                        1: Comm_1.WriteCommData(PChar(SendCommRecord.sCmd),StrLen(PChar(SendCommRecord.sCmd)));
                        2: Comm_2.WriteCommData(PChar(SendCommRecord.sCmd),StrLen(PChar(SendCommRecord.sCmd)));
                        3: Comm_3.WriteCommData(PChar(SendCommRecord.sCmd),StrLen(PChar(SendCommRecord.sCmd)));
                        4: Comm_4.WriteCommData(PChar(SendCommRecord.sCmd),StrLen(PChar(SendCommRecord.sCmd)));
                      end;

                  end;


            //Sleep(10);
        end;

        if (SendCommRecord^.bWaitResponses) and (SendCommRecord^.iWaitResponseOverTime>0) then
        begin
            case CommIndex of
                1:
                begin
                    tmrRecCommTimeOut_1.Interval:=SendCommRecord^.iWaitResponseOverTime;
                   tmrRecCommTimeOut_1.Enabled:=True;
                end;
                2:
                begin
                    tmrRecCommTimeOut_2.Interval:=SendCommRecord^.iWaitResponseOverTime;
                    tmrRecCommTimeOut_2.Enabled:=True;
                end;
                3:
                begin
                    tmrRecCommTimeOut_3.Interval:=SendCommRecord^.iWaitResponseOverTime;
                    tmrRecCommTimeOut_3.Enabled:=True;
                end;
                4:
                begin
                    tmrRecCommTimeOut_4.Interval:=SendCommRecord^.iWaitResponseOverTime;
                    tmrRecCommTimeOut_4.Enabled:=True;
                end;
            end;
        end;
    end;

    finally
      //Dispose(SendCommRecord);
      Result:=False;
    end;
    Result:=True;
end;

procedure TfrmIncomCheck.Comm_1ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
  var
    CommIndex:Integer;
begin
  Application.ProcessMessages;
  CommIndex:=1;
    SetLength(StrCommRecText[CommIndex],BufferLength);
  Move(Buffer^,PChar(StrCommRecText[CommIndex])^,BufferLength);

  StrCommRecText[CommIndex]:=UpperCase(StrCommRecText[CommIndex]);
  NoteCommLog(CommIndex,StrCommRecText[CommIndex]);
  DeComReceieveDataIncomCheck(CommIndex);
end;

procedure TfrmIncomCheck.Comm_01ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
    CommIndex:Integer;
begin
   Application.ProcessMessages;
    CommIndex:=1;
    SetLength(StrCommRecText[CommIndex],DataSize);
    Move(DataPtr^,PChar(StrCommRecText[CommIndex])^,DataSize);
    StrCommRecText[CommIndex]:=UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex,StrCommRecText[CommIndex]);
    DeComReceieveDataIncomCheck(CommIndex);
end;

procedure TfrmIncomCheck.Comm_2ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
 var
    CommIndex:Integer;
begin
  Application.ProcessMessages;
  CommIndex:=2;
    SetLength(StrCommRecText[CommIndex],BufferLength);
  Move(Buffer^,PChar(StrCommRecText[CommIndex])^,BufferLength);

  StrCommRecText[CommIndex]:=UpperCase(StrCommRecText[CommIndex]);
  NoteCommLog(CommIndex,StrCommRecText[CommIndex]);
  DeComReceieveDataIncomCheck(CommIndex);
end;

procedure TfrmIncomCheck.Comm_3ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
 var
    CommIndex:Integer;
begin
  Application.ProcessMessages;
  CommIndex:=3;
    SetLength(StrCommRecText[CommIndex],BufferLength);
  Move(Buffer^,PChar(StrCommRecText[CommIndex])^,BufferLength);

  StrCommRecText[CommIndex]:=UpperCase(StrCommRecText[CommIndex]);
  NoteCommLog(CommIndex,StrCommRecText[CommIndex]);
  DeComReceieveDataIncomCheck(CommIndex);
end;

procedure TfrmIncomCheck.Comm_4ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
 var
    CommIndex:Integer;
begin
  Application.ProcessMessages;
  CommIndex:=4;
    SetLength(StrCommRecText[CommIndex],BufferLength);
  Move(Buffer^,PChar(StrCommRecText[CommIndex])^,BufferLength);

  StrCommRecText[CommIndex]:=UpperCase(StrCommRecText[CommIndex]);
  NoteCommLog(CommIndex,StrCommRecText[CommIndex]);
  DeComReceieveDataIncomCheck(CommIndex);
end;

procedure TfrmIncomCheck.tmrCheckAllowTest_1Timer(Sender: TObject);
var
  CommIndex:Integer;
begin
    CommIndex:=1;
    TTimer(FindComponent('tmrCheckAllowTest_'+inttostr(CommIndex))).Enabled:=False;
    SendToComm_TestParam(CommIndex,'ATALLOWTEST',strCheckTestAtCommand[CommIndex],true,iSendAllowTestAtTimeOut[CommIndex]*1000,strCheckTestAtCommandReturn[CommIndex],'检测设备');
end;


procedure TfrmIncomCheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
iIndex:Integer;
begin
   for iIndex := 1 to CommCount-1 do
  begin
    try
      if bUsbReceieveData then
      begin
         if TCommPortDriver(FindComponent('Comm_0'+inttostr(iIndex))).ComHandle>0 then
         begin
         TCommPortDriver(FindComponent('Comm_0'+inttostr(iIndex))).Disconnect;
         end;
      end
      else
      begin
         if TComm(FindComponent('Comm_'+inttostr(iIndex))).Handle>0 then
         begin
          TComm(FindComponent('Comm_'+inttostr(iIndex))).StopComm;
         end;
      end;
    except
    	//MessageDlg('端口'+inttostr(iIndex)+'断开失败!',mtInformation,mbOKCancel,0);
    end;
  end;
  TestPassContList.Free;
end;

procedure TfrmIncomCheck.tmrCheckAllowTest_2Timer(Sender: TObject);
var
CommIndex:Integer;
begin
    CommIndex:=2;
    TTimer(FindComponent('tmrCheckAllowTest_'+inttostr(CommIndex))).Enabled:=False;
    SendToComm_TestParam(CommIndex,'ATALLOWTEST',strCheckTestAtCommand[CommIndex],true,iSendAllowTestAtTimeOut[CommIndex]*1000,strCheckTestAtCommandReturn[CommIndex],'检测设备');
end;


procedure TfrmIncomCheck.tmrRecCommTimeOut_1Timer(Sender: TObject);
var
CommIndex:Integer;
SendCommRecord:PSendCommRecord;
begin
    CommIndex:=1;
    TTimer(FindComponent('tmrRecCommTimeOut_'+IntToStr(CommIndex))).Enabled:=False;

    if SendCommList[CommIndex].Count<1 then Exit;
    try
      New(SendCommRecord);
      SendCommRecord:=SendCommList[CommIndex].Items[0];
      if (SendCommRecord.bWaitResponses) and (SendCommRecord.iResendNum>0) then
      begin
          if SendCommRecord.iSendNum < SendCommRecord.iResendNum then
          begin
              SendCommRecord.bInvalidation:=False;
              SendCommRecord.iSendNum:=SendCommRecord.iSendNum+1;
              SendToComm_TestParam(CommIndex);
          if SendCommRecord.sCmdKey='ATALLOWTEST' then iSendAtTestCount[CommIndex]:=iSendAtTestCount[CommIndex]+1;
          end
          else
          begin
              if SendCommRecord.sCmdKey='ATALLOWTEST' then
              begin
                  InitAllControl(CommIndex);
                  SendToComm_TestParam(CommIndex);
                  TTimer(FindComponent('tmrCheckAllowTest_'+inttostr(CommIndex))).Enabled:=True;
              end;

          end;
      end;
    finally
      //Dispose(SendCommRecord);
    end;
end;

procedure TfrmIncomCheck.tmrCheckAllowTest_3Timer(Sender: TObject);
var
CommIndex:Integer;
begin
    CommIndex:=3;
    TTimer(FindComponent('tmrCheckAllowTest_'+inttostr(CommIndex))).Enabled:=False;
    SendToComm_TestParam(CommIndex,'ATALLOWTEST',strCheckTestAtCommand[CommIndex],true,iSendAllowTestAtTimeOut[CommIndex]*1000,strCheckTestAtCommandReturn[CommIndex],'检测设备');
end;


procedure TfrmIncomCheck.tmrCheckAllowTest_4Timer(Sender: TObject);
var

CommIndex:Integer;
begin
    CommIndex:=4;
    TTimer(FindComponent('tmrCheckAllowTest_'+inttostr(CommIndex))).Enabled:=False;
    SendToComm_TestParam(CommIndex,'ATALLOWTEST',strCheckTestAtCommand[CommIndex],true,iSendAllowTestAtTimeOut[CommIndex]*1000,strCheckTestAtCommandReturn[CommIndex],'检测设备');
end;

procedure TfrmIncomCheck.ChectAllowStartTest(CommIndex:Integer);
begin
    Application.ProcessMessages;
    iSendAtTestCount[CommIndex]:=0;
    //InitAllControl(CommIndex);
    TTimer(FindComponent('tmrCheckAllowTest_'+inttostr(CommIndex))).Interval:=iTestFinishTime[CommIndex]*1000;
    TTimer(FindComponent('tmrCheckAllowTest_'+inttostr(CommIndex))).Enabled:=True;
    Application.ProcessMessages;
end;

procedure TfrmIncomCheck.InitAllControl(CommIndex:Integer);
var
    iIndex:Integer;
begin
    TPanel(FindComponent('pnl'+inttostr(CommIndex))).Caption:='';
    TPanel(FindComponent('pnl'+inttostr(CommIndex))).Color:=clSilver;
    pnlTestResultBox.Caption:='';
    pnlTestResultBox.Color:=clSilver;
end;

procedure TfrmIncomCheck.StartTest(CommIndex:Integer);
begin
  InitAllControl(CommIndex);
  strChipRid[CommIndex]:='';
  SerialInfo[CommIndex].bAllowTest:=True;
  SendCommList[CommIndex].Clear;
  SendToComm_TestParam(CommIndex,'ATID','AT^GT_CM=ID,1');
  //SendToComm_TestParam(CommIndex,'ATID','AT^GT_CM=ID,1');
end;

procedure TfrmIncomCheck.tmrRecCommTimeOut_2Timer(Sender: TObject);
var
CommIndex:Integer;
SendCommRecord:PSendCommRecord;
begin
    CommIndex:=2;
    TTimer(FindComponent('tmrRecCommTimeOut_'+IntToStr(CommIndex))).Enabled:=False;

    if SendCommList[CommIndex].Count<1 then Exit;
    try
      New(SendCommRecord);
      SendCommRecord:=SendCommList[CommIndex].Items[0];
      if (SendCommRecord.bWaitResponses) and (SendCommRecord.iResendNum>0) then
      begin
          if SendCommRecord.iSendNum < SendCommRecord.iResendNum then
          begin
              SendCommRecord.bInvalidation:=False;
              SendCommRecord.iSendNum:=SendCommRecord.iSendNum+1;
              SendToComm_TestParam(CommIndex);

              if SendCommRecord.sCmdKey='ATALLOWTEST' then iSendAtTestCount[CommIndex]:=iSendAtTestCount[CommIndex]+1;
          end
          else
          begin
              if SendCommRecord.sCmdKey='ATALLOWTEST' then
              begin
                  InitAllControl(CommIndex);
                  SendToComm_TestParam(CommIndex);
                  TTimer(FindComponent('tmrCheckAllowTest_'+inttostr(CommIndex))).Enabled:=True;
              end;

          end;
      end;
    finally
      //Dispose(SendCommRecord);
    end;
end;

procedure TfrmIncomCheck.tmrRecCommTimeOut_3Timer(Sender: TObject);
var
  CommIndex:Integer;
SendCommRecord:PSendCommRecord;
begin
   CommIndex:=3;
    TTimer(FindComponent('tmrRecCommTimeOut_'+IntToStr(CommIndex))).Enabled:=False;

    if SendCommList[CommIndex].Count<1 then Exit;
    try
      New(SendCommRecord);
      SendCommRecord:=SendCommList[CommIndex].Items[0];
      if (SendCommRecord.bWaitResponses) and (SendCommRecord.iResendNum>0) then
      begin
          if SendCommRecord.iSendNum < SendCommRecord.iResendNum then
          begin
              SendCommRecord.bInvalidation:=False;
              SendCommRecord.iSendNum:=SendCommRecord.iSendNum+1;
              SendToComm_TestParam(CommIndex);

              if SendCommRecord.sCmdKey='ATALLOWTEST' then iSendAtTestCount[CommIndex]:=iSendAtTestCount[CommIndex]+1;
          end
          else
          begin
              if SendCommRecord.sCmdKey='ATALLOWTEST' then
              begin
                  InitAllControl(CommIndex);
                  SendToComm_TestParam(CommIndex);
                  TTimer(FindComponent('tmrCheckAllowTest_'+inttostr(CommIndex))).Enabled:=True;
              end;

          end;
      end;
    finally
      //Dispose(SendCommRecord);
    end;
end;

procedure TfrmIncomCheck.tmrRecCommTimeOut_4Timer(Sender: TObject);
var
  CommIndex:Integer;
SendCommRecord:PSendCommRecord;
begin
   CommIndex:=4;
    TTimer(FindComponent('tmrRecCommTimeOut_'+IntToStr(CommIndex))).Enabled:=False;

    if SendCommList[CommIndex].Count<1 then Exit;
    try
      New(SendCommRecord);
      SendCommRecord:=SendCommList[CommIndex].Items[0];
      if (SendCommRecord.bWaitResponses) and (SendCommRecord.iResendNum>0) then
      begin
          if SendCommRecord.iSendNum < SendCommRecord.iResendNum then
          begin
              SendCommRecord.bInvalidation:=False;
              SendCommRecord.iSendNum:=SendCommRecord.iSendNum+1;
              SendToComm_TestParam(CommIndex);

              if SendCommRecord.sCmdKey='ATALLOWTEST' then iSendAtTestCount[CommIndex]:=iSendAtTestCount[CommIndex]+1;
          end
          else
          begin
              if SendCommRecord.sCmdKey='ATALLOWTEST' then
              begin
                  InitAllControl(CommIndex);
                  SendToComm_TestParam(CommIndex);
                  TTimer(FindComponent('tmrCheckAllowTest_'+inttostr(CommIndex))).Enabled:=True;
              end;

          end;
      end;
    finally
      //Dispose(SendCommRecord);
    end;
end;

procedure TfrmIncomCheck.Comm_02ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
  CommIndex:Integer;
begin
   Application.ProcessMessages;
    CommIndex:=2;
    SetLength(StrCommRecText[CommIndex],DataSize);
    Move(DataPtr^,PChar(StrCommRecText[CommIndex])^,DataSize);
    StrCommRecText[CommIndex]:=UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex,StrCommRecText[CommIndex]);
    DeComReceieveDataIncomCheck(CommIndex);
end;

procedure TfrmIncomCheck.Comm_03ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
  CommIndex:Integer;
begin
   Application.ProcessMessages;
    CommIndex:=3;
    SetLength(StrCommRecText[CommIndex],DataSize);
    Move(DataPtr^,PChar(StrCommRecText[CommIndex])^,DataSize);
    StrCommRecText[CommIndex]:=UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex,StrCommRecText[CommIndex]);
    DeComReceieveDataIncomCheck(CommIndex);
end;

procedure TfrmIncomCheck.Comm_04ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
  CommIndex:Integer;
begin
   Application.ProcessMessages;
    CommIndex:=4;
    SetLength(StrCommRecText[CommIndex],DataSize);
    Move(DataPtr^,PChar(StrCommRecText[CommIndex])^,DataSize);
    StrCommRecText[CommIndex]:=UpperCase(StrCommRecText[CommIndex]);
    NoteCommLog(CommIndex,StrCommRecText[CommIndex]);
    DeComReceieveDataIncomCheck(CommIndex);
end;

procedure TfrmIncomCheck.btn_twiceAllClick(Sender: TObject);
var
  strSendText,BOXNO:string;
  CommIndex:Integer;
begin
    CommIndex:=0;
    //MessageBox(0,'返工箱号为：' + (PChar)canaledtBoxNo.Text, '请确认', mb_Ok+Mb_Cannel);
    BOXNO:='返工箱号为：'+edtBoxNo.Text;
    if MessageBox(0,PChar(BOXNO), '信息提示',MB_OKCANCEL) <> 1 then
    begin
       Exit;
    end;
    strSendText:=Format('Action=DeleteTestResult_ByBoxNo_Twice#BoxNo=%s#Tester=%s#', [edtBoxNo.Text,User.UserName]);

    SendToServer(CommIndex,'DeleteTestResult_ByBoxNo_Twice', strSendText,True,CTimeOut*3);
end;


procedure TfrmIncomCheck.MsgTwiceByBoxNox(var msg:TMessage);
var
  CommIndex:Integer;
   StrListNumberSign:TStringList;     //#号分隔内容
begin
  CommIndex:=0;
     StrListNumberSign:=TStringList(msg.WParam);
   if StrListNumberSign.Values['iSMTResult']='1' then
     begin
        pnlTestResultBox.Caption:='PASS';
        pnlTestResultBox.Color:=clGreen;
     end
    else
    begin
       pnlTestResultBox.Caption:='FAIL';
        pnlTestResultBox.Color:=clRed;
    end;

end;

procedure TfrmIncomCheck.btnReTest_1Click(Sender: TObject);
begin
   StartTest(1);
end;

procedure TfrmIncomCheck.btnReTest_2Click(Sender: TObject);
begin
   StartTest(2);
end;

procedure TfrmIncomCheck.btnReTest_3Click(Sender: TObject);
begin
   StartTest(3);
end;

procedure TfrmIncomCheck.btnReTest_4Click(Sender: TObject);
begin
   StartTest(4);
end;

end.
