unit uCartonBoxLlf;
interface
uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uCartonBox, StdCtrls, Buttons, ExtCtrls, DB, ADODB, OleServer, ComObj, OleExcel,
    BarTender_TLB, MemDS, DBAccess, Uni, uDmMain, uGlobalVar, Mask, Grids,
    DBTables, Excel2000, DBCtrls, StrUtils, AppEvnts;
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
        cbb_Rel: TDBLookupComboBox;
        lblrel: TLabel;
        UniQuery_ManuOrderParamIMEIRel: TIntegerField;
        UniQuery_ManuOrderParamIMEIRelDesc: TStringField;
        UniQuery_DataRelativeSheetByImei: TUniQuery;
        lbl_IMEI: TLabel;
        Label4: TLabel;
        edt_SIM: TEdit;
        UniQuery_SIM: TUniQuery;
        UniQuery_DataRelativeSheetBySIM: TUniQuery;
        Label5: TLabel;
        Edt_SIMSTART: TDBEdit;
        Label6: TLabel;
        Edt_SIMEND: TDBEdit;
        UniQuery_ManuOrderParamSIMStart: TStringField;
        UniQuery_ManuOrderParamSIMEnd: TStringField;
        qry_UpdateDataRel: TUniQuery;
        btappAutoPrint: TBTApplication;
        btappBtnPrint: TBTApplication;
        Label8: TLabel;
        edt_preSim: TEdit;
        Label9: TLabel;
        edt_preIMEI: TEdit;
        sp_CheckSim: TUniStoredProc;
        UniQuery_SIMIMEI1: TStringField;
        edt_IMEI1: TDBEdit;
        ds_SIM: TDataSource;
        UniQuery_DataRelativeSheetByImeiSIM: TUniQuery;
        ch_CheckInfo: TCheckBox;
        UniQuery_DataRelative_ByIMEI: TUniQuery;
        spCheckTestpass: TUniStoredProc;
        UniQuery_DataRelative_VIP_ByIMEI: TUniQuery;
    qry_InsertDataRel_BAT: TUniQuery;
    chk_ConNo: TCheckBox;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure btn_RePrintClick(Sender: TObject);
        procedure cbManuOrderChange(Sender: TObject);
        procedure EdtMEIKeyPress(Sender: TObject; var Key: Char);
        procedure edt_SIMKeyPress(Sender: TObject; var Key: Char);
        procedure MsgAllowPrint(var msg: TMessage); message WM_AllowPrint;
        procedure IMEIErrorPrompt(StrPrompt: string);
    private
        { Private declarations }
    public
        { Public declarations }
        procedure ImeiPrint(); override;
        procedure ImeiPrint_40();
        procedure AllowPrint(); override;
    end;
var
    frmCartonBoxLlf: TfrmCartonBoxLlf;
    IMEIRel: Integer; //IMEI绑定关系
    StrList_IMEISIM: TStringList; //扫描数据列表
implementation
uses
    uPublicFunc;
{$R *.dfm}

procedure TfrmCartonBoxLlf.MsgAllowPrint(var msg: TMessage);
begin
    AllowPrint();
end;

procedure TfrmCartonBoxLlf.ImeiPrint();
var
    strFile, strver: string; //打印的模版文件,日志文件
    i, iRecordCount: Integer; //循环变量,数据记录总数
    strSQL, strRid: string; //SQL语句,机子基带ID
    iIMEI, istart, iend: Integer; //判断IMEI是否在范围内
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
    if (PrintType = '中文') then
    begin
        strFile := ExtractFilePath(ParamStr(0)) + 'CartonBox\llf\Cn' + IntToStr(mmoMEI.Lines.Count) + '.btw';
    end
    else
    begin
        strFile := ExtractFilePath(ParamStr(0)) + 'CartonBox\llf\Eng' + IntToStr(mmoMEI.Lines.Count) + '.btw';
    end;
    AppendTxt(strFile, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\log.txt');
    with btappAutoPrint.Formats.Open(strFile, True, '') do //打开标签文件
    begin
        //贴纸标题赋值
        SetNamedSubStringValue('BoxNum', trim(EdtBoxNum.Text) + trim(EdtBoxNum1.Text));
        SetNamedSubStringValue('ZhiDan', trim(Edtzhidan.Text));
        SetNamedSubStringValue('MachineType', trim(EdtSoftModel.Text));
        SetNamedSubStringValue('ProductColor', trim(EdtColor.Text));
        SetNamedSubStringValue('ProductDate', trim(EdtDate.Text));
        SetNamedSubStringValue('ProductCount', trim(EdtQty.Text));
        SetNamedSubStringValue('ProductWeight', (EdtWeight.Text));
        SetNamedSubStringValue('ProductNum', trim(EdtProNo.Text));
        SetNamedSubStringValue('Remark', trim(edt_Remark1.Text));
        if (PrintType = '中文') then
        begin
            strver := SysUtils.Format('箱号:%s%s' + #13#10 + '制单:%s' + #13#10 + '机型:%s' + #13#10 + '颜色:%s' + #13#10 + '日期:%s' + #13#10 + '数量:%s' + #13#10 + '毛重:%s' + #13#10 + '产品编码:%s' + #13#10 + '%s' + #13#10 + '',
                [EdtBoxNum.Text, EdtBoxNum1.Text, Edtzhidan.Text, edtsoftmodel.Text, EdtColor.Text, EdtDate.Text, EdtQty.Text, EdtWeight.Text, EdtProNo.Text, edt_Remark1.text]);
        end
        else
        begin
            strver := SysUtils.Format('BOX NO:%s%s' + #13#10 + 'P.O.:%s' + #13#10 + 'Model:%s' + #13#10 + 'Color:%s' + #13#10 + 'Date:%s' + #13#10 + 'QTY:%s' + #13#10 + 'G.W:%s' + #13#10 + 'Product Code:%s' + #13#10 + '%s' + #13#10 + '',
                [EdtBoxNum.Text, EdtBoxNum1.Text, Edtzhidan.Text, edtsoftmodel.Text, EdtColor.Text, EdtDate.Text, EdtQty.Text, EdtWeight.Text, EdtProNo.Text, edt_Remark1.text]);
        end;
        AppendTxt(strver, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
        //IMEI赋值
        for i := 0 to (mmoMEI.Lines.Count - 1) do
        begin
            //解析要打印的数据 StrList_IMEISIM[0]=>IMEI      StrList_IMEISIM[1]=>SIM
            StrList_IMEISIM.Delimiter := ',';
            StrList_IMEISIM.DelimitedText := StrList.Strings[i];

            //判断IMEI号是否在范围内
            if ((Edt_IMEISTART.Text <> '') and (Edt_IMEIEND.Text <> '')) then
            begin
                istart := strtoint64(Trim(Edt_IMEISTART.Text));
                iend := strtoint64(Trim(Edt_IMEIEND.Text));
                iIMEI := strtoint64(LeftStr(StrList_IMEISIM[0], 14));
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
            end
            else
            begin
                IMEIErrorPrompt('IMEI号段未设置！');
                Exit;
            end;

            if (ch_CheckInfo.Checked) then
            begin
                //IMEI判断基带ID是否正常
                UniQuery_FindRidByImei.Close;
                UniQuery_FindRidByImei.ParamByName('IMEI').value := StrList_IMEISIM[0];
                UniQuery_FindRidByImei.Open;
                //得到基带ID
                strRid := '';
                if (UniQuery_FindRidByImei.RecordCount <> 1) then
                begin
                    IMEIErrorPrompt('此机子异常,请联系管理员！');
                    Exit;
                end
                else
                begin
                    UniQuery_FindRidByImei.First;
                    strRid := UniQuery_FindRidByImei.FieldByName('Rid').AsString;
                    AppendTxt(StrList.Strings[i] + ',' + strRid, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');

                end;
            end;

            //每个单独的IMEI
            strver := strver + StrList_IMEISIM[0] + '' + #13#10 + '';
            strBar := 'IMEI' + IntToStr(i);
            SetNamedSubStringValue(strBar, StrList_IMEISIM[0]); //设置值
            AppendTxt(DateTimeToStr(Now) + '-----------' + StrList_IMEISIM[0], LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');

            case IMEIRel of
                1, 2, 3:
                    begin
                        //更新DataRelativeSheet表
                        qry_UpdateDataRel.Close;
                        qry_UpdateDataRel.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        qry_UpdateDataRel.ParamByName('SIMNo').Value := StrList_IMEISIM[1];
                        qry_UpdateDataRel.Execute;

                        //查看DataRelativeSheet表是否更改
                        UniQuery_DataRelativeSheetByImeiSIM.Close;
                        UniQuery_DataRelativeSheetByImeiSIM.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        UniQuery_DataRelativeSheetByImeiSIM.ParamByName('SIMNO').Value := StrList_IMEISIM[1];
                        UniQuery_DataRelativeSheetByImeiSIM.Open;
                        iRecordCount := UniQuery_DataRelativeSheetByImeiSIM.RecordCount;
                        UniQuery_DataRelativeSheetByImeiSIM.Close;
                        if (iRecordCount < 1) then
                        begin
                            IMEIErrorPrompt('IMEI与SIM绑定失败,请联系管理员!');
                            Exit;
                        end
                    end;
                4:
                    begin
                        qry_InsertDataRel_BAT.Close;
                        qry_InsertDataRel_BAT.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        //qry_InsertDataRel_BAT.ParamByName('SIMNo').Value := StrList_IMEISIM[1];
                        qry_InsertDataRel_BAT.Execute;

                        //查看DataRelativeSheet表是否更改
                        UniQuery_DataRelativeSheetByImei.Close;
                        UniQuery_DataRelativeSheetByImei.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        //UniQuery_DataRelativeSheetByImeiSIM.ParamByName('SIMNO').Value := nil;
                        UniQuery_DataRelativeSheetByImei.Open;
                        iRecordCount := UniQuery_DataRelativeSheetByImei.RecordCount;
                        UniQuery_DataRelativeSheetByImei.Close;
                        if (iRecordCount < 1) then
                        begin
                            IMEIErrorPrompt('BAT绑定失败,请联系管理员!');
                            Exit;
                        end
                    end;
            end;

            //更新Gps_CartonBoxTwenty_Result表
            UniQuery_IMEI.Close;
            UniQuery_IMEI.Sql.Clear;
            strSQL := 'Insert into Gps_CartonBoxTwenty_Result(BoxNo,IMEI,ZhiDan,SoftModel,Version,ProductCode,Color,Qty,Weight,Date,TACInfo,CompanyName,TesterId,Remark2,Remark1) values('''
                + EdtBoxNum.Text + EdtBoxNum1.Text + ''',''' + StrList_IMEISIM[0] + ''',''' + Edtzhidan.Text
                + ''',''' + edtsoftmodel.Text + ''',''' + edtVersion.Text + ''',''' + EdtProNo.Text + ''','''
                + EdtColor.Text + ''',''' + EdtQty.Text + ''',''' + EdtWeight.Text + ''',''' + EdtDate.Text + ''','''
                + EdtTac.Text + ''',''' + EdtCpName.Text + ''',''' + User.UserName + ''',''' + strRid + ''',''' + edt_remark1.Text + ''')';
            UniQuery_IMEI.SQL.Text := strSQL;
            UniQuery_IMEI.Execute;

            //查看Gps_CartonBoxTwenty_Result是否更新
            UniQuery_IMEI_20.Close;
            UniQuery_IMEI_20.ParamByName('IMEI').Value := StrList_IMEISIM[0];
            UniQuery_IMEI_20.Open;
            iRecordCount := UniQuery_IMEI_20.RecordCount;
            UniQuery_IMEI_20.Close;
            if (iRecordCount) < 1 then
            begin
                MessageBox(0, PCHAR('当前IMEI更新卡通测试结果失败,请联系管理员!'), '友情提醒,数据更新失败', mb_OK);
                Exit;
            end;

        end;
        SetNamedSubStringValue('QRCode', strver); //设置值
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

        //更新箱号
        UniQuery_UpdateBoxNo.Close;
        UniQuery_UpdateBoxNo.ParamByName('BoxNo2').AsString := EdtBoxNum1.Text;
        UniQuery_UpdateBoxNo.ParamByName('ZhiDan').AsString := cbManuOrder.Text;
        UniQuery_UpdateBoxNo.Execute;

        //打印贴纸
        //if chkAuto.Checked then
        //begin
        try
            PrintOut(False, False);
            Close(btDoNotSaveChanges); //关闭不保存
        except
            Close(btDoNotSaveChanges); //关闭不保存
        end;
        {end
        else
        begin
            try
                PrintOut(False, true); //打印
                Close(btDoNotSaveChanges); //关闭不保存
            except
                Close(btDoNotSaveChanges); //关闭不保存
            end;
        end; }
        StrList.Clear;
        SNList.Clear;
        VersionList.Clear;
        mmoMEI.Clear;

        AppendTxt('', LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
        AppendTxt('', LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
    end;
end;

procedure TfrmCartonBoxLlf.ImeiPrint_40();
var
    strFile, strver: string; //打印的模版文件,日志文件
    i, iRecordCount: Integer; //循环变量,数据记录总数
    strSQL, strRid: string; //SQL语句,机子基带ID
    iIMEI, istart, iend: Integer; //判断IMEI是否在范围内
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
    if (PrintType = '中文') then
    begin
        strFile := ExtractFilePath(ParamStr(0)) + 'CartonBox\llf\Cn20.btw';
    end
    else
    begin
        strFile := ExtractFilePath(ParamStr(0)) + 'CartonBox\llf\Eng20.btw';
    end;
    AppendTxt(strFile, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\log.txt');
    //first box
    with btappAutoPrint.Formats.Open(strFile, True, '') do //打开标签文件
    begin
        //贴纸标题赋值
        SetNamedSubStringValue('BoxNum', trim(EdtBoxNum.Text) + trim(EdtBoxNum1.Text));
        SetNamedSubStringValue('ZhiDan', trim(Edtzhidan.Text));
        SetNamedSubStringValue('MachineType', trim(EdtSoftModel.Text));
        SetNamedSubStringValue('ProductColor', trim(EdtColor.Text));
        SetNamedSubStringValue('ProductDate', trim(EdtDate.Text));
        SetNamedSubStringValue('ProductCount', trim(EdtQty.Text));
        SetNamedSubStringValue('ProductWeight', (EdtWeight.Text));
        SetNamedSubStringValue('ProductNum', trim(EdtProNo.Text));
        SetNamedSubStringValue('Remark', trim(edt_Remark1.Text));
        if (PrintType = '中文') then
        begin
            strver := SysUtils.Format('箱号:%s%s' + #13#10 + '制单:%s' + #13#10 + '机型:%s' + #13#10 + '颜色:%s' + #13#10 + '日期:%s' + #13#10 + '数量:%s' + #13#10 + '毛重:%s' + #13#10 + '产品编码:%s' + #13#10 + '%s' + #13#10 + '',
                [EdtBoxNum.Text, EdtBoxNum1.Text, Edtzhidan.Text, edtsoftmodel.Text, EdtColor.Text, EdtDate.Text, EdtQty.Text, EdtWeight.Text, EdtProNo.Text, edt_Remark1.text]);
        end
        else
        begin
            strver := SysUtils.Format('BOX NO:%s%s' + #13#10 + 'P.O.:%s' + #13#10 + 'Model:%s' + #13#10 + 'Color:%s' + #13#10 + 'Date:%s' + #13#10 + 'QTY:%s' + #13#10 + 'G.W:%s' + #13#10 + 'Product Code:%s' + #13#10 + '%s' + #13#10 + '',
                [EdtBoxNum.Text, EdtBoxNum1.Text, Edtzhidan.Text, edtsoftmodel.Text, EdtColor.Text, EdtDate.Text, EdtQty.Text, EdtWeight.Text, EdtProNo.Text, edt_Remark1.text]);
        end;
        AppendTxt(strver, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
        //IMEI赋值
        for i := 0 to 19 do
        begin
            //解析要打印的数据 StrList_IMEISIM[0]=>IMEI      StrList_IMEISIM[1]=>SIM
            StrList_IMEISIM.Delimiter := ',';
            StrList_IMEISIM.DelimitedText := StrList.Strings[i];

            //判断IMEI号是否在范围内
            if ((Edt_IMEISTART.Text <> '') and (Edt_IMEIEND.Text <> '')) then
            begin
                istart := strtoint64(Trim(Edt_IMEISTART.Text));
                iend := strtoint64(Trim(Edt_IMEIEND.Text));
                iIMEI := strtoint64(LeftStr(StrList_IMEISIM[0], 14));
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
            end
            else
            begin
                IMEIErrorPrompt('IMEI号段未设置！');
                Exit;
            end;

            if (ch_CheckInfo.Checked) then
            begin
                //IMEI判断基带ID是否正常
                UniQuery_FindRidByImei.Close;
                UniQuery_FindRidByImei.ParamByName('IMEI').value := StrList_IMEISIM[0];
                UniQuery_FindRidByImei.Open;
                //得到基带ID
                strRid := '';
                if (UniQuery_FindRidByImei.RecordCount <> 1) then
                begin
                    IMEIErrorPrompt('此机子异常,请联系管理员！');
                    Exit;
                end
                else
                begin
                    UniQuery_FindRidByImei.First;
                    strRid := UniQuery_FindRidByImei.FieldByName('Rid').AsString;
                    AppendTxt(StrList.Strings[i] + ',' + strRid, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');

                end;
            end;

            //每个单独的IMEI
            strver := strver + StrList_IMEISIM[0] + '' + #13#10 + '';
            strBar := 'IMEI' + IntToStr(i);
            SetNamedSubStringValue(strBar, StrList_IMEISIM[0]); //设置值
            AppendTxt(DateTimeToStr(Now) + '-----------' + StrList_IMEISIM[0], LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');

            case IMEIRel of
                1, 2, 3:
                    begin
                        //更新DataRelativeSheet表
                        qry_UpdateDataRel.Close;
                        qry_UpdateDataRel.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        qry_UpdateDataRel.ParamByName('SIMNo').Value := StrList_IMEISIM[1];
                        qry_UpdateDataRel.Execute;

                        //查看DataRelativeSheet表是否更改
                        UniQuery_DataRelativeSheetByImeiSIM.Close;
                        UniQuery_DataRelativeSheetByImeiSIM.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        UniQuery_DataRelativeSheetByImeiSIM.ParamByName('SIMNO').Value := StrList_IMEISIM[1];
                        UniQuery_DataRelativeSheetByImeiSIM.Open;
                        iRecordCount := UniQuery_DataRelativeSheetByImeiSIM.RecordCount;
                        UniQuery_DataRelativeSheetByImeiSIM.Close;
                        if (iRecordCount < 1) then
                        begin
                            IMEIErrorPrompt('IMEI与SIM绑定失败,请联系管理员!');
                            Exit;
                        end
                    end;
            end;

            //更新Gps_CartonBoxTwenty_Result表
            UniQuery_IMEI.Close;
            UniQuery_IMEI.Sql.Clear;
            strSQL := 'Insert into Gps_CartonBoxTwenty_Result(BoxNo,IMEI,ZhiDan,SoftModel,Version,ProductCode,Color,Qty,Weight,Date,TACInfo,CompanyName,TesterId,Remark2,Remark1) values('''
                + EdtBoxNum.Text + EdtBoxNum1.Text + ''',''' + StrList_IMEISIM[0] + ''',''' + Edtzhidan.Text
                + ''',''' + edtsoftmodel.Text + ''',''' + edtVersion.Text + ''',''' + EdtProNo.Text + ''','''
                + EdtColor.Text + ''',''' + EdtQty.Text + ''',''' + EdtWeight.Text + ''',''' + EdtDate.Text + ''','''
                + EdtTac.Text + ''',''' + EdtCpName.Text + ''',''' + User.UserName + ''',''' + strRid + ''',''' + edt_remark1.Text + ''')';
            UniQuery_IMEI.SQL.Text := strSQL;
            UniQuery_IMEI.Execute;

            //查看Gps_CartonBoxTwenty_Result是否更新
            UniQuery_IMEI_20.Close;
            UniQuery_IMEI_20.ParamByName('IMEI').Value := StrList_IMEISIM[0];
            UniQuery_IMEI_20.Open;
            iRecordCount := UniQuery_IMEI_20.RecordCount;
            UniQuery_IMEI_20.Close;
            if (iRecordCount) < 1 then
            begin
                MessageBox(0, PCHAR('当前IMEI更新卡通测试结果失败,请联系管理员!'), '友情提醒,数据更新失败', mb_OK);
                Exit;
            end;

        end;
        SetNamedSubStringValue('QRCode', strver); //设置值
        try
            PrintOut(False, False);
            Close(btDoNotSaveChanges); //关闭不保存
        except
            Close(btDoNotSaveChanges); //关闭不保存
        end;

        AppendTxt('', LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
        AppendTxt('', LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
    end;
    //second box
    with btappAutoPrint.Formats.Open(strFile, True, '') do //打开标签文件
    begin
        //贴纸标题赋值
        SetNamedSubStringValue('BoxNum', trim(EdtBoxNum.Text) + trim(EdtBoxNum1.Text));
        SetNamedSubStringValue('ZhiDan', trim(Edtzhidan.Text));
        SetNamedSubStringValue('MachineType', trim(EdtSoftModel.Text));
        SetNamedSubStringValue('ProductColor', trim(EdtColor.Text));
        SetNamedSubStringValue('ProductDate', trim(EdtDate.Text));
        SetNamedSubStringValue('ProductCount', trim(EdtQty.Text));
        SetNamedSubStringValue('ProductWeight', (EdtWeight.Text));
        SetNamedSubStringValue('ProductNum', trim(EdtProNo.Text));
        SetNamedSubStringValue('Remark', trim(edt_Remark1.Text));
        if (PrintType = '中文') then
        begin
            strver := SysUtils.Format('箱号:%s%s' + #13#10 + '制单:%s' + #13#10 + '机型:%s' + #13#10 + '颜色:%s' + #13#10 + '日期:%s' + #13#10 + '数量:%s' + #13#10 + '毛重:%s' + #13#10 + '产品编码:%s' + #13#10 + '%s' + #13#10 + '',
                [EdtBoxNum.Text, EdtBoxNum1.Text, Edtzhidan.Text, edtsoftmodel.Text, EdtColor.Text, EdtDate.Text, EdtQty.Text, EdtWeight.Text, EdtProNo.Text, edt_Remark1.text]);
        end
        else
        begin
            strver := SysUtils.Format('BOX NO:%s%s' + #13#10 + 'P.O.:%s' + #13#10 + 'Model:%s' + #13#10 + 'Color:%s' + #13#10 + 'Date:%s' + #13#10 + 'QTY:%s' + #13#10 + 'G.W:%s' + #13#10 + 'Product Code:%s' + #13#10 + '%s' + #13#10 + '',
                [EdtBoxNum.Text, EdtBoxNum1.Text, Edtzhidan.Text, edtsoftmodel.Text, EdtColor.Text, EdtDate.Text, EdtQty.Text, EdtWeight.Text, EdtProNo.Text, edt_Remark1.text]);
        end;
        AppendTxt(strver, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
        //IMEI赋值
        for i := 20 to (mmoMEI.Lines.Count - 1) do
        begin
            //解析要打印的数据 StrList_IMEISIM[0]=>IMEI      StrList_IMEISIM[1]=>SIM
            StrList_IMEISIM.Delimiter := ',';
            StrList_IMEISIM.DelimitedText := StrList.Strings[i];

            //判断IMEI号是否在范围内
            if ((Edt_IMEISTART.Text <> '') and (Edt_IMEIEND.Text <> '')) then
            begin
                istart := strtoint64(Trim(Edt_IMEISTART.Text));
                iend := strtoint64(Trim(Edt_IMEIEND.Text));
                iIMEI := strtoint64(LeftStr(StrList_IMEISIM[0], 14));
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
            end
            else
            begin
                IMEIErrorPrompt('IMEI号段未设置！');
                Exit;
            end;

            if (ch_CheckInfo.Checked) then
            begin
                //IMEI判断基带ID是否正常
                UniQuery_FindRidByImei.Close;
                UniQuery_FindRidByImei.ParamByName('IMEI').value := StrList_IMEISIM[0];
                UniQuery_FindRidByImei.Open;
                //得到基带ID
                strRid := '';
                if (UniQuery_FindRidByImei.RecordCount <> 1) then
                begin
                    IMEIErrorPrompt('此机子异常,请联系管理员！');
                    Exit;
                end
                else
                begin
                    UniQuery_FindRidByImei.First;
                    strRid := UniQuery_FindRidByImei.FieldByName('Rid').AsString;
                    AppendTxt(StrList.Strings[i mod 20] + ',' + strRid, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');

                end;
            end;

            //每个单独的IMEI
            strver := strver + StrList_IMEISIM[0] + '' + #13#10 + '';
            strBar := 'IMEI' + IntToStr(i mod 20);
            SetNamedSubStringValue(strBar, StrList_IMEISIM[0]); //设置值
            AppendTxt(DateTimeToStr(Now) + '-----------' + StrList_IMEISIM[0], LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');

            case IMEIRel of
                1, 2, 3:
                    begin
                        //更新DataRelativeSheet表
                        qry_UpdateDataRel.Close;
                        qry_UpdateDataRel.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        qry_UpdateDataRel.ParamByName('SIMNo').Value := StrList_IMEISIM[1];
                        qry_UpdateDataRel.Execute;

                        //查看DataRelativeSheet表是否更改
                        UniQuery_DataRelativeSheetByImeiSIM.Close;
                        UniQuery_DataRelativeSheetByImeiSIM.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        UniQuery_DataRelativeSheetByImeiSIM.ParamByName('SIMNO').Value := StrList_IMEISIM[1];
                        UniQuery_DataRelativeSheetByImeiSIM.Open;
                        iRecordCount := UniQuery_DataRelativeSheetByImeiSIM.RecordCount;
                        UniQuery_DataRelativeSheetByImeiSIM.Close;
                        if (iRecordCount < 1) then
                        begin
                            IMEIErrorPrompt('IMEI与SIM绑定失败,请联系管理员!');
                            Exit;
                        end
                    end;
            end;

            //更新Gps_CartonBoxTwenty_Result表
            UniQuery_IMEI.Close;
            UniQuery_IMEI.Sql.Clear;
            strSQL := 'Insert into Gps_CartonBoxTwenty_Result(BoxNo,IMEI,ZhiDan,SoftModel,Version,ProductCode,Color,Qty,Weight,Date,TACInfo,CompanyName,TesterId,Remark2,Remark1) values('''
                + EdtBoxNum.Text + EdtBoxNum1.Text + ''',''' + StrList_IMEISIM[0] + ''',''' + Edtzhidan.Text
                + ''',''' + edtsoftmodel.Text + ''',''' + edtVersion.Text + ''',''' + EdtProNo.Text + ''','''
                + EdtColor.Text + ''',''' + EdtQty.Text + ''',''' + EdtWeight.Text + ''',''' + EdtDate.Text + ''','''
                + EdtTac.Text + ''',''' + EdtCpName.Text + ''',''' + User.UserName + ''',''' + strRid + ''',''' + edt_remark1.Text + ''')';
            UniQuery_IMEI.SQL.Text := strSQL;
            UniQuery_IMEI.Execute;

            //查看Gps_CartonBoxTwenty_Result是否更新
            UniQuery_IMEI_20.Close;
            UniQuery_IMEI_20.ParamByName('IMEI').Value := StrList_IMEISIM[0];
            UniQuery_IMEI_20.Open;
            iRecordCount := UniQuery_IMEI_20.RecordCount;
            UniQuery_IMEI_20.Close;
            if (iRecordCount) < 1 then
            begin
                MessageBox(0, PCHAR('当前IMEI更新卡通测试结果失败,请联系管理员!'), '友情提醒,数据更新失败', mb_OK);
                Exit;
            end;

        end;
        SetNamedSubStringValue('QRCode', strver); //设置值
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

        //更新箱号
        UniQuery_UpdateBoxNo.Close;
        UniQuery_UpdateBoxNo.ParamByName('BoxNo2').AsString := EdtBoxNum1.Text;
        UniQuery_UpdateBoxNo.ParamByName('ZhiDan').AsString := cbManuOrder.Text;
        UniQuery_UpdateBoxNo.Execute;

        //打印贴纸
        //if chkAuto.Checked then
        //begin
        try
            PrintOut(False, False);
            Close(btDoNotSaveChanges); //关闭不保存
        except
            Close(btDoNotSaveChanges); //关闭不保存
        end;

        StrList.Clear;
        SNList.Clear;
        VersionList.Clear;
        mmoMEI.Clear;

        AppendTxt('', LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
        AppendTxt('', LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
    end;
end;

procedure TfrmCartonBoxLlf.AllowPrint();
var
    imemoLines, lineLoop: Integer; //条码的条数,条码数循环量
    iRecordCount: Integer;
begin

    if (edtMEI.Text = '') then Exit;
    imemoLines := mmoMEI.Lines.Count;
    if imemoLines + 1 > iPrintCount then
    begin
        ShowMessage('打印数据不能超过' + inttostr(iPrintCount) + '条,若继续扫描请先打印当前数据');
        Exit;
    end;
    //判断条码是否重复
    if imemoLines <> 0 then
    begin
        for lineLoop := 0 to imemoLines - 1 do
        begin
            if edtMEI.Text = StrUtils.LeftStr(mmoMEI.Lines[lineLoop], 15) then
            begin
                IMEIErrorPrompt('IMEI数据重复');
                Exit;
            end
            else IMEIErrorPrompt('');
        end;
    end;
    begin
        IMEIErrorPrompt('');
        UniQuery_IMEI_20.Close;
        UniQuery_IMEI_20.ParamByName('IMEI').Value := edtMEI.Text;
        UniQuery_IMEI_20.Open;
        iRecordCount := iRecordCount + UniQuery_IMEI_20.RecordCount;
        //UniQuery_IMEI_20.Close;

        if (iRecordCount) >= 1 then
        begin
            EdtMEI.Text := '';
            EdtMEI.SetFocus;
            MessageBox(0, PCHAR('当前IMEI在箱号' + UniQuery_IMEI_20.FieldByName('BoxNo').AsString + '中已经扫描过请勿重复扫描'), '友情提醒,数据重复', mb_OK);
            Exit;
        end;
    end;

    case IMEIRel of
        //无绑定
        0,4:
            begin
                if (edtMEI.Text <> '') then
                begin
                    mmoMEI.Lines.Add(edtMEI.Text);
                    StrList.Add(trim(edtMEI.Text));
                    //AppendTxt(DateTimeToStr(Now) + '-----------AddPrintNote:' + edtMEI.Text , LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');
                    edt_SIM.Text := '';
                    edtMEI.Text := '';
                    EdtMEI.SetFocus;

                end;
            end;
        //与SIM卡绑定
        1, 2, 3:
            begin
                if (edt_SIM.Text = '') then Exit;
                imemoLines := mmoMEI.Lines.Count;
                //判断条码是否重复
                if imemoLines <> 0 then
                begin
                    for lineLoop := 0 to imemoLines - 1 do
                    begin
                        if edt_SIM.Text = StrUtils.RightStr(mmoMEI.Lines[lineLoop], 13) then
                        begin
                            IMEIErrorPrompt('SIM数据重复');
                            Exit;
                        end
                        else IMEIErrorPrompt('');
                    end;
                end;
                IMEIErrorPrompt('');

                //查看IMEI是否打印过
                UniQuery_DataRelativeSheetBySIM.Close;
                UniQuery_DataRelativeSheetBySIM.ParamByName('SIMNO').Value := Edt_SIM.Text;
                UniQuery_DataRelativeSheetBySIM.Open;
                iRecordCount := UniQuery_DataRelativeSheetBySIM.RecordCount;
                UniQuery_DataRelativeSheetBySIM.Close;
                if (iRecordCount <= 0) then
                begin
                    MessageBox(0, PCHAR('当前SIM已绑定!'), '友情提醒,数据重复', mb_OK);
                    Exit;
                end;

                if (edtMEI.Text <> '') and (edt_SIM.Text <> '') then
                begin
                    mmoMEI.Lines.Add(edtMEI.Text + ',' + edt_Sim.Text);
                    StrList.Add(trim(edtMEI.Text + ',' + edt_Sim.Text));
                    //AppendTxt(DateTimeToStr(Now) + '-----------AddPrintNote:' + edtMEI.Text + ',' + edt_Sim.Text, LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');
                    edtMEI.Text := '';
                    edt_SIM.Text := '';
                    edt_SIM.SetFocus;
                    edt_SIM.SetFocus;
                end;

            end;

    end;
    lbl10.Caption := IntToStr(imemoLines + 1);
    //自动打印
    if (imemoLines + 1 = iPrintCount) and (chkAuto.Checked) then
    begin
        //SendNotifyMessage(Handle, WM_BarPrint, 0, 0);
        if (iPrintCount = 40) then
        begin
            ImeiPrint_40();
        end
        else
        begin
            ImeiPrint();
        end;

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

    StrList_IMEISIM.Free;
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
        btnPrint.Enabled := False;
    end;

    StrList_IMEISIM := TStringList.Create; //

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
    if (EdtSoftModel.Text <> '') and (edt_Remark1.Text <> '') then
    begin
        UniQuery_RePrint.Filter := 'SoftModel=' + QuotedStr(EdtSoftModel.Text) + ' and ' + 'Remark1=' + QuotedStr(edt_Remark1.Text);

    end
    else
    begin
        UniQuery_RePrint.Filter := 'SoftModel=' + QuotedStr(EdtSoftModel.Text);

    end;
    UniQuery_RePrint.Filtered := True;
    //UniQuery_RePrint.Filter:='Remark1='+QuotedStr(edt_Remark1.Text);
    //UniQuery_RePrint.Filtered:=True;
    iRecordCount := UniQuery_RePrint.RecordCount;

    if (iRecordCount) <= 0 then
    begin
        MessageBox(0, '此箱号未打印过!', '友情提醒', mb_OK);
        Exit;
    end;

    strBar := '';
    strver := '';
    if (PrintType = '中文') then
    begin
        strFile := ExtractFilePath(ParamStr(0)) + 'CartonBox\llf\Cn20.btw';
    end
    else
    begin
        strFile := ExtractFilePath(ParamStr(0)) + 'CartonBox\llf\Eng20.btw';
    end;
    //strFile := ExtractFilePath(ParamStr(0)) + 'CartonBox\llf\' + IntToStr(iRecordCount) + '.btw';
    AppendTxt(strFile, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
    UniQuery_RePrint.First;
    if (iRecordCount = 40) then
    begin
        //first box
        with btappAutoPrint.Formats.Open(strFile, True, '') do //打开标签文件
        begin
            SetNamedSubStringValue('BoxNum', UniQuery_RePrint.FieldByName('BoxNo').AsString);
            SetNamedSubStringValue('ZhiDan', UniQuery_RePrint.FieldByName('ZhiDan').AsString);
            SetNamedSubStringValue('MachineType', UniQuery_RePrint.FieldByName('SoftModel').AsString);
            SetNamedSubStringValue('ProductColor', UniQuery_RePrint.FieldByName('Color').AsString);
            SetNamedSubStringValue('ProductDate', UniQuery_RePrint.FieldByName('Date').AsString);
            SetNamedSubStringValue('ProductCount', UniQuery_RePrint.FieldByName('Qty').AsString);
            SetNamedSubStringValue('ProductWeight', UniQuery_RePrint.FieldByName('Weight').AsString);
            SetNamedSubStringValue('ProductNum', UniQuery_RePrint.FieldByName('ProductCode').AsString);
            SetNamedSubStringValue('Remark', UniQuery_RePrint.FieldByName('Remark1').AsString);

            if (PrintType = '中文') then
            begin
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
            end
            else
            begin
                strver := SysUtils.Format('BOX NO:%s' + #13#10 + 'P.O.:%s' + #13#10 + 'Model:%s' + #13#10 + 'Color:%s' + #13#10 + 'Date:%s' + #13#10 + 'QTY:%s' + #13#10 + 'G.W:%s' + #13#10 + 'Product Code:%s' + #13#10 + '%s' + #13#10 + '',
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
            end;
            AppendTxt(strver, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
            rowCount := 0;
            while (not UniQuery_RePrint.Eof) and (rowCount<=19) do
            begin
                strver := strver + UniQuery_RePrint.FieldByName('IMEI').AsString + '' + #13#10 + '';
                strBar := 'IMEI' + IntToStr(rowCount);
                SetNamedSubStringValue(strBar, UniQuery_RePrint.FieldByName('IMEI').AsString); //设置值
                AppendTxt(DateTimeToStr(Now) + '-----------' + UniQuery_RePrint.FieldByName('IMEI').AsString, LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');

                rowCount := rowCount + 1;
                UniQuery_RePrint.Next;

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
        //second box
        with btappAutoPrint.Formats.Open(strFile, True, '') do //打开标签文件
        begin
            SetNamedSubStringValue('BoxNum', UniQuery_RePrint.FieldByName('BoxNo').AsString);
            SetNamedSubStringValue('ZhiDan', UniQuery_RePrint.FieldByName('ZhiDan').AsString);
            SetNamedSubStringValue('MachineType', UniQuery_RePrint.FieldByName('SoftModel').AsString);
            SetNamedSubStringValue('ProductColor', UniQuery_RePrint.FieldByName('Color').AsString);
            SetNamedSubStringValue('ProductDate', UniQuery_RePrint.FieldByName('Date').AsString);
            SetNamedSubStringValue('ProductCount', UniQuery_RePrint.FieldByName('Qty').AsString);
            SetNamedSubStringValue('ProductWeight', UniQuery_RePrint.FieldByName('Weight').AsString);
            SetNamedSubStringValue('ProductNum', UniQuery_RePrint.FieldByName('ProductCode').AsString);
            SetNamedSubStringValue('Remark', UniQuery_RePrint.FieldByName('Remark1').AsString);

            if (PrintType = '中文') then
            begin
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
            end
            else
            begin
                strver := SysUtils.Format('BOX NO:%s' + #13#10 + 'P.O.:%s' + #13#10 + 'Model:%s' + #13#10 + 'Color:%s' + #13#10 + 'Date:%s' + #13#10 + 'QTY:%s' + #13#10 + 'G.W:%s' + #13#10 + 'Product Code:%s' + #13#10 + '%s' + #13#10 + '',
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
            end;
            AppendTxt(strver, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
            rowCount := 0;
            while (not UniQuery_RePrint.Eof) and (rowCount<=19) do
            begin
                strver := strver + UniQuery_RePrint.FieldByName('IMEI').AsString + '' + #13#10 + '';
                strBar := 'IMEI' + IntToStr(rowCount);
                SetNamedSubStringValue(strBar, UniQuery_RePrint.FieldByName('IMEI').AsString); //设置值
                AppendTxt(DateTimeToStr(Now) + '-----------' + UniQuery_RePrint.FieldByName('IMEI').AsString, LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');

                rowCount := rowCount + 1;
                UniQuery_RePrint.Next;

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
    end
    else
    begin
        with btappAutoPrint.Formats.Open(strFile, True, '') do //打开标签文件
        begin
            SetNamedSubStringValue('BoxNum', UniQuery_RePrint.FieldByName('BoxNo').AsString);
            SetNamedSubStringValue('ZhiDan', UniQuery_RePrint.FieldByName('ZhiDan').AsString);
            SetNamedSubStringValue('MachineType', UniQuery_RePrint.FieldByName('SoftModel').AsString);
            SetNamedSubStringValue('ProductColor', UniQuery_RePrint.FieldByName('Color').AsString);
            SetNamedSubStringValue('ProductDate', UniQuery_RePrint.FieldByName('Date').AsString);
            SetNamedSubStringValue('ProductCount', UniQuery_RePrint.FieldByName('Qty').AsString);
            SetNamedSubStringValue('ProductWeight', UniQuery_RePrint.FieldByName('Weight').AsString);
            SetNamedSubStringValue('ProductNum', UniQuery_RePrint.FieldByName('ProductCode').AsString);
            SetNamedSubStringValue('Remark', UniQuery_RePrint.FieldByName('Remark1').AsString);

            if (PrintType = '中文') then
            begin
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
            end
            else
            begin
                strver := SysUtils.Format('BOX NO:%s' + #13#10 + 'P.O.:%s' + #13#10 + 'Model:%s' + #13#10 + 'Color:%s' + #13#10 + 'Date:%s' + #13#10 + 'QTY:%s' + #13#10 + 'G.W:%s' + #13#10 + 'Product Code:%s' + #13#10 + '%s' + #13#10 + '',
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
            end;
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

end;

procedure TfrmCartonBoxLlf.cbManuOrderChange(Sender: TObject);
begin
    inherited;
    UniQuery_ManuOrderParam.Active := false;
    UniQuery_ManuOrderParam.Params.ParamByName('ZhiDan').AsString := cbManuOrder.Text;
    UniQuery_ManuOrderParam.Active := true;

    IMEIRel := UniQuery_ManuOrderParam.FieldByName('IMEIRel').AsInteger;
    edt_RePrint.Enabled := True;

    case IMEIRel of
        //无绑定
        0,4:
            begin
                edt_SIM.Enabled := False;
                EdtMEI.Text := '';
                EdtMEI.SetFocus;
            end;
        //与SIM卡绑定
        1, 2, 3:
            begin
                edt_SIM.Enabled := True;
                edt_SIM.Text := '';
                edt_SIM.SetFocus;
            end;
    end;
end;
procedure TfrmCartonBoxLlf.IMEIErrorPrompt(StrPrompt: string);
begin
    lbl8.Caption := StrPrompt;
    if StrPrompt <> '' then
    begin
        //Windows.Beep(2000, 500);
        //Windows.Beep(2000, 500);
        case IMEIRel of
        //无绑定
        0,4:
            begin
                EdtMEI.Text := '';
                EdtMEI.SetFocus;
            end;
        //与SIM卡绑定
        1, 2, 3:
            begin
                EdtMEI.Text := '';
                edt_SIM.Text := '';
                edt_SIM.SetFocus;
            end;
    end;
    end;
    //Application.ProcessMessages;

end;
procedure TfrmCartonBoxLlf.EdtMEIKeyPress(Sender: TObject; var Key: Char);
var
    strSendText: string;
    CommIndex: Integer;
    iIMEI,iPreIMEI, istart, iend: Integer;
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
    //只可输入数字
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
            AppendTxt(DateTimeToStr(Now) + '-----------AddPrintNote:IMEI=>' + edtMEI.Text, LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');
            //连号检测
            if(chk_ConNo.Checked) and (edt_preIMEI.Text<>'') then
            begin
                iIMEI := strtoint64(Trim(edtMEI.Text));
                iPreIMEI:= strtoint64(Trim(edt_preIMEI.Text));
                if(iIMEI<> iPreIMEI+1) then
                begin
                   IMEIErrorPrompt('IMEI号未连续！');
                    //EdtMEI.Text := '';
                    //EdtMEI.SetFocus;
                    Exit;
                end;
            end;


            edt_preIMEI.Text := EdtMEI.Text;
            //判断IMEI是否在IMEI号段
            if ((Edt_IMEISTART.Text <> '') and (Edt_IMEIEND.Text <> '')) then
            begin
                istart := strtoint64(Trim(Edt_IMEISTART.Text));
                iend := strtoint64(Trim(Edt_IMEIEND.Text));
                iIMEI := strtoint64(LeftStr(Trim(EdtMEI.Text), 14));
                if iend <= istart then
                begin
                    IMEIErrorPrompt('此IMEI号段设置错误(起始大于结束)！');
                    //EdtMEI.Text := '';
                    //EdtMEI.SetFocus;
                    Exit;
                end;
                if ((iIMEI < istart) or (iIMEI > iend)) then
                begin
                    IMEIErrorPrompt('此IMEI不在设置号段内！');
                    //EdtMEI.Text := '';
                    //EdtMEI.SetFocus;
                    Exit;
                end;
            end
            else
            begin
                IMEIErrorPrompt('未设置IMEI号号段！');
                //EdtMEI.Text := '';
                //EdtMEI.SetFocus;
                Exit;
            end;

            if (ch_CheckInfo.Checked) then
            begin
                //判断机子IMEI绑定的基带ID是否唯一
                UniQuery_FindRidByImei.Close;
                UniQuery_FindRidByImei.ParamByName('IMEI').value := EdtMEI.Text;
                UniQuery_FindRidByImei.Open;
                if (UniQuery_FindRidByImei.RecordCount <> 1) then
                begin
                    IMEIErrorPrompt('此机子绑定RID异常,请联系管理员！');
                    //EdtMEI.Text := '';
                    //EdtMEI.SetFocus;
                    Exit;
                end;
            end;

            //判断此IMEI是否关联了数据
            case IMEIRel of
                //与SIM卡绑定
                1, 2, 3:
                    begin
                        UniQuery_DataRelativeSheetByImei.Close;
                        UniQuery_DataRelativeSheetByImei.ParamByName('IMEI').value := edtMEI.Text;
                        UniQuery_DataRelativeSheetByImei.Open;
                        if (UniQuery_DataRelativeSheetByImei.RecordCount >= 1) then
                        begin
                            IMEIErrorPrompt('此机子已与其它SIM卡绑定,请联系管理员！');
                            //EdtMEI.Text := '';
                            //EdtMEI.SetFocus;
                            Exit;
                        end;
                    end;

            end;
            case IMEIRel of
                2,4:
                    begin
                        UniQuery_DataRelative_ByIMEI.Close;
                        UniQuery_DataRelative_ByIMEI.ParamByName('IMEI').Value := EdtMEI.Text;
                        UniQuery_DataRelative_ByIMEI.Open;
                        iRecordCount := UniQuery_DataRelative_ByIMEI.RecordCount;
                        UniQuery_DataRelative_ByIMEI.Close;

                        if (iRecordCount) < 1 then
                        begin
                            IMEIErrorPrompt('此机子未与电池做绑定,请联系管理员！');
                            //EdtMEI.Text := '';
                            //EdtMEI.SetFocus;
                            Exit;
                        end;
                    end;
            end;
            case IMEIRel of
                3:
                    begin
                        UniQuery_DataRelative_VIP_ByIMEI.Close;
                        UniQuery_DataRelative_VIP_ByIMEI.ParamByName('IMEI').Value := EdtMEI.Text;
                        UniQuery_DataRelative_VIP_ByIMEI.Open;
                        iRecordCount := UniQuery_DataRelative_VIP_ByIMEI.RecordCount;
                        UniQuery_DataRelative_VIP_ByIMEI.Close;

                        if (iRecordCount) < 1 then
                        begin
                            IMEIErrorPrompt('此机子未与服务卡做绑定,请联系管理员！');
                            //EdtMEI.Text := '';
                            //EdtMEI.SetFocus;
                            Exit;
                        end;
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

            if (ch_CheckInfo.Checked) then
            begin
                //strSendText := 'Action=CheckTestPass#IMEI=' + edtMEI.Text + '#Tester=' + User.UserName + '#';
                //SendToServer(CommIndex, 'CheckTestPass', strSendText);
                with spCheckTestpass do
                begin
                    Close;
                    ParamByName('cIMEI').Value := EdtMEI.Text;
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
                        //SendNotifyMessage(Handle, WM_AllowPrint, 0, 0);
                        //RefreseDisplay();
                        AllowPrint();

                    end;
                end;
            end
            else
            begin
                AllowPrint();
            end;
        end
        else
        begin
            IMEIErrorPrompt('无效IMEI,可能为SIM号!');
            //EdtMEI.Text := '';
            //EdtMEI.SetFocus;
            Exit;
        end;
    end;
end;

procedure TfrmCartonBoxLlf.edt_SIMKeyPress(Sender: TObject; var Key: Char);
var
    iRecordCount: Integer;
    iSIM, istart, iend: Integer;
    imemoLines, lineLoop: Integer;
begin
    IMEIErrorPrompt('');
    //只可输入数字
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
            AppendTxt(DateTimeToStr(Now) + '-----------AddPrintNote:SIM=>' + edt_SIM.Text, LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');

            edt_preSim.Text := edt_SIM.Text;
            if ((Edt_SIMSTART.Text <> '') and (Edt_SIMEND.Text <> '')) then
            begin
                //判断SIM卡是否在范围内
                istart := strtoint64(Trim(Edt_SIMSTART.Text));
                iend := strtoint64(Trim(Edt_SIMEND.Text));
                iSIM := strtoint64(Trim(edt_SIM.Text));
                if iend <= istart then
                begin
                    IMEIErrorPrompt('此SIM号段设置错误(起始大于结束)！');
                    edt_SIM.Text := '';
                    edt_SIM.SetFocus;
                    Exit;
                end;
                if ((iSIM < istart) or (iSIM > iend)) then
                begin
                    IMEIErrorPrompt('此SIM号不在设置号段内！');
                    edt_SIM.Text := '';
                    edt_SIM.SetFocus;
                    Exit;
                end;
            end
            else
            begin
                IMEIErrorPrompt('未设置SIM号号段！');
                edt_SIM.Text := '';
                edt_SIM.SetFocus;
                Exit;
            end;

            //判断SIM码是否重复
            imemoLines := mmoMEI.Lines.Count;
            if imemoLines + 1 > iPrintCount then
            begin
                ShowMessage('打印数据不能超过' + inttostr(iPrintCount) + '条,若继续扫描请先打印当前数据');
                Exit;
            end;
            if imemoLines <> 0 then
            begin
                for lineLoop := 0 to imemoLines - 1 do
                begin
                    if edt_SIM.Text = StrUtils.RightStr(mmoMEI.Lines[lineLoop], 13) then
                    begin
                        IMEIErrorPrompt('SIM号数据重复');
                        edt_SIM.Text := '';
                        edt_SIM.SetFocus;
                        Exit;
                    end
                    else IMEIErrorPrompt('');
                end;
            end;

            //判断SIM卡号是否存在，SIM是否与其他IMEI绑定
            UniQuery_SIM.Close;
            UniQuery_SIM.ParamByName('SIMNo').Value := edt_SIM.Text;
            //UniQuery_SIM.ParamByName('IMEI').Value := edt_SIM.Text;
            UniQuery_SIM.Open;
            iRecordCount := UniQuery_SIM.RecordCount;

            //判断SIM卡号是否存在
            if ((iRecordCount <= 0)) then
            begin
                IMEIErrorPrompt('SIM卡号不存在!');
                edt_SIM.Text := '';
                edt_SIM.SetFocus;
                Exit;
            end;
            //SIM是否与其他IMEI绑定
            if (edt_SIM.Text <> UniQuery_SIM.FieldByName('IMEI1').AsString) then
            begin
                IMEIErrorPrompt('SIM已经与其他IMEI绑定!');
                edt_SIM.Text := '';
                edt_SIM.SetFocus;
                Exit;
            end;

            EdtMEI.Text := '';
            EdtMEI.SetFocus;
        end
        else
        begin
            IMEIErrorPrompt('SIM号长度不正确！!');
            edt_SIM.Text := '';
            edt_SIM.SetFocus;
            Exit;
        end;
    end;
end;

end.


