unit uAutoTestItemPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, DBCtrls, Buttons, GridsEh, ComCtrls, StdCtrls, Mask,
  DBCtrlsEh, DBLookupEh, ExtCtrls, MemTableDataEh, Db, MemTableEh,
  DataDriverEh, ADODB,uDmMain, Grids, DBGrids, MemDS, DBAccess, Uni,DBTables;

type
  TfrmAutoTestItemPlan = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    lblSrcLabel: TLabel;
    lblDstLabel: TLabel;
    btnInclude: TSpeedButton;
    btnIncAll: TSpeedButton;
    btnExclude: TSpeedButton;
    btnExAll: TSpeedButton;
    DBLSrcList: TDBLookupListBox;
    DBLDstList: TDBLookupListBox;
    DS_AutoTestModel: TDataSource;
    DS_DstSubItem: TDataSource;
    DS_SrcSubItem: TDataSource;
    UniQuery_TestModel: TUniQuery;
    SFUniQuery_TestModelIndex: TStringField;
    intgrfldUniQuery_TestModelId: TIntegerField;
    SFUniQuery_TestModelModel: TStringField;
    cbbCom_TestModel: TComboBox;
    UniQuery_DstSubItem: TUniQuery;
    UniQuery_SrcSubItem: TUniQuery;
    procedure FormCreate(Sender: TObject);
    procedure cbbCom_TestModelChange(Sender: TObject);

    procedure btnIncludeClick(Sender: TObject);
    procedure btnIncAllClick(Sender: TObject);
    procedure btnExcludeClick(Sender: TObject);
    procedure btnExAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SetButtons;
  public
    { Public declarations }
  end;

var
  frmAutoTestItemPlan: TfrmAutoTestItemPlan;
  stem : string;
implementation
uses
  uGlobalVar,uPublicFunc;
  
{$R *.dfm}
procedure TfrmAutoTestItemPlan.FormCreate(Sender: TObject);
begin
  UniQuery_TestModel.Open;
  UniQuery_DstSubItem.Open;
  UniQuery_SrcSubItem.Open;

  if UniQuery_TestModel.RecordCount>0 then
  begin
    UniQuery_TestModel.First;
    cbbCom_TestModel.Items.Clear;

    while not UniQuery_TestModel.Eof do
    begin
      cbbCom_TestModel.Items.Add(UniQuery_TestModel.FieldByName('Model').AsString);
      UniQuery_TestModel.Next;
    end;
  end;
  cbbCom_TestModel.ItemIndex:=0;
  cbbCom_TestModelChange(cbbCom_TestModel);
end;

procedure TfrmAutoTestItemPlan.cbbCom_TestModelChange(Sender: TObject);
var
  strFiledValue:string;
begin
  strFiledValue:=Trim(cbbCom_TestModel.Text);
  if strFiledValue<>'' then
  begin
    UniQuery_DstSubItem.Close;
    UniQuery_DstSubItem.ParamByName('ItemModel').Value:=strFiledValue;
    UniQuery_DstSubItem.Open;

    UniQuery_SrcSubItem.Close;
    UniQuery_SrcSubItem.ParamByName('ItemModel').Value:=strFiledValue;
    UniQuery_SrcSubItem.Open;
  end;
  SetButtons
end;

procedure TfrmAutoTestItemPlan.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  UniQuery_SrcSubItem.Refresh;
  UniQuery_DstSubItem.Refresh;
  SrcEmpty:=UniQuery_SrcSubItem.RecordCount=0;
  DstEmpty := UniQuery_DstSubItem.RecordCount = 0;

  btnInclude.Enabled := not SrcEmpty;
  btnIncAll.Enabled := not SrcEmpty;
  btnExclude.Enabled := not DstEmpty;
  btnExAll.Enabled := not DstEmpty;
end;

procedure TfrmAutoTestItemPlan.btnIncludeClick(Sender: TObject);
begin
  if cbbCom_TestModel.Items.Count > 0 then
  begin //���Ͳ���Ϊ�գ���ʹ������������ѡ�� 2014.2.21
    if Length(Trim(cbbCom_TestModel.Text)) > 0 then
    begin
      stem := '��� �Զ����Լƻ�#[' + '����:' + Trim(cbbCom_TestModel.Text) + '/';
      stem := stem + '��ӿ�ѡ������:' + trim(UniQuery_SrcSubItem.FieldByName('ItemName').AsString);
      InsertOperRecord(User.UserName,stem + ']',DateTimeToStr(Now));

      with UniQuery_DstSubItem do
      begin
        try
          Append;
          FieldByName('ItemModel').Value:=UniQuery_SrcSubItem.FieldByName('ItemModel').Value;
          FieldByName('ItemName').Value:=UniQuery_SrcSubItem.FieldByName('ItemName').Value;
          Post;
        except
          Cancel;
          raise;
        end;
      end;
      SetButtons;
    end
    else
    begin
      Application.MessageBox('���Ͳ���Ϊ�գ���ѡ��!','��ʾ��Ϣ',MB_ICONERROR);
    	cbbCom_TestModel.SetFocus;
    end; 
  end;
end;

procedure TfrmAutoTestItemPlan.btnExcludeClick(Sender: TObject);
begin
  if Length(Trim(cbbCom_TestModel.Text)) > 0 then
  begin     //���Ͳ���Ϊ�գ���ʹ������������ѡ�� 2014.2.21
    stem := 'ɾ�� �Զ����Լƻ�#[' + '����:' + Trim(cbbCom_TestModel.Text) + '/';
    stem := stem + 'ɾ����ѡ������:' + trim(DBLDstList.SelectedItem);
    InsertOperRecord(User.UserName,stem + ']',DateTimeToStr(Now));

    UniQuery_DstSubItem.Edit;
    UniQuery_DstSubItem.Delete;
    SetButtons;
  end
  else
  begin
    Application.MessageBox('���Ͳ���Ϊ�գ���ѡ��!','��ʾ��Ϣ',MB_ICONERROR);
    cbbCom_TestModel.SetFocus;
  end;
end;

procedure TfrmAutoTestItemPlan.btnExAllClick(Sender: TObject);
begin
  if Length(Trim(cbbCom_TestModel.Text)) > 0 then
  begin     //���Ͳ���Ϊ�գ���ʹ������������ѡ�� 2014.2.21
    UniQuery_DstSubItem.First;
    while not UniQuery_DstSubItem.Eof do
    begin
      stem := 'ɾ�� �Զ����Լƻ�#[' + '����:' + Trim(cbbCom_TestModel.Text) + '/';
      stem := stem + 'ɾ����ѡ������:' + trim(UniQuery_DstSubItem.fieldbyname('ItemName').AsString);
      InsertOperRecord(User.UserName,stem + ']',DateTimeToStr(Now));

      UniQuery_DstSubItem.Edit;
      UniQuery_DstSubItem.Delete;
      SetButtons;
    end;
  end
  else
  begin
    Application.MessageBox('���Ͳ���Ϊ�գ���ѡ��!','��ʾ��Ϣ',MB_ICONERROR);
    cbbCom_TestModel.SetFocus;
  end;
end;

procedure TfrmAutoTestItemPlan.btnIncAllClick(Sender: TObject);
begin
  if Length(Trim(cbbCom_TestModel.Text)) > 0 then  
  begin     //���Ͳ���Ϊ�գ���ʹ������������ѡ�� 2014.2.21
    UniQuery_SrcSubItem.First;
    while not UniQuery_SrcSubItem.Eof do
    begin
      stem := '��� �Զ����Լƻ�#[' + '����:' + Trim(cbbCom_TestModel.Text) + '/';
      stem := stem + '��ӿ�ѡ������:' + trim(UniQuery_DstSubItem.FieldByName('ItemName').AsString);
      InsertOperRecord(User.UserName,stem + ']',DateTimeToStr(Now));
    
      with UniQuery_DstSubItem do
      begin
        try
          Append;
          FieldByName('ItemModel').Value:=UniQuery_SrcSubItem.FieldByName('ItemModel').Value;
          FieldByName('ItemName').Value:=UniQuery_SrcSubItem.FieldByName('ItemName').Value;
          Post;
        except
          Cancel;
          raise;
        end;
      end;
      SetButtons;
    end;
  end
  else
  begin
    Application.MessageBox('���Ͳ���Ϊ�գ���ѡ��!','��ʾ��Ϣ',MB_ICONERROR);
    cbbCom_TestModel.SetFocus;
  end;  
end;

procedure TfrmAutoTestItemPlan.FormShow(Sender: TObject);
var
  i:Integer;
begin
    for i:=0 to ComponentCount-1 do
    begin
        if Components[i].ClassName = 'TUniQuery' then
        begin
            (Components[i] as TUniQuery).Close;
            (Components[i] as TUniQuery).Open;
        end;
    end;
end;

end.
