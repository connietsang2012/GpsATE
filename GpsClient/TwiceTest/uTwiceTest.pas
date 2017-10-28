unit uTwiceTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, ExtCtrls, SPComm, StdCtrls,uGlobalVar,uPublicFunc,
  ComCtrls, ComDrv32;

type
  TfrmTwiceTest = class(TfrmModule)
    grp_TestPlan: TGroupBox;
    chk_FuncTest: TCheckBox;
    chk_GPSTest: TCheckBox;
    chk_CoupleTest: TCheckBox;
    chk_WriteImei: TCheckBox;
    chk_ParamDownload: TCheckBox;
    chk_ALL: TCheckBox;
    rb_Imei: TRadioButton;
    rb_Rid: TRadioButton;
    rbUpdateVersion: TRadioButton;
    chk_AutoTest: TCheckBox;
    chk_CartonBox: TCheckBox;
    EdtImei: TEdit;
    redtPrompt: TRichEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    chk_AutoTestSMT: TCheckBox;
    chk_SMTIQCTest: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnStartTestClick(Sender: TObject);
    procedure EdtImeiKeyPress(Sender: TObject; var Key: Char);
    procedure chk_ALLClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure rb_ImeiClick(Sender: TObject);
    procedure rb_RidClick(Sender: TObject);
    {procedure Comm_0ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);}
    procedure Comm_0ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure rbUpdateVersionClick(Sender: TObject);
    procedure BtnReTestClick(Sender: TObject);
    procedure Comm_00ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
  private
    { Private declarations }
    procedure MsgCheckIMEI(var msg:TMessage);message WM_CheckIMEI;
    procedure DeleteTestResult_Twice();
    procedure TwiceByUpdateVersion();

    procedure SetImeiRidEnable();
    procedure ImeiPrompt(strPrompt:string);

  public
    { Public declarations }
    procedure StartTest(CommIndex:Integer);override;
    procedure MsgTwiceByUpdateVersion(var msg:TMessage);message WM_TwiceByUpdateVersion;

    procedure SetSysCommToBox; //获取注册表中的记录的串口信息，并保存到下拉框
    procedure DeComReceieveDataTwice(CommIndex:Integer);
  end;

var
  frmTwiceTest: TfrmTwiceTest;
  strDeleteImei:string;         //要删除记录的IMEI或SN
  iImeiOrRidOrVersion:Integer;    //0:以IMEI返工/1:以SN返工/2:软件升级
  iAutoTestSMT,iFunctionTest,iGpsTest,iCoupleTest,iWriteImei,iParamDownload,iCartonBox,iAutoTest,iSMTIQCTest:Integer;

implementation

{$R *.dfm}

procedure TfrmTwiceTest.MsgTwiceByUpdateVersion(var msg:TMessage);
var
    StrListNumberSign:TStringList;     //#号分隔内容
    strTemp:string;
    strUserType,strUserTestPlan:string;
    //iRecordCount:Integer;
    CommIndex:Integer;
begin
    CommIndex:=0;
    StrListNumberSign:=TStringList(msg.WParam);

    if StrListNumberSign.Values['TwiceResult']='1' then
        TfrmModule(CurrentFrom).SetResult(CommIndex,1)
    else
        TfrmModule(CurrentFrom).SetResult(CommIndex,0);
end;
procedure TfrmTwiceTest.StartTest(CommIndex:Integer);
begin
    strPlanName:='TwiceTest';

    if (iImeiOrRidOrVersion=1) or (iImeiOrRidOrVersion=2) then
    begin
        BeginTest(CommIndex);
    end;
    bUpdateForm:=False;
end;

procedure TfrmTwiceTest.FormCreate(Sender: TObject);
begin
  inherited;
    //btnStartTest.Enabled:=True;
    rb_Imei.Checked:=True;
    if (User.UserType='admin') or (User.UserType='SuperAdmin') then
    begin
      grp_TestPlan.Enabled:=True;
    end
    else
    begin
      grp_TestPlan.Enabled:=False;
    end;

end;

procedure TfrmTwiceTest.btnStartTestClick(Sender: TObject);
begin
    EdtImei.Text:='';
    //btnStartTest.Enabled:=False;
    Application.ProcessMessages;
    StartTest(0);
end;

procedure TfrmTwiceTest.EdtImeiKeyPress(Sender: TObject; var Key: Char);
var
    CommIndex:Integer;
    strTemp:string;
    strSendText:string;
begin
    if Length(EdtImei.Text)=0 then
    begin
        if (((ord(key)<=48) or (ord(key) >57)) and (key<>#13) and (key<>#8) ) then
        key:=#0
    end
    else
    begin
        if (((ord(key)<48) or (ord(key) >57)) and (key<>#13) and (key<>#8) ) then
        key:=#0
    end;

    if key=#13 then
    begin
        CommIndex:=0;
        StartTest(CommIndex);
        strDeleteImei:=EdtImei.Text;

        if (Length(strDeleteImei)=15) then
        begin
            if strDeleteImei<>CheckImei(strDeleteImei) then
            begin
                MessageBox(0, '条码不合法,请重新扫描!', '警告!', MB_ICONWARNING + mb_OK);
            end
            else
            begin
                strSendText:=Format('Action=CheckIMEI#IMEI=%s#Tester=%s#',[strDeleteImei,User.UserName]);
                SendToServer(CommIndex,'CheckIMEI',strSendText,True,CTimeOut*2);

                EdtImei.Text:='';
            end;
        end
        else
            Exit;
    end;
end;
procedure TfrmTwiceTest.TwiceByUpdateVersion();
var
    CommIndex:Integer;
    strSendText,strCmdKey:string;
begin
    CommIndex:=0;

    strSendText:=Format('Action=TwiceByUpdateVersion#Rid=%s#IMEI=%s#Version=%s#Tester=%s#',[strChipRid[CommIndex],strDeleteImei,strVersion[CommIndex],User.UserName]);
    SendToServer(CommIndex,'TwiceByUpdateVersion',strSendText,True,CTimeOut*3);
end;

procedure TfrmTwiceTest.DeleteTestResult_Twice();
//strFormName为操作的表单,bImei为True时strImeiOrRid为IMEI,否则认为是基带ID
var
    CommIndex:Integer;
    strSendText,strCmdKey:string;
begin
    CommIndex:=0;

    iFunctionTest:=BoolToInt(chk_FuncTest.Checked);
    iGpsTest:=BoolToInt(chk_GPSTest.Checked);
    iCoupleTest:=BoolToInt(chk_CoupleTest.Checked);
    iWriteImei:=BoolToInt(chk_WriteImei.Checked);
    iParamDownload:=BoolToInt(chk_ParamDownload.Checked);
    iCartonBox:=BoolToInt(chk_CartonBox.Checked);
    iAutoTest:=BoolToInt(chk_AutoTest.Checked);
    iAutoTestSMT:=BoolToInt(chk_AutoTestSMT.Checked);
    iSMTIQCTest:=BoolToInt(chk_SMTIQCTest.Checked);

    if (not (chk_FuncTest.Checked or chk_GPSTest.Checked or chk_CoupleTest.Checked or chk_WriteImei.Checked or
    chk_ParamDownload.Checked or chk_CartonBox.Checked or chk_AutoTest.Checked or chk_AutoTestSMT.Checked or chk_SMTIQCTest.Checked)) then
    begin
        Application.MessageBox('请选择要返工的工位!','警告',MB_ICONWARNING);
        TfrmModule(CurrentFrom).SetResult(CommIndex,0);
        Exit;
    end;

    if iImeiOrRidOrVersion=0 then
    begin
        //strSendText:=Format('Action=DeleteTestResult_ByImei_Twice#FormName=%s#Imei=%s#Tester=%s#',[strFormName,strDeleteImei,User.UserName]);
        strSendText:=Format('Action=DeleteTestResult_ByImei_Twice#FunctionTest=%d#GpsTest=%d#CoupleTest=%d#WriteImei=%d#ParamDownload=%d#CartonBox=%d#AutoTest=%d#AutoTestSMT=%d#SMTIQCTest=%d#Imei=%s#Version=%s#Tester=%s#',[iFunctionTest,iGpsTest,iCoupleTest,iWriteImei,iParamDownload,iCartonBox,iAutoTest,iAutoTestSMT,iSMTIQCTest,strDeleteImei,'',User.UserName]);
    end
    else
    begin
        //strDeleteImei:='12345678912345678912345678912345';
        //strSendText:=Format('Action=DeleteTestResult_ByRid_Twice#FormName=%s#Rid=%s#Tester=%s#',[strFormName,strDeleteImei,User.UserName]);
      	strSendText:=Format('Action=DeleteTestResult_ByRid_Twice#FunctionTest=%d#GpsTest=%d#CoupleTest=%d#WriteImei=%d#ParamDownload=%d#CartonBox=%d#AutoTest=%d#AutoTestSMT=%d#SMTIQCTest=%d#Rid=%s#Version=%s#Tester=%s#',[iFunctionTest,iGpsTest,iCoupleTest,iWriteImei,iParamDownload,iCartonBox,iAutoTest,iAutoTestSMT,iSMTIQCTest,strChipRid[CommIndex],strVersion[CommIndex],User.UserName]);
    end;
    SendToServer(CommIndex,'DeleteTestResult_Twice',strSendText,True,CTimeOut*3);
end;

procedure TfrmTwiceTest.chk_ALLClick(Sender: TObject);
begin
    chk_FuncTest.Checked:=chk_ALL.Checked;
    chk_GPSTest.Checked:=chk_ALL.Checked;
    chk_CoupleTest.Checked:=chk_ALL.Checked;
    chk_WriteImei.Checked:=chk_ALL.Checked;
    chk_ParamDownload.Checked:=chk_ALL.Checked;
    chk_CartonBox.Checked:=chk_ALL.Checked;
    chk_AutoTest.Checked:=chk_ALL.Checked;
    chk_AutoTestSMT.Checked:=chk_ALL.Checked;
    chk_SMTIQCTest.Checked:=chk_ALL.Checked;
end;

procedure TfrmTwiceTest.SetImeiRidEnable();
begin
    EdtImei.Enabled:=rb_Imei.Checked;
    //pnlClientTop.Enabled:=rb_Rid.Checked;
    cbbCom_0.Enabled:=rb_Rid.Checked or rbUpdateVersion.Checked;
    btnStart_0.Enabled:=rb_Rid.Checked or rbUpdateVersion.Checked;
end;
procedure TfrmTwiceTest.btn1Click(Sender: TObject);
begin
  inherited;
    //DeleteFuncTest_Twice('12345678912345678912345678912345');
    //DeleteFuncTest_Twice();
end;

procedure TfrmTwiceTest.rb_ImeiClick(Sender: TObject);
begin
  inherited;
    iImeiOrRidOrVersion:=0;
    SetImeiRidEnable();
end;

procedure TfrmTwiceTest.rb_RidClick(Sender: TObject);
begin
  inherited;
    iImeiOrRidOrVersion:=1;
    SetImeiRidEnable();
end;

{procedure TfrmTwiceTest.Comm_0ReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Integer);}
procedure TfrmTwiceTest.Comm_0ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
var
    CommIndex:Integer;
begin
    Application.ProcessMessages;
    CommIndex:=0;
  inherited;
     DeComReceieveDataTwice(CommIndex);

end;

procedure TfrmTwiceTest.rbUpdateVersionClick(Sender: TObject);
begin
  inherited;
    iImeiOrRidOrVersion:=2;
    SetImeiRidEnable();
    EdtImei.Enabled:=false;
end;
procedure TfrmTwiceTest.MsgCheckIMEI(var msg:TMessage);
var
    strTemp:string;

begin
    if msg.LParam>=1 then
    begin
        ImeiPrompt('');
        if iImeiOrRidOrVersion=0 then
        begin
            DeleteTestResult_Twice();
        end
        else
        begin
            TwiceByUpdateVersion();
        end;
    end
    else
    begin
        Application.MessageBox('此IMEI未烧写过!','警告',MB_ICONWARNING);
        EdtImei.Text:='';
        TfrmModule(CurrentFrom).SetResult(0,0);

    end;
end;
procedure TfrmTwiceTest.ImeiPrompt(strPrompt:string);
begin
  redtPrompt.Lines.Clear;
  redtPrompt.Lines.Add(strPrompt);
end;
procedure TfrmTwiceTest.BtnReTestClick(Sender: TObject);
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

procedure TfrmTwiceTest.SetSysCommToBox;
var
  iCommindex,Count :Integer;
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
    begin
      TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).ItemIndex:= iOldIndex;
    end
    else
      TComboBox(FindComponent('cbbCom_'+inttostr(iCommindex))).ItemIndex:=0;
  end;
  CommList.free;
end;

procedure TfrmTwiceTest.DeComReceieveDataTwice(CommIndex:Integer);
begin
  if strCmdCommKey[CommIndex]= 'AT' then
    begin

        if rb_Rid.Checked then
        begin
            if (pos('OK',StrCommRecText[CommIndex])>0) then
            begin
                SendToComm(CommIndex);
                if iImeiOrRidOrVersion=1 then
                begin
                    //DeleteFuncTest_Twice();
                    strCmdCommKey[CommIndex]:='';
                    DeleteTestResult_Twice();
                end
                else
                begin
                    EdtImei.Enabled:=True;
                    EdtImei.Text:='';
                    EdtImei.SetFocus;
                    if iImeiOrRidOrVersion=2 then
                    begin
                        ImeiPrompt('请扫描条码!');
                    end;
                end;

            end
            else
                Exit;
        end
        else
        begin
            SendToComm(CommIndex);
            ImeiPrompt('若要返工,请选择以RID返工!');
        end;



    end
    else if (strCmdCommKey[CommIndex]= 'ATID') then
    begin
        if (pos('00000000000000000000000000000000',strChipRid[CommIndex])<>0) or (strChipRid[CommIndex]='') then Exit;

        strDeleteImei:=strChipRid[CommIndex];
        //SendToComm(CommIndex);
        //SendToComm(CommIndex,'AT','AT');
    end
    else if strCmdCommKey[CommIndex]= 'ATVERSION' then
    else
    begin
        //SendToComm(CommIndex);
    end;
    Application.ProcessMessages;
end;  

procedure TfrmTwiceTest.Comm_00ReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
CommIndex:Integer;
begin
   Application.ProcessMessages;
    CommIndex:=0;
  inherited;
     DeComReceieveDataTwice(CommIndex);
end;

end.
