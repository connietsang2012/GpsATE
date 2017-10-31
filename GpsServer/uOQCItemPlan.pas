unit uOQCItemPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Uni, DBCtrls, Buttons, ComCtrls, StdCtrls,
  ExtCtrls;

type
  TfrmOQCItemPlan = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    cbbCom_TestModel: TComboBox;
    pgc1: TPageControl;
    ts1: TTabSheet;
    lblSrcLabel: TLabel;
    lblDstLabel: TLabel;
    btnInclude: TSpeedButton;
    btnIncAll: TSpeedButton;
    btnExclude: TSpeedButton;
    btnExAll: TSpeedButton;
    DBLSrcList: TDBLookupListBox;
    DBLDstList: TDBLookupListBox;
    DS_AutoTestModel: TDataSource;
    UniQuery_TestModel: TUniQuery;
    strngfldSFUniQuery_TestModelIndex: TStringField;
    intgrfldUniQuery_TestModelId: TIntegerField;
    strngfldSFUniQuery_TestModelModel: TStringField;
    DS_DstSubItem: TDataSource;
    UniQuery_DstSubItem: TUniQuery;
    DS_SrcSubItem: TDataSource;
    UniQuery_SrcSubItem: TUniQuery;
    procedure FormCreate(Sender: TObject);
    procedure cbbCom_TestModelChange(Sender: TObject);
    procedure btnIncludeClick(Sender: TObject);
    procedure btnIncAllClick(Sender: TObject);
    procedure btnExcludeClick(Sender: TObject);
    procedure btnExAllClick(Sender: TObject);
  private
    { Private declarations }
     procedure SetButtons;
  public
    { Public declarations }
  end;

var
  frmOQCItemPlan: TfrmOQCItemPlan;

implementation

{$R *.dfm}

procedure TfrmOQCItemPlan.FormCreate(Sender: TObject);
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

procedure TfrmOQCItemPlan.SetButtons;
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

procedure TfrmOQCItemPlan.cbbCom_TestModelChange(Sender: TObject);
var
strFiledValue:string;
begin
  strFiledValue:=cbbCom_TestModel.Text;
  if strFiledValue<>'' then
  begin
    UniQuery_DstSubItem.Close;
    UniQuery_DstSubItem.ParamByName('ItemModel').Value:=strFiledValue;
    UniQuery_DstSubItem.Open;

    UniQuery_SrcSubItem.Close;
    UniQuery_SrcSubItem.ParamByName('ItemModel').Value:=strFiledValue;
    UniQuery_SrcSubItem.Open;
  end;
end;

procedure TfrmOQCItemPlan.btnIncludeClick(Sender: TObject);
begin
  if Length(Trim(cbbCom_TestModel.Text)) > 0 then
  begin
    //stem := '��� �Զ����Լƻ�(SMT)#[' + '����:' + Trim(cbbCom_TestModel.Text) + '/';
    //stem := stem + '��ӿ�ѡ������:' + trim(UniQuery_SrcSubItem.FieldByName('ItemName').AsString);
    //InsertOperRecord(User.UserName,stem + ']',DateTimeToStr(Now));

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

procedure TfrmOQCItemPlan.btnIncAllClick(Sender: TObject);
begin
  if Length(Trim(cbbCom_TestModel.Text)) > 0 then
  begin
    UniQuery_SrcSubItem.First;
    while not UniQuery_SrcSubItem.Eof do
    begin
      //stem := '��� �Զ����Լƻ�(SMT)#[' + '����:' + Trim(cbbCom_TestModel.Text) + '/';
      //stem := stem + '��ӿ�ѡ������:' + trim(UniQuery_SrcSubItem.FieldByName('ItemName').AsString);
      //InsertOperRecord(User.UserName,stem + ']',DateTimeToStr(Now));

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

procedure TfrmOQCItemPlan.btnExcludeClick(Sender: TObject);
begin
  if Length(Trim(cbbCom_TestModel.Text)) > 0 then
  begin
    //stem := 'ɾ�� �Զ����Լƻ�(SMT)#[' + '����:' + Trim(cbbCom_TestModel.Text) + '/';
    //stem := stem + 'ɾ����ѡ������:' + trim(UniQuery_DstSubItem.fieldbyname('ItemName').AsString);
    //InsertOperRecord(User.UserName,stem + ']',DateTimeToStr(Now));

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

procedure TfrmOQCItemPlan.btnExAllClick(Sender: TObject);
begin
  if Length(Trim(cbbCom_TestModel.Text)) > 0 then
  begin
    UniQuery_DstSubItem.First;
    while not UniQuery_DstSubItem.Eof do
    begin
      //stem := 'ɾ�� �Զ����Լƻ�(SMT)#[' + '����:' + Trim(cbbCom_TestModel.Text) + '/';
      //stem := stem + 'ɾ����ѡ������:' + trim(UniQuery_DstSubItem.fieldbyname('ItemName').AsString);
      //InsertOperRecord(User.UserName,stem + ']',DateTimeToStr(Now));

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

end.
