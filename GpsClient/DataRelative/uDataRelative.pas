unit uDataRelative;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, DB, MemDS, DBAccess, Uni,uGlobalVar,uDmMain,


      Buttons, StrUtils,  OleServer, ExtCtrls;

type
  TfrmDataRelative = class(TForm)
    GrpTestPass: TGroupBox;
    chk_FuncTest: TCheckBox;
    chk_GPSTest: TCheckBox;
    chk_CoupleTest: TCheckBox;
    chk_WriteImei: TCheckBox;
    chk_ParamDownload: TCheckBox;
    chk_AutoTest: TCheckBox;
    UniQuery_ManuOrder: TUniQuery;
    UniQuery_ManuOrderZhiDan: TStringField;
    UniQuery_ManuOrderParam: TUniQuery;
    UniQuery_ManuOrderParamZhiDan: TStringField;
    UniQuery_ManuOrderParamSoftModel: TStringField;
    UniQuery_ManuOrderParamSN1: TStringField;
    UniQuery_ManuOrderParamSN2: TStringField;
    UniQuery_ManuOrderParamSN3: TStringField;
    UniQuery_ManuOrderParamProductDate: TStringField;
    UniQuery_ManuOrderParamProductNo: TStringField;
    UniQuery_ManuOrderParamVersion: TStringField;
    UniQuery_ManuOrderParamIMEIStart: TStringField;
    UniQuery_ManuOrderParamIMEIEnd: TStringField;
    UniQuery_ManuOrderParamSIMStart: TStringField;
    UniQuery_ManuOrderParamSIMEnd: TStringField;
    UniQuery_ManuOrderParamIMEIRel: TIntegerField;
    UniQuery_ManuOrderParamTACInfo: TStringField;
    UniQuery_ManuOrderParamCompanyName: TStringField;
    UniQuery_ManuOrderParamStatus: TIntegerField;
    UniQuery_ManuOrderParam_MASK_FROM_V2: TBytesField;
    UniQuery_ManuOrderParamIMEIRelDesc: TStringField;
    UniQuery_IMEIRel: TUniQuery;
    UniQuery_IMEIRelRelId: TIntegerField;
    UniQuery_IMEIRelIMEIRelNo: TStringField;
    UniQuery_IMEIRelIMEIRelDes: TStringField;
    UniQuery_IMEIRel_MASK_FROM_V2: TBytesField;
    DS_ManuOrderParam: TDataSource;
    DataSource1: TDataSource;
    grp4: TGroupBox;
    lbl13: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    lbl18: TLabel;
    Label1: TLabel;
    edt_SoftModel: TDBEdit;
    edt_Date: TDBEdit;
    Edt_IMEISTART: TDBEdit;
    Edt_IMEIEND: TDBEdit;
    edt_Tac: TDBEdit;
    grp1: TGroupBox;
    lbl_SIM: TLabel;
    lbl_IMEI: TLabel;
    lblrel: TLabel;
    Label7: TLabel;
    Edt_IMEI: TEdit;
    edt_BAT: TEdit;
    cbManuOrder: TComboBox;
    cbb_Rel: TDBLookupComboBox;
    Label4: TLabel;
    Edt_BATSTART: TDBEdit;
    Label6: TLabel;
    Edt_BATEND: TDBEdit;
    UniQuery_ManuOrderParamBATStart: TStringField;
    UniQuery_ManuOrderParamBATEnd: TStringField;
    lbl8: TLabel;
    UniQuery_DataRelative_ByBAT: TUniQuery;
    UniQuery_DataRelative_ByIMEI: TUniQuery;
    UniQuery_InsertDataRelative_BAT: TUniQuery;
    pnlClientBottom: TPanel;
    TestResult: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure cbManuOrderChange(Sender: TObject);
    procedure Edt_IMEIKeyPress(Sender: TObject; var Key: Char);
    procedure edt_BATKeyPress(Sender: TObject; var Key: Char);
    procedure MsgAllowPrint(var msg: TMessage); message WM_AllowPrint;
  private
    { Private declarations }
    procedure IMEIErrorPrompt(StrPrompt: string);
    procedure AllowPrint();
    procedure SetResult(iResult:Integer);
  public
    { Public declarations }
    procedure MsgTestPass(var StrListNumberSign: TStringList; var comm: Integer);
  end;

var
  frmDataRelative: TfrmDataRelative;
  IMEIRel:Integer;
implementation
uses uClientMain, uPublicFunc;
{$R *.dfm}
procedure TfrmDataRelative.MsgAllowPrint(var msg: TMessage);
begin
    AllowPrint();
end;
procedure TfrmDataRelative.FormCreate(Sender: TObject);
begin
    UniQuery_ManuOrder.Close;
    UniQuery_ManuOrder.Open;
    UniQuery_ManuOrder.First;
    cbManuOrder.Clear;
    while not UniQuery_ManuOrder.Eof do
    begin
        cbManuOrder.Items.Add(UniQuery_ManuOrder.FieldByName('ZhiDan').AsString);
        UniQuery_ManuOrder.Next;
    end;


    //彩盒测试位
    //IMEIErrorPrompt('');
    strPlanName := 'DataRelative';

    //操作员没权限更改数据
    if (User.UserType <> 'ParamConfig') and (User.UserType <> 'admin') and (User.UserType <> 'SuperAdmin') then
    begin
        edt_SoftModel.Enabled := false;
        {edt_SN1.Enabled := false;
        edt_SN2.Enabled := false;
        edt_SN3.Enabled := false;}
        edt_Date.Enabled := false;
        Edt_IMEISTART.Enabled := false;
        Edt_IMEIEND.Enabled := false;
        edt_Tac.Enabled := false;
        Edt_BATSTART.Enabled := false;
        Edt_BATEND.Enabled := false;
        //edtReprintImei.Enabled:=False;
    end;
end;

procedure TfrmDataRelative.cbManuOrderChange(Sender: TObject);
begin
    UniQuery_ManuOrderParam.Active:=false;
    UniQuery_ManuOrderParam.Params.ParamByName('ZhiDan').AsString:=cbManuOrder.Text;
    UniQuery_ManuOrderParam.Active:=true;

    IMEIRel:=UniQuery_ManuOrderParam.FieldByName('IMEIRel').AsInteger;

    edt_BAT.Enabled := False;
    if (IMEIRel = 2) then
    begin
        edt_BAT.Enabled := true;
        edt_BAT.SetFocus;
        edt_IMEI.Enabled:=True;
    end;
end;

procedure TfrmDataRelative.Edt_IMEIKeyPress(Sender: TObject;
  var Key: Char);
var
    strSendText: string;
    CommIndex: Integer;
    iIMEI, istart, iend: Integer;
begin
    IMEIErrorPrompt('');
    if Length(edt_IMEI.Text) = 0 then
    begin
        if (((ord(key) <= 48) or (ord(key) > 57)) and (key <> #13) and (key <> #8)) then
            key := #0
    end
    else
    begin
        if (((ord(key) < 48) or (ord(key) > 57)) and (key <> #13) and (key <> #8)) then
            key := #0
    end;
    if key = #13 then
    begin
        if Length(edt_IMEI.Text) = 15 then
        begin
            if ((Edt_IMEISTART.Text <> '') and (Edt_IMEIEND.Text <> '')) then
            begin
                istart := strtoint64(Trim(Edt_IMEISTART.Text));
                iend := strtoint64(Trim(Edt_IMEIEND.Text));
                iIMEI := strtoint64(LeftStr(Trim(Edt_IMEI.Text), 14));
                if iend <= istart then
                begin
                    IMEIErrorPrompt('此IMEI号段设置错误(起始大于结束)！');
                    Exit;
                end;
                if ((iIMEI < istart) or (iIMEI > iend)) then
                begin
                    IMEIErrorPrompt('此IMEI不在设置号段内！');
                    Exit;
                end;
            end;
            //判断是否测试过
            CommIndex := 0;
            GrpTestPass.Visible := False;
            chk_FuncTest.Checked := False;
            chk_GPSTest.Checked := False;
            chk_CoupleTest.Checked := False;
            chk_WriteImei.Checked := False;
            chk_AutoTest.Checked := False;
            chk_ParamDownload.Checked := False;
            strSendText := 'Action=CheckTestPass#IMEI=' + edt_IMEI.Text + '#Tester=' + User.UserName + '#';
            SendToServer(CommIndex, 'CheckTestPass', strSendText);
            //AllowPrint();

        end;
    end;
end;
procedure TfrmDataRelative.IMEIErrorPrompt(StrPrompt: string);
begin
    lbl8.Caption := StrPrompt;
    if StrPrompt <> '' then
    begin
        edt_IMEI.Text := '';
        edt_BAT.Text := '';
    end;
end;

procedure TfrmDataRelative.MsgTestPass(var StrListNumberSign: TStringList; var comm: Integer);
var
    iRecordCount: Integer;
begin
    //机子未测试通过
    if StrToInt(StrListNumberSign.Values['Result']) < 1 then
    begin
        if StrToInt(StrListNumberSign.Values['FunctionTest']) = 0 then
        begin
            chk_FuncTest.Checked := True;
        end;
        if StrToInt(StrListNumberSign.Values['GPS']) = 0 then
        begin
            chk_GPSTest.Checked := True;
        end;
        if StrToInt(StrListNumberSign.Values['CoupleTest']) = 0 then
        begin
            chk_CoupleTest.Checked := True;
        end;
        if StrToInt(StrListNumberSign.Values['AutoTest']) = 0 then
        begin
            chk_AutoTest.Checked := True;
        end;
        if StrToInt(StrListNumberSign.Values['WriteImei']) = 0 then
        begin
            chk_WriteImei.Checked := True;
        end;
        GrpTestPass.Visible := True;
        IMEIErrorPrompt('此机子其它测试项没测试通过');
    end
    else
        //可以打印
    begin
        GrpTestPass.Visible := False;
        //AllowPrint();
        SendNotifyMessage(Handle, WM_AllowPrint, 0, 0);
    end;
end;

procedure TfrmDataRelative.AllowPrint();
var
    iRecordCount: Integer;
begin

        //查看IMEI是否打印过
        UniQuery_DataRelative_ByIMEI.Close;
        UniQuery_DataRelative_ByIMEI.ParamByName('IMEI').Value := Edt_IMEI.Text;
        UniQuery_DataRelative_ByIMEI.Open;
        iRecordCount := UniQuery_DataRelative_ByIMEI.RecordCount;
        UniQuery_DataRelative_ByIMEI.Close;

        if (iRecordCount) >= 1 then
        begin
            IMEIErrorPrompt('当前IMEI已经绑定电池号!');
            Edt_IMEI.Text := '';
            edt_BAT.Text := '';

                edt_BAT.SetFocus;

            Exit;
        end;

        if(edt_BAT.Text<>'') and (Edt_IMEI.Text<>'') then
        begin
          //更新数据库Gps_GiftBox_Result结果
          UniQuery_InsertDataRelative_BAT.Close;
          UniQuery_InsertDataRelative_BAT.ParamByName('IMEI').Value := Edt_IMEI.Text;
          UniQuery_InsertDataRelative_BAT.ParamByName('BAT').Value := edt_BAT.Text;
          UniQuery_InsertDataRelative_BAT.ParamByName('ZhiDan').Value := cbManuOrder.Text;
          UniQuery_InsertDataRelative_BAT.ParamByName('TesterId').Value := User.UserName;
          UniQuery_InsertDataRelative_BAT.Execute;

          if(UniQuery_InsertDataRelative_BAT.RowsAffected=1)  then
          begin
            SetResult(1);
          end
          else
          begin
            SetResult(0);
          end;

          
        end;
          edt_BAT.Text:='';
          Edt_IMEI.Text:='';
          edt_BAT.SetFocus;
          //IMEIErrorPrompt('');

end;

procedure TfrmDataRelative.edt_BATKeyPress(Sender: TObject; var Key: Char);
var
    iRecordCount: Integer;
    iBAT, istart, iend: Integer;
begin
    IMEIErrorPrompt('');

    if Length(edt_BAT.Text) = 0 then
    begin
        if (((ord(key) < 48) or (ord(key) > 57)) and (key <> #13) and (key <> #8)) then
            key := #0
    end
    else
    begin
        if (((ord(key) < 48) or (ord(key) > 57)) and (key <> #13) and (key <> #8)) then
            key := #0
    end;
    if key = #13 then
    begin
        if Length(edt_BAT.Text) = 10 then
        begin
            SetResult(-1);
            if ((Edt_BATSTART.Text <> '') and (Edt_BATEND.Text <> '')) then
            begin
                istart := strtoint64(Trim(Edt_BATSTART.Text));
                iend := strtoint64(Trim(Edt_BATEND.Text));
                iBAT := strtoint64(Trim(edt_BAT.Text));
                if iend <= istart then
                begin
                    IMEIErrorPrompt('此BAT号段设置错误(起始大于结束)！');
                    Exit;
                end;
                if ((iBAT < istart) or (iBAT > iend)) then
                begin
                    IMEIErrorPrompt('此BAT号不在设置号段内！');
                    Exit;
                end;

            end;
            //BAT号是否已绑定
            UniQuery_DataRelative_ByBAT.Close;
            UniQuery_DataRelative_ByBAT.ParamByName('BATNo').Value := edt_BAT.Text;
            UniQuery_DataRelative_ByBAT.Open;
            iRecordCount := UniQuery_DataRelative_ByBAT.RecordCount;
            UniQuery_DataRelative_ByBAT.Close;
            if (iRecordCount > 0) then
            begin
                IMEIErrorPrompt('BAT号已与其它IMEI绑定!');
                edt_BAT.Text := '';
                edt_BAT.SetFocus;
                Exit;
            end
            else
            begin
                Edt_IMEI.Text := '';
                Edt_IMEI.SetFocus;
            end;
            
        end;
    end;
end;
{
iResult<  -2->初始状态或显示内容? -1->倒计时  1->成功  0->失败 >
}
procedure TfrmDataRelative.SetResult(iResult:Integer);
var
    strTestTime, strSendText: string;
    hWindow: HWND;
begin
    Application.ProcessMessages;

    case iResult of
        -1:
            begin
                TPanel(FindComponent('TestResult')).Caption := '';
                TPanel(FindComponent('TestResult' )).Color := clSilver;

            end;
        1:
            begin
                TPanel(FindComponent('TestResult' )).Caption := 'PASS';
                TPanel(FindComponent('TestResult' )).Color := clGreen;
            end;
        0:
            begin
                TPanel(FindComponent('TestResult' )).Caption := 'FAIL';
                TPanel(FindComponent('TestResult' )).Color := clRed;
            end;
    end;
    Application.ProcessMessages;
end;

end.
