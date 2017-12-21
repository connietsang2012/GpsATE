unit uCartonBox;
interface
uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB, OleServer, BarTender_TLB, StrUtils, uGlobalVar, uDmMain,
    MemDS, DBAccess, Uni, Mask;
type
    TfrmCartonBox = class(TForm)
        pnlParent: TPanel;
        grp1: TGroupBox;
        EdtMEI: TEdit;
        grp2: TGroupBox;
        lbl8: TLabel;
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
        btappAutoPrint: TBTApplication;
        GrpTestPass: TGroupBox;
        chk_FuncTest: TCheckBox;
        chk_GPSTest: TCheckBox;
        chk_CoupleTest: TCheckBox;
        chk_WriteImei: TCheckBox;
        chk_ParamDownload: TCheckBox;
        chk_AutoTest: TCheckBox;
        UniQuery_IMEI: TUniQuery;
        btappBtnPrint: TBTApplication;
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
        procedure AllowPrint();
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
    paramVersion: string; //2014.12.4下载版本
implementation
uses uClientMain, uPublicFunc;
{$R *.dfm}

procedure TfrmCartonBox.FormResize(Sender: TObject);
begin
    pnlParent.Left := Trunc((frmClientMain.ts1.Width - pnlParent.Width) / 2);
    pnlParent.Top := Trunc((frmClientMain.ts1.Height - pnlParent.Height) / 2);
end;

procedure TfrmCartonBox.AllowPrint();
var
    imemoLines, lineLoop: Integer; //条码的条数,条码数循环量
    iRecordCount: Integer;
begin
    if(edtMEI.Text='') then Exit;
    imemoLines := mmoMEI.Lines.Count;
    //判断条码是否重复
    if imemoLines <> 0 then
    begin
        for lineLoop := 0 to imemoLines - 1 do
        begin
            if edtMEI.Text = StrUtils.RightStr(mmoMEI.Lines[lineLoop], 15) then
            begin
                IMEIErrorPrompt('数据重复');
                Exit;
            end
            else IMEIErrorPrompt('');
        end;
    end;
    //判断条码是否以TAC开始
    {if (copy(edtMEI.Text, 1, length(EdtTac.text)) <> EdtTac.Text) then
    begin
        IMEIErrorPrompt('非法IMEI');
        Exit;
    end
    else}
    begin
        IMEIErrorPrompt('');
        { UniQuery_IMEI_10.Close;
         UniQuery_IMEI_10.ParamByName('IMEI').Value:=edtMEI.Text;
         UniQuery_IMEI_10.Open;
         iRecordCount:=UniQuery_IMEI_10.RecordCount;
         UniQuery_IMEI_10.Close; }
        UniQuery_IMEI_20.Close;
        UniQuery_IMEI_20.ParamByName('IMEI').Value := edtMEI.Text;
        UniQuery_IMEI_20.Open;
        iRecordCount := iRecordCount + UniQuery_IMEI_20.RecordCount;
        UniQuery_IMEI_20.Close;

        if (iRecordCount) >= 1 then
        begin
            MessageBox(0, PCHAR('当前IMEI在箱号' + UniQuery_IMEI_20.FieldByName('BoxNo').AsString + '中已经扫描过请勿重复扫描'), '友情提醒,数据重复', mb_OK);
            Exit;
        end;
    end;
    if imemoLines + 1 > iPrintCount then
    begin
        ShowMessage('打印数据不能超过' + inttostr(iPrintCount) + '条,若继续扫描请先打印当前数据');
        Exit;
    end;
    ///对应的SN和version
    unqry_ParamVersion.Close;
    unqry_ParamVersion.ParamByName('IMEI').Value := EdtMEI.Text;
    unqry_ParamVersion.Open;
    iRecordCount := unqry_ParamVersion.RecordCount;
    paramVersion := '';
    if iRecordCount >= 1 then
    begin
        paramVersion := unqry_ParamVersion.fieldbyname('VersionS').AsString;
    end;
    {if (Trim(EdtSoftModel.Text) <> paramVersion) and (paramVersion <> '') then //兼容不跑下载位的机型
    begin
        //ShowMessage();
        //lbl8.Caption:= '下载版本号与单号设置版本不一致！';
        MessageBox(0, PChar('下载版本号' + paramVersion), '版本不一致', MB_ICONWARNING + mb_OK);
        Exit;
    end; }
    if(edtMEI.Text<>'') then
    begin
       mmoMEI.Lines.Add(edtMEI.Text);
        StrList.Add(trim(edtMEI.Text));
    end;


    {if iRecordCount>=1 then
    begin
      SNList.Add(Trim(unqry_SNandVersion.FieldByName('SN').AsString));
      VersionList.Add(unqry_SNandVersion.FieldByName('Version').AsString);
      //ShowMessage('无对应SN和Version!');
    end
    else
    begin
      //ShowMessage('无对应SN和Version!');
      //MessageDlg('无对应SN号或版本号',mtconfirmation,mbOKCancel,0);
      SNList.Add('空');
      VersionList.Add('空');
    end;}
    lbl10.Caption := IntToStr(imemoLines + 1);
    edtMEI.Text := '';
    //自动打印
    if (imemoLines + 1 = iPrintCount) and (chkAuto.Checked) then
    begin
        SendNotifyMessage(Handle, WM_BarPrint, 0, 0);
    end;
end;

procedure TfrmCartonBox.FormCreate(Sender: TObject);
begin
    iPrintCount := 20;
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
        AllowPrint();
        GrpTestPass.Visible := False;
    end;
    //<1登录失败,否则成功
    {if msg.wParam<1 then
    begin
        IMEIErrorPrompt('此机子其它测试项没测试通过');
    end
    else
    begin
        AllowPrint();
    end;}
end;

procedure TfrmCartonBox.IMEIErrorPrompt(StrPrompt: string);
begin
    lbl8.Caption := StrPrompt;
    if StrPrompt <> '' then
    begin
        Windows.Beep(2000, 500);
        Windows.Beep(2000, 500);
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

end.
.
