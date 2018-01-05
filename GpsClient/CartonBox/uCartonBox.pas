unit uCartonBox;
interface
uses
    Windows, Messages, SysUtils, Variants, Classes, Forms, Graphics, Controls,
    Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB, OleServer, StrUtils, uGlobalVar, uDmMain,
    MemDS, DBAccess, Uni, Mask;
type
    TfrmCartonBox = class(TForm)
        pnlParent: TPanel;
        grp1: TGroupBox;
        EdtMEI: TEdit;
        grp2: TGroupBox;
        lbl9: TLabel;
        lbl10: TLabel;
        btnPrint: TSpeedButton;
        chkAuto: TCheckBox;
        btnClear: TButton;
        grp3: TGroupBox;
        mmoMEI: TMemo;
        grp4: TGroupBox;
        lbl13: TLabel;
        DS_IMEI: TDataSource;
        lbl12: TLabel;
        GrpTestPass: TGroupBox;
        chk_FuncTest: TCheckBox;
        chk_GPSTest: TCheckBox;
        chk_CoupleTest: TCheckBox;
        chk_WriteImei: TCheckBox;
        chk_ParamDownload: TCheckBox;
        chk_AutoTest: TCheckBox;
        UniQuery_IMEI: TUniQuery;
        UniQuery_IMEI_20: TUniQuery;
        UniQuery_IMEI_20Id: TIntegerField;
        UniQuery_IMEI_20BoxNo: TStringField;
        UniQuery_IMEI_20IMEI: TStringField;
        UniQuery_IMEI_20ZhiDan: TStringField;
        UniQuery_IMEI_20SoftModel: TStringField;
        UniQuery_IMEI_20Version: TStringField;
        UniQuery_IMEI_20ProductCode: TStringField;
        UniQuery_IMEI_20Color: TStringField;
        UniQuery_IMEI_20Qty: TStringField;
        UniQuery_IMEI_20Weight: TStringField;
        UniQuery_IMEI_20Date: TStringField;
        UniQuery_IMEI_20TACInfo: TStringField;
        UniQuery_IMEI_20CompanyName: TStringField;
        UniQuery_IMEI_20TesterId: TStringField;
        UniQuery_IMEI_20TestTime: TDateTimeField;
        UniQuery_IMEI_20Remark1: TStringField;
        UniQuery_IMEI_20Remark2: TStringField;
        UniQuery_IMEI_20Remark3: TStringField;
        UniQuery_IMEI_20Remark4: TStringField;
        UniQuery_IMEI_20Remark5: TStringField;
        UniQuery_IMEI_10: TUniQuery;
        UniQuery_IMEI_10Id: TIntegerField;
        UniQuery_IMEI_10BoxNo: TStringField;
        UniQuery_IMEI_10IMEI: TStringField;
        UniQuery_IMEI_10Color: TStringField;
        UniQuery_IMEI_10Weight: TStringField;
        UniQuery_IMEI_10TACInfo: TStringField;
        UniQuery_IMEI_10OtherInfo: TStringField;
        UniQuery_IMEI_10TesterId: TStringField;
        UniQuery_IMEI_10TestTime: TDateTimeField;
        UniQuery_IMEI_10Remark1: TStringField;
        UniQuery_IMEI_10Remark2: TStringField;
        UniQuery_IMEI_10Remark3: TStringField;
        UniQuery_IMEI_10Remark4: TStringField;
        UniQuery_IMEI_10Remark5: TStringField;
        chkMustParamterDownload: TCheckBox;
        medtParamterDownload: TMaskEdit;
        btnParamterDownload: TBitBtn;
        UniQueryUser: TUniQuery;
        UniQueryUserUserId: TIntegerField;
        UniQueryUserUserName: TStringField;
        UniQueryUserUserDes: TStringField;
        UniQueryUserUserPwd: TStringField;
        UniQueryUserUserType: TStringField;
        UniQueryUserUserTestPlan: TStringField;
        unqry_ParamVersion: TUniQuery;
        ds1: TDataSource;
        lbl16: TLabel;
        lbl17: TLabel;
        strngfld_ParamVersionVersionS: TStringField;
        lbl18: TLabel;
        sp1: TUniStoredProc;
        UniQuery_FindRidByImei: TUniQuery;
    lbl8: TLabel;
        procedure FormResize(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure EdtMEIKeyPress(Sender: TObject; var Key: Char);
        procedure btnPrintClick(Sender: TObject);
        procedure btnClearClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure EdtTacKeyPress(Sender: TObject; var Key: Char);
        procedure FormShow(Sender: TObject);
        procedure IMEIErrorPrompt(StrPrompt: string);
        procedure MsgTestPass(var StrListNumberSign: TStringList; var comm: Integer);
        procedure MsgBarPrint(var msg: TMessage); message WM_BarPrint;
        procedure chkMustParamterDownloadClick(Sender: TObject);
        procedure btnParamterDownloadClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
        procedure ImeiPrint(); virtual; abstract;
        procedure AllowPrint(); virtual; abstract;
        procedure RefreseDisplay();
    end;
var
    frmCartonBox: TfrmCartonBox;
    StrList: TStringList;
    SNList: TStringList; //基带ID
    VersionList: TStringList; //版本ID都与IMEI一一对应
    strBarFile, strver: string;
    //i:Integer;
    strBar: string;
    iPrintCount: Integer; //窗体要打印的最多条码数
    PrintType:string;//打印类型
    paramVersion: string; //2014.12.4下载版本
implementation
uses uClientMain, uPublicFunc;
{$R *.dfm}

procedure TfrmCartonBox.FormResize(Sender: TObject);
begin
    pnlParent.Left := Trunc((frmClientMain.ts1.Width - pnlParent.Width) / 2);
    pnlParent.Top := Trunc((frmClientMain.ts1.Height - pnlParent.Height) / 2);
end;


procedure TfrmCartonBox.FormCreate(Sender: TObject);
begin
    iPrintCount := StrToInt(ReadIni('CartonBoxSet','PrintCount','20'));
    PrintType := ReadIni('CartonBoxSet','PrintType','中文');
    mmoMEI.Text := '';
    lbl10.Caption := '0';
    IMEIErrorPrompt('');
    strPlanName := 'CartonBox';
end;

procedure TfrmCartonBox.EdtMEIKeyPress(Sender: TObject; var Key: Char);
var
    strSendText: string;
    CommIndex: Integer;
    iIMEI, istart, iend: Integer;
begin
    if Length(edtMEI.Text) = 0 then
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
        if Length(edtMEI.Text) = 15 then
        begin
            {if ((Edt_IMEISTART.Text <> '') and (Edt_IMEIEND.Text <> '')) then
            begin
                istart := strtoint64(Trim(Edt_IMEISTART.Text));
                iend := strtoint64(Trim(Edt_IMEIEND.Text));
                iIMEI := strtoint64(LeftStr(Trim(EdtMEI.Text), 14));
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
            CommIndex := 0;
            GrpTestPass.Visible := False;
            chk_FuncTest.Checked := False;
            chk_GPSTest.Checked := False;
            chk_CoupleTest.Checked := False;
            chk_WriteImei.Checked := False;
            chk_AutoTest.Checked := False;
            chk_ParamDownload.Checked := False;
            strSendText := 'Action=CheckTestPass#IMEI=' + edtMEI.Text + '#Tester=' + User.UserName + '#';
            //strSendText:=Format('Action=CheckTestPass#IMEI=%s#',[edtMEI.Text])
            SendToServer(CommIndex, 'CheckTestPass', strSendText); }
        end;
    end;
end;

procedure TfrmCartonBox.btnPrintClick(Sender: TObject);
begin
    ImeiPrint();
end;

procedure TfrmCartonBox.btnClearClick(Sender: TObject);
begin
    edtMEI.Text := '';
    StrList.Clear;
    SNList.Clear;
    VersionList.Clear;
    mmoMEI.Clear;
    lbl10.Caption := '0';
end;

procedure TfrmCartonBox.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    StrList.Free;
    SNList.Free;
    VersionList.Free;
    //btApp1.Quit(btDoNotSaveChanges);
end;

procedure TfrmCartonBox.EdtTacKeyPress(Sender: TObject; var Key: Char);
begin
    if (((ord(key) < 48) or (ord(key) > 57)) and (key <> #8)) then key := #0
end;

procedure TfrmCartonBox.FormShow(Sender: TObject);
begin
    StrList := TStringList.Create;
    SNList := TStringList.Create;
    VersionList := TStringList.Create;
end;



procedure TfrmCartonBox.IMEIErrorPrompt(StrPrompt: string);
begin
    lbl8.Caption := StrPrompt;
    if StrPrompt <> '' then
    begin
        //Windows.Beep(2000, 500);
        //Windows.Beep(2000, 500);
        edtMEI.Text := '';
    end;
    //Application.ProcessMessages;

end;

procedure TfrmCartonBox.MsgBarPrint(var msg: TMessage);
begin
    ImeiPrint();
end;

procedure TfrmCartonBox.chkMustParamterDownloadClick(Sender: TObject);
begin
    InsertOperRecord('CartonAdmin', medtParamterDownload.Text, DateTimeToStr(Now), BoolToStr(chkMustParamterDownload.Checked));
    medtParamterDownload.Text := '';
    chkMustParamterDownload.Enabled := False;
end;

procedure TfrmCartonBox.btnParamterDownloadClick(Sender: TObject);
var
    iRecordCount: Integer;
begin
    if medtParamterDownload.Text <> '' then
    begin
        UniQueryUser.Close;
        UniQueryUser.ParamByName('UserPwd').Value := medtParamterDownload.Text;
        UniQueryUser.Open;
        iRecordCount := UniQueryUser.RecordCount;
        UniQueryUser.Close;
        if iRecordCount >= 1 then
        begin
            chkMustParamterDownload.Enabled := True;
        end;

    end
    else
    begin
        Exit;
    end;

end;
procedure TfrmCartonBox.RefreseDisplay();
begin
  Application.ProcessMessages;

end;

procedure TfrmCartonBox.MsgTestPass(var StrListNumberSign: TStringList; var comm: Integer);
var
    iRecordCount: Integer;
begin
    //CommIndex:=comm;
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
            {with sp1 do
            begin
              Close;
              Params.ParamByName('@cIMEI').Value:=EdtMEI.Text;
              ExecProc;
              iRecordCount:=Params.ParamByName('@iRecordCount').Value;
              if iRecordCount=1 then
              begin
                 chk_CoupleTest.Checked:=False;
                 chk_AutoTest.Checked:=False;
                 chk_WriteImei.Checked:=False;
                 if chkMustParamterDownload.Checked then
                 begin
                    chk_ParamDownload.Checked:=True;
                 end
                 else
                 begin
                    AllowPrint();
                    GrpTestPass.Visible:=False;
                    Exit;
                 end;
              end;
            end;}
        end;
        if StrToInt(StrListNumberSign.Values['ParamDownload']) = 0 then
        begin
            if chkMustParamterDownload.Checked then
            begin
                chk_ParamDownload.Checked := True;
            end
            else
            begin
                chk_ParamDownload.Checked := False;
                {if not (chk_FuncTest.Checked or chk_GPSTest.Checked or chk_CoupleTest.Checked or chk_WriteImei.Checked
                        or chk_AutoTest.Checked or chk_ParamDownload.Checked) then
                begin
                  AllowPrint();
                  GrpTestPass.Visible:=False;
                  Exit;
                end;}
            end;
        end;
        GrpTestPass.Visible := True;
        IMEIErrorPrompt('此机子其它测试项没测试通过');
    end
    else
    begin
        GrpTestPass.Visible := False;
        SendNotifyMessage(Handle, WM_AllowPrint, 0, 0);
        RefreseDisplay();
        //AllowPrint();

    end;

end;
end.
