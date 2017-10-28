unit uBasicTestParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask,IniFiles,uGlobalVar, DBGridEh,uDmMain,
  DBCtrlsEh, DBLookupEh, DBCtrls, ExtCtrls,uPublicFunc, SPComm,StrUtils,
  MemTableDataEh, Db,  DataDriverEh, ADODB, MemDS, DBAccess, Uni,
  ComDrv32,ShellAPI;

type
  TfrmBasicTestParam = class(TForm)
    Panel1: TPanel;
    tmrRecCommTimeOut_0: TTimer;
    DS_VersionModel: TDataSource;
    UniQuery_VersionModel: TUniQuery;
    SFUniQuery_VersionModelIndex: TStringField;
    intgrfldUniQuery_VersionModelId: TIntegerField;
    SFUniQuery_VersionModelVersion: TStringField;
    SFUniQuery_VersionModelModel: TStringField;
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
    UniQuery_GpsTestParamterSMT_AutoTestTestTime: TIntegerField;
    DS_GpsTestParamter: TDataSource;
    UniQuery_1: TUniQuery;
    intgrfld1: TIntegerField;
    intgrfld2: TIntegerField;
    intgrfld3: TIntegerField;
    intgrfld4: TIntegerField;
    intgrfld5: TIntegerField;
    intgrfld6: TIntegerField;
    intgrfld7: TIntegerField;
    intgrfld8: TIntegerField;
    SF1: TStringField;
    SF2: TStringField;
    SF3: TStringField;
    intgrfld9: TIntegerField;
    SF4: TStringField;
    SF5: TStringField;
    intgrfld10: TIntegerField;
    intgrfld11: TIntegerField;
    UniQuery_1SMT_AutoTestTestTime: TIntegerField;
    Panel2: TPanel;
    GroupBox6: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edt_CheckTestAtReturn: TDBEdit;
    Edt_CheckTestAtTimeOut: TDBEdit;
    Edt_CheckTestAllowTestCount: TDBEdit;
    Edt_CheckTestTime: TDBEdit;
    Edt_CheckTestAtCommand: TDBEdit;
    GroupBox5: TGroupBox;
    lbl11: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edt_GPSNumbers: TDBEdit;
    Edt_EPOLatitude: TDBEdit;
    Edt_EPOLongitude: TDBEdit;
    Edt_EPOAltitude: TDBEdit;
    GroupBox4: TGroupBox;
    lbl1: TLabel;
    Label4: TLabel;
    lbl4: TLabel;
    lbl7: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Edt_CoupleTestTestTime: TDBEdit;
    Edt_ParamDownloadTestTime: TDBEdit;
    Edt_AutoTestTestTime: TDBEdit;
    Edt_WriteImeiTestTime: TDBEdit;
    Edt_TwiceTestTime: TDBEdit;
    Edt_SMTAutoTestTestTime: TDBEdit;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    edtTCPIp: TMaskEdit;
    edtTCPPort: TMaskEdit;
    chkTCPAuto: TCheckBox;
    btnStopTcp: TBitBtn;
    btnStartTcp: TBitBtn;
    GroupBox2: TGroupBox;
    LabelCom6EI_1: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Splitter1: TSplitter;
    edtCompareVersion: TMaskEdit;
    chkFailContinue: TCheckBox;
    cbbCom_0: TComboBox;
    btnStart_0: TButton;
    btnEnter: TBitBtn;
    btnCancel: TBitBtn;
    UniQuery_VersionModelbReadRID: TBooleanField;
    UniQuery_Model: TUniQuery;
    intgrfldUniQuery_ModelId: TIntegerField;
    SFUniQuery_ModelModel: TStringField;
    blnfldUniQuery_ModelbReadRID: TBooleanField;
    DS_Model: TDataSource;
    Cbb_Model: TDBLookupComboBox;
    dbchkbReadRID: TDBCheckBox;
    Label3: TLabel;
    Edt_GpsDBMin: TEdit;
    Label16: TLabel;
    Edt_GpsDBMax: TEdit;
    BtnGpsSet: TButton;
    Comm_00: TCommPortDriver;
    lbl5: TLabel;
    edtEdt_GPSNumbersDY: TEdit;
    Comm_0: TComm;
    lbl6: TLabel;
    edt_INPercentage: TEdit;
    lbl8: TLabel;
    chkUSB: TCheckBox;
    UniQuery_GetIEMIRANG: TUniQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure btnStart_0Click(Sender: TObject);
    {procedure Comm_00ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
    procedure tmrRecCommTimeOut_0Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGpsSetClick(Sender: TObject);
    procedure Comm_0ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure Comm_0ReceiveError(Sender: TObject; EventMask: Cardinal);
    procedure Comm_00ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure chkUSBClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    function SendToComm_TestParam(CommIndex:Integer;CmdKey:string;Cmd:string;WaitResponses:Boolean=True;
                        WaitResponseOverTime:Integer=3000*2;
                        ReturnText:string='';SubItemName:string='';
                        bCompare:Boolean=False;strCompare:string='';strRemark:string='';
                        bSendAtCommand:Boolean=True;
                        ResendNum:Integer=3;SendNum:Integer=0):Boolean;overload;    //发送内容至串口
    function SendToComm_TestParam(CommIndex:Integer):Boolean;overload;
  public
    { Public declarations }
    procedure SetSysCommToBox; //获取注册表中的记录的串口信息，并保存到下拉框
    procedure DeComReceieveDataBasicTParam(CommIndex:Integer);
  end;

var
  frmBasicTestParam: TfrmBasicTestParam;
implementation

uses uAutoTest, ufrmMessageBox;

{$R *.dfm}

procedure TfrmBasicTestParam.FormCreate(Sender: TObject);
var
    iCommindex,Count:Integer;
    CommList: TStrings;
begin
    UniQuery_Model.Active:=True;
    UniQuery_GpsTestParamter.Close;
    UniQuery_GpsTestParamter.Open;
    edtCompareVersion.Text:=BasicTestParam.CompareVersion;
    edtTCPIp.Text:=strTcpIp;
    edtTCPPort.Text:=strTcpPort;
    chkFailContinue.Checked:=BasicTestParam.FailContinueTest;
    edt_INPercentage.Text:= IntToStr(BasicTestParam.INPercentage);
    for iCommindex := 0 to 0 do
    begin
        CommList:= TStringList.Create;
        if GetSysComm(CommList) then
        begin
            for Count:= 0 to CommList.Count-1 do
            begin
                TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).Items.Add(CommList[Count]);
                TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).ItemIndex:=0;
            end;
        end;
        CommList.free;
    end;

    Edt_GpsDBMin.Text:=ReadIni_GPS('GpsTC','MinDB','0');
    Edt_GpsDBMax.Text:=ReadIni_GPS('GpsTC','MaxDB','0');
    edtEdt_GPSNumbersDY.Text:= ReadIni_GPS('GpsNumberDY','num','0');
    if (User.UserType<>'admin') and (User.UserType<>'FacSuperAdmin') and (User.UserType<>'SuperAdmin') then
    begin
      GroupBox5.Enabled:=False;
    end;

end;

procedure TfrmBasicTestParam.btnEnterClick(Sender: TObject);
var
    CommIndex:Integer;
    strTemp:string;
    i : integer;
    ParamFilename:string;
    MyIniFile:Tinifile;
begin
    strTcpIp:=edtTCPIp.Text;
    strTcpPort:=edtTCPPort.Text;
    bTcpAuto:=chkTCPAuto.Checked;
    strAutoTestModel:=Cbb_Model.Text;
    if frmAutoTestMain <> nil then
    begin
        if strAutoTestModel<>'' then
        begin
            CurrentFrom.Enabled:=True;
            //将要测试的项放至列表框中
            frmAutoTestMain.TestItem.Items.Clear;
            frmAutoTestMain.UniQuery_DstSubItem.Params.ParamByName('ItemModel').Value:=strAutoTestModel;
            frmAutoTestMain.UniQuery_DstSubItem.Open;
            frmAutoTestMain.UniQuery_DstSubItem.First;
            while not frmAutoTestMain.UniQuery_DstSubItem.Eof do
            begin
                frmAutoTestMain.TestItem.Items.Add(frmAutoTestMain.UniQuery_DstSubItem.FieldByName('ItemName').AsString);
                frmAutoTestMain.UniQuery_DstSubItem.Next;
            end;
        end;

    end;

    //要保存参数的文件
    BasicTestParam.CompareVersion:=edtCompareVersion.Text;
    BasicTestParam.FailContinueTest:=chkFailContinue.Checked;
    ParamFilename:=ExtractFilePath(Paramstr(0))+'Param.ini';
    MyIniFile:=Tinifile.Create(ParamFilename);

    with MyIniFile do
    begin
        writestring('BasicTest', 'CompareVersion', BasicTestParam.CompareVersion);
        WriteBool('BasicTest', 'FailContinueTest', BasicTestParam.FailContinueTest);
    end;
    MyIniFile.Free;

    bReadRID:=dbchkbReadRID.Checked;

end;

procedure TfrmBasicTestParam.btnStart_0Click(Sender: TObject);
var
    strComPort:string;
    CommIndex:Integer;
begin
    Application.ProcessMessages;
    bUsbReceieveData:=chkUSB.Checked;
    CommIndex:=0;
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




            Sleep(100);
            TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Caption:='断开';
            TButton(FindComponent('btnStart_'+inttostr(CommIndex))).Enabled:=True;
            SerialInfo[CommIndex].bConnectedComm:=True;
            Sleep(1000);
            SendToComm_TestParam(CommIndex,'ATTEST',strTESTAT);
            //SendToComm_TestParam(CommIndex,'ATVERSION_PARAM','AT^GT_CM=VERSION');
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

procedure TfrmBasicTestParam.Comm_00ReceiveData(Sender: TObject;    ///TComport
  DataPtr: Pointer; DataSize: Integer);
var
CommIndex,iCount,i:Integer;  //iCount用于定义能否读取基带ID数组长度 ,i数组元素位置
strTemp:string;
begin
  Application.ProcessMessages;
  CommIndex:=0;

  SetLength(StrCommRecText[CommIndex],DataSize);
  Move(DataPtr^,PChar(StrCommRecText[CommIndex])^,DataSize);

  StrCommRecText[CommIndex]:=UpperCase(StrCommRecText[CommIndex]);
  NoteCommLog(CommIndex,StrCommRecText[CommIndex]);

  DeComReceieveDataBasicTParam(CommIndex);
end;

procedure TfrmBasicTestParam.Comm_0ReceiveData(Sender: TObject;
  Buffer: Pointer; BufferLength: Word);
var
  CommIndex,iCount,i:Integer;  //iCount用于定义能否读取基带ID数组长度 ,i数组元素位置
  strTemp:string;
begin
  Application.ProcessMessages;
  CommIndex:=0;

  {SetLength(StrCommRecText[CommIndex],DataSize);
  Move(DataPtr^,PChar(StrCommRecText[CommIndex])^,DataSize);

  StrCommRecText[CommIndex]:=UpperCase(StrCommRecText[CommIndex]);
  NoteCommLog(CommIndex,StrCommRecText[CommIndex]);}
  SetLength(StrCommRecText[CommIndex],BufferLength);
  Move(Buffer^,PChar(StrCommRecText[CommIndex])^,BufferLength);

  StrCommRecText[CommIndex]:=UpperCase(StrCommRecText[CommIndex]);
  NoteCommLog(CommIndex,StrCommRecText[CommIndex]);

  DeComReceieveDataBasicTParam(CommIndex);

end;
//============================发送数据至串口============================//
function TfrmBasicTestParam.SendToComm_TestParam(CommIndex:Integer;CmdKey:string;Cmd:string;WaitResponses:Boolean;
                        WaitResponseOverTime:Integer;
                        ReturnText:string;SubItemName:string;
                        bCompare:Boolean;strCompare:string;strRemark:string;
                        bSendAtCommand:Boolean;
                        ResendNum:Integer;SendNum:Integer):Boolean;    //发送内容至串口
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

              SendCommList[CommIndex].Add(SendCommRecord);
            finally
              //Dispose(SendCommRecord);
            end;

            if SendCommList[CommIndex].Count<=1 then
            begin
               SendToComm_TestParam(CommIndex);
            end;
            Application.ProcessMessages;
        end
        else
        begin
            NoteCommLog(CommIndex,'[S:]===='+Cmd);
            if bSendAtCommand then
            begin
              if bUsbReceieveData then
              begin
                frmBasicTestParam.Comm_00.SendString(PChar(Cmd));
              end
              else
              begin
                  frmBasicTestParam.Comm_0.WriteCommData(PChar(Cmd),StrLen(PChar(Cmd)));
              end;


            end;
            Application.ProcessMessages;
        end;
    end;
    Application.ProcessMessages;
end;
//============================发送下一条内容至服务器============================//
function TfrmBasicTestParam.SendToComm_TestParam(CommIndex:Integer):Boolean;
label FindHead;
var
    strTemp:string;
    SendCommRecord:PSendCommRecord;                         //发送至串口的命令
begin
    try
      tmrRecCommTimeOut_0.Enabled:=False;
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
          if bUsbReceieveData then
          begin
             Comm_00.SendString(PChar(SendCommRecord.sCmd));
          end
          else
          begin
             Comm_0.WriteCommData(PChar(SendCommRecord.sCmd),StrLen(PChar(SendCommRecord.sCmd)));
          end;
        end;

        if (SendCommRecord^.bWaitResponses) and (SendCommRecord^.iWaitResponseOverTime>0) then
        begin
            tmrRecCommTimeOut_0.Interval:=SendCommRecord^.iWaitResponseOverTime;
            tmrRecCommTimeOut_0.Enabled:=True;
        end;
      end;
    finally
      //Dispose(SendCommRecord);
    end;
    Result:=True;
end;

procedure TfrmBasicTestParam.tmrRecCommTimeOut_0Timer(Sender: TObject);
var
    CommIndex:Integer;
    SendCommRecord:PSendCommRecord;                         //发送至串口的命令
begin
    CommIndex:=0;
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
                      SendToComm_TestParam(CommIndex);
                      SetStatusText(Format('发送至串口超时!%s请查看串口是否连接!',[SendCommRecord.sCmdKey]),0);

          end;
      end;
    finally
      //Dispose(SendCommRecord);
    end;
end;

procedure TfrmBasicTestParam.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
	iIndex:Integer;
begin
  //各个串口断开
  for iIndex := 0 to 0 do
  begin
    try
      if bUsbReceieveData then
      begin
         if TCommPortDriver(FindComponent('Comm_0'+inttostr(iIndex))).ComHandle>0 then
         begin
         TCommPortDriver(FindComponent('Comm_0'+inttostr(iIndex))).Disconnect;
         end
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
    //TTimer(FindComponent('tmrCountdown_'+inttostr(iIndex))).Enabled:=False;
  end;
end;

procedure TfrmBasicTestParam.SetSysCommToBox;
var
  iCommindex,Count:Integer;
  CommList: TStrings;
  iOldIndex :Integer;          //原先的下拉框选项
begin
  iCommindex := 0;
  CommList:= TStringList.Create;
  if GetSysComm(CommList) then
  begin
    iOldIndex := TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).ItemIndex;
    TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).Clear;
    for Count:= 0 to CommList.Count-1 do
    begin
      TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).Items.Add(CommList[Count]);
    end;
    if TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).Items.Count -1 >= iOldIndex then
      TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).ItemIndex:= iOldIndex
    else
      TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).ItemIndex:=0;
  end;
  CommList.free;
end;

procedure TfrmBasicTestParam.BtnGpsSetClick(Sender: TObject);
var
    ParamFilename:string;
    MyIniFile:Tinifile;
begin
    WriteIni_GPS('GpsTC','MinDB',Edt_GpsDBMin.Text);
    WriteIni_GPS('GpsTC','MaxDB',Edt_GpsDBMax.Text);
    WriteIni_GPS('GpsNumberDY','num',edtEdt_GPSNumbersDY.Text);
    GPSTestParam.GPSDbMin:=StrToInt(ReadIni_GPS('GpsTC','MinDB','0'));
    GPSTestParam.GPSDbMax:=StrToInt(ReadIni_GPS('GpsTC','MaxDB','0'));
    //从文件读取参数 (TCP/基本设置/GPS设置),并将其显示各控件上。
    ParamFilename:=ExtractFilePath(Paramstr(0))+'Param.ini';
    MyIniFile:=Tinifile.Create(ParamFilename);
    with MyIniFile do
    begin
        BasicTestParam.Factory:=ReadInteger('Factory', 'DESAY',0);
        if BasicTestParam.Factory=1 then
            GPSTestParam.GPSNumbers := StrToInt(Self.edtEdt_GPSNumbersDY.Text);
    end;
    MyIniFile.Free;
end;



procedure TfrmBasicTestParam.Comm_0ReceiveError(Sender: TObject;
  EventMask: Cardinal);
begin
  Sleep(10);
  //application.MessageBox('读取串口出错！','dfasdf');
  //Application.MessageBox(PChar(lDBName),'警告');

end;

procedure TfrmBasicTestParam.DeComReceieveDataBasicTParam(CommIndex:Integer);
var
 iCount,i:Integer;  //iCount用于定义能否读取基带ID数组长度 ,i数组元素位置
 strTemp:string;
 strParamIMEI:string;
begin

   if pos('=',StrCommRecText[CommIndex])<>0 then
  	StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],'=','-',[rfReplaceAll]);

  GetSendedCommCmdkey(CommIndex,strCmdReturnText[CommIndex],strCmdCommKey[CommIndex],
  			bCompare[CommIndex],strCompare[CommIndex],strRemark[CommIndex],strSubTestItemName[CommIndex],strRemark2[CommIndex]);
  strCmdReturnText[CommIndex]:=UpperCase(strCmdReturnText[CommIndex]);
  strCmdCommKey[CommIndex]:=UpperCase(strCmdCommKey[CommIndex]);

  if strCmdCommKey[CommIndex]<>'ATVERSION_PARAM' Then
  begin
      if pos(#$D,StrCommRecText[CommIndex])<>0 then
    StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],#$D,'',[rfReplaceAll]);
  if pos(#$A,StrCommRecText[CommIndex])<>0 then
    StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],#$A,'',[rfReplaceAll]);

  end;

    if strCmdCommKey[CommIndex]= 'ATTEST' then
    begin
        if Pos('OK',StrCommRecText[CommIndex])>0 then
        begin
            SendToComm_TestParam(CommIndex);
            SendToComm_TestParam(CommIndex,'IMEI','AT+EGMR=0,7');
            //SendToComm_TestParam(CommIndex,'ATVERSION_PARAM','AT^GT_CM=VERSION');
        end
        else
            Exit;
    end
    else if  strCmdCommKey[CommIndex]= 'IMEI' then
    begin
      if Pos('+EGMR:',StrCommRecText[CommIndex])>0 then
      begin
         if pos(#$D,StrCommRecText[CommIndex])<>0 then
          StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],#$D,'',[rfReplaceAll]);
         if pos(#$A,StrCommRecText[CommIndex])<>0 then
          StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],#$A,'',[rfReplaceAll]);

          strParamIMEI:=GetIMEI(StrCommRecText[CommIndex]);
          NoteCommLog(0,'[IMEI:]===='+strParamIMEI);
          if (strParamIMEI<>CheckImei(strParamIMEI)) or (Length(strParamIMEI) <> 15) then
          begin
            SendToComm_TestParam(CommIndex);
            SendToComm_TestParam(CommIndex,'ATVERSION_PARAM','AT^GT_CM=VERSION');
            EXIT;
          end;
          try
            UniQuery_GetIEMIRANG.Active:=false;
            UniQuery_GetIEMIRANG.Params[0].AsString:=strParamIMEI;
            UniQuery_GetIEMIRANG.Active:=true;
            if UniQuery_GetIEMIRANG.RecordCount<>0 then
            begin
              UniQuery_GetIEMIRANG.First;
              strIMEIStart:=UniQuery_GetIEMIRANG.fieldbyname('IMEISTART').AsString;
              strIMEIEnd:=UniQuery_GetIEMIRANG.fieldbyname('IMEIEND').AsString;
              strParamAutoTestModel:=UniQuery_GetIEMIRANG.fieldbyname('ItemModel').AsString;

            end
            else
            begin
              strIMEIStart:='0';
              strIMEIEnd:='0';
              strParamAutoTestModel:='';
            end;
          except
              strIMEIStart:='0';
              strIMEIEnd:='0';
              strParamAutoTestModel:='';
              SendToComm_TestParam(CommIndex);
              SendToComm_TestParam(CommIndex,'ATVERSION_PARAM','AT^GT_CM=VERSION');
          end;
          NoteCommLog(0,'[Param:]===='+strIMEIStart+'=='+strIMEIEnd+'=='+strParamAutoTestModel);
          SendToComm_TestParam(CommIndex);
          SendToComm_TestParam(CommIndex,'ATVERSION_PARAM','AT^GT_CM=VERSION');
      end
      else
      begin
         Exit;
      end;
    end
    else if strCmdCommKey[CommIndex]= 'ATVERSION_PARAM' then
  begin
      if Pos('[VERSION]',StrCommRecText[CommIndex])>0 then
      begin

    if Pos('[BUILD]',StrCommRecText[CommIndex]) > 0 then
    begin
        if pos(#$D,StrCommRecText[CommIndex])<>0 then
    StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],#$D,'',[rfReplaceAll]);
  if pos(#$A,StrCommRecText[CommIndex])<>0 then
    StrCommRecText[CommIndex]:=stringreplace(StrCommRecText[CommIndex],#$A,'',[rfReplaceAll]);

        SendToComm_TestParam(CommIndex);
        //strSoftModel[CommIndex]:=strAutoTestModel;

        //取得当前机子的版本
        StrCommRecText[CommIndex]:=MidStr(PChar(StrCommRecText[CommIndex]),
                                          Pos('[VERSION]',StrCommRecText[CommIndex]),
                                          StrLen(PChar(StrCommRecText[CommIndex]))-Pos('[VERSION]',StrCommRecText[CommIndex]));
        if Pos('[BUILD]',StrCommRecText[CommIndex])>0 then
        begin
          strVersion[CommIndex]:=LeftStr(StrCommRecText[CommIndex],Pos('[BUILD]',StrCommRecText[CommIndex])-1);
        end
        else
        begin
          strVersion[CommIndex]:=LeftStr(StrCommRecText[CommIndex],Pos('[BRANCH]',StrCommRecText[CommIndex])-1);
        end;
        strVersion[CommIndex]:=stringreplace(strVersion[CommIndex],'[VERSION]','',[rfReplaceAll]);
        edtCompareVersion.Text:=strVersion[CommIndex];

        Application.ProcessMessages;
        strTemp:=Format('Version=''%s''',[Trim(edtCompareVersion.Text)]);
        UniQuery_VersionModel.Close;
        UniQuery_VersionModel.Filter:=strTemp;
        UniQuery_VersionModel.Filtered:=True;
        UniQuery_VersionModel.Open;
        Application.ProcessMessages;
        iCount := UniQuery_VersionModel.RecordCount;
        i := 0;
        if iCount > 0 then
        begin
          btnEnter.Enabled:=True;
          btnCancel.Enabled:=True;
        end;
    end
    else
    begin
          if strTempVersion[CommIndex]<>''  then
          begin
            StrCommRecText[CommIndex]:=strTempVersion[CommIndex]+StrCommRecText[CommIndex];
          end;

          if Pos(#$D,StrCommRecText[CommIndex])<=0 then
           begin
               strTempVersion[CommIndex]:=StrCommRecText[CommIndex];
               Exit;
           end;
           strTempVersion[CommIndex]:='';

             SendToComm_TestParam(CommIndex);
        //strSoftModel[CommIndex]:=strAutoTestModel;

        //取得当前机子的版本
        StrCommRecText[CommIndex]:=MidStr(PChar(StrCommRecText[CommIndex]),
                                          Pos('[VERSION]',StrCommRecText[CommIndex]),
                                          StrLen(PChar(StrCommRecText[CommIndex]))-Pos('[VERSION]',StrCommRecText[CommIndex]));
        //if Pos('[#$D]',StrCommRecText[CommIndex])>0 then
        //begin
          strVersion[CommIndex]:=LeftStr(StrCommRecText[CommIndex],Pos(#$D,StrCommRecText[CommIndex])-1);
        //end
        //else
        //begin
         // strVersion[CommIndex]:=LeftStr(StrCommRecText[CommIndex],Pos('[BRANCH]',StrCommRecText[CommIndex])-1);
        //end;
        strVersion[CommIndex]:=stringreplace(strVersion[CommIndex],'[VERSION]','',[rfReplaceAll]);
        edtCompareVersion.Text:=strVersion[CommIndex];

        Application.ProcessMessages;
        strTemp:=Format('Version=''%s''',[Trim(edtCompareVersion.Text)]);
        UniQuery_VersionModel.Close;
        UniQuery_VersionModel.Filter:=strTemp;
        UniQuery_VersionModel.Filtered:=True;
        UniQuery_VersionModel.Open;
        Application.ProcessMessages;
        iCount := UniQuery_VersionModel.RecordCount;
        i := 0;
        if iCount > 0 then
        begin
          btnEnter.Enabled:=True;
          btnCancel.Enabled:=True;
        end;
    end
 end
 end;
end;




procedure TfrmBasicTestParam.chkUSBClick(Sender: TObject);
begin
    bUsbReceieveData:=chkUSB.Checked;
end;

procedure TfrmBasicTestParam.btn1Click(Sender: TObject);
var
  ShExecInfo:SHELLEXECUTEINFO;
   _path : String;
begin
    //ShellExecute(Self.Handle,'open',PChar('C:/Documents and Settings/Administrator/桌面/sscom32.exe'),'','',SW_SHOW);
    //C:\Documents and Settings\Administrator\桌面
   ShellExecute(Handle,'Open',PChar('D:/FlashTool_v5.1348.00/Flash_tool.exe'),PChar('Hello World'),PChar('D:/FlashTool_v5.1348.00'),SW_SHOWNORMAL);
   //ShellExecute(Handle,'open',PChar('D:/FlashTool_v5.1348.00/1.txt'),'-s',nil,SW_SHOWNORMAL);

end;

end.
