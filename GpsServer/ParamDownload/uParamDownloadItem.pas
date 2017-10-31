unit uParamDownloadItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, MemTableDataEh, Db, MemTableEh, ExtCtrls, ActnList,
  ImgList, ComCtrls, ToolWin, GridsEh, DBGridEh, DBCtrlsEh, DBLookupEh,
  StdCtrls, Mask, DBCtrls, DataDriverEh, ADODB,uDmMain, DBActns, MemDS,
  DBAccess, Uni,uGlobalVar;

type
  TfrmParamDownloadItem = class(TfrmModuleForm)
    pnl2: TPanel;
    dblklstModel: TDBLookupListBox;
    Panel1: TPanel;
    Edt_ItemName: TDBEdit;
    Edt_TestItemNameAdd: TEdit;
    btnModify: TButton;
    btnAdd: TButton;
    pnl1: TPanel;
    lbl1: TLabel;
    estResult1: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    btnCopy: TButton;
    cbb_SrcModel: TComboBox;
    cbb_DstModel: TComboBox;
    DS_AutoTestModel: TDataSource;
    dbedtRemark5: TDBEdit;
    dbedtRemark4: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit7: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Edt_TestPlanDes: TDBEdit;
    Edt_TestPlanName: TDBEdit;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    lbl2: TLabel;
    Label1: TLabel;
    ActionList1: TActionList;
    ac_TestItemInsert: TAction;
    ac_TestItemDelete: TAction;
    ac_TestItemModify: TAction;
    cbbCom_TestModel: TComboBox;
    UniQuery_ParamDownloadItem: TUniQuery;
    intgrfldUniQuery_AutoItemId: TIntegerField;
    SFUniQuery_AutoItemItemModel: TStringField;
    SFUniQuery_AutoItemItemName: TStringField;
    DS_ParamDownloadItem: TDataSource;
    UniQuery_ParamDownloadSubItem: TUniQuery;
    UniQuery_TestModel: TUniQuery;
    SFUniQuery_TestModelIndex: TStringField;
    intgrfldUniQuery_TestModelId: TIntegerField;
    SFUniQuery_TestModelModel: TStringField;
    ActionList2: TActionList;
    DS_TestItemEdit: TDataSetEdit;
    DS_TestItemPost: TDataSetPost;
    DS_TestItemInsert: TDataSetInsert;
    DS_TestItemDelete: TDataSetDelete;

    procedure FormCreate(Sender: TObject);
    procedure dblklstModelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbModelChange(Sender: TObject);
    procedure Edt_ItemNameChange(Sender: TObject);
    procedure cbbCom_TestModelChange(Sender: TObject);

    procedure DeleteTestItem();
    procedure btnAddClick(Sender: TObject);         //����������Ŀ
    procedure btnCopyClick(Sender: TObject);
    procedure UniQuery_ParamDownloadSubItemAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Edt_TestPlanNameChange(Sender: TObject);
    procedure Edt_TestPlanDesChange(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit7Change(Sender: TObject);
    procedure DBEdit8Change(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure DBEdit9Change(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure DBEdit10Change(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure dbedtRemark4Change(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure dbedtRemark5Change(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure TB_PostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure saveOperRecd;
    procedure deleteOperRec;override;
    procedure updateOperRec;
  end;

var
  frmParamDownloadItem: TfrmParamDownloadItem;
var
  sTemp : string;
  //ԭ�������޸�ǰ������
  //sA1,sA2,sA3,sA4,sA5,sA6,sA7,sA8,sA9,sA10,sA11,sA12,sA13,sA14,sA15,sA16 : string;
  sA : array[0..17] of string;
implementation

uses uServerMain,uPublicFunc;

{$R *.dfm}
procedure TfrmParamDownloadItem.FormCreate(Sender: TObject);
begin
  inherited;
    UniQuery_TestModel.Close;
    UniQuery_ParamDownloadItem.Close;
    UniQuery_TestModel.Open;
    UniQuery_ParamDownloadItem.Open;
    //�����Ի��ͼ����б�
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

    {DS_Insert.Visible:=True;
    DS_Edit.Visible:=True;
    DS_Module.AutoEdit:=True;
    DBGridEh1.ReadOnly:=False;
    TabSheet2.Enabled:=True;}
end;

procedure TfrmParamDownloadItem.dblklstModelKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  //if ( User.UserType='FacSuperAdmin')  then Exit; //������������Ա��Ȩ�޶����� 2014.01.22 �޽��������
  if Key=VK_DELETE  then
  begin
    if UniQuery_ParamDownloadItem.RecordCount > 0 then
  	DeleteTestItem();
  end;
end;

procedure TfrmParamDownloadItem.cbbModelChange(Sender: TObject);
var
    strFiledValue,strTemp:string;
begin
    strFiledValue:=cbbCom_TestModel.Text;
    if strFiledValue<>'NULL' then
    begin
        strTemp:=Format('ItemModel=''%s''',[strFiledValue]);
        UniQuery_ParamDownloadItem.Refresh;
        UniQuery_ParamDownloadItem.Filter:=strTemp;
        UniQuery_ParamDownloadItem.Filtered:=True;
    end;
end;

procedure TfrmParamDownloadItem.Edt_ItemNameChange(Sender: TObject);
var
    strTemp:string;
begin
  inherited;
   strTemp:=Format('ItemModel=''%s'' and ItemName=''%s''',
        [UniQuery_ParamDownloadItem.FieldByName('ItemModel').AsString,
        UniQuery_ParamDownloadItem.FieldByName('ItemName').AsString]);
   UniQuery_ParamDownloadSubItem.Refresh;
   UniQuery_ParamDownloadSubItem.Filter:=strTemp;
   UniQuery_ParamDownloadSubItem.Filtered:=True;
end;

procedure TfrmParamDownloadItem.cbbCom_TestModelChange(Sender: TObject);
var
    strFiledValue:string;
begin
    strFiledValue:=cbbCom_TestModel.Text;
    if strFiledValue<>'' then
    begin
        UniQuery_ParamDownloadItem.Close;
        UniQuery_ParamDownloadItem.Params.ParamByName('ItemModel').Value:=strFiledValue;
        UniQuery_ParamDownloadItem.Open;
    end;
    Edt_ItemNameChange(Edt_ItemName);
end;

procedure TfrmParamDownloadItem.DeleteTestItem();
var
  s0,s1: string;
begin
  inherited;
  if Application.MessageBox('�Ƿ�Ҫɾ����¼��','��ʾ��Ϣ��',MB_YesNo+MB_IconQuestion)=IdYes then
  begin
    s0 := cbbCom_TestModel.Text; 
    s1 := UniQuery_ParamDownloadItem.FieldByName('ItemName').Value;
    InsertOperRecord(User.UserName,'ɾ�� ���ز�������_ɾ����¼#[����:' + s0
    									+ '/���ز�����:' + s1
                      + ']',DateTimeToStr(Now));
    UniQuery_ParamDownloadItem.Edit;
    UniQuery_ParamDownloadItem.delete;
    SetOpInfo('ɾ����¼');
  end
  else
    exit;
end;

procedure TfrmParamDownloadItem.btnAddClick(Sender: TObject);

begin
  inherited;
  if Application.MessageBox('�Ƿ�Ҫ���Ӳ����','��ʾ��Ϣ��',MB_YesNo+MB_IconQuestion)=IdYes then
  begin
    UniQuery_ParamDownloadItem.Append;
    UniQuery_ParamDownloadItem.FieldByName('ItemModel').Value:=cbbCom_TestModel.Text;
    UniQuery_ParamDownloadItem.FieldByName('ItemName').Value:=Edt_TestItemNameAdd.Text;
    UniQuery_ParamDownloadItem.Edit;
    UniQuery_ParamDownloadItem.Post;
    UniQuery_ParamDownloadItem.Last;
    SetOpInfo('����ɹ�');

    sTemp := '����:' + Trim(cbbCom_TestModel.Text) + '/������:' + Trim(Edt_TestItemNameAdd.Text);
    InsertOperRecord(User.UserName,'���� ���ز�������#[' + sTemp + ']',DateTimeToStr(Now));
    Edt_TestItemNameAdd.Text:='';
  end;
end;

procedure TfrmParamDownloadItem.btnCopyClick(Sender: TObject);
var
  strTemp : string;
begin
  inherited;
  if Application.MessageBox('�Ƿ�Ҫ�������ø��ƣ�','��ʾ��Ϣ��',MB_YesNo+MB_IconQuestion)=IdYes then
  begin
    with frmServerMain.spModelParamDownloadCopy do
    begin
      Close;
      Parameters.ParamByName('@cSrcModel').Value:=cbb_SrcModel.Text;
      Parameters.ParamByName('@cDstModel').Value:=cbb_DstModel.Text;
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
end; 

procedure TfrmParamDownloadItem.UniQuery_ParamDownloadSubItemAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('ItemModel').AsString:=cbbCom_TestModel.text;
  DataSet.FieldByName('ItemName').AsString:=Edt_ItemName.Text;
  DataSet.FieldByName('SendAtComm').Value:=True;
  DataSet.FieldByName('Compare').Value:=False;
end;

procedure TfrmParamDownloadItem.FormShow(Sender: TObject);
begin
  inherited;
  UniQuery_TestModel.Close;
  UniQuery_ParamDownloadItem.Close;
  UniQuery_TestModel.Open;
  UniQuery_ParamDownloadItem.Open;
  //�����Ի��ͼ����б�
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

procedure TfrmParamDownloadItem.Edt_TestPlanNameChange(Sender: TObject);
begin
  inherited;
  sA[1] := Trim(UniQuery_ParamDownloadSubItem.fieldbyname('ItemModel').AsString);
end;

procedure TfrmParamDownloadItem.DBCheckBox2Click(Sender: TObject);
var
  b : Boolean;
begin
  inherited;
  b := UniQuery_ParamDownloadSubItem.fieldbyname('Compare').AsBoolean;
  if b then
  	sA[2] := '��'
  else
  	sA[2] := '��';
end;

procedure TfrmParamDownloadItem.Edt_TestPlanDesChange(Sender: TObject);
begin
  inherited;
  sA[3] := Trim(UniQuery_ParamDownloadSubItem.fieldbyname('ItemName').AsString);
end;

procedure TfrmParamDownloadItem.DBEdit6Change(Sender: TObject);
begin
  inherited;
  sA[4] := Trim(UniQuery_ParamDownloadSubItem.fieldbyname('CompareValue').AsString);
end;

procedure TfrmParamDownloadItem.DBEdit1Change(Sender: TObject);
begin
  inherited;
  sA[5] := Trim(UniQuery_ParamDownloadSubItem.fieldbyname('SubItemName').AsString);
end;

procedure TfrmParamDownloadItem.DBEdit7Change(Sender: TObject);
begin
  inherited;
  sA[6] := Trim(UniQuery_ParamDownloadSubItem.fieldbyname('CompareRemark').AsString);
end;

procedure TfrmParamDownloadItem.DBCheckBox1Click(Sender: TObject);
var
  b : Boolean;
begin
  inherited;
  b := UniQuery_ParamDownloadSubItem.fieldbyname('SendAtComm').AsBoolean;
  if b then
  	sA[7] := '��'
  else
  	sA[7] := '��';
end;

procedure TfrmParamDownloadItem.DBEdit8Change(Sender: TObject);
begin
  inherited;
  sA[8] := Trim(UniQuery_ParamDownloadSubItem.fieldbyname('Remark1').AsString);
end;

procedure TfrmParamDownloadItem.DBEdit2Change(Sender: TObject);
begin
  inherited;
  sA[9] := Trim(UniQuery_ParamDownloadSubItem.fieldbyname('AtComm').AsString);
end;

procedure TfrmParamDownloadItem.DBEdit9Change(Sender: TObject);
begin
  inherited;
  sA[10] := Trim(UniQuery_ParamDownloadSubItem.fieldbyname('Remark2').AsString);
end;

procedure TfrmParamDownloadItem.DBEdit3Change(Sender: TObject);
begin
  inherited;
  sA[11] := Trim(UniQuery_ParamDownloadSubItem.fieldbyname('ReturnText').AsString);
end;

procedure TfrmParamDownloadItem.DBEdit10Change(Sender: TObject);
begin
  inherited;
  sA[12] := Trim(UniQuery_ParamDownloadSubItem.fieldbyname('Remark3').AsString);
end;

procedure TfrmParamDownloadItem.DBEdit4Change(Sender: TObject);
begin
  inherited;
  sA[13] := Trim(UniQuery_ParamDownloadSubItem.fieldbyname('ReSendNum').AsString);
end;

procedure TfrmParamDownloadItem.dbedtRemark4Change(Sender: TObject);
begin
  inherited;
  sA[14] := Trim(UniQuery_ParamDownloadSubItem.fieldbyname('Remark4').AsString);
end;

procedure TfrmParamDownloadItem.DBEdit5Change(Sender: TObject);
begin
  inherited;
  sA[15] := Trim(UniQuery_ParamDownloadSubItem.fieldbyname('TestTimeOut').AsString);
end;

procedure TfrmParamDownloadItem.dbedtRemark5Change(Sender: TObject);
begin
  inherited;
  sA[16] := Trim(UniQuery_ParamDownloadSubItem.fieldbyname('Remark5').AsString);
end;

procedure TfrmParamDownloadItem.saveOperRecd;
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
      	sTemp := sTemp + '/��������:'+ Trim(DBEdit1.Text)+ '(��)' + sA[5] + '(ǰ)'
      else
      	sTemp := sTemp + '/��������:'+ Trim(DBEdit1.Text);
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

procedure TfrmParamDownloadItem.deleteOperRec;
var
  s0,s1,sTmp : string;
  b : Boolean;
begin
  s0 := UniQuery_ParamDownloadSubItem.fieldbyname('ItemModel').AsString;
  s1 := UniQuery_ParamDownloadSubItem.fieldbyname('ItemName').AsString;
  b := DS_Delete.Execute;
  if b then
  begin
    sTmp := 'ɾ�� ɾ�����ز�������(SMT)#[����:' + s0 +'/����������:'+ s1+ ']';
    InsertOperRecord(User.UserName,sTmp,DateTimeToStr(Now));
  end;
end;

procedure TfrmParamDownloadItem.updateOperRec;
var
  sTemp,sTestModel : string;
begin
  sTestModel := Trim(cbbCom_TestModel.Text);
  if Length(sTestModel) > 0 then
  begin
    sTemp := '����:' + sTestModel + '/������:' + Trim(Edt_ItemName.Text);
    InsertOperRecord(User.UserName,'�޸� �Զ�������Ŀ����#[' + sTemp + ']',DateTimeToStr(Now));
    Application.MessageBox('�������޸ĳɹ���','��ʾ��Ϣ',MB_YesNo+MB_IconQuestion);
  end
  else
  begin
    Application.MessageBox('���Ͳ���Ϊ�գ���ѡ��!','��ʾ��Ϣ',MB_ICONERROR);
    cbbCom_TestModel.SetFocus;
  end;
end;

procedure TfrmParamDownloadItem.btnModifyClick(Sender: TObject);
begin
  inherited;
  updateOperRec;
end;

procedure TfrmParamDownloadItem.TB_PostClick(Sender: TObject);
begin
  inherited;
  saveOperRecd;
end;

end.
