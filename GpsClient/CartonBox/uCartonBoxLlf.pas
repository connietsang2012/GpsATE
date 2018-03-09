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
    IMEIRel: Integer; //IMEI�󶨹�ϵ
    StrList_IMEISIM: TStringList; //ɨ�������б�
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
    strFile, strver: string; //��ӡ��ģ���ļ�,��־�ļ�
    i, iRecordCount: Integer; //ѭ������,���ݼ�¼����
    strSQL, strRid: string; //SQL���,���ӻ���ID
    iIMEI, istart, iend: Integer; //�ж�IMEI�Ƿ��ڷ�Χ��
begin
    if (mmoMEI.Lines.Count = 0) then
    begin
        ShowMessage('��ǰ����Ϊ��,���ܽ��д�ӡ');
        Exit;
    end;
    if (trim(EdtVersion.Text) = '') then
    begin
        ShowMessage('�汾��Ϣ����Ϊ��');
        Exit;
    end;
    strBar := '';
    strver := '';
    if (PrintType = '����') then
    begin
        strFile := ExtractFilePath(ParamStr(0)) + 'CartonBox\llf\Cn' + IntToStr(mmoMEI.Lines.Count) + '.btw';
    end
    else
    begin
        strFile := ExtractFilePath(ParamStr(0)) + 'CartonBox\llf\Eng' + IntToStr(mmoMEI.Lines.Count) + '.btw';
    end;
    AppendTxt(strFile, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\log.txt');
    with btappAutoPrint.Formats.Open(strFile, True, '') do //�򿪱�ǩ�ļ�
    begin
        //��ֽ���⸳ֵ
        SetNamedSubStringValue('BoxNum', trim(EdtBoxNum.Text) + trim(EdtBoxNum1.Text));
        SetNamedSubStringValue('ZhiDan', trim(Edtzhidan.Text));
        SetNamedSubStringValue('MachineType', trim(EdtSoftModel.Text));
        SetNamedSubStringValue('ProductColor', trim(EdtColor.Text));
        SetNamedSubStringValue('ProductDate', trim(EdtDate.Text));
        SetNamedSubStringValue('ProductCount', trim(EdtQty.Text));
        SetNamedSubStringValue('ProductWeight', (EdtWeight.Text));
        SetNamedSubStringValue('ProductNum', trim(EdtProNo.Text));
        SetNamedSubStringValue('Remark', trim(edt_Remark1.Text));
        if (PrintType = '����') then
        begin
            strver := SysUtils.Format('���:%s%s' + #13#10 + '�Ƶ�:%s' + #13#10 + '����:%s' + #13#10 + '��ɫ:%s' + #13#10 + '����:%s' + #13#10 + '����:%s' + #13#10 + 'ë��:%s' + #13#10 + '��Ʒ����:%s' + #13#10 + '%s' + #13#10 + '',
                [EdtBoxNum.Text, EdtBoxNum1.Text, Edtzhidan.Text, edtsoftmodel.Text, EdtColor.Text, EdtDate.Text, EdtQty.Text, EdtWeight.Text, EdtProNo.Text, edt_Remark1.text]);
        end
        else
        begin
            strver := SysUtils.Format('BOX NO:%s%s' + #13#10 + 'P.O.:%s' + #13#10 + 'Model:%s' + #13#10 + 'Color:%s' + #13#10 + 'Date:%s' + #13#10 + 'QTY:%s' + #13#10 + 'G.W:%s' + #13#10 + 'Product Code:%s' + #13#10 + '%s' + #13#10 + '',
                [EdtBoxNum.Text, EdtBoxNum1.Text, Edtzhidan.Text, edtsoftmodel.Text, EdtColor.Text, EdtDate.Text, EdtQty.Text, EdtWeight.Text, EdtProNo.Text, edt_Remark1.text]);
        end;
        AppendTxt(strver, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
        //IMEI��ֵ
        for i := 0 to (mmoMEI.Lines.Count - 1) do
        begin
            //����Ҫ��ӡ������ StrList_IMEISIM[0]=>IMEI      StrList_IMEISIM[1]=>SIM
            StrList_IMEISIM.Delimiter := ',';
            StrList_IMEISIM.DelimitedText := StrList.Strings[i];

            //�ж�IMEI���Ƿ��ڷ�Χ��
            if ((Edt_IMEISTART.Text <> '') and (Edt_IMEIEND.Text <> '')) then
            begin
                istart := strtoint64(Trim(Edt_IMEISTART.Text));
                iend := strtoint64(Trim(Edt_IMEIEND.Text));
                iIMEI := strtoint64(LeftStr(StrList_IMEISIM[0], 14));
                if iend <= istart then
                begin
                    IMEIErrorPrompt('��IMEI�Ŷ����ô���(��ʼ���ڽ���)��');
                    Exit;
                end;
                if ((iIMEI < istart) or (iIMEI > iend)) then
                begin
                    IMEIErrorPrompt('��IMEI�������úŶ��ڣ�');
                    Exit;
                end;
            end
            else
            begin
                IMEIErrorPrompt('IMEI�Ŷ�δ���ã�');
                Exit;
            end;

            if (ch_CheckInfo.Checked) then
            begin
                //IMEI�жϻ���ID�Ƿ�����
                UniQuery_FindRidByImei.Close;
                UniQuery_FindRidByImei.ParamByName('IMEI').value := StrList_IMEISIM[0];
                UniQuery_FindRidByImei.Open;
                //�õ�����ID
                strRid := '';
                if (UniQuery_FindRidByImei.RecordCount <> 1) then
                begin
                    IMEIErrorPrompt('�˻����쳣,����ϵ����Ա��');
                    Exit;
                end
                else
                begin
                    UniQuery_FindRidByImei.First;
                    strRid := UniQuery_FindRidByImei.FieldByName('Rid').AsString;
                    AppendTxt(StrList.Strings[i] + ',' + strRid, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');

                end;
            end;

            //ÿ��������IMEI
            strver := strver + StrList_IMEISIM[0] + '' + #13#10 + '';
            strBar := 'IMEI' + IntToStr(i);
            SetNamedSubStringValue(strBar, StrList_IMEISIM[0]); //����ֵ
            AppendTxt(DateTimeToStr(Now) + '-----------' + StrList_IMEISIM[0], LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');

            case IMEIRel of
                1, 2, 3:
                    begin
                        //����DataRelativeSheet��
                        qry_UpdateDataRel.Close;
                        qry_UpdateDataRel.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        qry_UpdateDataRel.ParamByName('SIMNo').Value := StrList_IMEISIM[1];
                        qry_UpdateDataRel.Execute;

                        //�鿴DataRelativeSheet���Ƿ����
                        UniQuery_DataRelativeSheetByImeiSIM.Close;
                        UniQuery_DataRelativeSheetByImeiSIM.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        UniQuery_DataRelativeSheetByImeiSIM.ParamByName('SIMNO').Value := StrList_IMEISIM[1];
                        UniQuery_DataRelativeSheetByImeiSIM.Open;
                        iRecordCount := UniQuery_DataRelativeSheetByImeiSIM.RecordCount;
                        UniQuery_DataRelativeSheetByImeiSIM.Close;
                        if (iRecordCount < 1) then
                        begin
                            IMEIErrorPrompt('IMEI��SIM��ʧ��,����ϵ����Ա!');
                            Exit;
                        end
                    end;
                4:
                    begin
                        qry_InsertDataRel_BAT.Close;
                        qry_InsertDataRel_BAT.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        //qry_InsertDataRel_BAT.ParamByName('SIMNo').Value := StrList_IMEISIM[1];
                        qry_InsertDataRel_BAT.Execute;

                        //�鿴DataRelativeSheet���Ƿ����
                        UniQuery_DataRelativeSheetByImei.Close;
                        UniQuery_DataRelativeSheetByImei.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        //UniQuery_DataRelativeSheetByImeiSIM.ParamByName('SIMNO').Value := nil;
                        UniQuery_DataRelativeSheetByImei.Open;
                        iRecordCount := UniQuery_DataRelativeSheetByImei.RecordCount;
                        UniQuery_DataRelativeSheetByImei.Close;
                        if (iRecordCount < 1) then
                        begin
                            IMEIErrorPrompt('BAT��ʧ��,����ϵ����Ա!');
                            Exit;
                        end
                    end;
            end;

            //����Gps_CartonBoxTwenty_Result��
            UniQuery_IMEI.Close;
            UniQuery_IMEI.Sql.Clear;
            strSQL := 'Insert into Gps_CartonBoxTwenty_Result(BoxNo,IMEI,ZhiDan,SoftModel,Version,ProductCode,Color,Qty,Weight,Date,TACInfo,CompanyName,TesterId,Remark2,Remark1) values('''
                + EdtBoxNum.Text + EdtBoxNum1.Text + ''',''' + StrList_IMEISIM[0] + ''',''' + Edtzhidan.Text
                + ''',''' + edtsoftmodel.Text + ''',''' + edtVersion.Text + ''',''' + EdtProNo.Text + ''','''
                + EdtColor.Text + ''',''' + EdtQty.Text + ''',''' + EdtWeight.Text + ''',''' + EdtDate.Text + ''','''
                + EdtTac.Text + ''',''' + EdtCpName.Text + ''',''' + User.UserName + ''',''' + strRid + ''',''' + edt_remark1.Text + ''')';
            UniQuery_IMEI.SQL.Text := strSQL;
            UniQuery_IMEI.Execute;

            //�鿴Gps_CartonBoxTwenty_Result�Ƿ����
            UniQuery_IMEI_20.Close;
            UniQuery_IMEI_20.ParamByName('IMEI').Value := StrList_IMEISIM[0];
            UniQuery_IMEI_20.Open;
            iRecordCount := UniQuery_IMEI_20.RecordCount;
            UniQuery_IMEI_20.Close;
            if (iRecordCount) < 1 then
            begin
                MessageBox(0, PCHAR('��ǰIMEI���¿�ͨ���Խ��ʧ��,����ϵ����Ա!'), '��������,���ݸ���ʧ��', mb_OK);
                Exit;
            end;

        end;
        SetNamedSubStringValue('QRCode', strver); //����ֵ
        //�������
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

        //�������
        UniQuery_UpdateBoxNo.Close;
        UniQuery_UpdateBoxNo.ParamByName('BoxNo2').AsString := EdtBoxNum1.Text;
        UniQuery_UpdateBoxNo.ParamByName('ZhiDan').AsString := cbManuOrder.Text;
        UniQuery_UpdateBoxNo.Execute;

        //��ӡ��ֽ
        //if chkAuto.Checked then
        //begin
        try
            PrintOut(False, False);
            Close(btDoNotSaveChanges); //�رղ�����
        except
            Close(btDoNotSaveChanges); //�رղ�����
        end;
        {end
        else
        begin
            try
                PrintOut(False, true); //��ӡ
                Close(btDoNotSaveChanges); //�رղ�����
            except
                Close(btDoNotSaveChanges); //�رղ�����
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
    strFile, strver: string; //��ӡ��ģ���ļ�,��־�ļ�
    i, iRecordCount: Integer; //ѭ������,���ݼ�¼����
    strSQL, strRid: string; //SQL���,���ӻ���ID
    iIMEI, istart, iend: Integer; //�ж�IMEI�Ƿ��ڷ�Χ��
begin
    if (mmoMEI.Lines.Count = 0) then
    begin
        ShowMessage('��ǰ����Ϊ��,���ܽ��д�ӡ');
        Exit;
    end;
    if (trim(EdtVersion.Text) = '') then
    begin
        ShowMessage('�汾��Ϣ����Ϊ��');
        Exit;
    end;

    strBar := '';
    strver := '';
    if (PrintType = '����') then
    begin
        strFile := ExtractFilePath(ParamStr(0)) + 'CartonBox\llf\Cn20.btw';
    end
    else
    begin
        strFile := ExtractFilePath(ParamStr(0)) + 'CartonBox\llf\Eng20.btw';
    end;
    AppendTxt(strFile, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\log.txt');
    //first box
    with btappAutoPrint.Formats.Open(strFile, True, '') do //�򿪱�ǩ�ļ�
    begin
        //��ֽ���⸳ֵ
        SetNamedSubStringValue('BoxNum', trim(EdtBoxNum.Text) + trim(EdtBoxNum1.Text));
        SetNamedSubStringValue('ZhiDan', trim(Edtzhidan.Text));
        SetNamedSubStringValue('MachineType', trim(EdtSoftModel.Text));
        SetNamedSubStringValue('ProductColor', trim(EdtColor.Text));
        SetNamedSubStringValue('ProductDate', trim(EdtDate.Text));
        SetNamedSubStringValue('ProductCount', trim(EdtQty.Text));
        SetNamedSubStringValue('ProductWeight', (EdtWeight.Text));
        SetNamedSubStringValue('ProductNum', trim(EdtProNo.Text));
        SetNamedSubStringValue('Remark', trim(edt_Remark1.Text));
        if (PrintType = '����') then
        begin
            strver := SysUtils.Format('���:%s%s' + #13#10 + '�Ƶ�:%s' + #13#10 + '����:%s' + #13#10 + '��ɫ:%s' + #13#10 + '����:%s' + #13#10 + '����:%s' + #13#10 + 'ë��:%s' + #13#10 + '��Ʒ����:%s' + #13#10 + '%s' + #13#10 + '',
                [EdtBoxNum.Text, EdtBoxNum1.Text, Edtzhidan.Text, edtsoftmodel.Text, EdtColor.Text, EdtDate.Text, EdtQty.Text, EdtWeight.Text, EdtProNo.Text, edt_Remark1.text]);
        end
        else
        begin
            strver := SysUtils.Format('BOX NO:%s%s' + #13#10 + 'P.O.:%s' + #13#10 + 'Model:%s' + #13#10 + 'Color:%s' + #13#10 + 'Date:%s' + #13#10 + 'QTY:%s' + #13#10 + 'G.W:%s' + #13#10 + 'Product Code:%s' + #13#10 + '%s' + #13#10 + '',
                [EdtBoxNum.Text, EdtBoxNum1.Text, Edtzhidan.Text, edtsoftmodel.Text, EdtColor.Text, EdtDate.Text, EdtQty.Text, EdtWeight.Text, EdtProNo.Text, edt_Remark1.text]);
        end;
        AppendTxt(strver, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
        //IMEI��ֵ
        for i := 0 to 19 do
        begin
            //����Ҫ��ӡ������ StrList_IMEISIM[0]=>IMEI      StrList_IMEISIM[1]=>SIM
            StrList_IMEISIM.Delimiter := ',';
            StrList_IMEISIM.DelimitedText := StrList.Strings[i];

            //�ж�IMEI���Ƿ��ڷ�Χ��
            if ((Edt_IMEISTART.Text <> '') and (Edt_IMEIEND.Text <> '')) then
            begin
                istart := strtoint64(Trim(Edt_IMEISTART.Text));
                iend := strtoint64(Trim(Edt_IMEIEND.Text));
                iIMEI := strtoint64(LeftStr(StrList_IMEISIM[0], 14));
                if iend <= istart then
                begin
                    IMEIErrorPrompt('��IMEI�Ŷ����ô���(��ʼ���ڽ���)��');
                    Exit;
                end;
                if ((iIMEI < istart) or (iIMEI > iend)) then
                begin
                    IMEIErrorPrompt('��IMEI�������úŶ��ڣ�');
                    Exit;
                end;
            end
            else
            begin
                IMEIErrorPrompt('IMEI�Ŷ�δ���ã�');
                Exit;
            end;

            if (ch_CheckInfo.Checked) then
            begin
                //IMEI�жϻ���ID�Ƿ�����
                UniQuery_FindRidByImei.Close;
                UniQuery_FindRidByImei.ParamByName('IMEI').value := StrList_IMEISIM[0];
                UniQuery_FindRidByImei.Open;
                //�õ�����ID
                strRid := '';
                if (UniQuery_FindRidByImei.RecordCount <> 1) then
                begin
                    IMEIErrorPrompt('�˻����쳣,����ϵ����Ա��');
                    Exit;
                end
                else
                begin
                    UniQuery_FindRidByImei.First;
                    strRid := UniQuery_FindRidByImei.FieldByName('Rid').AsString;
                    AppendTxt(StrList.Strings[i] + ',' + strRid, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');

                end;
            end;

            //ÿ��������IMEI
            strver := strver + StrList_IMEISIM[0] + '' + #13#10 + '';
            strBar := 'IMEI' + IntToStr(i);
            SetNamedSubStringValue(strBar, StrList_IMEISIM[0]); //����ֵ
            AppendTxt(DateTimeToStr(Now) + '-----------' + StrList_IMEISIM[0], LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');

            case IMEIRel of
                1, 2, 3:
                    begin
                        //����DataRelativeSheet��
                        qry_UpdateDataRel.Close;
                        qry_UpdateDataRel.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        qry_UpdateDataRel.ParamByName('SIMNo').Value := StrList_IMEISIM[1];
                        qry_UpdateDataRel.Execute;

                        //�鿴DataRelativeSheet���Ƿ����
                        UniQuery_DataRelativeSheetByImeiSIM.Close;
                        UniQuery_DataRelativeSheetByImeiSIM.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        UniQuery_DataRelativeSheetByImeiSIM.ParamByName('SIMNO').Value := StrList_IMEISIM[1];
                        UniQuery_DataRelativeSheetByImeiSIM.Open;
                        iRecordCount := UniQuery_DataRelativeSheetByImeiSIM.RecordCount;
                        UniQuery_DataRelativeSheetByImeiSIM.Close;
                        if (iRecordCount < 1) then
                        begin
                            IMEIErrorPrompt('IMEI��SIM��ʧ��,����ϵ����Ա!');
                            Exit;
                        end
                    end;
            end;

            //����Gps_CartonBoxTwenty_Result��
            UniQuery_IMEI.Close;
            UniQuery_IMEI.Sql.Clear;
            strSQL := 'Insert into Gps_CartonBoxTwenty_Result(BoxNo,IMEI,ZhiDan,SoftModel,Version,ProductCode,Color,Qty,Weight,Date,TACInfo,CompanyName,TesterId,Remark2,Remark1) values('''
                + EdtBoxNum.Text + EdtBoxNum1.Text + ''',''' + StrList_IMEISIM[0] + ''',''' + Edtzhidan.Text
                + ''',''' + edtsoftmodel.Text + ''',''' + edtVersion.Text + ''',''' + EdtProNo.Text + ''','''
                + EdtColor.Text + ''',''' + EdtQty.Text + ''',''' + EdtWeight.Text + ''',''' + EdtDate.Text + ''','''
                + EdtTac.Text + ''',''' + EdtCpName.Text + ''',''' + User.UserName + ''',''' + strRid + ''',''' + edt_remark1.Text + ''')';
            UniQuery_IMEI.SQL.Text := strSQL;
            UniQuery_IMEI.Execute;

            //�鿴Gps_CartonBoxTwenty_Result�Ƿ����
            UniQuery_IMEI_20.Close;
            UniQuery_IMEI_20.ParamByName('IMEI').Value := StrList_IMEISIM[0];
            UniQuery_IMEI_20.Open;
            iRecordCount := UniQuery_IMEI_20.RecordCount;
            UniQuery_IMEI_20.Close;
            if (iRecordCount) < 1 then
            begin
                MessageBox(0, PCHAR('��ǰIMEI���¿�ͨ���Խ��ʧ��,����ϵ����Ա!'), '��������,���ݸ���ʧ��', mb_OK);
                Exit;
            end;

        end;
        SetNamedSubStringValue('QRCode', strver); //����ֵ
        try
            PrintOut(False, False);
            Close(btDoNotSaveChanges); //�رղ�����
        except
            Close(btDoNotSaveChanges); //�رղ�����
        end;

        AppendTxt('', LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
        AppendTxt('', LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
    end;
    //second box
    with btappAutoPrint.Formats.Open(strFile, True, '') do //�򿪱�ǩ�ļ�
    begin
        //��ֽ���⸳ֵ
        SetNamedSubStringValue('BoxNum', trim(EdtBoxNum.Text) + trim(EdtBoxNum1.Text));
        SetNamedSubStringValue('ZhiDan', trim(Edtzhidan.Text));
        SetNamedSubStringValue('MachineType', trim(EdtSoftModel.Text));
        SetNamedSubStringValue('ProductColor', trim(EdtColor.Text));
        SetNamedSubStringValue('ProductDate', trim(EdtDate.Text));
        SetNamedSubStringValue('ProductCount', trim(EdtQty.Text));
        SetNamedSubStringValue('ProductWeight', (EdtWeight.Text));
        SetNamedSubStringValue('ProductNum', trim(EdtProNo.Text));
        SetNamedSubStringValue('Remark', trim(edt_Remark1.Text));
        if (PrintType = '����') then
        begin
            strver := SysUtils.Format('���:%s%s' + #13#10 + '�Ƶ�:%s' + #13#10 + '����:%s' + #13#10 + '��ɫ:%s' + #13#10 + '����:%s' + #13#10 + '����:%s' + #13#10 + 'ë��:%s' + #13#10 + '��Ʒ����:%s' + #13#10 + '%s' + #13#10 + '',
                [EdtBoxNum.Text, EdtBoxNum1.Text, Edtzhidan.Text, edtsoftmodel.Text, EdtColor.Text, EdtDate.Text, EdtQty.Text, EdtWeight.Text, EdtProNo.Text, edt_Remark1.text]);
        end
        else
        begin
            strver := SysUtils.Format('BOX NO:%s%s' + #13#10 + 'P.O.:%s' + #13#10 + 'Model:%s' + #13#10 + 'Color:%s' + #13#10 + 'Date:%s' + #13#10 + 'QTY:%s' + #13#10 + 'G.W:%s' + #13#10 + 'Product Code:%s' + #13#10 + '%s' + #13#10 + '',
                [EdtBoxNum.Text, EdtBoxNum1.Text, Edtzhidan.Text, edtsoftmodel.Text, EdtColor.Text, EdtDate.Text, EdtQty.Text, EdtWeight.Text, EdtProNo.Text, edt_Remark1.text]);
        end;
        AppendTxt(strver, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');
        //IMEI��ֵ
        for i := 20 to (mmoMEI.Lines.Count - 1) do
        begin
            //����Ҫ��ӡ������ StrList_IMEISIM[0]=>IMEI      StrList_IMEISIM[1]=>SIM
            StrList_IMEISIM.Delimiter := ',';
            StrList_IMEISIM.DelimitedText := StrList.Strings[i];

            //�ж�IMEI���Ƿ��ڷ�Χ��
            if ((Edt_IMEISTART.Text <> '') and (Edt_IMEIEND.Text <> '')) then
            begin
                istart := strtoint64(Trim(Edt_IMEISTART.Text));
                iend := strtoint64(Trim(Edt_IMEIEND.Text));
                iIMEI := strtoint64(LeftStr(StrList_IMEISIM[0], 14));
                if iend <= istart then
                begin
                    IMEIErrorPrompt('��IMEI�Ŷ����ô���(��ʼ���ڽ���)��');
                    Exit;
                end;
                if ((iIMEI < istart) or (iIMEI > iend)) then
                begin
                    IMEIErrorPrompt('��IMEI�������úŶ��ڣ�');
                    Exit;
                end;
            end
            else
            begin
                IMEIErrorPrompt('IMEI�Ŷ�δ���ã�');
                Exit;
            end;

            if (ch_CheckInfo.Checked) then
            begin
                //IMEI�жϻ���ID�Ƿ�����
                UniQuery_FindRidByImei.Close;
                UniQuery_FindRidByImei.ParamByName('IMEI').value := StrList_IMEISIM[0];
                UniQuery_FindRidByImei.Open;
                //�õ�����ID
                strRid := '';
                if (UniQuery_FindRidByImei.RecordCount <> 1) then
                begin
                    IMEIErrorPrompt('�˻����쳣,����ϵ����Ա��');
                    Exit;
                end
                else
                begin
                    UniQuery_FindRidByImei.First;
                    strRid := UniQuery_FindRidByImei.FieldByName('Rid').AsString;
                    AppendTxt(StrList.Strings[i mod 20] + ',' + strRid, LowerDir(ExtractFilePath(ParamStr(0))) + 'PrintLog\dblog.txt');

                end;
            end;

            //ÿ��������IMEI
            strver := strver + StrList_IMEISIM[0] + '' + #13#10 + '';
            strBar := 'IMEI' + IntToStr(i mod 20);
            SetNamedSubStringValue(strBar, StrList_IMEISIM[0]); //����ֵ
            AppendTxt(DateTimeToStr(Now) + '-----------' + StrList_IMEISIM[0], LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');

            case IMEIRel of
                1, 2, 3:
                    begin
                        //����DataRelativeSheet��
                        qry_UpdateDataRel.Close;
                        qry_UpdateDataRel.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        qry_UpdateDataRel.ParamByName('SIMNo').Value := StrList_IMEISIM[1];
                        qry_UpdateDataRel.Execute;

                        //�鿴DataRelativeSheet���Ƿ����
                        UniQuery_DataRelativeSheetByImeiSIM.Close;
                        UniQuery_DataRelativeSheetByImeiSIM.ParamByName('IMEI').Value := StrList_IMEISIM[0];
                        UniQuery_DataRelativeSheetByImeiSIM.ParamByName('SIMNO').Value := StrList_IMEISIM[1];
                        UniQuery_DataRelativeSheetByImeiSIM.Open;
                        iRecordCount := UniQuery_DataRelativeSheetByImeiSIM.RecordCount;
                        UniQuery_DataRelativeSheetByImeiSIM.Close;
                        if (iRecordCount < 1) then
                        begin
                            IMEIErrorPrompt('IMEI��SIM��ʧ��,����ϵ����Ա!');
                            Exit;
                        end
                    end;
            end;

            //����Gps_CartonBoxTwenty_Result��
            UniQuery_IMEI.Close;
            UniQuery_IMEI.Sql.Clear;
            strSQL := 'Insert into Gps_CartonBoxTwenty_Result(BoxNo,IMEI,ZhiDan,SoftModel,Version,ProductCode,Color,Qty,Weight,Date,TACInfo,CompanyName,TesterId,Remark2,Remark1) values('''
                + EdtBoxNum.Text + EdtBoxNum1.Text + ''',''' + StrList_IMEISIM[0] + ''',''' + Edtzhidan.Text
                + ''',''' + edtsoftmodel.Text + ''',''' + edtVersion.Text + ''',''' + EdtProNo.Text + ''','''
                + EdtColor.Text + ''',''' + EdtQty.Text + ''',''' + EdtWeight.Text + ''',''' + EdtDate.Text + ''','''
                + EdtTac.Text + ''',''' + EdtCpName.Text + ''',''' + User.UserName + ''',''' + strRid + ''',''' + edt_remark1.Text + ''')';
            UniQuery_IMEI.SQL.Text := strSQL;
            UniQuery_IMEI.Execute;

            //�鿴Gps_CartonBoxTwenty_Result�Ƿ����
            UniQuery_IMEI_20.Close;
            UniQuery_IMEI_20.ParamByName('IMEI').Value := StrList_IMEISIM[0];
            UniQuery_IMEI_20.Open;
            iRecordCount := UniQuery_IMEI_20.RecordCount;
            UniQuery_IMEI_20.Close;
            if (iRecordCount) < 1 then
            begin
                MessageBox(0, PCHAR('��ǰIMEI���¿�ͨ���Խ��ʧ��,����ϵ����Ա!'), '��������,���ݸ���ʧ��', mb_OK);
                Exit;
            end;

        end;
        SetNamedSubStringValue('QRCode', strver); //����ֵ
        //�������
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

        //�������
        UniQuery_UpdateBoxNo.Close;
        UniQuery_UpdateBoxNo.ParamByName('BoxNo2').AsString := EdtBoxNum1.Text;
        UniQuery_UpdateBoxNo.ParamByName('ZhiDan').AsString := cbManuOrder.Text;
        UniQuery_UpdateBoxNo.Execute;

        //��ӡ��ֽ
        //if chkAuto.Checked then
        //begin
        try
            PrintOut(False, False);
            Close(btDoNotSaveChanges); //�رղ�����
        except
            Close(btDoNotSaveChanges); //�رղ�����
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
    imemoLines, lineLoop: Integer; //���������,������ѭ����
    iRecordCount: Integer;
begin

    if (edtMEI.Text = '') then Exit;
    imemoLines := mmoMEI.Lines.Count;
    if imemoLines + 1 > iPrintCount then
    begin
        ShowMessage('��ӡ���ݲ��ܳ���' + inttostr(iPrintCount) + '��,������ɨ�����ȴ�ӡ��ǰ����');
        Exit;
    end;
    //�ж������Ƿ��ظ�
    if imemoLines <> 0 then
    begin
        for lineLoop := 0 to imemoLines - 1 do
        begin
            if edtMEI.Text = StrUtils.LeftStr(mmoMEI.Lines[lineLoop], 15) then
            begin
                IMEIErrorPrompt('IMEI�����ظ�');
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
            MessageBox(0, PCHAR('��ǰIMEI�����' + UniQuery_IMEI_20.FieldByName('BoxNo').AsString + '���Ѿ�ɨ��������ظ�ɨ��'), '��������,�����ظ�', mb_OK);
            Exit;
        end;
    end;

    case IMEIRel of
        //�ް�
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
        //��SIM����
        1, 2, 3:
            begin
                if (edt_SIM.Text = '') then Exit;
                imemoLines := mmoMEI.Lines.Count;
                //�ж������Ƿ��ظ�
                if imemoLines <> 0 then
                begin
                    for lineLoop := 0 to imemoLines - 1 do
                    begin
                        if edt_SIM.Text = StrUtils.RightStr(mmoMEI.Lines[lineLoop], 13) then
                        begin
                            IMEIErrorPrompt('SIM�����ظ�');
                            Exit;
                        end
                        else IMEIErrorPrompt('');
                    end;
                end;
                IMEIErrorPrompt('');

                //�鿴IMEI�Ƿ��ӡ��
                UniQuery_DataRelativeSheetBySIM.Close;
                UniQuery_DataRelativeSheetBySIM.ParamByName('SIMNO').Value := Edt_SIM.Text;
                UniQuery_DataRelativeSheetBySIM.Open;
                iRecordCount := UniQuery_DataRelativeSheetBySIM.RecordCount;
                UniQuery_DataRelativeSheetBySIM.Close;
                if (iRecordCount <= 0) then
                begin
                    MessageBox(0, PCHAR('��ǰSIM�Ѱ�!'), '��������,�����ظ�', mb_OK);
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
    //�Զ���ӡ
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
    {WriteIni('llf', 'Version', trim(EdtVersion.Text)); //����
    WriteIni('llf', 'Color', trim(EdtColor.Text)); //��ɫ
    WriteIni('llf', 'BoxNum', trim(EdtBoxNum.Text)); //���
    WriteIni('llf', 'BoxNum1', trim(EdtBoxNum1.Text)); //��ŷ�֧
    WriteIni('llf', 'Weight', (EdtWeight.Text)); //����
    WriteIni('llf', 'ZhiDan', trim(Edtzhidan.Text)); //�Ƶ�
    WriteIni('llf', 'Date', trim(EdtDate.Text)); //����
    WriteIni('llf', 'ProNo', trim(EdtProNo.Text)); //��Ʒ��
    WriteIni('llf', 'Model', trim(EdtSoftModel.Text)); //�汾��
    WriteIni('llf', 'Tac', trim(EdtTac.Text)); //Tac��Ϣ
    WriteIni('llf', 'Qty', trim(EdtQty.Text)); //����
    WriteIni('llf', 'CpName', trim(EdtCpName.Text)); //��˾����
    WriteIni('llf', 'Remark1', trim(edt_Remark1.Text)); //��עһ}

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
        MessageBox(0, '�����δ��ӡ��!', '��������', mb_OK);
        Exit;
    end;

    strBar := '';
    strver := '';
    if (PrintType = '����') then
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
        with btappAutoPrint.Formats.Open(strFile, True, '') do //�򿪱�ǩ�ļ�
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

            if (PrintType = '����') then
            begin
                strver := SysUtils.Format('���:%s' + #13#10 + '�Ƶ�:%s' + #13#10 + '����:%s' + #13#10 + '��ɫ:%s' + #13#10 + '����:%s' + #13#10 + '����:%s' + #13#10 + 'ë��:%s' + #13#10 + '��Ʒ����:%s' + #13#10 + '%s' + #13#10 + '',
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
                SetNamedSubStringValue(strBar, UniQuery_RePrint.FieldByName('IMEI').AsString); //����ֵ
                AppendTxt(DateTimeToStr(Now) + '-----------' + UniQuery_RePrint.FieldByName('IMEI').AsString, LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');

                rowCount := rowCount + 1;
                UniQuery_RePrint.Next;

            end;
            SetNamedSubStringValue('QRCode', strver); //����ֵ
            try
                PrintOut(False, False);
                Close(btDoNotSaveChanges); //�رղ�����
                StrList.Clear;
                SNList.Clear;
                VersionList.Clear;
                mmoMEI.Clear;
            except
                Close(btDoNotSaveChanges); //�رղ�����
            end;
        end;
        //second box
        with btappAutoPrint.Formats.Open(strFile, True, '') do //�򿪱�ǩ�ļ�
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

            if (PrintType = '����') then
            begin
                strver := SysUtils.Format('���:%s' + #13#10 + '�Ƶ�:%s' + #13#10 + '����:%s' + #13#10 + '��ɫ:%s' + #13#10 + '����:%s' + #13#10 + '����:%s' + #13#10 + 'ë��:%s' + #13#10 + '��Ʒ����:%s' + #13#10 + '%s' + #13#10 + '',
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
                SetNamedSubStringValue(strBar, UniQuery_RePrint.FieldByName('IMEI').AsString); //����ֵ
                AppendTxt(DateTimeToStr(Now) + '-----------' + UniQuery_RePrint.FieldByName('IMEI').AsString, LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');

                rowCount := rowCount + 1;
                UniQuery_RePrint.Next;

            end;
            SetNamedSubStringValue('QRCode', strver); //����ֵ
            try
                PrintOut(False, False);
                Close(btDoNotSaveChanges); //�رղ�����
                StrList.Clear;
                SNList.Clear;
                VersionList.Clear;
                mmoMEI.Clear;
            except
                Close(btDoNotSaveChanges); //�رղ�����
            end;
        end;
    end
    else
    begin
        with btappAutoPrint.Formats.Open(strFile, True, '') do //�򿪱�ǩ�ļ�
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

            if (PrintType = '����') then
            begin
                strver := SysUtils.Format('���:%s' + #13#10 + '�Ƶ�:%s' + #13#10 + '����:%s' + #13#10 + '��ɫ:%s' + #13#10 + '����:%s' + #13#10 + '����:%s' + #13#10 + 'ë��:%s' + #13#10 + '��Ʒ����:%s' + #13#10 + '%s' + #13#10 + '',
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
                SetNamedSubStringValue(strBar, UniQuery_RePrint.FieldByName('IMEI').AsString); //����ֵ
                AppendTxt(DateTimeToStr(Now) + '-----------' + UniQuery_RePrint.FieldByName('IMEI').AsString, LowerDir(ExtractFilePath(ParamStr(0))) + '\PrintLog\log.txt');

                rowCount := rowCount + 1;
                UniQuery_RePrint.Next;

            end;
            SetNamedSubStringValue('QRCode', strver); //����ֵ
            try
                PrintOut(False, False);
                Close(btDoNotSaveChanges); //�رղ�����
                StrList.Clear;
                SNList.Clear;
                VersionList.Clear;
                mmoMEI.Clear;
            except
                Close(btDoNotSaveChanges); //�رղ�����
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
        //�ް�
        0,4:
            begin
                edt_SIM.Enabled := False;
                EdtMEI.Text := '';
                EdtMEI.SetFocus;
            end;
        //��SIM����
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
        //�ް�
        0,4:
            begin
                EdtMEI.Text := '';
                EdtMEI.SetFocus;
            end;
        //��SIM����
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
    //ֻ����������
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
            //���ż��
            if(chk_ConNo.Checked) and (edt_preIMEI.Text<>'') then
            begin
                iIMEI := strtoint64(Trim(edtMEI.Text));
                iPreIMEI:= strtoint64(Trim(edt_preIMEI.Text));
                if(iIMEI<> iPreIMEI+1) then
                begin
                   IMEIErrorPrompt('IMEI��δ������');
                    //EdtMEI.Text := '';
                    //EdtMEI.SetFocus;
                    Exit;
                end;
            end;


            edt_preIMEI.Text := EdtMEI.Text;
            //�ж�IMEI�Ƿ���IMEI�Ŷ�
            if ((Edt_IMEISTART.Text <> '') and (Edt_IMEIEND.Text <> '')) then
            begin
                istart := strtoint64(Trim(Edt_IMEISTART.Text));
                iend := strtoint64(Trim(Edt_IMEIEND.Text));
                iIMEI := strtoint64(LeftStr(Trim(EdtMEI.Text), 14));
                if iend <= istart then
                begin
                    IMEIErrorPrompt('��IMEI�Ŷ����ô���(��ʼ���ڽ���)��');
                    //EdtMEI.Text := '';
                    //EdtMEI.SetFocus;
                    Exit;
                end;
                if ((iIMEI < istart) or (iIMEI > iend)) then
                begin
                    IMEIErrorPrompt('��IMEI�������úŶ��ڣ�');
                    //EdtMEI.Text := '';
                    //EdtMEI.SetFocus;
                    Exit;
                end;
            end
            else
            begin
                IMEIErrorPrompt('δ����IMEI�źŶΣ�');
                //EdtMEI.Text := '';
                //EdtMEI.SetFocus;
                Exit;
            end;

            if (ch_CheckInfo.Checked) then
            begin
                //�жϻ���IMEI�󶨵Ļ���ID�Ƿ�Ψһ
                UniQuery_FindRidByImei.Close;
                UniQuery_FindRidByImei.ParamByName('IMEI').value := EdtMEI.Text;
                UniQuery_FindRidByImei.Open;
                if (UniQuery_FindRidByImei.RecordCount <> 1) then
                begin
                    IMEIErrorPrompt('�˻��Ӱ�RID�쳣,����ϵ����Ա��');
                    //EdtMEI.Text := '';
                    //EdtMEI.SetFocus;
                    Exit;
                end;
            end;

            //�жϴ�IMEI�Ƿ����������
            case IMEIRel of
                //��SIM����
                1, 2, 3:
                    begin
                        UniQuery_DataRelativeSheetByImei.Close;
                        UniQuery_DataRelativeSheetByImei.ParamByName('IMEI').value := edtMEI.Text;
                        UniQuery_DataRelativeSheetByImei.Open;
                        if (UniQuery_DataRelativeSheetByImei.RecordCount >= 1) then
                        begin
                            IMEIErrorPrompt('�˻�����������SIM����,����ϵ����Ա��');
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
                            IMEIErrorPrompt('�˻���δ��������,����ϵ����Ա��');
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
                            IMEIErrorPrompt('�˻���δ���������,����ϵ����Ա��');
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
                        IMEIErrorPrompt('�˻�������������û����ͨ��');
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
            IMEIErrorPrompt('��ЧIMEI,����ΪSIM��!');
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
    //ֻ����������
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
                //�ж�SIM���Ƿ��ڷ�Χ��
                istart := strtoint64(Trim(Edt_SIMSTART.Text));
                iend := strtoint64(Trim(Edt_SIMEND.Text));
                iSIM := strtoint64(Trim(edt_SIM.Text));
                if iend <= istart then
                begin
                    IMEIErrorPrompt('��SIM�Ŷ����ô���(��ʼ���ڽ���)��');
                    edt_SIM.Text := '';
                    edt_SIM.SetFocus;
                    Exit;
                end;
                if ((iSIM < istart) or (iSIM > iend)) then
                begin
                    IMEIErrorPrompt('��SIM�Ų������úŶ��ڣ�');
                    edt_SIM.Text := '';
                    edt_SIM.SetFocus;
                    Exit;
                end;
            end
            else
            begin
                IMEIErrorPrompt('δ����SIM�źŶΣ�');
                edt_SIM.Text := '';
                edt_SIM.SetFocus;
                Exit;
            end;

            //�ж�SIM���Ƿ��ظ�
            imemoLines := mmoMEI.Lines.Count;
            if imemoLines + 1 > iPrintCount then
            begin
                ShowMessage('��ӡ���ݲ��ܳ���' + inttostr(iPrintCount) + '��,������ɨ�����ȴ�ӡ��ǰ����');
                Exit;
            end;
            if imemoLines <> 0 then
            begin
                for lineLoop := 0 to imemoLines - 1 do
                begin
                    if edt_SIM.Text = StrUtils.RightStr(mmoMEI.Lines[lineLoop], 13) then
                    begin
                        IMEIErrorPrompt('SIM�������ظ�');
                        edt_SIM.Text := '';
                        edt_SIM.SetFocus;
                        Exit;
                    end
                    else IMEIErrorPrompt('');
                end;
            end;

            //�ж�SIM�����Ƿ���ڣ�SIM�Ƿ�������IMEI��
            UniQuery_SIM.Close;
            UniQuery_SIM.ParamByName('SIMNo').Value := edt_SIM.Text;
            //UniQuery_SIM.ParamByName('IMEI').Value := edt_SIM.Text;
            UniQuery_SIM.Open;
            iRecordCount := UniQuery_SIM.RecordCount;

            //�ж�SIM�����Ƿ����
            if ((iRecordCount <= 0)) then
            begin
                IMEIErrorPrompt('SIM���Ų�����!');
                edt_SIM.Text := '';
                edt_SIM.SetFocus;
                Exit;
            end;
            //SIM�Ƿ�������IMEI��
            if (edt_SIM.Text <> UniQuery_SIM.FieldByName('IMEI1').AsString) then
            begin
                IMEIErrorPrompt('SIM�Ѿ�������IMEI��!');
                edt_SIM.Text := '';
                edt_SIM.SetFocus;
                Exit;
            end;

            EdtMEI.Text := '';
            EdtMEI.SetFocus;
        end
        else
        begin
            IMEIErrorPrompt('SIM�ų��Ȳ���ȷ��!');
            edt_SIM.Text := '';
            edt_SIM.SetFocus;
            Exit;
        end;
    end;
end;

end.


