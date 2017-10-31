unit uAutoTestItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, MemTableDataEh, Db, MemTableEh, ExtCtrls, ActnList,
  ImgList, ComCtrls, ToolWin, GridsEh, DBGridEh,uDmMain, DBCtrls, StdCtrls,
  Mask, DBCtrlsEh, DBLookupEh, DataDriverEh, ADODB, DBActns, MemDS,
  DBAccess, Uni,Clipbrd,uGlobalVar;

type
  TfrmAutoTestItem = class(TfrmModuleForm)
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
    UniQuery_AutoTestItem: TUniQuery;
    UniQuery_AutoTestSubItem: TUniQuery;
    DS_AutoTestItem: TDataSource;
    DS_TestItemInsert: TDataSetInsert;
    intgrfldUniQuery_AutoItemId: TIntegerField;
    SFUniQuery_AutoItemItemModel: TStringField;
    SFUniQuery_AutoItemItemName: TStringField;
    UniQuery_TestModel: TUniQuery;
    SFUniQuery_TestModelIndex: TStringField;
    intgrfldUniQuery_TestModelId: TIntegerField;
    SFUniQuery_TestModelModel: TStringField;
    procedure dblklstModelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbModelChange(Sender: TObject);
    procedure Edt_ItemNameChange(Sender: TObject);
    procedure cbbCom_TestModelChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure UniQuery_AutoTestSubItemAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Edt_ItemNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniQuery_AutoTestSubItemBeforeInsert(DataSet: TDataSet);

    procedure DeleteTestItem();
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
    procedure btnModifyClick(Sender: TObject);
    procedure TB_PostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure saveOperRec;
    procedure deleteOperRec;override;
    procedure updateOperRec;
  end;

var
  frmAutoTestItem: TfrmAutoTestItem;
  sTemp :string;
  i:Integer;

  //ԭ�������޸�ǰ������
  sA : array[0..17] of string;
  sTestModel : string;  //�������еĻ���
implementation

uses uServerMain,uPublicFunc;


{$R *.dfm}
procedure TfrmAutoTestItem.FormShow(Sender: TObject);
begin
  inherited;
  {//FormCreate()����ʵ�ֵģ���FormShow()�Ĳ�������һ��
  UniQuery_TestModel.Close;
  UniQuery_AutoTestItem.Close;
  UniQuery_TestModel.Open;
  UniQuery_AutoTestItem.Open;
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

  DS_Insert.Visible:=True; }
  {DS_Edit.Visible:=True;
  DS_Module.AutoEdit:=True;
  DBGridEh1.ReadOnly:=False;
  TabSheet2.Enabled:=True;}

  UniQuery_TestModel.Close;
  UniQuery_AutoTestItem.Close;
  UniQuery_TestModel.Open;
  UniQuery_AutoTestItem.Open;
  if UniQuery_TestModel.RecordCount>0 then
  begin
    UniQuery_TestModel.First;
    cbbCom_TestModel.Items.Clear;
    cbb_SrcModel.Items.Clear;
    cbb_DstModel.Items.Clear;
    while not UniQuery_TestModel.Eof do
    begin
      cbbCom_TestModel.Items.Add(trim(UniQuery_TestModel.FieldByName('Model').AsString));
      cbb_SrcModel.Items.Add(trim(UniQuery_TestModel.FieldByName('Model').AsString));
      cbb_DstModel.Items.Add(trim(UniQuery_TestModel.FieldByName('Model').AsString));
      UniQuery_TestModel.Next;
    end;
  end;
  cbbCom_TestModel.ItemIndex:=0;
  cbbCom_TestModelChange(cbbCom_TestModel);

  DS_Insert.Visible:=True;
  {DS_Edit.Visible:=True;
  DS_Module.AutoEdit:=True;
  DBGridEh1.ReadOnly:=False;
  TabSheet2.Enabled:=True;}
  //������������Ա��Ȩ�޶����� 2014.01.22 �޽��������
  //if (User.UserType='FacSuperAdmin') then TabSheet2.Enabled := True;
end;

procedure TfrmAutoTestItem.dblklstModelKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  //if ( User.UserType='FacSuperAdmin')  then Exit; //������������Ա��Ȩ�޶����� 2014.01.22 �޽��������
  if Key=VK_DELETE  then
  begin
    if (UniQuery_AutoTestItem.RecordCount >0) and (UniQuery_AutoTestItem.RecordCount >0) then
    	DeleteTestItem;
  end;
end;

procedure TfrmAutoTestItem.cbbModelChange(Sender: TObject);
var
    strFiledValue,strTemp:string;
begin
    strFiledValue:=cbbCom_TestModel.Text;
    if strFiledValue<>'' then
    begin
        strTemp:=Format('ItemModel=''%s''',[strFiledValue]);
        UniQuery_AutoTestItem.Refresh;
        UniQuery_AutoTestItem.Filter:=strTemp;
        UniQuery_AutoTestItem.Filtered:=True;
        //UniQuery_AutoTestItem.Params.ParamByName('ItemModel').Value:=strFiledValue;
        //UniQuery_AutoTestItem.Open;
    end;
end;

procedure TfrmAutoTestItem.Edt_ItemNameChange(Sender: TObject);
var
    strTemp:string;
begin
  inherited;
     strTemp:=Format('ItemModel=''%s'' and ItemName=''%s''',
          [UniQuery_AutoTestItem.FieldByName('ItemModel').AsString,
          UniQuery_AutoTestItem.FieldByName('ItemName').AsString]);
     UniQuery_AutoTestSubItem.Refresh;
     UniQuery_AutoTestSubItem.Filter:=strTemp;
     UniQuery_AutoTestSubItem.Filtered:=True;
end;

procedure TfrmAutoTestItem.cbbCom_TestModelChange(Sender: TObject);
var
    strFiledValue:string;
begin
    strFiledValue:=cbbCom_TestModel.Text;
    if strFiledValue<>'' then
    begin
        UniQuery_AutoTestItem.Close;
        UniQuery_AutoTestItem.Params.ParamByName('ItemModel').Value:=strFiledValue;
        UniQuery_AutoTestItem.Open;
        //˵�����ҵ������ݱ��е����ݣ���ǰ�����ı�������Ļ�������Ч�� 2014.2.21
        if UniQuery_AutoTestItem.RecordCount > 0 then
           sTestModel := strFiledValue;
    end;
    Edt_ItemNameChange(Edt_ItemName);
end;

procedure TfrmAutoTestItem.btnAddClick(Sender: TObject);
begin
  inherited;
  //ֻ�е����ݱ��д��ڻ��͵�ʱ��ſ����Ƿ�Ҫ���Ӳ����� 2014.2.21
  //if (Length(sTestModel) > 0) and (CompareStr(sTestModel,Trim(cbbCom_TestModel.Text))= 0) then
  if Length(Trim(cbbCom_TestModel.Text)) > 0 then
  begin
    if Application.MessageBox('�Ƿ�Ҫ���Ӳ����','��ʾ��Ϣ',MB_YesNo+MB_IconQuestion)=IdYes then
    begin
      UniQuery_AutoTestItem.Append;
      UniQuery_AutoTestItem.FieldByName('ItemModel').Value:=cbbCom_TestModel.Text;
      UniQuery_AutoTestItem.FieldByName('ItemName').Value:=Edt_TestItemNameAdd.Text;
      UniQuery_AutoTestItem.Edit;
      UniQuery_AutoTestItem.Post;
      UniQuery_AutoTestItem.Last;
      SetOpInfo('����ɹ�');

      sTemp := '����:' + sTestModel + '/������:' + Trim(Edt_TestItemNameAdd.Text);
      InsertOperRecord(User.UserName,'���� �Զ�������Ŀ����#[' + sTemp + ']',DateTimeToStr(Now));
      Edt_TestItemNameAdd.Text:='';
    end;
  end
  else
  begin
    Application.MessageBox('���Ͳ���Ϊ�գ���ѡ��!','��ʾ��Ϣ',MB_ICONERROR);
    cbbCom_TestModel.SetFocus;
  end;
end;

procedure TfrmAutoTestItem.btnCopyClick(Sender: TObject);
var
  strTemp:string;
begin
  inherited;
  if (Length(Trim(cbb_SrcModel.Text)) > 0) and (Length(Trim(cbb_DstModel.Text)) >0) then
  begin
    if Application.MessageBox('�Ƿ�Ҫ�������ø��ƣ�','��ʾ��Ϣ��',MB_YesNo+MB_IconQuestion)=IdYes then
    begin
      with frmServerMain.spModelTestParamCopy do
      begin
        Close;
        Parameters.ParamByName('@cSrcModel').Value:=cbb_SrcModel.Text;
        Parameters.ParamByName('@cDstModel').Value:=cbb_DstModel.Text;
        ExecProc;
        strTemp:=Parameters.ParamByName('@iRecordCount').Value;
      end;
      if StrToInt(strTemp)<=0 then
      begin
        Application.MessageBox('���Բ�������ʧ��!','��Ϣ����',MB_ICONINFORMATION);
      end
      else
        Application.MessageBox('���Բ������Ƴɹ�!','��Ϣ����',MB_ICONINFORMATION);
      sTemp := '�������ÿ���:��' + Trim(cbb_SrcModel.Text) + '���Ƶ�' + Trim(cbb_DstModel.Text);
      InsertOperRecord(User.UserName,'���� �Զ�������Ŀ����#[' + sTemp + ']',DateTimeToStr(Now));
    end;
  end;
end;

procedure TfrmAutoTestItem.UniQuery_AutoTestSubItemAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('ItemModel').AsString:=cbbCom_TestModel.text;
  DataSet.FieldByName('ItemName').AsString:=Edt_ItemName.Text;
  DataSet.FieldByName('SendAtComm').Value:=True;
  DataSet.FieldByName('Compare').Value:=False;
end;

procedure TfrmAutoTestItem.Edt_ItemNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if(ssctrl in shift)and(key = Ord('X'))   then
  begin
     Key := 0;
  end;
end;

{procedure TfrmAutoTestItem.UniQuery_AutoTestSubItemAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  if (User.UserType<>'SuperAdmin') then
  begin    //������������Ա��Ȩ�޶����� 2014.01.22 �޽��������
    DS_Module.AutoEdit:=False;
    DBGridEh1.ReadOnly:=True;
    TabSheet2.Enabled:=False;
  end;
end;}

procedure TfrmAutoTestItem.UniQuery_AutoTestSubItemBeforeInsert(
  DataSet: TDataSet);
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
        if ((Components[i] as TDBEdit).Enabled) and ((Components[i] as TDBEdit).Visible) then
          (Components[i] as TDBEdit).SetFocus;
    end;
  end;
end;

procedure TfrmAutoTestItem.DeleteTestItem;
var
  sTmp : string;
begin
  if Application.MessageBox('�Ƿ�Ҫɾ����¼��','��ʾ��Ϣ��',MB_YesNo+MB_IconQuestion)=IdYes then
  begin
    sTmp := 'ɾ�� �Զ�������Ŀ����_ɾ����¼#[����:';
    sTmp := sTmp + UniQuery_AutoTestItem.fieldbyname('ItemModel').AsString + '/�Ӳ�����Ŀ:';
    sTmp := sTmp + UniQuery_AutoTestItem.fieldbyname('ItemName').AsString;
    InsertOperRecord(User.UserName,sTmp + ']',DateTimeToStr(Now));
    UniQuery_AutoTestItem.Edit;
    UniQuery_AutoTestItem.delete;
    SetOpInfo('ɾ����¼');
  end
  else
    exit;
end;

{sTemp := '����:' + Trim(Edt_TestPlanName.Text);
  if DBCheckBox2.Checked then
    sTemp := sTemp + '/�Ƚ�:��'
  else
    sTemp := sTemp + '/�Ƚ�:��';
  if Length(Trim(Edt_TestPlanDes.Text)) > 0 then
  	sTemp := sTemp + '/������:'+ Trim(Edt_TestPlanDes.Text);
  if Length(Trim(DBEdit6.Text)) > 0 then
  	sTemp := sTemp + '/����ֵ��Χ:' + Trim(DBEdit6.Text);
  if Length(Trim(DBEdit1.Text)) > 0 then
  	sTemp := sTemp	+ '/�Ӳ�����:' + Trim(DBEdit1.Text);
  if Length(Trim(DBEdit7.Text)) > 0 then
    sTemp := sTemp + '/����ֵ�ָ�:'+ Trim(DBEdit7.Text);
  if DBCheckBox1.Checked then
    sTemp := sTemp + '/����:��'
  else
    sTemp := sTemp + '/����:��';
  if Length(Trim(DBEdit8.Text)) > 0 then
  	sTemp := sTemp + '/��ע1:'+ Trim(DBEdit8.Text);
  if Length(Trim(DBEdit2.Text)) > 0 then
  	sTemp := sTemp + '/ATָ��:' + Trim(DBEdit2.Text);
  if Length(Trim(DBEdit9.Text)) > 0 then
    sTemp := sTemp+ '/��ע2:'+ Trim(DBEdit9.Text);
  if Length(Trim(DBEdit3.Text)) > 0 then
  	sTemp := sTemp+ '/AT����ֵ:' + Trim(DBEdit3.Text);
  if Length(Trim(DBEdit10.Text)) > 0 then
  	sTemp := sTemp+ '/��ע3:' + Trim(DBEdit10.Text);
  if Length(Trim(DBEdit4.Text)) > 0 then
  	sTemp := sTemp + '/AT�ط�����:' + Trim(DBEdit4.Text);
  if Length(Trim(dbedtRemark4.Text)) > 0 then
    sTemp := sTemp + '/��ע4:' + Trim(dbedtRemark4.Text);
  if Length(Trim(DBEdit5.Text)) > 0 then
    sTemp := sTemp + '/��ʱʱ��:' + Trim(DBEdit5.Text);
  if Length(Trim(dbedtRemark5.Text)) > 0 then
    sTemp := sTemp + '/��ע5:' + Trim(dbedtRemark5.Text);
  InsertOperRecord(User.UserName,'���� �Զ�������Ŀ#[' + sTemp + ']',DateTimeToStr(Now));
  TB_Refresh.Click;}
procedure TfrmAutoTestItem.saveOperRec;
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
  InsertOperRecord(User.UserName,'���� ���ز���#[' + sTemp + ']',DateTimeToStr(Now));
  TB_Refresh.Click;
end;

procedure TfrmAutoTestItem.Edt_TestPlanNameChange(Sender: TObject);
begin
  inherited;
  sA[1] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('ItemModel').AsString);
end;

procedure TfrmAutoTestItem.DBCheckBox2Click(Sender: TObject);
var
  b : Boolean;
begin
  inherited;
  b := UniQuery_AutoTestSubItem.FIeldbyname('Compare').AsBoolean;
  if b then
  	sA[2] := '��'
  else
  	sA[2] := '��';
end;

procedure TfrmAutoTestItem.Edt_TestPlanDesChange(Sender: TObject);
begin
  inherited;
  sA[3] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('ItemName').AsString);
end;

procedure TfrmAutoTestItem.DBEdit6Change(Sender: TObject);
begin
  inherited;
	sA[4] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('CompareValue').AsString);
end;

procedure TfrmAutoTestItem.DBEdit1Change(Sender: TObject);
begin
  inherited;
  sA[5] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('SubItemName').AsString);
end;

procedure TfrmAutoTestItem.DBEdit7Change(Sender: TObject);
begin
  inherited;
  sA[6] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('CompareRemark').AsString);
end;

procedure TfrmAutoTestItem.DBCheckBox1Click(Sender: TObject);
var
  b : Boolean;
begin
  inherited;
  b := UniQuery_AutoTestSubItem.FIeldbyname('SendAtComm').AsBoolean;
  if b then
  	sA[7] := '��'
  else
  	sA[7] := '��';
end;

procedure TfrmAutoTestItem.DBEdit8Change(Sender: TObject);
begin
  inherited;
  sA[8] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('Remark1').AsString);
end;

procedure TfrmAutoTestItem.DBEdit2Change(Sender: TObject);
begin
  inherited;
  sA[9] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('AtComm').AsString);
end;

procedure TfrmAutoTestItem.DBEdit9Change(Sender: TObject);
begin
  inherited;
  sA[10] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('Remark2').AsString);
end;

procedure TfrmAutoTestItem.DBEdit3Change(Sender: TObject);
begin
  inherited;
  sA[11] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('ReturnText').AsString);
end;

procedure TfrmAutoTestItem.DBEdit10Change(Sender: TObject);
begin
  inherited;
  sA[12] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('Remark3').AsString);
end;

procedure TfrmAutoTestItem.DBEdit4Change(Sender: TObject);
begin
  inherited;
  sA[13] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('ReSendNum').AsString);
end;

procedure TfrmAutoTestItem.dbedtRemark4Change(Sender: TObject);
begin
  inherited;
  sA[14] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('Remark4').AsString);
end;

procedure TfrmAutoTestItem.DBEdit5Change(Sender: TObject);
begin
  inherited;
  sA[15] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('TestTimeOut').AsString);
end;

procedure TfrmAutoTestItem.dbedtRemark5Change(Sender: TObject);
begin
  inherited;
  sA[16] := Trim(UniQuery_AutoTestSubItem.FIeldbyname('Remark5').AsString);
end;

procedure TfrmAutoTestItem.deleteOperRec;
var
  s0,s1,sTmp : string;
  b : Boolean;
begin
  s1 := UniQuery_AutoTestSubItem.fieldbyname('ItemModel').AsString;
  s0 := UniQuery_AutoTestSubItem.fieldbyname('SubItemName').AsString;
  b := DS_Delete.Execute;
  if b then
  begin
    sTmp := 'ɾ�� �Զ���������#[����:' + s1 + '/�Ӳ���������:' + s0;
  	InsertOperRecord(User.UserName, sTmp  + ']',DateTimeToStr(Now));
  end;
end;

procedure TfrmAutoTestItem.updateOperRec;
begin
  if (Length(sTestModel) > 0) and (CompareStr(sTestModel,Trim(cbbCom_TestModel.Text))= 0) then
  begin
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

procedure TfrmAutoTestItem.btnModifyClick(Sender: TObject);
begin
  inherited;
  updateOperRec;
end;

procedure TfrmAutoTestItem.TB_PostClick(Sender: TObject);
begin
  inherited;
  saveOperRec;
end;

end.
