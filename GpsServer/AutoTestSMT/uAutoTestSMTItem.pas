unit uAutoTestSMTItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, MemTableDataEh, Db, MemTableEh, ExtCtrls, ActnList,
  ImgList, ComCtrls, ToolWin, GridsEh, DBGridEh,uDmMain, DBCtrls, StdCtrls,
  Mask, DBCtrlsEh, DBLookupEh, DataDriverEh, ADODB, DBActns, MemDS,
  DBAccess, Uni,uGlobalVar;

type
  TfrmAutoTestSMTItem = class(TfrmModuleForm)
    pnl2: TPanel;
    dblklstModel: TDBLookupListBox;
    Edt_TestItemNameAdd: TEdit;
    Edt_ItemName: TDBEdit;
    Panel1: TPanel;
    btnModify: TButton;
    btnAdd: TButton;
    ActionList1: TActionList;
    ac_TestItemInsert: TAction;
    ac_TestItemDelete: TAction;
    ac_TestItemModify: TAction;
    Label1: TLabel;
    Edt_TestPlanName: TDBEdit;
    lbl2: TLabel;
    Edt_TestPlanDes: TDBEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBCheckBox2: TDBCheckBox;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    Label14: TLabel;
    dbedtRemark4: TDBEdit;
    Label15: TLabel;
    dbedtRemark5: TDBEdit;
    pnl1: TPanel;
    lbl1: TLabel;
    estResult1: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    btnCopy: TButton;
    cbb_SrcModel: TComboBox;
    cbb_DstModel: TComboBox;
    DS_AutoTestModel: TDataSource;
    cbbCom_TestModel: TComboBox;
    ActionList2: TActionList;
    DS_TestItemEdit: TDataSetEdit;
    DS_TestItemPost: TDataSetPost;
    UniQuery_AutoTestSMTItem: TUniQuery;
    UniQuery_AutoTestSMTSubItem: TUniQuery;
    DS_AutoTestItem: TDataSource;
    DS_TestItemInsert: TDataSetInsert;
    UniQuery_TestModel: TUniQuery;
    SFUniQuery_TestModelIndex: TStringField;
    intgrfldUniQuery_TestModelId: TIntegerField;
    SFUniQuery_TestModelModel: TStringField;
    intgrfldUniQuery_AutoTestSMTItemId: TIntegerField;
    SFUniQuery_AutoTestSMTItemItemModel: TStringField;
    SFUniQuery_AutoTestSMTItemItemName: TStringField;
    btnCopyFormAutoTest: TButton;

    procedure FormCreate(Sender: TObject);
    procedure dblklstModelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbModelChange(Sender: TObject);
    procedure Edt_ItemNameChange(Sender: TObject);
    procedure cbbCom_TestModelChange(Sender: TObject);

    procedure DeleteTestItem();
    procedure btnAddClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure UniQuery_AutoTestSMTSubItemAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnCopyFormAutoTestClick(Sender: TObject);
    procedure UniQuery_AutoTestSMTSubItemBeforeInsert(DataSet: TDataSet);
    procedure Edt_TestPlanNameChange(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure Edt_TestPlanDesChange(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit7Change(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure DBEdit8Change(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure DBEdit9Change(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure DBEdit10Change(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure dbedtRemark4Change(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure dbedtRemark5Change(Sender: TObject);
    procedure TB_PostClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure saveOperRec;
    procedure updateOperRec;
    procedure deleteOperRec;override;
  end;

var
  frmAutoTestSMTItem: TfrmAutoTestSMTItem;
  sTemp : string;
  Remark4Before : string; //�޸�ǰ������
  //ԭ�������޸�ǰ������
  sA : array[0..17] of string;
implementation

uses uServerMain,uPublicFunc;

{$R *.dfm}
procedure TfrmAutoTestSMTItem.FormCreate(Sender: TObject);
begin
  inherited;
    UniQuery_TestModel.Open;
    UniQuery_AutoTestSMTItem.Open;
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
    {DS_Edit.Visible:=True;
    DS_Module.AutoEdit:=True;
    DBGridEh1.ReadOnly:=False;
    TabSheet2.Enabled:=True; }
end;

procedure TfrmAutoTestSMTItem.dblklstModelKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  //if ( User.UserType='FacSuperAdmin')  then Exit;  //������������Ա��Ȩ�޶����� 2014.01.22 �޽��������
  if Key=VK_DELETE  then
  begin
    if (UniQuery_AutoTestSMTItem.RecordCount > 0) then
    	DeleteTestItem;
  end;
end;

procedure TfrmAutoTestSMTItem.cbbModelChange(Sender: TObject);
var
    strFiledValue,strTemp:string;
begin
    strFiledValue:=cbbCom_TestModel.Text;
    if strFiledValue<>'' then
    begin
        strTemp:=Format('ItemModel=''%s''',[strFiledValue]);
        UniQuery_AutoTestSMTItem.Refresh;
        UniQuery_AutoTestSMTItem.Filter:=strTemp;
        UniQuery_AutoTestSMTItem.Filtered:=True;
        //UniQuery_AutoTestItem.Params.ParamByName('ItemModel').Value:=strFiledValue;
        //UniQuery_AutoTestItem.Open;
    end;
end;

procedure TfrmAutoTestSMTItem.Edt_ItemNameChange(Sender: TObject);
var
    strTemp:string;
begin
  inherited;
   strTemp:=Format('ItemModel=''%s'' and ItemName=''%s''',
        [UniQuery_AutoTestSMTItem.FieldByName('ItemModel').AsString,
        UniQuery_AutoTestSMTItem.FieldByName('ItemName').AsString]);
   UniQuery_AutoTestSMTSubItem.Refresh;
   UniQuery_AutoTestSMTSubItem.Filter:=strTemp;
   UniQuery_AutoTestSMTSubItem.Filtered:=True;
end;

procedure TfrmAutoTestSMTItem.cbbCom_TestModelChange(Sender: TObject);
var
    strFiledValue:string;
begin
    strFiledValue:=cbbCom_TestModel.Text;
    if strFiledValue<>'' then
    begin
        UniQuery_AutoTestSMTItem.Close;
        UniQuery_AutoTestSMTItem.Params.ParamByName('ItemModel').Value:=strFiledValue;
        UniQuery_AutoTestSMTItem.Open;
    end;
    Edt_ItemNameChange(Edt_ItemName);
end;

procedure TfrmAutoTestSMTItem.DeleteTestItem();
begin
  inherited;
  if Application.MessageBox('�Ƿ�Ҫɾ����¼��','��ʾ��Ϣ��',MB_YesNo+MB_IconQuestion)=IdYes then
  begin
    InsertOperRecord(User.UserName,'ɾ�� �Զ�������Ŀ����SMT_ɾ����¼#[����:'
    									+ UniQuery_AutoTestSMTItem.fieldbyname('ItemModel').AsString
                      + '/������Ŀ:' + UniQuery_AutoTestSMTItem.fieldbyname('ItemName').AsString
                      + ']',DateTimeToStr(Now));
    UniQuery_AutoTestSMTItem.Edit;
    UniQuery_AutoTestSMTItem.delete;
    SetOpInfo('ɾ����¼');
  end
  else
    exit;
end;

procedure TfrmAutoTestSMTItem.btnAddClick(Sender: TObject);
begin
  inherited;
  if Length(Trim(cbbCom_TestModel.Text)) > 0 then
  begin
    if Application.MessageBox('�Ƿ�Ҫ���Ӳ����','��ʾ��Ϣ��',MB_YesNo+MB_IconQuestion)=IdYes then
    begin
      UniQuery_AutoTestSMTItem.Append;
      UniQuery_AutoTestSMTItem.FieldByName('ItemModel').Value:=cbbCom_TestModel.Text;
      UniQuery_AutoTestSMTItem.FieldByName('ItemName').Value:=Edt_TestItemNameAdd.Text;
      UniQuery_AutoTestSMTItem.Edit;
      UniQuery_AutoTestSMTItem.Post;
      UniQuery_AutoTestSMTItem.Last;
      SetOpInfo('����ɹ�');     //�Զ�������Ŀ����(SMT)

      sTemp := '����:' + Trim(cbbCom_TestModel.Text) + '/����������:' + Trim(Edt_TestItemNameAdd.Text);
      InsertOperRecord(User.UserName,'���� �Զ�������Ŀ����SMT#[' + sTemp + ']',DateTimeToStr(Now));
      Edt_TestItemNameAdd.Text:='';
    end;
  end
  else
  begin
    Application.MessageBox('���Ͳ���Ϊ�գ���ѡ��!','��ʾ��Ϣ',MB_ICONERROR);
    cbbCom_TestModel.SetFocus;
  end;  
end;

procedure TfrmAutoTestSMTItem.btnCopyClick(Sender: TObject);
var
    strTemp,strSrcModel,strDstModel:string;
begin
  inherited;
  if (Length(Trim(cbb_SrcModel.Text)) > 0) and (Length(Trim(cbb_DstModel.Text)) > 0) then
  begin
    if Application.MessageBox('�Ƿ�Ҫ�ӱ����ƣ�','��ʾ��Ϣ��',MB_YesNo+MB_IconQuestion)=IdYes then
    begin
      strSrcModel:=Trim(cbb_SrcModel.Text);
      strDstModel:=Trim(cbb_DstModel.Text);
      with frmServerMain.spAutoTestSMTParamCopy do
      begin
        Close;
        Parameters.ParamByName('@cSrcModel').Value:=strSrcModel;
        Parameters.ParamByName('@cDstModel').Value:=strDstModel;
        ExecProc;
        strTemp:=Parameters.ParamByName('@iRecordCount').Value;
      end;
      if StrToInt(strTemp)<=0 then
      begin
        sTemp := '�������ÿ���:��' + Trim(cbb_SrcModel.Text) + '���Ƶ�' + Trim(cbb_DstModel.Text);
        Application.MessageBox('���Բ�������ʧ��!','��Ϣ����',MB_ICONINFORMATION);
      end
      else
      begin
        sTemp := '�������ÿ���:��' + Trim(cbb_SrcModel.Text) + '���Ƶ�' + Trim(cbb_DstModel.Text);
        Application.MessageBox('���Բ������Ƴɹ�!','��Ϣ����',MB_ICONINFORMATION);
      end;
      InsertOperRecord(User.UserName,'���� �Զ�������Ŀ����(SMT)#[' + sTemp + ']',DateTimeToStr(Now));
    end;
  end
  else
  begin
    Application.MessageBox('�������ÿ�������Ϊ�գ���ѡ��!','��ʾ��Ϣ',MB_ICONERROR);
    cbb_SrcModel.SetFocus;
  end;  
end;

procedure TfrmAutoTestSMTItem.UniQuery_AutoTestSMTSubItemAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
    DataSet.FieldByName('ItemModel').AsString:=cbbCom_TestModel.text;
    DataSet.FieldByName('ItemName').AsString:=Edt_ItemName.Text;
    DataSet.FieldByName('SendAtComm').Value:=True;
    DataSet.FieldByName('Compare').Value:=False;
end;

procedure TfrmAutoTestSMTItem.FormShow(Sender: TObject);
begin
  inherited;
  UniQuery_TestModel.Close;
  UniQuery_AutoTestSMTItem.Close;
  UniQuery_TestModel.Open;
  UniQuery_AutoTestSMTItem.Open;
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
  //������������Ա��Ȩ�޶����� 2014.01.22 �޽��������
  //if (User.UserType='FacSuperAdmin') then TabSheet2.Enabled := True;
end;

procedure TfrmAutoTestSMTItem.btnCopyFormAutoTestClick(Sender: TObject);
var
  strSrcModel,strDstModel,strTemp:string;
begin
  inherited;
  if (Length(Trim(cbb_SrcModel.Text)) > 0) and (Length(Trim(cbb_DstModel.Text)) > 0) then
  begin
    if Application.MessageBox('�Ƿ�Ҫ���Զ�����λ���ƣ�','��ʾ��Ϣ��',MB_YesNo+MB_IconQuestion)=IdYes then
    begin
      strSrcModel:=Trim(cbb_SrcModel.Text);
      strDstModel:=Trim(cbb_DstModel.Text);
      with frmServerMain.spAutoTestSMTParamCopyFormAutoTest do
      begin
        Close;
        Parameters.ParamByName('@cSrcModel').Value:=strSrcModel;
        Parameters.ParamByName('@cDstModel').Value:=strDstModel;
        ExecProc;
        strTemp:=Parameters.ParamByName('@iRecordCount').Value;
      end;
      if StrToInt(strTemp)<=0 then
      begin
        sTemp := '�������ÿ���:��' + Trim(cbb_SrcModel.Text) + '���Ƶ�' + Trim(cbb_DstModel.Text);
        Application.MessageBox('���Բ�������ʧ��!','��Ϣ����',MB_ICONINFORMATION);
      end
      else
      begin
        sTemp := '�������ÿ���:��' + Trim(cbb_SrcModel.Text) + '���Ƶ�' + Trim(cbb_DstModel.Text);
        Application.MessageBox('���Բ������Ƴɹ�!','��Ϣ����',MB_ICONINFORMATION);
      end;
      InsertOperRecord(User.UserName,'���� ���ز�������#[' + sTemp + ']',DateTimeToStr(Now));
    end;
  end
  else
  begin
    Application.MessageBox('�������ÿ�������Ϊ�գ���ѡ��!','��ʾ��Ϣ',MB_ICONERROR);
    cbb_SrcModel.SetFocus;
  end;  
end;

procedure TfrmAutoTestSMTItem.UniQuery_AutoTestSMTSubItemBeforeInsert(
  DataSet: TDataSet);
var
  i:Integer;
begin
  inherited;
  DS_Module.AutoEdit:=True;
  DBGridEh1.ReadOnly:=False;
  TabSheet2.Enabled:=True;
  if PageControl1.ActivePageIndex=1 then
  begin
      for i:=0 to ComponentCount-1 do
      begin
      	if (Components[i] is TDBEdit) and ((Components[i] as TDBEdit).TabOrder=0) then
          if ((Components[i] as TDBEdit).Enabled)and ((Components[i] as TDBEdit).Visible) then
              (Components[i] as TDBEdit).SetFocus;
      end;
  end;
end;

{procedure TfrmAutoTestSMTItem.UniQuery_AutoTestSMTSubItemAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  //������������Ա��Ȩ�޶����� 2014.01.22 �޽��������
  if ( User.UserType='SuperAdmin')or(User.UserType='FacSuperAdmin')  then
  begin
    DS_Module.AutoEdit:=True;;
    DBGridEh1.ReadOnly:=False;
    TabSheet2.Enabled:=True;
  end
  else
  begin
    DS_Module.AutoEdit:=False;
    DBGridEh1.ReadOnly:=True;
    TabSheet2.Enabled:=False;
  end;
end;}

procedure TfrmAutoTestSMTItem.saveOperRec;
var
  i : Integer;
begin
  sTemp := '����:' + Trim(Edt_TestPlanName.Text);
  if DBCheckBox2.Checked then
    sTemp := sTemp + '/�Ƚ�:Y'
  else
    sTemp := sTemp + '/���Ƚ�:N';

  if Length(Trim(Edt_TestPlanDes.Text)) > 0 then
    sTemp := sTemp + '/������:'+ Trim(Edt_TestPlanDes.Text);

  if ansicomparestr(Trim(DBEdit6.Text),sA[4])<>0 then
  begin
    if Length(Trim(DBEdit6.Text)) > 0 then
    begin
      if Length(sA[4]) > 0 then
      	sTemp := sTemp +'/���ط�Χ:' + Trim(DBEdit6.Text)+ '(��)' + sA[4] + '(ǰ)'
    	else
        sTemp := sTemp +'/���ط�Χ:' + Trim(DBEdit6.Text);
    end
    else
    begin
      if Length(sA[4]) > 0 then
    		sTemp := sTemp +'/���ط�Χ:' + sA[4] + '(ǰ)';
    end;
  end;
  if ansicomparestr(Trim(DBEdit1.Text),sA[5])<>0 then
  begin
    if Length(Trim(DBEdit1.Text)) > 0 then
    begin
      if Length(sA[5]) > 0 then
      	sTemp := sTemp + '/�Ӳ�����:'+ Trim(DBEdit1.Text)+ '(��)' + sA[5] + '(ǰ)'
      else
      	sTemp := sTemp + '/�Ӳ�����:'+ Trim(DBEdit1.Text);
    end
    else
    begin
      if Length(sA[5]) > 0 then
        sTemp := sTemp + sA[5] + '(ǰ)';
    end;  
  end;
  if ansicomparestr(Trim(DBEdit7.Text),sA[6])<>0 then
  begin
    if Length(Trim(DBEdit7.Text)) > 0 then
    begin
      if Length(sA[6]) > 0 then
      	sTemp := sTemp +'/�ָ�����:'+ Trim(DBEdit7.Text) + '(��)' + sA[6] + '(ǰ)'
      else
      	sTemp := sTemp +'/�ָ�����:'+ Trim(DBEdit7.Text);
    end
    else
    begin
      if Length(sA[6]) > 0 then
        sTemp := sTemp + sA[6] + '(ǰ)';
    end;  
  end;
  if DBCheckBox1.Checked then
    sTemp := sTemp + '/����AT:Y'
  else
    sTemp := sTemp + '/������AT:N';
  if ansicomparestr(Trim(DBEdit8.Text),sA[8])<>0 then  //�����и�ʱ�ż�¼��������
  begin
    if Length(Trim(DBEdit8.Text)) > 0 then
    begin
      if Length(sA[8]) > 0 then
        sTemp := sTemp + '/��ע1:'+ Trim(DBEdit8.Text) + '(��)' + sA[8] + '(ǰ)'
      else
        sTemp := sTemp + '/��ע1:'+ Trim(DBEdit8.Text);
    end
    else
    begin
      if Length(sA[8]) > 0 then
        sTemp := sTemp + '/��ע1:'+  sA[8] + '(ǰ)';
    end;
  end;
  if ansicomparestr(Trim(DBEdit2.Text),sA[9])<>0 then
  begin
    if Length(Trim(DBEdit2.Text)) > 0 then
    begin
      if Length(sA[9]) > 0 then
      	sTemp := sTemp + '/ATָ��:'+ Trim(DBEdit2.Text)+ '(��)' + sA[9] + '(ǰ)'
      else
      	sTemp := sTemp + '/ATָ��:'+ Trim(DBEdit2.Text);
    end
    else
    begin
      if Length(sA[9]) > 0 then
        sTemp := sTemp + '/ATָ��:' + sA[9] + '(ǰ)';
    end;  
  end;
  if ansicomparestr(Trim(DBEdit9.Text),sA[10])<>0 then
  begin
    if Length(Trim(DBEdit9.Text)) > 0 then
    begin
      if Length(sA[10]) > 0 then
      	sTemp := sTemp + '/��ע2:' + Trim(DBEdit9.Text) + '(��)' + sA[10] + '(ǰ)'
      else
      	sTemp := sTemp + '/��ע2:' + Trim(DBEdit9.Text);
    end
    else
    begin
      if Length(sA[10]) > 0 then
        sTemp := sTemp + sA[10] + '(ǰ)';
    end;  
  end;
  if ansicomparestr(Trim(DBEdit3.Text),sA[11])<>0 then
  begin
    if Length(Trim(DBEdit3.Text)) > 0 then
    begin
      if Length(sA[11]) > 0 then
      	sTemp := sTemp + '/AT����ֵ:'+ Trim(DBEdit3.Text) + '(��)' + sA[11] + '(ǰ)'
      else
      	sTemp := sTemp + '/AT����ֵ:'+ Trim(DBEdit3.Text);
    end
    else
    begin
      if Length(sA[11]) > 0 then
      	sTemp := sTemp + sA[11] + '(ǰ)';
    end;  
  end;
  if ansicomparestr(Trim(DBEdit10.Text),sA[12])<>0 then
  begin
    if Length(Trim(DBEdit10.Text)) > 0 then
    begin
      if Length(sA[12]) > 0 then
      	sTemp := sTemp + '/��ע3:' + Trim(DBEdit10.Text) + '(��)' + sA[12] + '(ǰ)'
      else
      	sTemp := sTemp + '/��ע3:' + Trim(DBEdit10.Text);
    end
    else
    begin
      if Length(sA[12]) > 0 then
        sTemp := sTemp + '/��ע3:' + sA[12] + '(ǰ)'
    end;  
  end;
  if ansicomparestr(Trim(DBEdit4.Text),sA[13])<>0 then
  begin
    if Length(Trim(DBEdit4.Text)) > 0 then
    begin
      if Length(sA[13]) > 0 then
      	sTemp := sTemp + '/AT�ط�����:' + Trim(DBEdit4.Text) + '(��)' + sA[13] + '(ǰ)'
      else
      	sTemp := sTemp + '/AT�ط�����:' + Trim(DBEdit4.Text);
    end
    else
    begin
      if Length(sA[13]) > 0 then
        sTemp := sTemp + sA[13] + '(ǰ)';
    end;  
  end;
  if ansicomparestr(Trim(dbedtRemark4.Text),sA[14])<>0 then
  begin
    if Length(Trim(dbedtRemark4.Text)) > 0 then
    begin
      if Length(sA[14]) > 0 then
      	sTemp := sTemp + '/��ע4:'+ Trim(dbedtRemark4.Text) + '(��)' + sA[14] + '(ǰ)'
      else
      	sTemp := sTemp + '/��ע4:'+ Trim(dbedtRemark4.Text);
    end
    else
    begin
      if Length(sA[14]) > 0 then
        sTemp := sTemp + sA[14] + '(ǰ)';
    end;  
  end;
  if ansicomparestr(Trim(DBEdit5.Text),sA[15])<>0 then
  begin
    if Length(Trim(DBEdit5.Text)) > 0 then
    begin
      if Length(sA[15]) > 0 then
      	sTemp := sTemp + '/��ʱ:' + Trim(DBEdit5.Text) + '(��)' + sA[15] + '(ǰ)'
      else
      	sTemp := sTemp + '/��ʱ:' + Trim(DBEdit5.Text);
    end
    else
    begin
      if Length(sA[15]) > 0 then
        sTemp := sTemp + sA[15] + '(ǰ)';
    end;
  end;
  if ansicomparestr(Trim(dbedtRemark5.Text),sA[16])<>0 then
  begin
    if Length(Trim(dbedtRemark5.Text)) > 0 then
    begin
      if Length(sA[16]) > 0 then
      	sTemp := sTemp + '/��ע5:' + Trim(dbedtRemark5.Text) + '(��)' + sA[16] + '(ǰ)'
      else
      	sTemp := sTemp + '/��ע5:' + Trim(dbedtRemark5.Text);
    end
    else
    begin
      if Length(sA[16]) > 0 then
        sTemp := sTemp + sA[16] + '(ǰ)';
    end;  
  end;
  for i := 1 to 16 do
  begin
    sA[i] := '';
  end;
  InsertOperRecord(User.UserName,'���� �Զ�������Ŀ����(SMT)#[' + sTemp + ']',DateTimeToStr(Now));
  TB_Refresh.Click;
end;

procedure TfrmAutoTestSMTItem.Edt_TestPlanNameChange(Sender: TObject);
begin
  inherited;
  sA[1] := Trim(UniQuery_AutoTestSMTSubItem.FIeldbyname('ItemModel').AsString);
end;

procedure TfrmAutoTestSMTItem.DBCheckBox2Click(Sender: TObject);
var
  b : Boolean;
begin
  inherited;
  b := UniQuery_AutoTestSMTSubItem.FIeldbyname('Compare').AsBoolean;
  if b  then
  	sA[2] := '��'
  else
  	sA[2] := '��';
end;

procedure TfrmAutoTestSMTItem.Edt_TestPlanDesChange(Sender: TObject);
begin
  inherited;
  sA[3] := Trim(UniQuery_AutoTestSMTSubItem.FIeldbyname('ItemName').AsString);
end;

procedure TfrmAutoTestSMTItem.DBEdit6Change(Sender: TObject);
begin
  inherited;
  sA[4] := Trim(UniQuery_AutoTestSMTSubItem.FIeldbyname('CompareValue').AsString);
end;

procedure TfrmAutoTestSMTItem.DBEdit1Change(Sender: TObject);
begin
  inherited;
  sA[5] := Trim(UniQuery_AutoTestSMTSubItem.FIeldbyname('SubItemName').AsString);
end;

procedure TfrmAutoTestSMTItem.DBEdit7Change(Sender: TObject);
begin
  inherited;
  sA[6] := Trim(UniQuery_AutoTestSMTSubItem.FIeldbyname('CompareRemark').AsString);
end;

procedure TfrmAutoTestSMTItem.DBCheckBox1Click(Sender: TObject);
var
  b : Boolean;
begin
  inherited;
  b := UniQuery_AutoTestSMTSubItem.FIeldbyname('SendAtComm').AsBoolean;
  if b  then
  	sA[7] := '��'
  else
  	sA[7] := '��';
end;

procedure TfrmAutoTestSMTItem.DBEdit8Change(Sender: TObject);
begin
  inherited;
  sA[8] := Trim(UniQuery_AutoTestSMTSubItem.FIeldbyname('Remark1').AsString);
end;

procedure TfrmAutoTestSMTItem.DBEdit2Change(Sender: TObject);
begin
  inherited;
  sA[9] := Trim(UniQuery_AutoTestSMTSubItem.FIeldbyname('AtComm').AsString);
end;

procedure TfrmAutoTestSMTItem.DBEdit9Change(Sender: TObject);
begin
  inherited;
  sA[10] := Trim(UniQuery_AutoTestSMTSubItem.FIeldbyname('Remark2').AsString);
end;

procedure TfrmAutoTestSMTItem.DBEdit3Change(Sender: TObject);
begin
  inherited;
  sA[11] := Trim(UniQuery_AutoTestSMTSubItem.FIeldbyname('ReturnText').AsString);
end;

procedure TfrmAutoTestSMTItem.DBEdit10Change(Sender: TObject);
begin
  inherited;
  sA[12] := Trim(UniQuery_AutoTestSMTSubItem.FIeldbyname('Remark3').AsString);
end;

procedure TfrmAutoTestSMTItem.DBEdit4Change(Sender: TObject);
begin
  inherited;
  sA[13] := Trim(UniQuery_AutoTestSMTSubItem.FIeldbyname('ReSendNum').AsString);
end;

procedure TfrmAutoTestSMTItem.dbedtRemark4Change(Sender: TObject);
begin
  inherited;
  sA[14] := Trim(UniQuery_AutoTestSMTSubItem.FIeldbyname('Remark4').AsString);
end;

procedure TfrmAutoTestSMTItem.DBEdit5Change(Sender: TObject);
begin
  inherited;
  sA[15] := Trim(UniQuery_AutoTestSMTSubItem.FIeldbyname('TestTimeOut').AsString);
end;

procedure TfrmAutoTestSMTItem.dbedtRemark5Change(Sender: TObject);
begin
  inherited;
  sA[16] := Trim(UniQuery_AutoTestSMTSubItem.FIeldbyname('Remark5').AsString);
end;

procedure TfrmAutoTestSMTItem.updateOperRec;
var
  sTestModel : string;
begin
  if UniQuery_AutoTestSMTItem.RecordCount > 0 then
  begin
    if Length(Trim(cbbCom_TestModel.Text)) > 0 then
    begin
      sTestModel := Trim(cbbCom_TestModel.Text);
      sTemp := '����:' + sTestModel + '/������:' + Trim(Edt_ItemName.Text);
      InsertOperRecord(User.UserName,'�޸� �Զ�������Ŀ����#[' + sTemp + ']',DateTimeToStr(Now));
      Application.MessageBox('�������޸ĳɹ���','��ʾ��Ϣ',MB_YesNo+MB_IconQuestion);
    end
    else
    begin
      Application.MessageBox('��ѡ�����!','��ʾ��Ϣ',MB_ICONERROR);
      cbbCom_TestModel.SetFocus;
    end;
  end;
end;

procedure TfrmAutoTestSMTItem.deleteOperRec;
var
  s0,s1,sTmp : string;
  b : Boolean;
begin
  inherited;
  s0 := UniQuery_AutoTestSMTSubItem.fieldbyname('SubItemName').AsString;
  s1 := UniQuery_AutoTestSMTSubItem.fieldbyname('ItemModel').AsString;
  b := DS_Delete.Execute;
  if b then
  begin
    sTmp := 'ɾ�� ɾ���Զ�������Ŀ����(SMT)#[����:'+ s1+ '/�Ӳ���������:' + s0 + ']' ;
    InsertOperRecord(User.UserName,sTmp,DateTimeToStr(Now));
  end;
end;

procedure TfrmAutoTestSMTItem.TB_PostClick(Sender: TObject);
begin
  inherited;
  saveOperRec;
end;

procedure TfrmAutoTestSMTItem.btnModifyClick(Sender: TObject);
begin
  inherited;
  updateOperRec;
end;

end.
