unit uCartonBox10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCartonBox, OleServer, BarTender_TLB, DB, ADODB, StdCtrls,
  Buttons, ExtCtrls, MemDS, DBAccess, Uni, Mask;

type
  TfrmCartonBox_10 = class(TfrmCartonBox)
    lbl2: TLabel;
    EdtVersion: TEdit;
    lbl3: TLabel;
    EdtColor: TEdit;
    lbl4: TLabel;
    EdtQty: TEdit;
    lbl1: TLabel;
    lbl5: TLabel;
    EdtOther1: TEdit;
    EdtOther2: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImeiPrint(); override;
  end;

var
  frmCartonBox_10: TfrmCartonBox_10;

implementation
uses
    uPublicFunc;
{$R *.dfm}

procedure TfrmCartonBox_10.FormCreate(Sender: TObject);
begin
  inherited;
    iPrintCount:=10;
    mmoMEI.Text:='';
    lbl10.Caption:='0';
    IMEIErrorPrompt('');

    //读取相关打印内容
    EdtSoftModel.Text :=ReadIni('default10','Version','');
    EdtBoxNum.Text :=ReadIni('default10','BoxNum','001');
    EdtTac.Text :=ReadIni('default10','Tac','000000');
    EdtColor.Text :=ReadIni('default10','Color','');
    EdtQty.Text :=ReadIni('default10','Qty','20');
    EdtOther1.Text :=ReadIni('default10','Other1','20');
    EdtOther2.Text :=ReadIni('default10','Other2','20');

    if (Length(EdtBoxNum.Text) =1)  then
        EdtBoxNum.Text :='00'+EdtBoxNum.Text
    else if (Length(EdtBoxNum.Text) =2) then
        EdtBoxNum.Text :='0'+ EdtBoxNum.Text;

    if ReadIni('Auto','Print','0') ='1' then
        ChkAuto.Checked :=True
    else
        ChkAuto.Checked :=False;
end;
procedure TfrmCartonBox_10.ImeiPrint();
var
  i:Integer;
begin
    //Application.ProcessMessages;
    if (mmoMEI.Lines.Count =0) then
    begin
         ShowMessage('当前数据为空,不能进行打印');
         Exit;
    end;
    strBar :='';
    strver :='';
    strBarFile :=ExtractFilePath(ParamStr(0))+'CartonBox\config10\'+IntToStr(mmoMEI.Lines.Count)+'.btw';

    if  ChkAuto.Checked  then
    begin
        with btappAutoPrint.Formats.Open(strBarFile, True, '') do //打开标签文件
        begin
            //设置要打印的内容
            SetNamedSubStringValue('Text','机型:'+trim(EdtSoftModel.Text));
            SetNamedSubStringValue('Text1','箱号:'+trim(EdtBoxNum.Text));
            SetNamedSubStringValue('Text2','颜色:'+trim(EdtColor.Text));
            SetNamedSubStringValue('Text3','重量:'+trim(EdtQty.Text));
            SetNamedSubStringValue('Text5',trim(EdtOther1.Text));
            SetNamedSubStringValue('Text6',trim(EdtOther2.Text));

            strver := trim(EdtSoftModel.Text) +'-'+ trim(EdtBoxNum.Text)+'-'+ trim(EdtColor.Text) +'-'+ trim(EdtQty.Text);;
            AppendTxt(strver,LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');
            for i:=0 to (mmoMEI.Lines.Count-1) do
            begin
                strBar  :='BarCode' +IntToStr(i+1);
                SetNamedSubStringValue(strBar,StrList.Strings[i]); //设置值
                AppendTxt(StrList.Strings[i],LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');
            end;
            try
                //打印
                PrintOut(False, False);
                Sleep(1000);
                Close(btDoNotSaveChanges); //关闭不保存

                StrList.Clear;
                mmoMEI.Clear;
                //箱号递增
                WriteIni('default10','BoxNum',IntToStr(StrToInt(EdtBoxNum.Text)+1));
                EdtBoxNum.Text :=IntToStr((StrToInt(EdtBoxNum.Text)+1));
                AppendTxt('',LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');
                //btapp1.Quit(btDoNotSaveChanges);
            except
                Close(btDoNotSaveChanges); //关闭不保存
                //btapp1.Quit(btDoNotSaveChanges);
            end;
        end;
    end
    else
    begin
        with btappBtnPrint.Formats.Open(strBarFile, True, '') do //打开标签文件
        begin
            //设置要打印的内容
            SetNamedSubStringValue('Text','机型:'+trim(EdtSoftModel.Text));
            SetNamedSubStringValue('Text1','箱号:'+trim(EdtBoxNum.Text));
            SetNamedSubStringValue('Text2','颜色:'+trim(EdtColor.Text));
            SetNamedSubStringValue('Text3','重量:'+trim(EdtQty.Text));
            SetNamedSubStringValue('Text5',trim(EdtOther1.Text));
            SetNamedSubStringValue('Text6',trim(EdtOther2.Text));

            strver := trim(EdtSoftModel.Text) +'-'+ trim(EdtBoxNum.Text)+'-'+ trim(EdtColor.Text) +'-'+ trim(EdtQty.Text);;
            AppendTxt(strver,LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');
            for i:=0 to (mmoMEI.Lines.Count-1) do
            begin
                strBar  :='BarCode' +IntToStr(i+1);
                SetNamedSubStringValue(strBar,StrList.Strings[i]); //设置值
                AppendTxt(StrList.Strings[i],LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');
            end;
            try
                //打印
                PrintOut(False, True);
                Sleep(1000);
                Close(btDoNotSaveChanges); //关闭不保存

                StrList.Clear;
                mmoMEI.Clear;
                //箱号递增
                WriteIni('default10','BoxNum',IntToStr(StrToInt(EdtBoxNum.Text)+1));
                EdtBoxNum.Text :=IntToStr((StrToInt(EdtBoxNum.Text)+1));
                AppendTxt('',LowerDir(ExtractFilePath(ParamStr(0)))+'PrintLog\dblog.txt');
                //btapp1.Quit(btDoNotSaveChanges);
            except
                Close(btDoNotSaveChanges); //关闭不保存
                //btapp1.Quit(btDoNotSaveChanges);
            end;
        end;
    end;
    //Application.ProcessMessages;
end;


procedure TfrmCartonBox_10.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    WriteIni('default10','Version',trim(EdtSoftModel.Text));
    WriteIni('default10','BoxNum',trim(EdtBoxNum.Text));
    WriteIni('default10','Tac',trim(EdtTac.Text));
    WriteIni('default10','Color',trim(EdtColor.Text));
    WriteIni('default10','Qty',trim(EdtQty.Text));
    WriteIni('default10','Other1',trim(EdtOther1.Text));
    WriteIni('default10','Other2',trim(EdtOther2.Text));
end;

end.
