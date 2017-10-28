unit uWriteImei;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, ExtCtrls, DB, DBActns, ActnList, ImgList, ComCtrls,
  ToolWin, GridsEh, DBGridEh, StdCtrls, DBCtrls, MemDS, DBAccess, Uni, Mask;

type
  TfrmWriteImei = class(TfrmModuleForm)
    pnlResult1: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    btnCopy: TButton;
    cbb_SrcModel: TComboBox;
    cbb_DstModel: TComboBox;
    btnCopyFormAutoTest: TButton;
    pnl2: TPanel;
    dblklstModel: TDBLookupListBox;
    pnl3: TPanel;
    Edt_ItemName: TDBEdit;
    Edt_TestItemNameAdd: TEdit;
    btnModify: TButton;
    btnAdd: TButton;
    pnl1: TPanel;
    lbl1: TLabel;
    cbbCom_TestModel: TComboBox;
    DS_WriteImeiItem: TDataSource;
    UniQuery_WriteImeiItem: TUniQuery;
    DS_AutoTestModel1: TDataSource;
    UniQuery_TestModel: TUniQuery;
    strngfldSFUniQuery_TestModelIndex: TStringField;
    intgrfldUniQuery_TestModelId: TIntegerField;
    strngfldSFUniQuery_TestModelModel: TStringField;
    UniQuery_WriteImeiSubItem: TUniQuery;
    Edt_TestPlanName: TDBEdit;
    Edt_TestPlanDes: TDBEdit;
    dbedtSubItemName: TDBEdit;
    lbl5: TLabel;
    lbl2: TLabel;
    lbl6: TLabel;
    dbchkSendAtComm: TDBCheckBox;
    lbl7: TLabel;
    lbl8: TLabel;
    dbedtAtComm: TDBEdit;
    lbl9: TLabel;
    dbedtReturnText: TDBEdit;
    lbl10: TLabel;
    dbedtReSendNum: TDBEdit;
    lbl11: TLabel;
    dbedtTestTimeOut: TDBEdit;
    lbl12: TLabel;
    dbchkCompare: TDBCheckBox;
    lbl13: TLabel;
    dbedtRemark1: TDBEdit;
    lbl14: TLabel;
    dbedtRemark2: TDBEdit;
    intgrfldUniQuery_WriteImeiItemId: TIntegerField;
    strngfldUniQuery_WriteImeiItemItemModel: TStringField;
    strngfldUniQuery_WriteImeiItemItemName: TStringField;
    UniQuery_WriteImeiItem_MASK_FROM_V2: TBytesField;
    lbl17: TLabel;
    dbedtRemark3: TDBEdit;
    lbl18: TLabel;
    dbedtRemark4: TDBEdit;
    lbl19: TLabel;
    dbedtRemark5: TDBEdit;
    lbl16: TLabel;
    dbedtCompareRemark: TDBEdit;
    lbl15: TLabel;
    dbedtCompareValue: TDBEdit;
    UniQuery_WriteImeiSubItemId: TIntegerField;
    strngfldUniQuery_WriteImeiSubItemItemModel: TStringField;
    strngfldUniQuery_WriteImeiSubItemItemName: TStringField;
    strngfldUniQuery_WriteImeiSubItemSubItemName: TStringField;
    UniQuery_WriteImeiSubItemSendAtComm: TBooleanField;
    strngfldUniQuery_WriteImeiSubItemAtComm: TStringField;
    strngfldUniQuery_WriteImeiSubItemReturnText: TStringField;
    UniQuery_WriteImeiSubItemReSendNum: TIntegerField;
    UniQuery_WriteImeiSubItemTestTimeOut: TIntegerField;
    UniQuery_WriteImeiSubItemCompare: TBooleanField;
    strngfldUniQuery_WriteImeiSubItemCompareValue: TStringField;
    strngfldUniQuery_WriteImeiSubItemCompareRemark: TStringField;
    UniQuery_WriteImeiSubItemRemark1: TWideStringField;
    UniQuery_WriteImeiSubItemRemark2: TWideStringField;
    strngfldUniQuery_WriteImeiSubItemRemark3: TStringField;
    strngfldUniQuery_WriteImeiSubItemRemark4: TStringField;
    strngfldUniQuery_WriteImeiSubItemRemark5: TStringField;
    UniQuery_WriteImeiSubItem_MASK_FROM_V2: TBytesField;
    procedure FormCreate(Sender: TObject);
    procedure cbbCom_TestModelChange(Sender: TObject);
    procedure Edt_ItemNameChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure dbedtSubItemNameChange(Sender: TObject);
    procedure dblklstModelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCopyClick(Sender: TObject);
    procedure btnCopyFormAutoTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
         procedure DeleteTestItem();
  end;

var
  frmWriteImei: TfrmWriteImei;
    sTemp : string;

implementation
uses uPublicFunc,uServerMain,uGlobalVar;
{$R *.dfm}

procedure TfrmWriteImei.FormCreate(Sender: TObject);
begin
  inherited;
    UniQuery_TestModel.Open;
    UniQuery_WriteImeiItem.Open;
    if UniQuery_TestModel.RecordCount>0 then
    begin
        UniQuery_TestModel.First;
        cbbCom_TestModel.Items.Clear;
        cbb_SrcModel.Items.Clear;
        cbb_DstModel.Items.Clear;
        while not UniQuery_TestModel.Eof do
        begin
            cbbCom_TestModel.Items.Add(UniQuery_TestModel.FieldByName('Model').AsString);
            cbb_SrcModel.Items.Add(UniQuery_TestModel.FieldByName('Model').AsString);
            cbb_DstModel.Items.Add(UniQuery_TestModel.FieldByName('Model').AsString);
            UniQuery_TestModel.Next;
        end;
    end;
    cbbCom_TestModel.ItemIndex:=0;
    cbbCom_TestModelChange(cbbCom_TestModel);

    DS_Insert.Visible:=True;
end;

procedure TfrmWriteImei.cbbCom_TestModelChange(Sender: TObject);
var
strFiledValue:string;
begin
    strFiledValue:=cbbCom_TestModel.Text;
    if strFiledValue<>'' then
    begin
        UniQuery_WriteImeiItem.Close;
        UniQuery_WriteImeiItem.Params.ParamByName('ItemModel').Value:=strFiledValue;
        UniQuery_WriteImeiItem.Open;
    end;
    Edt_ItemNameChange(Edt_ItemName);
end;
procedure TfrmWriteImei.Edt_ItemNameChange(Sender: TObject);
var
    strTemp:string;
begin
  inherited;
{   strTemp:=Format('ItemModel=''%s'' and ItemName=''%s''',
        [UniQuery_WriteImeiItem.FieldByName('ItemModel').AsString,
        UniQuery_WriteImeiItem.FieldByName('ItemName').AsString]);
   UniQuery_WriteImeiSubItem.Refresh;
   UniQuery_WriteImeiSubItem.Filter:=strTemp;
   UniQuery_WriteImeiSubItem.Filtered:=True; }

   strTemp:=Format('ItemModel=''%s'' and ItemName=''%s''',
        [cbbCom_TestModel.Text,Edt_ItemName.Text]);
   UniQuery_WriteImeiSubItem.SQL.Clear;
   UniQuery_WriteImeiSubItem.SQL.Text:='select * from Gps_WriteImei_SubItem where ' +strTemp;
   //unqry_OQCSubItem.Params.ParamByName('ItemModel').Value:=cbbCom_TestModel.Text;
   //     unqry_OQCSubItem.Open;
   UniQuery_WriteImeiSubItem.ExecSQL;

   Edt_TestPlanName.Text:=cbbCom_TestModel.Text;
   Edt_TestPlanDes.Text:=Edt_ItemName.Text;
   dbedtSubItemName.Text:=UniQuery_WriteImeiSubItem.FieldByName('SubItemName').AsString;
   dbchkSendAtComm.Checked:=UniQuery_WriteImeiSubItem.FieldByName('SendAtComm').AsBoolean;
   dbedtAtComm.Text:=UniQuery_WriteImeiSubItem.FieldByName('AtComm').AsString;
   dbedtReturnText.Text:= UniQuery_WriteImeiSubItem.FieldByName('ReturnText').AsString;
   dbedtReSendNum.Text:=UniQuery_WriteImeiSubItem.FieldByName('ReSendNum').AsString;
   dbedtTestTimeOut.Text:= UniQuery_WriteImeiSubItem.FieldByName('TestTimeOut').AsString;
   dbchkCompare.Checked:= UniQuery_WriteImeiSubItem.FieldByName('Compare').AsBoolean;
   dbedtRemark1.Text:=UniQuery_WriteImeiSubItem.FieldByName('Remark1').AsString;
   dbedtRemark2.Text:= UniQuery_WriteImeiSubItem.FieldByName('Remark2').AsString;

end;
procedure TfrmWriteImei.btnAddClick(Sender: TObject);
begin
  inherited;
    if Length(Trim(cbbCom_TestModel.Text)) > 0 then
  begin
    if Application.MessageBox('是否要增加测试项？','提示信息！',MB_YesNo+MB_IconQuestion)=IdYes then
    begin
      UniQuery_WriteImeiItem.Append;
      UniQuery_WriteImeiItem.FieldByName('ItemModel').Value:=cbbCom_TestModel.Text;
      UniQuery_WriteImeiItem.FieldByName('ItemName').Value:=Edt_TestItemNameAdd.Text;
      UniQuery_WriteImeiItem.Edit;
      UniQuery_WriteImeiItem.Post;
      UniQuery_WriteImeiItem.Last;
      SetOpInfo('保存成功');     //自动测试项目设置(SMT)

      sTemp := '机型:' + Trim(cbbCom_TestModel.Text) + '/测试项名称:' + Trim(Edt_TestItemNameAdd.Text);
      InsertOperRecord(User.UserName,'增加 自动测试项目设置SMT#[' + sTemp + ']',DateTimeToStr(Now));
      Edt_TestItemNameAdd.Text:='';
    end;
  end
  else
  begin
    Application.MessageBox('机型不能为空，请选择!','提示信息',MB_ICONERROR);
    cbbCom_TestModel.SetFocus;
  end;
end;

procedure TfrmWriteImei.dbedtSubItemNameChange(Sender: TObject);
begin
  inherited;
   Edt_TestPlanName.Text:=cbbCom_TestModel.Text;
   Edt_TestPlanDes.Text:=Edt_ItemName.Text;
end;

procedure TfrmWriteImei.dblklstModelKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  //if ( User.UserType='FacSuperAdmin')  then Exit;  //工厂超级管理员的权限都开放 2014.01.22 罗金美提议的
  if Key=VK_DELETE  then
  begin
    if (UniQuery_WriteImeiItem.RecordCount> 0) then
    	DeleteTestItem;
  end;

end;

procedure TfrmWriteImei.DeleteTestItem();
begin
  inherited;
  if Application.MessageBox('是否要删除记录？','提示信息！',MB_YesNo+MB_IconQuestion)=IdYes then
  begin
    {InsertOperRecord(User.UserName,'删除 自动测试项目设置SMT_删除记录#[机型:'
    									+ unqry_OQCItem.fieldbyname('ItemModel').AsString
                      + '/测试项目:' + unqry_OQCItem.fieldbyname('ItemName').AsString
                      + ']',DateTimeToStr(Now));    }
    UniQuery_WriteImeiItem.Edit;
    UniQuery_WriteImeiItem.delete;
    //SetOpInfo('删除记录');
  end
  else
    exit;
end;


procedure TfrmWriteImei.btnCopyClick(Sender: TObject);
var
    strTemp,strSrcModel,strDstModel:string;
begin
  inherited;
  if (Length(Trim(cbb_SrcModel.Text)) > 0) and (Length(Trim(cbb_DstModel.Text)) > 0) then
  begin
    if Application.MessageBox('是否要从本表复制？','提示信息！',MB_YesNo+MB_IconQuestion)=IdYes then
    begin
      strSrcModel:=Trim(cbb_SrcModel.Text);
      strDstModel:=Trim(cbb_DstModel.Text);
      with frmServerMain.spWriteImeiParamCopy do
      begin
        Close;
        Parameters.ParamByName('@cSrcModel').Value:=strSrcModel;
        Parameters.ParamByName('@cDstModel').Value:=strDstModel;
        ExecProc;
        strTemp:=Parameters.ParamByName('@iRecordCount').Value;
      end;
      if StrToInt(strTemp)<=0 then
      begin
        sTemp := '机型设置拷贝:从' + Trim(cbb_SrcModel.Text) + '复制到' + Trim(cbb_DstModel.Text);
        Application.MessageBox('测试参数复制失败!','信息警告',MB_ICONINFORMATION);
      end
      else
      begin
        sTemp := '机型设置拷贝:从' + Trim(cbb_SrcModel.Text) + '复制到' + Trim(cbb_DstModel.Text);
        Application.MessageBox('测试参数复制成功!','信息警告',MB_ICONINFORMATION);
      end;
      InsertOperRecord(User.UserName,'复制 烧写IMEI项目#[' + sTemp + ']',DateTimeToStr(Now));
    end;
  end
  else
  begin
    Application.MessageBox('机型设置拷贝不能为空，请选择!','提示信息',MB_ICONERROR);
    cbb_SrcModel.SetFocus;
  end;
end;

procedure TfrmWriteImei.btnCopyFormAutoTestClick(Sender: TObject);
var
  strSrcModel,strDstModel,strTemp:string;
begin
 if (Length(Trim(cbb_SrcModel.Text)) > 0) and (Length(Trim(cbb_DstModel.Text)) > 0) then
  begin
    if Application.MessageBox('是否要从自动测试位表复制？','提示信息！',MB_YesNo+MB_IconQuestion)=IdYes then
    begin
      strSrcModel:=Trim(cbb_SrcModel.Text);
      strDstModel:=Trim(cbb_DstModel.Text);
      with frmServerMain.spTestParamFormAutoTest do
      begin
        Close;
        Parameters.ParamByName('@cFormName').Value:='Gps_WriteImei';
        Parameters.ParamByName('@cSrcModel').Value:=strSrcModel;
        Parameters.ParamByName('@cDstModel').Value:=strDstModel;
        ExecProc;
        strTemp:=Parameters.ParamByName('@iRecordCount').Value;
      end;
      if StrToInt(strTemp)<=0 then
      begin
        sTemp := '机型设置拷贝:从' + Trim(cbb_SrcModel.Text) + '复制到' + Trim(cbb_DstModel.Text);
        Application.MessageBox('测试参数复制失败!','信息警告',MB_ICONINFORMATION);
      end
      else
      begin
        sTemp := '机型设置拷贝:从' + Trim(cbb_SrcModel.Text) + '复制到' + Trim(cbb_DstModel.Text);
        Application.MessageBox('测试参数复制成功!','信息警告',MB_ICONINFORMATION);
      end;
      InsertOperRecord(User.UserName,'复制 参数设置#[' + sTemp + ']',DateTimeToStr(Now));
    end;
  end
  else
  begin
    Application.MessageBox('机型设置拷贝不能为空，请选择!','提示信息',MB_ICONERROR);
    cbb_SrcModel.SetFocus;
  end;

end;

end.
