unit uGiftBoxMain;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, StrUtils, uGlobalVar, OleServer, BarTender_TLB,
    DB, MemDS, DBAccess, Uni, uDmMain;

type
    TfrmGiftBoxMain = class(TForm)
        Label3: TLabel;
        grp2: TGroupBox;
        lbl8: TLabel;
        btnPrint: TSpeedButton;
        chkAuto: TCheckBox;
        btnClear: TButton;
        GrpTestPass: TGroupBox;
        chk_FuncTest: TCheckBox;
        chk_GPSTest: TCheckBox;
        chk_CoupleTest: TCheckBox;
        chk_WriteImei: TCheckBox;
        chk_ParamDownload: TCheckBox;
        chk_AutoTest: TCheckBox;
        grp1: TGroupBox;
        Edt_IMEI: TEdit;
        edt_SIM: TEdit;
        lbl_SIM: TLabel;
        lbl_IMEI: TLabel;
        grp4: TGroupBox;
        lbl13: TLabel;
        lbl12: TLabel;
        Label2: TLabel;
        Label5: TLabel;
        lbl18: TLabel;
        edt_Tac: TEdit;
        edt_SN1: TEdit;
        Edt_IMEISTART: TEdit;
        Edt_IMEIEND: TEdit;
        edt_Date: TEdit;
        Label1: TLabel;
        edt_SoftModel: TEdit;
        edt_SN2: TEdit;
        edt_SN3: TEdit;
        btappAutoPrint: TBTApplication;
        btappBtnPrint: TBTApplication;
        UniQuery_SIM: TUniQuery;
        lblrel: TLabel;
        cbb_Rel: TComboBox;
        Label4: TLabel;
        Edt_SIMSTART: TEdit;
        Label6: TLabel;
        Edt_SIMEND: TEdit;
        qry_UpdateDataRel: TUniQuery;
        UniQuery_InsertGiftBox: TUniQuery;
        UniQuery_GiftBoxByImei: TUniQuery;
        edtReprintImei: TEdit;
        UniQuery_GiftBoxBySIM: TUniQuery;
        UniQuery_GiftBoxByImeiReprint: TUniQuery;
        procedure FormCreate(Sender: TObject);
        procedure edt_IMEIKeyPress(Sender: TObject; var Key: Char);
        procedure IMEIErrorPrompt(StrPrompt: string);
        procedure btnPrintClick(Sender: TObject);
        procedure edt_TacKeyPress(Sender: TObject; var Key: Char);
        procedure MsgTestPass(var StrListNumberSign: TStringList; var comm: Integer);
        procedure MsgBarPrint(var msg: TMessage); message WM_BarPrint;
        procedure AllowPrint();
        procedure ImeiPrint();
        procedure edt_SIMKeyPress(Sender: TObject; var Key: Char);
        procedure cbb_RelChange(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure edtReprintImeiKeyPress(Sender: TObject; var Key: Char);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmGiftBoxMain: TfrmGiftBoxMain;

implementation

uses uClientMain, uPublicFunc;
{$R *.dfm}

procedure TfrmGiftBoxMain.FormCreate(Sender: TObject);
begin
    //彩盒测试位
    IMEIErrorPrompt('');
    strPlanName := 'GiftBox';
    //读取参数
    edt_SoftModel.Text := ReadIni('Gift', 'SoftModel', '');
    edt_SN1.Text := ReadIni('Gift', 'SN1', '');
    edt_SN2.Text := ReadIni('Gift', 'SN2', '');
    edt_SN3.Text := ReadIni('Gift', 'SN3', '');
    edt_Date.Text := ReadIni('Gift', 'Date', '');
    Edt_IMEISTART.Text := ReadIni('Gift', 'IMEISTART', '');
    Edt_IMEIEND.Text := ReadIni('Gift', 'IMEIEND', '');
    edt_Tac.Text := ReadIni('Gift', 'TAC', '');
    Edt_SIMSTART.Text := ReadIni('Gift', 'SIMSTART', '');
    Edt_SIMEND.Text := ReadIni('Gift', 'SIMEND', '');
    if (Length(edt_SN2.Text) = 1) then
        edt_SN2.Text := '0000' + edt_SN2.Text
    else
        if (Length(edt_SN2.Text) = 2) then
            edt_SN2.Text := '000' + edt_SN2.Text
        else
            if (Length(edt_SN2.Text) = 3) then
                edt_SN2.Text := '00' + edt_SN2.Text
            else
                if (Length(edt_SN2.Text) = 4) then
                    edt_SN2.Text := '0' + edt_SN2.Text;
    if ReadIni('Gift', 'AutoPrint', '0') = '1' then
        chkAuto.Checked := True
    else
        chkAuto.Checked := False;
    //操作员没权限更改数据
    if (User.UserType <> 'ParamConfig') and (User.UserType <> 'admin') and (User.UserType <> 'SuperAdmin') then
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
        edtReprintImei.Enabled:=False;
    end;

end;

procedure TfrmGiftBoxMain.edt_IMEIKeyPress(Sender: TObject; var Key: Char);
var
    strSendText: string;
    CommIndex: Integer;
    iIMEI, istart, iend: Integer;
begin
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
            strSendText := 'Action=CheckTestPass#IMEI=' + edt_IMEI.Text + '#Tester=' + User.UserName + '#';
            SendToServer(CommIndex, 'CheckTestPass', strSendText);
        end;
    end;
end;

procedure TfrmGiftBoxMain.IMEIErrorPrompt(StrPrompt: string);
begin
    lbl8.Caption := StrPrompt;
    if StrPrompt <> '' then
    begin
        Windows.Beep(2000, 500);
        Windows.Beep(2000, 500);
        edt_IMEI.Text := '';
        edt_SIM.Text := '';
    end;
end;

procedure TfrmGiftBoxMain.btnPrintClick(Sender: TObject);
begin
    ImeiPrint();
end;

procedure TfrmGiftBoxMain.edt_TacKeyPress(Sender: TObject; var Key: Char);
begin
    if (((ord(key) < 48) or (ord(key) > 57)) and (key <> #8)) then key := #0
end;

procedure TfrmGiftBoxMain.MsgTestPass(var StrListNumberSign: TStringList; var comm: Integer);
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
        AllowPrint();
        GrpTestPass.Visible := False;
    end;
end;

procedure TfrmGiftBoxMain.AllowPrint();
var
    iRecordCount: Integer;
begin
    begin
        //查看IMEI是否打印过
        UniQuery_GiftBoxByImei.Close;
        UniQuery_GiftBoxByImei.ParamByName('IMEI').Value := Edt_IMEI.Text;
        UniQuery_GiftBoxByImei.Open;
        iRecordCount := UniQuery_GiftBoxByImei.RecordCount;
        UniQuery_GiftBoxByImei.Close;

        if (iRecordCount) >= 1 then
        begin
            MessageBox(0, PCHAR('当前IMEI已经扫描过请勿重复扫描'), '友情提醒,数据重复', mb_OK);
            Edt_IMEI.Text := '';
            edt_SIM.Text := '';
            if (cbb_Rel.ItemIndex = 1) then
            begin
                edt_SIM.SetFocus;
            end
            else
            begin
                Edt_IMEI.SetFocus;
            end;
            Exit;
        end;
    end;
    //自动打印
    if (chkAuto.Checked) then
    begin
        SendNotifyMessage(Handle, WM_BarPrint, 0, 0);
    end;
end;

procedure TfrmGiftBoxMain.MsgBarPrint(var msg: TMessage);
begin
    ImeiPrint();
end;

procedure TfrmGiftBoxMain.ImeiPrint();
var
    strFile, strver: string;
begin
    if (trim(edt_SoftModel.Text) = '') then
    begin
        ShowMessage('机型不能为空');
        Exit;
    end;
    //打开bartender文件
    strFile := ExtractFilePath(ParamStr(0)) + 'GiftBox\' + 'model.btw';
    AppendTxt(strFile, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
    with btappAutoPrint.Formats.Open(strFile, True, '') do //打开标签文件
    begin
        SetNamedSubStringValue('IMEI', trim(Edt_IMEI.Text));
        SetNamedSubStringValue('IMEI_QR', trim(Edt_IMEI.Text));
        SetNamedSubStringValue('SN', trim(edt_SN1.Text) + trim(edt_SN2.Text) + trim(edt_SN3.Text));
        SetNamedSubStringValue('SoftModel', trim(edt_SoftModel.Text));
        SetNamedSubStringValue('ProductDate', trim(edt_Date.Text));
        strver := SysUtils.Format('IMEI:%s' + #13#10 + 'SN:%s%s%s' + #13#10 + 'SoftModel:%s' + #13#10 + 'ProductDate:%s' + #13#10,
            [edt_IMEI.Text, edt_SN1.Text, edt_SN2.text, edt_SN3.text, edt_SoftModel.Text, edt_Date.Text]);
        AppendTxt(strver, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');

        //更新数据库DataRelativeSheet
        qry_UpdateDataRel.Close;
        qry_UpdateDataRel.ParamByName('IMEI').Value := Edt_IMEI.Text;
        qry_UpdateDataRel.ParamByName('SIMNo').Value := edt_SIM.Text;
        qry_UpdateDataRel.Execute;

        //更新数据库Gps_GiftBox_Result结果
        UniQuery_InsertGiftBox.Close;
        UniQuery_InsertGiftBox.ParamByName('SN').Value := edt_SN1.Text + edt_SN2.Text + edt_SN3.Text;
        UniQuery_InsertGiftBox.ParamByName('IMEI').Value := Edt_IMEI.Text;
        UniQuery_InsertGiftBox.ParamByName('SIMNO').Value := edt_SIM.Text;
        UniQuery_InsertGiftBox.ParamByName('ZhiDan').Value := '';
        UniQuery_InsertGiftBox.ParamByName('SoftModel').Value := edt_SoftModel.Text;
        UniQuery_InsertGiftBox.ParamByName('Date').Value := edt_Date.Text;
        UniQuery_InsertGiftBox.ParamByName('CompanyName').Value := '';
        UniQuery_InsertGiftBox.ParamByName('TesterId').Value := User.UserName;
        UniQuery_InsertGiftBox.Execute;

        IMEIErrorPrompt('');
        if (cbb_Rel.ItemIndex = 1) then
        begin
            edt_SIM.SetFocus;
        end
        else
        begin
            Edt_IMEI.SetFocus;
        end;
        try
            if chkAuto.Checked then
            begin
                PrintOut(False, False);
            end
            else
            begin
                PrintOut(False, true); //打印
            end;
            //InserExcell(StringGrid1);
            Close(btDoNotSaveChanges); //关闭不保存

            edt_SN2.Text := IntToStr((StrToInt(edt_SN2.Text) + 1));
            if (Length(edt_SN2.Text) = 1) then
                edt_SN2.Text := '0000' + edt_SN2.Text
            else
                if (Length(edt_SN2.Text) = 2) then
                    edt_SN2.Text := '000' + edt_SN2.Text
                else
                    if (Length(edt_SN2.Text) = 3) then
                        edt_SN2.Text := '00' + edt_SN2.Text
                    else
                        if (Length(edt_SN2.Text) = 4) then
                            edt_SN2.Text := '0' + edt_SN2.Text;
            WriteIni('Gift', 'SN2', edt_SN2.Text);
            AppendTxt('', LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
        except
            Close(btDoNotSaveChanges); //关闭不保存
        end;
    end;
end;

procedure TfrmGiftBoxMain.edt_SIMKeyPress(Sender: TObject; var Key: Char);
var
    iRecordCount: Integer;
    iSIM, istart, iend: Integer;
begin
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
            if (iRecordCount > 0) then
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

procedure TfrmGiftBoxMain.cbb_RelChange(Sender: TObject);
begin
    edt_SIM.Enabled := False;
    if (cbb_Rel.ItemIndex = 1) then
    begin
        edt_SIM.Enabled := true;
        edt_SIM.SetFocus;
    end;
end;

procedure TfrmGiftBoxMain.FormShow(Sender: TObject);
begin
    Edt_IMEI.SetFocus;
end;

procedure TfrmGiftBoxMain.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if (chkAuto.Checked) then
    begin
        WriteIni('Gift', 'AutoPrint', '1');
    end
    else
    begin
        WriteIni('Gift', 'AutoPrint', '0');
    end;
    WriteIni('Gift', 'SoftModel', edt_SoftModel.Text);
    WriteIni('Gift', 'SN1', edt_SN1.Text);
    WriteIni('Gift', 'SN2', edt_SN2.Text);
    WriteIni('Gift', 'SN3', edt_SN3.Text);
    WriteIni('Gift', 'Date', edt_Date.Text);
    WriteIni('Gift', 'IMEISTART', Edt_IMEISTART.Text);
    WriteIni('Gift', 'IMEIEND', Edt_IMEIEND.Text);
    WriteIni('Gift', 'TAC', edt_Tac.Text);
    WriteIni('Gift', 'SIMSTART', Edt_SIMSTART.Text);
    WriteIni('Gift', 'SIMEND', Edt_SIMEND.Text);
end;

procedure TfrmGiftBoxMain.edtReprintImeiKeyPress(Sender: TObject;
    var Key: Char);
var
  iIMEI, istart, iend: Integer;
  iRecordCount:Integer;
    strFile, strver: string;
begin
    if Length(edtReprintImei.Text) = 0 then
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
        if Length(edtReprintImei.Text) = 15 then
        begin
            //判断条码是否以TAC开始
            if (copy(edtReprintImei.Text, 1, length(edt_Tac.text)) <> edt_Tac.Text) then
            begin
                IMEIErrorPrompt('非法IMEI');
                Exit;
            end;
            if ((Edt_IMEISTART.Text <> '') and (Edt_IMEIEND.Text <> '')) then
            begin
                istart := strtoint64(Trim(Edt_IMEISTART.Text));
                iend := strtoint64(Trim(Edt_IMEIEND.Text));
                iIMEI := strtoint64(LeftStr(Trim(edtReprintImei.Text), 14));
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
            //IMEI号是否存在
            UniQuery_GiftBoxByImeiReprint.Close;
            UniQuery_GiftBoxByImeiReprint.ParamByName('IMEI').Value := edtReprintImei.Text;
            UniQuery_GiftBoxByImeiReprint.Open;
            iRecordCount := UniQuery_GiftBoxByImeiReprint.RecordCount;
            //UniQuery_SIM.Close;
            if (iRecordCount <= 0) then
            begin
                IMEIErrorPrompt('IMEI不存在!');
                edtReprintImei.Text := '';
                edtReprintImei.SetFocus;
                Exit;
            end
            else
            begin
                //打开bartender文件
                strFile := ExtractFilePath(ParamStr(0)) + 'GiftBox\' + 'model.btw';
                AppendTxt(strFile, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
                with btappAutoPrint.Formats.Open(strFile, True, '') do //打开标签文件
                begin
                    SetNamedSubStringValue('IMEI', UniQuery_GiftBoxByImeiReprint.FieldByName('IMEI').AsString);
                    SetNamedSubStringValue('IMEI_QR', UniQuery_GiftBoxByImeiReprint.FieldByName('IMEI').AsString);
                    SetNamedSubStringValue('SN', UniQuery_GiftBoxByImeiReprint.FieldByName('SN').AsString);
                    SetNamedSubStringValue('SoftModel', UniQuery_GiftBoxByImeiReprint.FieldByName('SoftModel').AsString);
                    SetNamedSubStringValue('ProductDate', UniQuery_GiftBoxByImeiReprint.FieldByName('Date').AsString);
                    strver := SysUtils.Format('IMEI:%s' + #13#10 + 'SN:%s' + #13#10 + 'SoftModel:%s' + #13#10 + 'ProductDate:%s' + #13#10,
                        [UniQuery_GiftBoxByImeiReprint.FieldByName('IMEI').AsString,
                        UniQuery_GiftBoxByImeiReprint.FieldByName('SN').AsString,
                            UniQuery_GiftBoxByImeiReprint.FieldByName('SoftModel').AsString,
                            UniQuery_GiftBoxByImeiReprint.FieldByName('Date').AsString]);
                    AppendTxt(strver, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');

                    IMEIErrorPrompt('');
                    try
                        PrintOut(False, False);
                        Close(btDoNotSaveChanges); //关闭不保存

                    except
                        Close(btDoNotSaveChanges); //关闭不保存
                    end;
                end;
            end;

            edtReprintImei.Text := '';
            edtReprintImei.SetFocus;
        end;

    end;
end;

end.

