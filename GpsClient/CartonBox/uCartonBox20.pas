unit uCartonBox20;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCartonBox, OleServer, BarTender_TLB, DB, ADODB, StdCtrls,
  Buttons, ExtCtrls;

type
  TfrmCartonBox_20 = class(TfrmCartonBox)
    lbl1: TLabel;
    EdtVersion: TEdit;
    lbl2: TLabel;
    EdtColor: TEdit;
    EdtQty: TEdit;
    lbl3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure EdtBoxNumExit(Sender: TObject);
    procedure EdtBoxNumKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImeiPrint(); override;
  end;

var
  frmCartonBox_20: TfrmCartonBox_20;

implementation
uses
    uPublicFunc;
{$R *.dfm}

procedure TfrmCartonBox_20.FormCreate(Sender: TObject);
begin
  inherited;
    EdtVersion.Text :=ReadIni('default20','Version','');
    EdtBoxNum.Text :=ReadIni('default20','BoxNum','001');
    EdtTac.Text :=ReadIni('default20','Tac','000000');
    EdtColor.Text :=ReadIni('default20','Color','');
    EdtQty.Text :=ReadIni('default20','Qty','20');

    if (Length(EdtBoxNum.Text) =1)  then
        EdtBoxNum.Text :='00'+EdtBoxNum.Text
    else if (Length(EdtBoxNum.Text) =2) then
        EdtBoxNum.Text :='0'+ EdtBoxNum.Text;

     if ReadIni('Auto','Print','0') ='1' then
        ChkAuto.Checked :=True
     else
        ChkAuto.Checked :=False;
end;

procedure TfrmCartonBox_20.ImeiPrint();
var
  i:Integer;
  strFile:string;
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

    strFile :=ExtractFilePath(ParamStr(0))+'CartonBox\config20\'+IntToStr(mmoMEI.Lines.Count)+'.btw';

    with btApp1.Formats.Open(strFile, True, '') do //打开标签文件
    begin
        SetNamedSubStringValue('Text',trim(EdtVersion.Text));
        SetNamedSubStringValue('Text1',trim(EdtBoxNum.Text));
        strver := trim(EdtVersion.Text) +'-'+ trim(EdtBoxNum.Text)+'-'+ trim(EdtColor.Text) +'-'+ trim(EdtQty.Text);

        AppendTxt(strver,ExtractFilePath(ParamStr(0))+'dblog.txt');
        for i:=0 to (mmoMEI.Lines.Count-1) do
        begin
            strBar  :='BarCode' +IntToStr(i+1);
            SetNamedSubStringValue(strBar,StrList.Strings[i]); //设置值
            AppendTxt(DateTimeToStr(Now)+'-----------'+StrList.Strings[i],ExtractFilePath(ParamStr(0))+'log.txt');
            AppendTxt(StrList.Strings[i],ExtractFilePath(ParamStr(0))+'dblog.txt');
        end;
        try
            if ChkAuto.Checked then
                PrintOut(False, False)
            else
                PrintOut(False, true); //打印
            Close(btDoNotSaveChanges); //关闭不保存
            StrList.Clear;
            mmoMEI.Clear;

            EdtBoxNum.Text :=IntToStr((StrToInt(EdtBoxNum.Text)+1));
            if (Length(EdtBoxNum.Text) =1)  then
            begin
                EdtBoxNum.Text :='00'+EdtBoxNum.Text;
            end else if (Length(EdtBoxNum.Text) =2) then
            begin
                EdtBoxNum.Text :='0'+ EdtBoxNum.Text;
            end;
            AppendTxt('',ExtractFilePath(ParamStr(0))+'dblog.txt');
        except
            Close(btDoNotSaveChanges); //关闭不保存
        end;
      end;
end;

procedure TfrmCartonBox_20.EdtBoxNumExit(Sender: TObject);
begin
  inherited;
    if EdtBoxNum.Text ='' then
    begin
        ShowMessage('箱号不能为空');
        EdtBoxNum.Text :='000';
        exit;
    end;
end;

procedure TfrmCartonBox_20.EdtBoxNumKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if (((ord(key)<48) or (ord(key) >57)) and (key<>#8)) then key:=#0
end;

procedure TfrmCartonBox_20.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    strKey:string;
begin
  inherited;
    WriteIni('default20','Version',trim(EdtVersion.Text));
    WriteIni('default20','BoxNum',trim(EdtBoxNum.Text));
    WriteIni('default20','Tac',trim(EdtTac.Text));
    WriteIni('default20','Color',trim(EdtColor.Text));
    WriteIni('default20','Qty',trim(EdtQty.Text));
end;

end.
