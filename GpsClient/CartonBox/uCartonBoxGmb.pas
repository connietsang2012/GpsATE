unit uCartonBoxGmb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCartonBox, OleServer, BarTender_TLB, DB, ADODB, StdCtrls,
  Buttons, ExtCtrls, MemDS, DBAccess, Uni,uGlobalVar,uDmMain, Mask;

type
  TfrmCartonBoxGmb = class(TfrmCartonBox)
    lbl2: TLabel;
    EdtSMark: TEdit;
    lbl4: TLabel;
    EdtProduct: TEdit;
    EdtColor: TEdit;
    lbl14: TLabel;
    EdtBoxNum1: TEdit;
    lbl1: TLabel;
    lbl3: TLabel;
    EdtDate: TEdit;
    lbl6: TLabel;
    EdtQty: TEdit;
    EdtPCode: TEdit;
    lbl7: TLabel;
    EdtGW: TEdit;
    lbl15: TLabel;
    lbl11: TLabel;
    EdtModel: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImeiPrint(); override;
  end;

var
  frmCartonBoxGmb: TfrmCartonBoxGmb;

implementation
uses
    uPublicFunc;
{$R *.dfm}
procedure TfrmCartonBoxGmb.ImeiPrint();
var
  strFile,strver:String;
  i:Integer;
  strTemp:string;
begin
    if (mmoMEI.Lines.Count =0) then
    begin
        ShowMessage('��ǰ����Ϊ��,���ܽ��д�ӡ');
        Exit;
    end;
    if (trim(EdtSoftModel.Text) ='') then
    begin
        ShowMessage('�汾��Ϣ����Ϊ��');
        Exit;
    end;
    {if (Trim(EdtVersion.Text)<>paramVersion) and (paramVersion<>'') then//���ݲ�������λ�Ļ���
    begin
        ShowMessage('���ذ汾���뵥�����ð汾��һ�£�');
        Exit;
    end; }
    strBar :='';
    strver :='';
    strFile :=ExtractFilePath(ParamStr(0))+'CartonBox\gmb\'+IntToStr(mmoMEI.Lines.Count)+'.btw';
    with btappAutoPrint.Formats.Open(strFile, True, '') do //�򿪱�ǩ�ļ�
    begin
        SetNamedSubStringValue('ZhiDan','SHIPPING MARK:'+trim(EdtSMark.Text));
        SetNamedSubStringValue('BoxNum',trim(EdtBoxNum.Text)+trim(EdtBoxNum1.Text));
        SetNamedSubStringValue('TextProduct','PRODUCT:'+trim(EdtProduct.Text));
        SetNamedSubStringValue('MachineType',trim(EdtModel.Text));
        SetNamedSubStringValue('ProductColor','Color:'+trim(EdtColor.Text));
        SetNamedSubStringValue('ProductDate','Date:'+trim(EdtDate.Text));
        SetNamedSubStringValue('ProductCount','QTY:'+trim(EdtQty.Text));
        SetNamedSubStringValue('ProductWeight','G.W:'+trim(EdtGW.Text));
        SetNamedSubStringValue('ProductNum','��Ʒ����:'+trim(EdtPCode.Text));
        SetNamedSubStringValue('Remark',trim(EdtSoftModel.Text));

        //strver := trim(EdtVersion.Text) +'-'+ trim(EdtBoxNum.Text)+'-'+ trim(EdtColor.Text) +'-'+ trim(EdtQty.Text);
        strver:=SysUtils.Format('Boxno:%s%s  ZhiDan:%s  Type:%s  Color:%s      Date:%s  QTY:%s PCS  G.W:%s KG  Product Code:%s  Version:%s',
                    [EdtBoxNum.Text,EdtBoxNum1.Text,EdtSMark.Text,EdtModel.Text,EdtColor.Text,EdtDate.Text,EdtQty.Text,EdtGW.Text,EdtPCode.Text,EdtSoftModel.Text]);
        AppendTxt(strver,LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\gmbdblog.txt');
        for i:=0 to (mmoMEI.Lines.Count-1) do
        begin
            strBar  :='BarCode' +IntToStr(i+1);
            SetNamedSubStringValue(strBar,StrList.Strings[i]);  //����ֵ
            AppendTxt(DateTimeToStr(Now)+'-----------'+StrList.Strings[i],LowerDir(ExtractFilePath(ParamStr(0)))+'\PrintLog\log.txt');
            AppendTxt(StrList.Strings[i],LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\gmbdblog.txt');

            UniQuery_IMEI.Close;
            UniQuery_IMEI.Sql.Clear;
            //strtemp:=Format('Insert into Gps_CartonBoxTwenty_Result (BoxNo,IMEI,ZhiDan,SoftModel,Version,ProductCode,Color,Qty,Weight,Date,TACInfo,CompanyName,TesterId) values (''%s%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'')',
            //[EdtBoxNum.Text,EdtBoxNum1.Text,StrList.Strings[i],EdtSMark.Text,EdtModel.Text,EdtParamVersion.Text,EdtPCode.Text,EdtColor.Text,EdtQty.Text,EdtGW.Text,EdtDate.Text,EdtTac.Text,'',User.UserName]);

            strtemp:='Insert into Gps_CartonBoxTwenty_Result (BoxNo,IMEI,ZhiDan,SoftModel,Version,'
                        + 'ProductCode,Color,Qty,Weight,Date,TACInfo,CompanyName,TesterId) values('''
                        + EdtBoxNum.Text+EdtBoxNum1.Text+''','''+StrList.Strings[i]+''','''+EdtSMark.Text+''','''
                        + EdtModel.Text+''','''+EdtSoftModel.Text+''','''+EdtPCode.Text+''','''+EdtColor.Text+''','''
                        + EdtQty.Text+''','''+EdtGW.Text+''','''+EdtDate.Text+''','''+EdtTac.Text+''','''+''+''','''+User.UserName+''')';


            UniQuery_IMEI.SQL.Text:=strtemp;
            UniQuery_IMEI.Execute;
        end;
        try
            if chkAuto.Checked then
                PrintOut(False, False)
            else
                PrintOut(False, true); //��ӡ
            Close(btDoNotSaveChanges); //�رղ�����
            StrList.Clear;
            mmoMEI.Clear;
            WriteIni('gmb','BoxNum1',trim(EdtBoxNum1.Text));
            EdtBoxNum1.Text :=IntToStr((StrToInt(EdtBoxNum1.Text)+1));
            lbl10.Caption:='';
            if (Length(EdtBoxNum1.Text) =1)  then
                EdtBoxNum1.Text :='0000'+EdtBoxNum1.Text
            else if (Length(EdtBoxNum1.Text) =2) then
                EdtBoxNum1.Text :='000'+ EdtBoxNum1.Text
            else if (Length(EdtBoxNum1.Text) =3) then
                EdtBoxNum1.Text :='00'+ EdtBoxNum1.Text
            else if (Length(EdtBoxNum1.Text) =4) then
                EdtBoxNum1.Text :='0'+ EdtBoxNum1.Text;

            AppendTxt('',LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\gmbdblog.txt');
            AppendTxt('',LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\gmbdblog.txt');
        except
            Close(btDoNotSaveChanges); //�رղ�����
        end;
      end;
end;
procedure TfrmCartonBoxGmb.FormCreate(Sender: TObject);
begin
  inherited;
    EdtSMark.Text :=ReadIni('gmb','SMark','');
    EdtBoxNum.Text :=ReadIni('gmb','BoxNum','');
    EdtBoxNum1.Text :=ReadIni('gmb','BoxNum1','');
    EdtDate.Text :=ReadIni('gmb','Date','');
    EdtGW.Text :=ReadIni('gmb','GW','');
    EdtSoftModel.Text :=ReadIni('gmb','Version','');
    EdtProduct.Text :=ReadIni('gmb','Product','');
    EdtColor.Text :=ReadIni('gmb','Color','');
    EdtQty.Text :=ReadIni('gmb','Qty','');
    EdtPCode.Text :=ReadIni('gmb','PCode','');
    EdtModel.Text :=ReadIni('gmb','Model','');
    EdtTac.Text :=ReadIni('gmb','Tac','');

    if ReadIni('Auto','Print','0') ='1' then
        chkAuto.Checked :=True
    else
        chkAuto.Checked :=False;

    if (Length(EdtBoxNum1.Text) =1)  then
        EdtBoxNum1.Text :='0000'+EdtBoxNum1.Text
    else if (Length(EdtBoxNum1.Text) =2) then
        EdtBoxNum1.Text :='000'+ EdtBoxNum1.Text
    else if (Length(EdtBoxNum1.Text) =3) then
        EdtBoxNum1.Text :='00'+ EdtBoxNum1.Text
    else if (Length(EdtBoxNum1.Text) =4) then
        EdtBoxNum1.Text :='0'+ EdtBoxNum1.Text;

    if (User.UserType<>'ParamConfig') and (User.UserType<>'admin') and (User.UserType<>'SuperAdmin') then
    begin
        {EdtVersion.Enabled:=false;
        EdtBoxNum.Enabled:=false;
        EdtBoxNum1.Enabled:=false;
        EdtColor.Enabled:=false;
        EdtQty.Enabled:=false;
        EdtDate.Enabled:=false;
        Edtzhidan.Enabled:=false;
        EdtProNo.Enabled:=false;
        EdtParamVersion.Enabled:=false;
        EdtTac.Enabled:=false;
        EdtQty1.Enabled:=false;
        Edt_IMEISTART.Enabled:=false;
        Edt_IMEIEND.Enabled:=false;
        EdtCpName.Enabled:=false;}

        EdtSMark.Enabled:=false;
        EdtProduct.Enabled:=false;
        EdtBoxNum.Enabled:=false;
        EdtBoxNum1.Enabled:=false;
        EdtColor.Enabled:=false;
        EdtDate.Enabled:=false;
        EdtQty.Enabled:=false;
        EdtGW.Enabled:=false;
        EdtPCode.Enabled:=false;
        EdtSoftModel.Enabled:=false;
        EdtModel.Enabled:=false;
        EdtTac.Enabled:=false;
        Edt_IMEISTART.Enabled:=false;
        Edt_IMEIEND.Enabled:=false;
    end;
end;

procedure TfrmCartonBoxGmb.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    WriteIni('gmb','SMark',trim(EdtSMark.Text));    //����
    WriteIni('gmb','BoxNum',trim(EdtBoxNum.Text));    //���
    WriteIni('gmb','BoxNum1',trim(EdtBoxNum1.Text));  //��ŷ�֧
    WriteIni('gmb','Date',trim(EdtDate.Text));        //����
    WriteIni('gmb','GW',trim(EdtGW.Text));      //��ɫ
    WriteIni('gmb','Version',trim(EdtSoftModel.Text)); //�汾��
    WriteIni('gmb','Tac',trim(EdtTac.Text));          //Tac��Ϣ
    WriteIni('gmb','Product',trim(EdtProduct.Text));        //����
    WriteIni('gmb','Color',trim(EdtColor.Text));          //����
    WriteIni('gmb','Qty',trim(EdtQty.Text));    //�Ƶ�
    WriteIni('gmb','PCode',trim(EdtPCode.Text));      //��Ʒ��    
    WriteIni('gmb','Model',trim(EdtModel.Text));    //��˾����
end;

end.
