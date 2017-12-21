unit uCartonBoxLlf;
interface
uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uCartonBox, StdCtrls, Buttons, ExtCtrls, DB, ADODB, OleServer, ComObj, OleExcel,
    BarTender_TLB, MemDS, DBAccess, Uni, uDmMain, uGlobalVar, Mask, Grids,
    DBTables, Excel2000, DBCtrls, StrUtils;
type
    TfrmCartonBoxLlf = class(TfrmCartonBox)
        lbl11: TLabel;
        lbl14: TLabel;
        lbl15: TLabel;
        lbl1: TLabel;
        lbl2: TLabel;
        lbl3: TLabel;
        lbl4: TLabel;
        lbl6: TLabel;
        lbl7: TLabel;
        UniQuery_IMEIId: TIntegerField;
        UniQuery_IMEIBoxNo: TStringField;
        UniQuery_IMEIIMEI: TStringField;
        UniQuery_IMEIZhiDan: TStringField;
        UniQuery_IMEISoftModel: TStringField;
        UniQuery_IMEIVersion: TStringField;
        UniQuery_IMEIProductCode: TStringField;
        UniQuery_IMEIColor: TStringField;
        UniQuery_IMEIQty: TStringField;
        UniQuery_IMEIWeight: TStringField;
        UniQuery_IMEIDate: TStringField;
        UniQuery_IMEITACInfo: TStringField;
        UniQuery_IMEICompanyName: TStringField;
        UniQuery_IMEITesterId: TStringField;
        UniQuery_IMEITestTime: TDateTimeField;
        UniQuery_IMEIRemark1: TStringField;
        UniQuery_IMEIRemark2: TStringField;
        UniQuery_IMEIRemark3: TStringField;
        UniQuery_IMEIRemark4: TStringField;
        UniQuery_IMEIRemark5: TStringField;
        unqry1: TUniQuery;
        StringGrid1: TStringGrid;
        shp1: TShape;
        edt_RePrint: TEdit;
        Label1: TLabel;
        btn_RePrint: TButton;
        UniQuery_RePrint: TUniQuery;
        UniQuery_RePrintBoxNo: TStringField;
        UniQuery_RePrintIMEI: TStringField;
        UniQuery_RePrintZhiDan: TStringField;
        UniQuery_RePrintSoftModel: TStringField;
        UniQuery_RePrintVersion: TStringField;
        UniQuery_RePrintProductCode: TStringField;
        UniQuery_RePrintColor: TStringField;
        UniQuery_RePrintQty: TStringField;
        UniQuery_RePrintWeight: TStringField;
        UniQuery_RePrintDate: TStringField;
        UniQuery_RePrintTACInfo: TStringField;
        UniQuery_RePrintCompanyName: TStringField;
        UniQuery_RePrintTesterId: TStringField;
        UniQuery_RePrintTestTime: TDateTimeField;
        UniQuery_RePrintRemark1: TStringField;
        UniQuery_RePrintRemark2: TStringField;
        UniQuery_RePrintRemark3: TStringField;
        UniQuery_RePrintRemark4: TStringField;
        UniQuery_RePrintRemark5: TStringField;
        UniQuery_RePrint_MASK_FROM_V2: TBytesField;
        Label2: TLabel;
        Label3: TLabel;
        UniQuery_ManuOrder: TUniQuery;
        UniQuery_ManuOrderZhiDan: TStringField;
        UniQuery_ManuOrderParam: TUniQuery;
        UniQuery_IMEIRel: TUniQuery;
        UniQuery_IMEIRelRelId: TIntegerField;
        UniQuery_IMEIRelIMEIRelNo: TStringField;
        UniQuery_IMEIRelIMEIRelDes: TStringField;
        UniQuery_IMEIRel_MASK_FROM_V2: TBytesField;
        DS_ManuOrderParam: TDataSource;
        UniQuery_ManuOrderParamZhiDan: TStringField;
        UniQuery_ManuOrderParamSoftModel: TStringField;
        UniQuery_ManuOrderParamBoxNo1: TStringField;
        UniQuery_ManuOrderParamBoxNo2: TStringField;
        UniQuery_ManuOrderParamProductDate: TStringField;
        UniQuery_ManuOrderParamColor: TStringField;
        UniQuery_ManuOrderParamWeight: TStringField;
        UniQuery_ManuOrderParamQty: TStringField;
        UniQuery_ManuOrderParamProductNo: TStringField;
        UniQuery_ManuOrderParamVersion: TStringField;
        UniQuery_ManuOrderParamIMEIStart: TStringField;
        UniQuery_ManuOrderParamIMEIEnd: TStringField;
        UniQuery_ManuOrderParamTACInfo: TStringField;
        UniQuery_ManuOrderParamCompanyName: TStringField;
        UniQuery_ManuOrderParamRemark1: TStringField;
        UniQuery_ManuOrderParamRemark2: TStringField;
        UniQuery_ManuOrderParamRemark3: TStringField;
        UniQuery_ManuOrderParamRemark4: TStringField;
        UniQuery_ManuOrderParamRemark5: TStringField;
        EdtSoftModel: TDBEdit;
        EdtColor: TDBEdit;
        EdtBoxNum: TDBEdit;
        EdtBoxNum1: TDBEdit;
        EdtWeight: TDBEdit;
        Edtzhidan: TDBEdit;
        EdtDate: TDBEdit;
        EdtProNo: TDBEdit;
        EdtVersion: TDBEdit;
        EdtTac: TDBEdit;
        EdtQty: TDBEdit;
        Edt_IMEISTART: TDBEdit;
        Edt_IMEIEND: TDBEdit;
        EdtCpName: TDBEdit;
        edt_Remark1: TDBEdit;
        Panel1: TPanel;
        Label7: TLabel;
        cbManuOrder: TComboBox;
        UniQuery_UpdateBoxNo: TUniQuery;
        IntegerField1: TIntegerField;
        StringField1: TStringField;
        StringField2: TStringField;
        BytesField1: TBytesField;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure btn_RePrintClick(Sender: TObject);
        procedure cbManuOrderChange(Sender: TObject);
        procedure EdtMEIKeyPress(Sender: TObject; var Key: Char);
    private
        { Private declarations }
    public
        { Public declarations }
        procedure ImeiPrint(); override;
    end;
var
    frmCartonBoxLlf: TfrmCartonBoxLlf;
    ExcelApp: OleVariant;
    CardBoxExcelApp: TOLEExcel;
implementation
uses
    uPublicFunc;
{$R *.dfm}

procedure TfrmCartonBoxLlf.ImeiPrint();
var
    strFile, strver, strExcel: string;
    i, iGrid: Integer;
    strtemp: string;
    strRid: string;
    iIMEI, istart, iend: Integer;
begin
    if (mmoMEI.Lines.Count = 0) then
    begin
        ShowMessage('当前数据为空,不能进行打印');
        Exit;
    end;
    if (trim(EdtVersion.Text) = '') then
    begin
        ShowMessage('版本信息不能为空');
        Exit;
    end;
    strBar := '';
    strver := '';
    strFile := ExtractFilePath(ParamStr(0)) + 'CartonBox\llf\' + IntToStr(mmoMEI.Lines.Count) + '.btw';
    AppendTxt(strFile, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
    with btappAutoPrint.Formats.Open(strFile, True, '') do //打开标签文件
    begin
        //贴纸标题赋值
        SetNamedSubStringValue('BoxNum', trim(EdtBoxNum.Text) + trim(EdtBoxNum1.Text));
        SetNamedSubStringValue('ZhiDan', '制单:' + trim(Edtzhidan.Text));
        SetNamedSubStringValue('MachineType', trim(EdtSoftModel.Text));
        SetNamedSubStringValue('ProductColor', '颜色:' + trim(EdtColor.Text));
        SetNamedSubStringValue('ProductDate', '日期:' + trim(EdtDate.Text));
        SetNamedSubStringValue('ProductCount', '数量:' + trim(EdtQty.Text));
        SetNamedSubStringValue('ProductWeight', '毛重:' + (EdtWeight.Text));
        SetNamedSubStringValue('ProductNum', '产品编码:' + trim(EdtProNo.Text));
        SetNamedSubStringValue('Remark', trim(edt_Remark1.Text));
        strver := SysUtils.Format('箱号:%s%s' + #13#10 + '制单:%s' + #13#10 + '机型:%s' + #13#10 + '颜色:%s' + #13#10 + '日期:%s' + #13#10 + '数量:%s' + #13#10 + '毛重:%s' + #13#10 + '产品编码:%s' + #13#10 + '%s' + #13#10 + '',
            [EdtBoxNum.Text, EdtBoxNum1.Text, Edtzhidan.Text, edtsoftmodel.Text, EdtColor.Text, EdtDate.Text, EdtQty.Text, EdtWeight.Text, EdtProNo.Text, edt_Remark1.text]);
        AppendTxt(strver, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
        //IMEI赋值
        for i := 0 to (mmoMEI.Lines.Count - 1) do
        begin
            //判断IMEI号是否在范围内
            if ((Edt_IMEISTART.Text <> '') and (Edt_IMEIEND.Text <> '')) then
            begin
                istart := strtoint64(Trim(Edt_IMEISTART.Text));
                iend := strtoint64(Trim(Edt_IMEIEND.Text));
                iIMEI := strtoint64(LeftStr(StrList.Strings[i], 14));
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

            UniQuery_FindRidByImei.Close;
            UniQuery_FindRidByImei.ParamByName('IMEI').value := StrList.Strings[i];
            UniQuery_FindRidByImei.Open;
            if(UniQuery_FindRidByImei.RecordCount<>1) then
            begin
                IMEIErrorPrompt('此机子异常,请联系管理员！');
                Exit;
            end;
            //每个单独的IMEI
            strver := strver + StrList.Strings[i] + '' + #13#10 + '';
            strBar := 'IMEI' + IntToStr(i);
            SetNamedSubStringValue(strBar, StrList.Strings[i]); //设置值
            AppendTxt(DateTimeToStr(Now) + '-----------' + StrList.Strings[i], LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');

        end;
        SetNamedSubStringValue('QRCode', strver); //设置值

        //更新卡通扫描结果
        for i := 0 to (mmoMEI.Lines.Count - 1) do
        begin
            //得到基带ID
            strRid := '';
            UniQuery_FindRidByImei.Close;
            UniQuery_FindRidByImei.ParamByName('IMEI').value := StrList.Strings[i];
            UniQuery_FindRidByImei.Open;
            UniQuery_FindRidByImei.First;
            strRid := UniQuery_FindRidByImei.FieldByName('Rid').AsString;
            AppendTxt(StrList.Strings[i] + ',' + strRid, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
            //更新Gps_CartonBoxTwenty_Result表
            UniQuery_IMEI.Close;
            UniQuery_IMEI.Sql.Clear;
            strtemp := 'Insert into Gps_CartonBoxTwenty_Result(BoxNo,IMEI,ZhiDan,SoftModel,Version,ProductCode,Color,Qty,Weight,Date,TACInfo,CompanyName,TesterId,Remark2,Remark1) values('''
                + EdtBoxNum.Text + EdtBoxNum1.Text + ''',''' + StrList.Strings[i] + ''',''' + Edtzhidan.Text
                + ''',''' + edtsoftmodel.Text + ''',''' + edtVersion.Text + ''',''' + EdtProNo.Text + ''','''
                + EdtColor.Text + ''',''' + EdtQty.Text + ''',''' + EdtWeight.Text + ''',''' + EdtDate.Text + ''','''
                + EdtTac.Text + ''',''' + EdtCpName.Text + ''',''' + User.UserName + ''',''' + strRid + ''',''' + edt_remark1.Text + ''')';
            UniQuery_IMEI.SQL.Text := strtemp;
            UniQuery_IMEI.Execute;
        end;

        //更新箱号
        EdtBoxNum1.Text := IntToStr((StrToInt(EdtBoxNum1.Text) + 1));
        lbl10.Caption := '0';
        if (Length(EdtBoxNum1.Text) = 1) then
            EdtBoxNum1.Text := '0000' + EdtBoxNum1.Text
        else
            if (Length(EdtBoxNum1.Text) = 2) then
                EdtBoxNum1.Text := '000' + EdtBoxNum1.Text
            else
                if (Length(EdtBoxNum1.Text) = 3) then
                    EdtBoxNum1.Text := '00' + EdtBoxNum1.Text
                else
                    if (Length(EdtBoxNum1.Text) = 4) then
                        EdtBoxNum1.Text := '0' + EdtBoxNum1.Text;
        UniQuery_UpdateBoxNo.Close;
        UniQuery_UpdateBoxNo.ParamByName('BoxNo2').AsString := EdtBoxNum1.Text;
        UniQuery_UpdateBoxNo.ParamByName('ZhiDan').AsString := cbManuOrder.Text;
        //UniQuery_UpdateBoxNo.Open;
        UniQuery_UpdateBoxNo.Execute;

        //打印贴纸
        if chkAuto.Checked then
        begin
        try
            PrintOut(False, False);
            Close(btDoNotSaveChanges); //关闭不保存
        except
            Close(btDoNotSaveChanges); //关闭不保存
        end;
        end
        else
        begin
            try
                PrintOut(False, true); //打印
                Close(btDoNotSaveChanges); //关闭不保存
            except
                Close(btDoNotSaveChanges); //关闭不保存
            end;
        end;
        StrList.Clear;
        SNList.Clear;
        VersionList.Clear;
        mmoMEI.Clear;

        AppendTxt('', LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
        AppendTxt('', LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
    end;
end;

procedure TfrmCartonBoxLlf.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    inherited;
    {WriteIni('llf', 'Version', trim(EdtVersion.Text)); //机型
    WriteIni('llf', 'Color', trim(EdtColor.Text)); //颜色
    WriteIni('llf', 'BoxNum', trim(EdtBoxNum.Text)); //箱号
    WriteIni('llf', 'BoxNum1', trim(EdtBoxNum1.Text)); //箱号分支
    WriteIni('llf', 'Weight', (EdtWeight.Text)); //重量
    WriteIni('llf', 'ZhiDan', trim(Edtzhidan.Text)); //制单
    WriteIni('llf', 'Date', trim(EdtDate.Text)); //日期
    WriteIni('llf', 'ProNo', trim(EdtProNo.Text)); //产品号
    WriteIni('llf', 'Model', trim(EdtSoftModel.Text)); //版本号
    WriteIni('llf', 'Tac', trim(EdtTac.Text)); //Tac信息
    WriteIni('llf', 'Qty', trim(EdtQty.Text)); //数量
    WriteIni('llf', 'CpName', trim(EdtCpName.Text)); //公司名称
    WriteIni('llf', 'Remark1', trim(edt_Remark1.Text)); //备注一}
end;

procedure TfrmCartonBoxLlf.FormCreate(Sender: TObject);
begin
    inherited;
    UniQuery_ManuOrder.Close;
    UniQuery_ManuOrder.Open;
    UniQuery_ManuOrder.First;
    cbManuOrder.Clear;
    while not UniQuery_ManuOrder.Eof do
    begin
        cbManuOrder.Items.Add(UniQuery_ManuOrder.FieldByName('ZhiDan').AsString);
        UniQuery_ManuOrder.Next;
    end;

    {EdtVersion.Text := ReadIni('llf', 'Version', '');
    EdtColor.Text := ReadIni('llf', 'Color', '');
    EdtBoxNum.Text := ReadIni('llf', 'BoxNum', '');
    EdtBoxNum1.Text := ReadIni('llf', 'BoxNum1', '');
    EdtQty.Text := ReadIni('llf', 'Qty', '');
    Edtzhidan.Text := ReadIni('llf', 'ZhiDan', '');
    EdtDate.Text := ReadIni('llf', 'Date', '');
    EdtProNo.Text := ReadIni('llf', 'ProNo', '');
    EdtSoftModel.Text := ReadIni('llf', 'Model', '');
    EdtTac.Text := ReadIni('llf', 'Tac', '');
    EdtWeight.Text := ReadIni('llf', 'Weight', '');
    EdtCpName.Text := ReadIni('llf', 'CpName', '');
    edt_Remark1.Text := ReadIni('llf', 'Remark1', '');
    if (Length(EdtBoxNum1.Text) = 1) then
        EdtBoxNum1.Text := '0000' + EdtBoxNum1.Text
    else
        if (Length(EdtBoxNum1.Text) = 2) then
            EdtBoxNum1.Text := '000' + EdtBoxNum1.Text
        else
            if (Length(EdtBoxNum1.Text) = 3) then
                EdtBoxNum1.Text := '00' + EdtBoxNum1.Text
            else
                if (Length(EdtBoxNum1.Text) = 4) then
                    EdtBoxNum1.Text := '0' + EdtBoxNum1.Text;
    if ReadIni('Auto', 'Print', '0') = '1' then
        chkAuto.Checked := True
    else
        chkAuto.Checked := False; }
    {if (User.UserType <> 'ParamConfig') and (User.UserType <> 'admin') and (User.UserType <> 'SuperAdmin') then
    begin
        EdtVersion.Enabled := false;
        EdtBoxNum.Enabled := false;
        EdtBoxNum1.Enabled := false;
        EdtColor.Enabled := false;
        EdtQty.Enabled := false;
        EdtDate.Enabled := false;
        Edtzhidan.Enabled := false;
        EdtProNo.Enabled := false;
        EdtSoftModel.Enabled := false;
        EdtTac.Enabled := false;
        EdtWeight.Enabled := false;
        //Edt_IMEISTART.Enabled := false;
        //Edt_IMEIEND.Enabled := false;
        EdtCpName.Enabled := false;
        edt_Remark1.Enabled := False;
        edt_RePrint.Enabled:=False;
        btn_RePrint.Enabled:=False;
    end;}
    if (User.UserType <> 'SuperAdmin') then
    begin
        btnPrint.Visible := False;
    end;

end;

procedure TfrmCartonBoxLlf.btn_RePrintClick(Sender: TObject);
var
    iRecordCount: Integer;
    strver, strFile: string;
    rowCount: Integer;
begin
    inherited;
    UniQuery_RePrint.Close;
    UniQuery_RePrint.ParamByName('BoxNo').Value := edt_RePrint.Text;
    UniQuery_RePrint.ParamByName('ZhiDan').Value := edtZhiDan.Text;
    UniQuery_RePrint.Open;
    iRecordCount := UniQuery_RePrint.RecordCount;

    if (iRecordCount) <= 0 then
    begin
        MessageBox(0, '此箱号未打印过!', '友情提醒', mb_OK);
        Exit;
    end;

    strBar := '';
    strver := '';
    strFile := ExtractFilePath(ParamStr(0)) + 'CartonBox\llf\' + IntToStr(iRecordCount) + '.btw';
    AppendTxt(strFile, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
    UniQuery_RePrint.First;
    with btappAutoPrint.Formats.Open(strFile, True, '') do //打开标签文件
    begin
        SetNamedSubStringValue('BoxNum', UniQuery_RePrint.FieldByName('BoxNo').AsString);
        SetNamedSubStringValue('ZhiDan', '制单:' + UniQuery_RePrint.FieldByName('ZhiDan').AsString);
        SetNamedSubStringValue('MachineType', UniQuery_RePrint.FieldByName('SoftModel').AsString);
        SetNamedSubStringValue('ProductColor', '颜色:' + UniQuery_RePrint.FieldByName('Color').AsString);
        SetNamedSubStringValue('ProductDate', '日期:' + UniQuery_RePrint.FieldByName('Date').AsString);
        SetNamedSubStringValue('ProductCount', '数量:' + UniQuery_RePrint.FieldByName('Qty').AsString);
        SetNamedSubStringValue('ProductWeight', '毛重:' + UniQuery_RePrint.FieldByName('Weight').AsString);
        SetNamedSubStringValue('ProductNum', '产品编码:' + UniQuery_RePrint.FieldByName('ProductCode').AsString);
        SetNamedSubStringValue('Remark', UniQuery_RePrint.FieldByName('Remark1').AsString);
        strver := SysUtils.Format('箱号:%s' + #13#10 + '制单:%s' + #13#10 + '机型:%s' + #13#10 + '颜色:%s' + #13#10 + '日期:%s' + #13#10 + '数量:%s' + #13#10 + '毛重:%s' + #13#10 + '产品编码:%s' + #13#10 + '%s' + #13#10 + '',
            [UniQuery_RePrint.FieldByName('BoxNo').AsString,
            UniQuery_RePrint.FieldByName('ZhiDan').AsString,
                UniQuery_RePrint.FieldByName('SoftModel').AsString,
                UniQuery_RePrint.FieldByName('Color').AsString,
                UniQuery_RePrint.FieldByName('Date').AsString,
                UniQuery_RePrint.FieldByName('Qty').AsString,
                UniQuery_RePrint.FieldByName('Weight').AsString,
                UniQuery_RePrint.FieldByName('ProductCode').AsString,
                UniQuery_RePrint.FieldByName('Remark1').AsString
                ]);
        AppendTxt(strver, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
        rowCount := 0;
        while not UniQuery_RePrint.Eof do
        begin
            strver := strver + UniQuery_RePrint.FieldByName('IMEI').AsString + '' + #13#10 + '';
            strBar := 'IMEI' + IntToStr(rowCount);
            SetNamedSubStringValue(strBar, UniQuery_RePrint.FieldByName('IMEI').AsString); //设置值
            AppendTxt(DateTimeToStr(Now) + '-----------' + UniQuery_RePrint.FieldByName('IMEI').AsString, LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');

            rowCount := rowCount + 1;
            UniQuery_RePrint.Next;
            {UniQuery_IMEI.Close;
            UniQuery_IMEI.Sql.Clear;
            //strtemp := Format('Insert into Gps_CartonBoxTwenty_Result (BoxNo,IMEI,ZhiDan,SoftModel,Version,ProductCode,Color,Qty,Weight,Date,TACInfo,CompanyName,TesterId) values(''%s%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'')',
            //[EdtBoxNum.Text, EdtBoxNum1.Text, StrList.Strings[i], Edtzhidan.Text, EdtVersion.Text, EdtVersion1.Text, EdtProNo.Text, EdtColor.Text, EdtQty1.Text, EdtQty.Text, EdtDate.Text, EdtTac.Text, EdtCpName.Text, User.UserName]);
            strtemp:='Insert into Gps_CartonBoxTwenty_Result(BoxNo,IMEI,ZhiDan,SoftModel,Version,ProductCode,Color,Qty,Weight,Date,TACInfo,CompanyName,TesterId,Remark2) values('''
                      + EdtBoxNum.Text+EdtBoxNum1.Text+''','''+StrList.Strings[i]+''','''+Edtzhidan.Text
                      + ''','''+EdtVersion.Text+''','''+EdtParamVersion.Text+''','''+EdtProNo.Text+''','''
                      + EdtColor.Text+''','''+EdtQty1.Text+''','''+EdtQty.Text+''','''+EdtDate.Text+''','''
                      + EdtTac.Text+''','''+EdtCpName.Text+''','''+User.UserName + ''','''+strRid+''')';

            UniQuery_IMEI.SQL.Text:=strtemp;
            UniQuery_IMEI.Execute; }

        end;
        SetNamedSubStringValue('QRCode', strver); //设置值
        try
            PrintOut(False, False);
            Close(btDoNotSaveChanges); //关闭不保存
            StrList.Clear;
            SNList.Clear;
            VersionList.Clear;
            mmoMEI.Clear;
        except
            Close(btDoNotSaveChanges); //关闭不保存
        end;
    end;

end;

procedure TfrmCartonBoxLlf.cbManuOrderChange(Sender: TObject);
begin
    inherited;
    UniQuery_ManuOrderParam.Active := false;
    UniQuery_ManuOrderParam.Params.ParamByName('ZhiDan').AsString := cbManuOrder.Text;
    UniQuery_ManuOrderParam.Active := true;

    edt_RePrint.Enabled := True;
end;

procedure TfrmCartonBoxLlf.EdtMEIKeyPress(Sender: TObject; var Key: Char);
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
            if ((Edt_IMEISTART.Text <> '') and (Edt_IMEIEND.Text <> '')) then
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
            SendToServer(CommIndex, 'CheckTestPass', strSendText);
        end;
    end;
end;

end.


