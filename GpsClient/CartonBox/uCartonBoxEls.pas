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
        ShowMessage('当前数据为空,不能进行打印');
        Exit;
    end;
    if (trim(EdtVersion.Text) ='') then
    begin
        ShowMessage('版本信息不能为空');
        Exit;
    end;
    strBar :='';
    strFile :=ExtractFilePath(ParamStr(0))+'CartonBox\els\'+IntToStr(mmoMEI.Lines.Count)+'.btw';
    with btApp1.Formats.Open(strFile, True, '') do //打开标签文件
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
            SetNamedSubStringValue(strBar,StrList.Strings[i]); //设置值
            AppendTxt(DateTimeToStr(Now)+'-----------'+StrList.Strings[i],ExtractFilePath(ParamStr(0))+'log.txt');
            AppendTxt(StrList.Strings[i],ExtractFilePath(ParamStr(0))+'dblog.txt');
        end;
        try
            if chkAuto.Checked then
                PrintOut(False, False)
            else
                PrintOut(False, true); //打印
            Close(btDoNotSaveChanges); //关闭不保存
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
            Close(btDoNotSaveChanges); //关闭不保存
         end;
      end;
end;
procedure TfrmCartonBoxEls.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    WriteIni('els','ConNo',trim(EdtConNo.Text));        //机型
    WriteIni('els','BoxNum',trim(EdtBoxNum.Text));      //箱号
    WriteIni('els','BoxNum1',trim(EdtBoxNum1.Text));    //箱号分支
    WriteIni('els','Destin',trim(EdtDestin.Text));      //箱号分支
    WriteIni('els','Color',trim(EdtColor.Text));        //重量
    WriteIni('els','Quan',trim(EdtQuan.Text));          //数量
    WriteIni('els','Version',trim(EdtVersion.Text));    //版本号
    WriteIni('els','Tac',trim(EdtTac.Text));            //Tac信息
    WriteIni('els','OrderNo',trim(EdtOrderNo.Text));    //日期
    WriteIni('els','Consignee',trim(EdtConsignee.Text));//颜色
    WriteIni('els','Type',trim(EdtModel.Text));         //日期
    WriteIni('els','Date',trim(EdtDate.Text));          //日期
    WriteIni('els','GW',trim(EdtGw.Text));              //日期
    WriteIni('els','MoName',trim(EdtMoName.Text));      //制单
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


