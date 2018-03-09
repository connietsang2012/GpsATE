unit uSIMRel;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, MemDS, DBAccess, Uni, OleServer, BarTender_TLB, Mask,
    DBCtrls, StdCtrls, StrUtils, uGlobalVar, uPublicFunc, ExtCtrls;

type
    TfrmSIMRel = class(TForm)
        Label3: TLabel;
        GrpTestPass: TGroupBox;
        chk_FuncTest: TCheckBox;
        chk_GPSTest: TCheckBox;
        chk_CoupleTest: TCheckBox;
        chk_WriteImei: TCheckBox;
        chk_ParamDownload: TCheckBox;
        chk_AutoTest: TCheckBox;
        grp1: TGroupBox;
        lbl_SIM: TLabel;
        lbl_IMEI: TLabel;
        lblrel: TLabel;
        Label7: TLabel;
        Edt_IMEI: TEdit;
        edt_SIM: TEdit;
        cbManuOrder: TComboBox;
        cbb_Rel: TDBLookupComboBox;
        grp4: TGroupBox;
        lbl13: TLabel;
        lbl12: TLabel;
        Label2: TLabel;
        Label5: TLabel;
        lbl18: TLabel;
        Label1: TLabel;
        Label4: TLabel;
        Label6: TLabel;
        edt_SoftModel: TDBEdit;
        edt_SN1: TDBEdit;
        edt_SN2: TDBEdit;
        edt_SN3: TDBEdit;
        edt_Date: TDBEdit;
        Edt_IMEISTART: TDBEdit;
        Edt_IMEIEND: TDBEdit;
        edt_Tac: TDBEdit;
        Edt_SIMSTART: TDBEdit;
        Edt_SIMEND: TDBEdit;
        UniQuery_SIM: TUniQuery;
        qry_UpdateDataRel: TUniQuery;
        UniQuery_InsertGiftBox: TUniQuery;
        UniQuery_GiftBoxByImei: TUniQuery;
        UniQuery_GiftBoxBySIM: TUniQuery;
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
        UniQuery_ManuOrder: TUniQuery;
        UniQuery_ManuOrderZhiDan: TStringField;
        UniQuery_IMEIRel: TUniQuery;
        UniQuery_IMEIRelRelId: TIntegerField;
        UniQuery_IMEIRelIMEIRelNo: TStringField;
        UniQuery_IMEIRelIMEIRelDes: TStringField;
        UniQuery_IMEIRel_MASK_FROM_V2: TBytesField;
        DS_ManuOrderParam: TDataSource;
        UniQuery_UpdateSN: TUniQuery;
        IntegerField1: TIntegerField;
        StringField1: TStringField;
        StringField2: TStringField;
        BytesField1: TBytesField;
        lbl8: TLabel;
        UniQuery_DataRelativeSheetByImeiSIM: TUniQuery;
        pnlClientBottom: TPanel;
        TestResult: TPanel;
    spCheckTestpass: TUniStoredProc;
        procedure FormCreate(Sender: TObject);
        procedure cbManuOrderChange(Sender: TObject);
        procedure edt_SIMKeyPress(Sender: TObject; var Key: Char);
        procedure Edt_IMEIKeyPress(Sender: TObject; var Key: Char);
    private
        { Private declarations }
        procedure IMEIErrorPrompt(StrPrompt: string);
        procedure AllowPrint();

    public
        { Public declarations }
        procedure MsgTestPass(var StrListNumberSign: TStringList; var comm: Integer);
        procedure MsgAllowPrint(var msg: TMessage); message WM_AllowPrint;
        procedure SetResult(iResult: Integer);
    end;

var
    frmSIMRel: TfrmSIMRel;
    IMEIRel: Integer;

implementation

{$R *.dfm}

procedure TfrmSIMRel.MsgAllowPrint(var msg: TMessage);
begin
    AllowPrint();
end;

procedure TfrmSIMRel.IMEIErrorPrompt(StrPrompt: string);
begin
    lbl8.Caption := StrPrompt;
    if StrPrompt <> '' then
    begin
        //Windows.Beep(2000, 500);
        //Windows.Beep(2000, 500);
        edt_IMEI.Text := '';
        edt_SIM.Text := '';
        edt_SIM.SetFocus;
    end;
end;

procedure TfrmSIMRel.FormCreate(Sender: TObject);
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
    IMEIErrorPrompt('');
    strPlanName := 'SIMRel';
    //操作员没权限更改数据
    //if (User.UserType <> 'ParamConfig') and (User.UserType <> 'admin') and (User.UserType <> 'SuperAdmin') then
    begin
        edt_SoftModel.Enabled := false;
        edt_SN1.Enabled := false;
        edt_SN2.Enabled := false;
        edt_SN3.Enabled := false;
        edt_Date.Enabled := false;
        Edt_IMEISTART.Enabled := false;
        Edt_IMEIEND.Enabled := false;
        edt_Tac.Enabled := false;
        Edt_SIMSTART.Enabled := false;
        Edt_SIMEND.Enabled := false;
    end;
end;

procedure TfrmSIMRel.cbManuOrderChange(Sender: TObject);
begin
    UniQuery_ManuOrderParam.Active := false;
    UniQuery_ManuOrderParam.Params.ParamByName('ZhiDan').AsString := cbManuOrder.Text;
    UniQuery_ManuOrderParam.Active := true;

    IMEIRel := UniQuery_ManuOrderParam.FieldByName('IMEIRel').AsInteger;

    edt_SIM.Enabled := False;

    case IMEIRel of
        1, 2, 3:
            begin
                edt_SIM.Enabled := true;
                Edt_IMEI.Enabled := true;
                edt_SIM.SetFocus;
            end;
    else
        begin
            edt_SIM.Enabled := False;
            Edt_IMEI.Enabled := False;
        end;
    end;
end;

procedure TfrmSIMRel.edt_SIMKeyPress(Sender: TObject; var Key: Char);
var
    iRecordCount: Integer;
    iSIM, istart, iend: Integer;
begin
    IMEIErrorPrompt('');
    if Length(edt_SIM.Text) = 0 then
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
        if Length(edt_SIM.Text) = 13 then
        begin
            if ((Edt_SIMSTART.Text <> '') and (Edt_SIMEND.Text <> '')) then
            begin
                istart := strtoint64(Trim(Edt_SIMSTART.Text));
                iend := strtoint64(Trim(Edt_SIMEND.Text));
                iSIM := strtoint64(Trim(edt_SIM.Text));
                if iend <= istart then
                begin
                    IMEIErrorPrompt('此SIM号段设置错误(起始大于结束)！');
                    Exit;
                end;
                if ((iSIM < istart) or (iSIM > iend)) then
                begin
                    IMEIErrorPrompt('此SIM号不在设置号段内！');
                    Exit;
                end;
            end;
            //SIM卡号是否存在
            UniQuery_SIM.Close;
            UniQuery_SIM.ParamByName('SIMNo').Value := edt_SIM.Text;
            UniQuery_SIM.Open;
            iRecordCount := UniQuery_SIM.RecordCount;
            UniQuery_SIM.Close;
            if (iRecordCount <= 0) then
            begin
                IMEIErrorPrompt('SIM卡号不存在!');
                edt_SIM.Text := '';
                edt_SIM.SetFocus;
                Exit;
            end
            else
            begin
                Edt_IMEI.Text := '';
                Edt_IMEI.SetFocus;
            end;
            //查看IMEI是否打印过
            UniQuery_GiftBoxBySIM.Close;
            UniQuery_GiftBoxBySIM.ParamByName('SIMNO').Value := Edt_SIM.Text;
            UniQuery_GiftBoxBySIM.Open;
            iRecordCount := UniQuery_GiftBoxBySIM.RecordCount;
            UniQuery_GiftBoxBySIM.Close;
            if (iRecordCount <= 0) then
            begin
                IMEIErrorPrompt('SIM已经与其他IMEI绑定!');
                edt_SIM.Text := '';
                edt_SIM.SetFocus;
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

procedure TfrmSIMRel.Edt_IMEIKeyPress(Sender: TObject; var Key: Char);
var
    strSendText: string;
    CommIndex: Integer;
    iIMEI, istart, iend: Integer;
    iRecordCount: Integer;
    iFuncTestPass: Integer;
    iGPSPass: Integer;
    iCoupleTestPass: Integer;
    iWriteImeiPass: Integer;
    iParamDownloadPass: Integer;
    iAutoPass: Integer;
    CheckResult: Integer;
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
            //判断条码是否以TAC开始
            if (copy(Edt_IMEI.Text, 1, length(edt_Tac.text)) <> edt_Tac.Text) then
            begin
                IMEIErrorPrompt('非法IMEI');
                Exit;
            end;
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
            //strSendText := 'Action=CheckTestPass#IMEI=' + edt_IMEI.Text + '#Tester=' + User.UserName + '#';
            //SendToServer(CommIndex, 'CheckTestPass', strSendText);
            AllowPrint();
            {with spCheckTestpass do
            begin
                Close;
                ParamByName('cIMEI').Value := Edt_IMEI.Text;
                ExecProc;
                //iAutoTestSMTPass:=Parameters.ParamByName('iAutoTestSMTPass').Value;
                iFuncTestPass := ParamByName('iFunctionPass').Value;
                iGPSPass := ParamByName('iGPSPass').Value;
                iCoupleTestPass := ParamByName('iCouplePass').Value;
                iWriteImeiPass := ParamByName('iWriteImeiPass').Value;
                iParamDownloadPass := ParamByName('iParamDownloadPass').Value;
                iAutoPass := ParamByName('iAutoPass').Value;
                CheckResult := ParamByName('cResult').Value;

                if CheckResult < 1 then
                begin
                    if iFuncTestPass = 0 then
                    begin
                        chk_FuncTest.Checked := True;
                    end;
                    if iGPSPass = 0 then
                    begin
                        chk_GPSTest.Checked := True;
                    end;
                    if iCoupleTestPass = 0 then
                    begin
                        chk_CoupleTest.Checked := True;
                    end;
                    if iAutoPass = 0 then
                    begin
                        chk_AutoTest.Checked := True;
                    end;
                    if iWriteImeiPass = 0 then
                    begin
                        chk_WriteImei.Checked := True;

                    end;
                    if iParamDownloadPass = 0 then
                    begin
                        chk_ParamDownload.Checked := True;
                        
                    end;
                    GrpTestPass.Visible := True;
                    IMEIErrorPrompt('此机子其它测试项没测试通过');
                end
                else
                begin
                    GrpTestPass.Visible := False;
                    //SendNotifyMessage(Handle, WM_AllowPrint, 0, 0);
                    //RefreseDisplay();
                    AllowPrint();

                end;
            end;}
        end
        else
        begin
            AllowPrint();
        end;
    end;
end;


procedure TfrmSIMRel.MsgTestPass(var StrListNumberSign: TStringList; var comm: Integer);
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

procedure TfrmSIMRel.AllowPrint();
var
    iRecordCount: Integer;
begin

    begin
        //查看IMEI是否打印过
        UniQuery_GiftBoxBySIM.Close;
        UniQuery_GiftBoxBySIM.ParamByName('SIMNO').Value := Edt_IMEI.Text;
        UniQuery_GiftBoxBySIM.Open;
        iRecordCount := UniQuery_GiftBoxBySIM.RecordCount;
        UniQuery_GiftBoxBySIM.Close;

        if (iRecordCount) >= 1 then
        begin
            IMEIErrorPrompt('当前IMEI已经绑定SIM卡!');
            Exit;
        end;

        if (edt_SIM.Text <> '') and (Edt_IMEI.Text <> '') then
        begin
            //更新DataRelativeSheet表
            qry_UpdateDataRel.Close;
            qry_UpdateDataRel.ParamByName('IMEI').Value := Edt_IMEI.Text;
            qry_UpdateDataRel.ParamByName('SIMNo').Value := edt_SIM.Text;
            qry_UpdateDataRel.Execute;

            //查看DataRelativeSheet表是否更改
            UniQuery_DataRelativeSheetByImeiSIM.Close;
            UniQuery_DataRelativeSheetByImeiSIM.ParamByName('IMEI').Value := Edt_IMEI.Text;
            UniQuery_DataRelativeSheetByImeiSIM.ParamByName('SIMNO').Value := edt_SIM.Text;
            UniQuery_DataRelativeSheetByImeiSIM.Open;
            iRecordCount := UniQuery_DataRelativeSheetByImeiSIM.RecordCount;
            UniQuery_DataRelativeSheetByImeiSIM.Close;
            if (iRecordCount < 1) then
            begin
                IMEIErrorPrompt('IMEI与SIM绑定失败,请联系管理员!');
                SetResult(0);
                Exit;
            end;
            SetResult(1);
        end;
        edt_SIM.Text := '';
        Edt_IMEI.Text := '';
        edt_SIM.SetFocus;
    end;

end;

{
iResult<  -2->初始状态或显示内容? -1->倒计时  1->成功  0->失败 >
}

procedure TfrmSIMRel.SetResult(iResult: Integer);
var
    strTestTime, strSendText: string;
    hWindow: HWND;
begin
    //Application.ProcessMessages;
    case iResult of
        -1:
            begin
                TPanel(FindComponent('TestResult')).Caption := '';
                TPanel(FindComponent('TestResult')).Color := clSilver;

            end;
        1:
            begin
                TPanel(FindComponent('TestResult')).Caption := 'PASS';
                TPanel(FindComponent('TestResult')).Color := clGreen;
            end;
        0:
            begin
                TPanel(FindComponent('TestResult')).Caption := 'FAIL';
                TPanel(FindComponent('TestResult')).Color := clRed;
            end;
    end;
    //Application.ProcessMessages;
end;
end.

