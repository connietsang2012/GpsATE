unit uParamLoadConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Uni, StdCtrls, Grids, DBGrids, ExtCtrls,
  ComCtrls,StrUtils;

type
  TfrmParamDownLoadConfig = class(TForm)
    grp1: TGroupBox;
    lbl16: TLabel;
    lbl17: TLabel;
    edtEdt_IMEIEND: TEdit;
    lbl12: TLabel;
    edtEdtOrNum: TEdit;
    edt_NUM: TEdit;
    lbl1: TLabel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    pnl1: TPanel;
    pnl2: TPanel;
    cbb_SoftModel: TComboBox;
    DBGrid_Instruction: TDBGrid;
    dbgrd2: TDBGrid;
    btn_BuildOrder: TButton;
    DS_Module: TDataSource;
    unqry_ParamDownloadDstSubItem: TUniQuery;
    DS_SoftModel: TDataSource;
    UniQuery_SoftModel: TUniQuery;
    DS_BuileOrder: TDataSource;
    UniQuery_BuileOrder: TUniQuery;
    lbl_Result: TLabel;
    sp_BuildOr: TUniStoredProc;
    edtEdt_IMEISTART: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure cbb_SoftModelChange(Sender: TObject);
    procedure btn_BuildOrderClick(Sender: TObject);
    procedure edtEdtOrNumChange(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure edtEdt_IMEISTARTChange(Sender: TObject);
    procedure edtEdt_IMEISTARTKeyPress(Sender: TObject; var Key: Char);
    procedure edtEdt_IMEIENDKeyPress(Sender: TObject; var Key: Char);
    procedure edtEdt_IMEIENDChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetResult;
    procedure SetDisplayResult(iResult:Integer);
  end;
 const
  Orignwidth=1440;
  Orignheight=900;
var
  frmParamDownLoadConfig: TfrmParamDownLoadConfig;

implementation
uses uDmMain,uPublicFunc;
{$R *.dfm}

procedure TfrmParamDownLoadConfig.FormCreate(Sender: TObject);
begin

    
    Scaled:=true;
    if(screen.width<>orignwidth)then
    begin
      height:=longint(height)*longint
      (screen.height)div orignheight;
      width:=longint(width)*longint
      (screen.width)div orignwidth;
      scaleby(screen.width,orignwidth);
    end;

    UniQuery_BuileOrder.Active:=true;
    UniQuery_SoftModel.Open;
    if UniQuery_SoftModel.RecordCount>0 then
    begin
      UniQuery_SoftModel.First;
      cbb_SoftModel.Clear;
      while not UniQuery_SoftModel.Eof do
      begin
        cbb_SoftModel.Items.Add(Trim(UniQuery_SoftModel.FieldByName('Model').AsString));
        UniQuery_SoftModel.Next;
      end;
    end;
    cbb_SoftModel.ItemIndex:=0;
    pgc1.ActivePageIndex:=0;

end;

procedure TfrmParamDownLoadConfig.cbb_SoftModelChange(Sender: TObject);
begin
   lbl_Result.Caption:='';
   lbl_Result.Color:=clWhite;
   if cbb_SoftModel.Text<>'' then
   begin
     unqry_ParamDownloadDstSubItem.Close;
     unqry_ParamDownloadDstSubItem.Params[0].AsString:=cbb_SoftModel.Text;
     unqry_ParamDownloadDstSubItem.Open;
   end;
end;


procedure TfrmParamDownLoadConfig.btn_BuildOrderClick(Sender: TObject);
var
  ImeiStart,ImeiEnd:Integer;
begin

   if (edtEdtOrNum.Text= '') or (edtEdt_IMEISTART.Text= '') or (edtEdt_IMEIEND.Text= '') or (edt_NUM.Text = '')  then
   begin
     MessageBox(0, '填写数据错误空!', '错误', MB_ICONWARNING + mb_OK);
     exit;
   end;
   ImeiStart:=strtoint64(edtEdt_IMEISTART.Text);
   ImeiEnd:=strtoint64(edtEdt_IMEIEND.Text);
   if ImeiStart>ImeiEnd then
   begin
     MessageBox(0,'Imei号段设置错误！','错误',  MB_ICONWARNING + mb_OK);
     exit;
   end;

   SetResult;//提交到数据库
end;

procedure TfrmParamDownLoadConfig.SetResult;
var
  SendText:string;
  iResult:integer;
begin
  //SendText:=Format('Action=UpdateOrder#OrderNum=%s#IMEISTART=%s#IMEIEND=%s#ItemModel=%s#Count=%d#',
  //                  [edtEdtOrNum.Text,edtEdt_IMEISTART.Text,edtEdt_IMEIEND.Text,cbb_SoftModel.Text,StrToInt(edt_NUM.Text)]);
  //SendToServer(0,'UpdateOrder',SendText,True,CTimeOut*2);
  //SendText:=Format('Action=CheckTest_SetOrder#OrderNum=%s#IMEISTART=%s#IMEIEND=%s#',
  //                  [edtEdtOrNum.Text,edtEdt_IMEISTART.Text,edtEdt_IMEIEND.Text]);
  //SendToServer(0,'CheckTest_SetOrder',True,CTimeOut*2);
  iResult:=0;
  try
  with sp_BuildOr do
  begin
    close;
    Params.ParamByName('cOrderNum').Value:=edtEdtOrNum.Text;
    Params.ParamByName('cIMEISTART').Value:=edtEdt_IMEISTART.Text;
    Params.ParamByName('cIMEIEND').Value:=edtEdt_IMEIEND.Text;
    Params.ParamByName('cItemModel').Value:=cbb_SoftModel.Text;
    Params.ParamByName('cCount').Value:=edt_NUM.Text;
    Params.ParamByName('cTestedCount').Value:='0';
    Params.ParamByName('Status').Value:='0';
    ExecProc;
    iResult:=strtoint(Params.ParamByName('UpdateResult').Value);
  end;
  SetDisplayResult(iResult);
  except
     SetDisplayResult(-1);
  end;
end;

procedure TfrmParamDownLoadConfig.SetDisplayResult(iResult:Integer);
begin
  case iResult of
    -1:
    begin
       lbl_Result.Caption:='数据存储出错，请从新下单！';
       lbl_Result.Color:=clRed;
    end;
    1:
    begin
       lbl_Result.Caption:='下单成功';
       lbl_Result.Color:=clLime;
    end;
    0:
    begin
       lbl_Result.Caption:='下单失败，单号重复！';
       lbl_Result.Color:=clRed;
    end;
  end;
end;

procedure TfrmParamDownLoadConfig.edtEdtOrNumChange(Sender: TObject);
begin
    lbl_Result.Caption:='';
    lbl_Result.Color:=clWhite;
end;

procedure TfrmParamDownLoadConfig.pgc1Change(Sender: TObject);
begin
    UniQuery_BuileOrder.Refresh;
end;


procedure TfrmParamDownLoadConfig.edtEdt_IMEISTARTChange(Sender: TObject);
var
  istart,iend:Int64;

begin
  if ((edtEdt_IMEIEND.Text)='') or ((edtEdt_IMEISTART.Text)='') then
  begin
     Exit;
  end;
  istart:=strtoint64(edtEdt_IMEISTART.Text);
  iend:=strtoint64(edtEdt_IMEIEND.Text);
  if (Length(edtEdt_IMEIEND.Text)=15) and (Length(edtEdt_IMEISTART.Text)=15) and (istart<=iend) then
  begin
    if iend=istart then
    begin
      edt_NUM.Text:='1';
    end
    else
    begin
      edt_NUM.Text:= inttostr(iend-istart+1);
    end;
  end
  else
  begin
    edt_NUM.Text:='';
  end;

end;

procedure TfrmParamDownLoadConfig.edtEdt_IMEISTARTKeyPress(Sender: TObject;
  var Key: Char);
begin
if (((ord(key)<48) or (ord(key) >57)) and (key<>#13) and (key<>#8) )then
begin
key:=#0;
MessageBeep(1);
  end;

end;

procedure TfrmParamDownLoadConfig.edtEdt_IMEIENDKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (((ord(key)<48) or (ord(key) >57)) and (key<>#13) and (key<>#8) )then
    begin
    key:=#0;

    end;
end;

procedure TfrmParamDownLoadConfig.edtEdt_IMEIENDChange(Sender: TObject);
var
 istart,iend:Int64;

begin
  if ((edtEdt_IMEIEND.Text)='') or ((edtEdt_IMEISTART.Text)='') then
  begin
     Exit;
  end;
  istart:=strtoint64(edtEdt_IMEISTART.Text);
  iend:=strtoint64(edtEdt_IMEIEND.Text);
  if (Length(edtEdt_IMEIEND.Text)=15) and (Length(edtEdt_IMEISTART.Text)=15) and (istart<=iend) then
  begin
    if iend=istart then
    begin
      edt_NUM.Text:='1';
    end
    else
    begin
      edt_NUM.Text:= inttostr(iend-istart+1);
    end;
  end
  else
  begin
    edt_NUM.Text:='';
  end;

end;

end.
