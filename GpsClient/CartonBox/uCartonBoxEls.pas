unit uCartonBoxEls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCartonBox, OleServer, BarTender_TLB, DB, ADODB, StdCtrls,
  Buttons, ExtCtrls;

type
  TfrmCartonBoxEls = class(TfrmCartonBox)
    lbl2: TLabel;
    EdtConNo: TEdit;
    lbl4: TLabel;
    EdtOrderNo: TEdit;
    EdtConsignee: TEdit;
    lbl16: TLabel;
    EdtBoxNum1: TEdit;
    lbl1: TLabel;
    lbl3: TLabel;
    EdtDestin: TEdit;
    lbl11: TLabel;
    EdtModel: TEdit;
    EdtDate: TEdit;
    lbl17: TLabel;
    EdtColor: TEdit;
    lbl14: TLabel;
    lbl6: TLabel;
    EdtQuan: TEdit;
    lbl15: TLabel;
    EdtGW: TEdit;
    EdtMoName: TEdit;
    lbl18: TLabel;
    EdtVersion: TEdit;
    lbl5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImeiPrint(); override;
  end;

var
  frmCartonBoxEls: TfrmCartonBoxEls;

implementation
uses
    uPublicFunc;
{$R *.dfm}
procedure TfrmCartonBoxEls.ImeiPrint();
var
  strFile,strver:String;
  i:Integer;
begin
    if (mmoMEI.Lines.Count =0) then
    begin
        ShowMessage('��ǰ����Ϊ��,���ܽ��д�ӡ');
        Exit;
    end;
    if (trim(EdtVersion.Text) ='') then
    begin
        ShowMessage('�汾��Ϣ����Ϊ��');
        Exit;
    end;
    strBar :='';
    strFile :=ExtractFilePath(ParamStr(0))+'CartonBox\els\'+IntToStr(mmoMEI.Lines.Count)+'.btw';
    with btApp1.Formats.Open(strFile, True, '') do //�򿪱�ǩ�ļ�
    begin
        SetNamedSubStringValue('TextZd','Contract NO:'+trim(EdtConNo.Text)+'  Order No:'+trim(EdtOrderNo.Text));
        SetNamedSubStringValue('BarCodeXH',trim(EdtBoxNum.Text)+trim(EdtBoxNum1.Text));
        SetNamedSubStringValue('TextProduct','Consignee:'+trim(EdtConsignee.Text)+'  Destination:'+trim(EdtDestin.Text));
        SetNamedSubStringValue('BarCodeJX',trim(EdtModel.Text));
        SetNamedSubStringValue('TextYsDate','Color:'+trim(EdtColor.Text)+'    Date:'+trim(EdtDate.Text));
        SetNamedSubStringValue('TextSlMz','Quantity:'+trim(EdtQuan.Text)+'    Gross Weight:'+trim(EdtGW.Text));
        SetNamedSubStringValue('Text','Model name/article:'+trim(EdtConsignee.Text));
        SetNamedSubStringValue('Text1','Version:'+trim(EdtVersion.Text));

        strver := trim(EdtVersion.Text) +'-'+ trim(EdtBoxNum.Text)+'-'+ trim(EdtColor.Text) ;

        AppendTxt(strver,ExtractFilePath(ParamStr(0))+'dblog.txt');
        for i:=0 to (mmoMEI.Lines.Count-1) do
        begin
            strBar  :='BarCode' +IntToStr(i+1);
            SetNamedSubStringValue(strBar,StrList.Strings[i]); //����ֵ
            AppendTxt(DateTimeToStr(Now)+'-----------'+StrList.Strings[i],ExtractFilePath(ParamStr(0))+'log.txt');
            AppendTxt(StrList.Strings[i],ExtractFilePath(ParamStr(0))+'dblog.txt');
        end;
        try
            if chkAuto.Checked then
                PrintOut(False, False)
            else
                PrintOut(False, true); //��ӡ
            Close(btDoNotSaveChanges); //�رղ�����
            StrList.Clear;
            mmoMEI.Clear;

            WriteIni('Box','Num',trim(EdtBoxNum.Text));
            EdtBoxNum1.Text :=IntToStr((StrToInt(EdtBoxNum1.Text)+1));

            if (Length(EdtBoxNum1.Text) =1)  then
                EdtBoxNum1.Text :='0000'+EdtBoxNum1.Text
            else if (Length(EdtBoxNum1.Text) =2) then
                EdtBoxNum1.Text :='000'+ EdtBoxNum1.Text
            else if (Length(EdtBoxNum1.Text) =3) then
                EdtBoxNum1.Text :='00'+ EdtBoxNum1.Text
            else if (Length(EdtBoxNum1.Text) =4) then
                EdtBoxNum1.Text :='0'+ EdtBoxNum1.Text;

            AppendTxt('',ExtractFilePath(ParamStr(0))+'dblog.txt');
            AppendTxt('',ExtractFilePath(ParamStr(0))+'dblog.txt');
         except
            Close(btDoNotSaveChanges); //�رղ�����
         end;
      end;
end;
procedure TfrmCartonBoxEls.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    WriteIni('els','ConNo',trim(EdtConNo.Text));        //����
    WriteIni('els','BoxNum',trim(EdtBoxNum.Text));      //���
    WriteIni('els','BoxNum1',trim(EdtBoxNum1.Text));    //��ŷ�֧
    WriteIni('els','Destin',trim(EdtDestin.Text));      //��ŷ�֧
    WriteIni('els','Color',trim(EdtColor.Text));        //����
    WriteIni('els','Quan',trim(EdtQuan.Text));          //����
    WriteIni('els','Version',trim(EdtVersion.Text));    //�汾��
    WriteIni('els','Tac',trim(EdtTac.Text));            //Tac��Ϣ
    WriteIni('els','OrderNo',trim(EdtOrderNo.Text));    //����
    WriteIni('els','Consignee',trim(EdtConsignee.Text));//��ɫ
    WriteIni('els','Type',trim(EdtModel.Text));         //����
    WriteIni('els','Date',trim(EdtDate.Text));          //����
    WriteIni('els','GW',trim(EdtGw.Text));              //����
    WriteIni('els','MoName',trim(EdtMoName.Text));      //�Ƶ�
end;

procedure TfrmCartonBoxEls.FormCreate(Sender: TObject);
begin
  inherited;
    EdtConNo.Text :=ReadIni('els','ConNo','');
    EdtBoxNum.Text :=ReadIni('els','BoxNum','');
    EdtBoxNum1.Text :=ReadIni('els','BoxNum1','');
    EdtDestin.Text :=ReadIni('els','Destin','');
    EdtColor.Text :=ReadIni('els','Color','');
    EdtQuan.Text :=ReadIni('els','Quan','');
    EdtVersion.Text :=ReadIni('els','Version','');
    EdtTac.Text :=ReadIni('els','Tac','');
    EdtOrderNo.Text :=ReadIni('els','OrderNo','');
    EdtConsignee.Text :=ReadIni('els','Consignee','');
    EdtModel.Text :=ReadIni('els','Type','');
    EdtDate.Text :=ReadIni('els','Date','');
    EdtGW.Text :=ReadIni('els','GW','');
    EdtMoName.Text :=ReadIni('els','MoName','');
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
end;

end.


