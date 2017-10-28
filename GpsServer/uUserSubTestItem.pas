unit uUserSubTestItem;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Forms, Dialogs, Controls, StdCtrls, 
  Buttons, MemTableDataEh, Db, MemTableEh, uDmMain, GridsEh, DBGridEh, uUserForm,
  DBCtrls;

type
  TfrmUserSubTestItem = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    HelpBtn: TButton;
    SrcList: TListBox;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    DS_SubTestItem: TDataSource;
    MTE_SubTestItem: TMemTableEh;
    DS_DstSubItem: TDataSource;
    MTE_DstSubItem: TMemTableEh;
    atncfldMTE_SubTestItemId: TAutoIncField;
    intgrfldMTE_SubTestItemParentId: TIntegerField;
    SFMTE_SubTestItemSubTestItemName: TStringField;
    SFMTE_SubTestItemAtCommand: TStringField;
    SFMTE_SubTestItemReturnText: TStringField;
    intgrfldMTE_SubTestItemTestTimeOut: TIntegerField;
    SFMTE_SubTestItemRemark: TStringField;
    atncfldMTE_DstSubItemId: TAutoIncField;
    intgrfldMTE_DstSubItemUserId: TIntegerField;
    intgrfldMTE_DstSubItemSubTestItemId: TIntegerField;
    estRuslt1: TDBGridEh;
    SFMTE_DstSubItemSubTestItemName: TStringField;
    DlDstList: TDBLookupListBox;
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
  end;

var
  frmUserSubTestItem: TfrmUserSubTestItem;

implementation

{$R *.dfm}

procedure TfrmUserSubTestItem.IncludeBtnClick(Sender: TObject);
var
  Index: Integer;
  strSrcText:string;
begin
    Index := GetFirstSelection(SrcList);
    strSrcText:=SrcList.Items[Index];
    //MoveSelected(SrcList, DstList.Items);
    //SrcList.Field.Value;
    //SetItem(SrcList, Index);


    MTE_DstSubItem.Append;
    //MTE_DstSubItem.FieldByName('UserId').Value:=frmUser.MTE_Module.fieldByName('UserId').Value;
    MTE_DstSubItem.FieldByName('SubTestItemId').Value:=2;
    MTE_DstSubItem.FieldByName('SubTestItemName').Value:=(strSrcText);
    MTE_DstSubItem.CheckBrowseMode;
    MTE_DstSubItem.Active:=False;
    MTE_DstSubItem.Active:=True;

    SetButtons;
end;

procedure TfrmUserSubTestItem.ExcludeBtnClick(Sender: TObject);
var
    strDstText:string;
begin
  //Index := GetFirstSelection(DlDstList);
  //strDstText:= DstList.Items[Index];
  //MoveSelected(DstList, SrcList.Items);
  //SetItem(DlDstList, 0);

  //MTE_DstSubItem.First;
  //while not MTE_DstSubItem.Eof do
  begin
    //if MTE_DstSubItem.FieldByName('SubTestItemName').Value = strDstText then
    begin
        MTE_DstSubItem.Delete;
        MTE_DstSubItem.Active:=False;
        MTE_DstSubItem.Active:=True;
        //Exit;
    end;
    //MTE_DstSubItem.Next;

  end;
  SetButtons;

end;

procedure TfrmUserSubTestItem.IncAllBtnClick(Sender: TObject);
var
  I: Integer;
    strSrcText:string;
begin
  for I := 0 to SrcList.Items.Count - 1 do
  begin
        //Index := GetFirstSelection(SrcList);
        strSrcText:=SrcList.Items[I];
        //MoveSelected(SrcList, DstList.Items);
        //SrcList.Field.Value;
        //SetItem(SrcList, Index);


        MTE_DstSubItem.Append;
        //MTE_DstSubItem.FieldByName('UserId').Value:=frmUser.MTE_Module.fieldByName('UserId').Value;
        MTE_DstSubItem.FieldByName('SubTestItemId').Value:=2;
        MTE_DstSubItem.FieldByName('SubTestItemName').Value:=(strSrcText);
        MTE_DstSubItem.CheckBrowseMode;

  end;
  MTE_DstSubItem.Active:=False;
        MTE_DstSubItem.Active:=True;
    //DstList.Items.AddObject(SrcList.Items[I],
      //SrcList.Items.Objects[I]);

  SrcList.Items.Clear;
  SetButtons;
  //SetItem(SrcList, 0);
end;

procedure TfrmUserSubTestItem.ExcAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  {for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]); }
  MTE_DstSubItem.First;
  while not MTE_DstSubItem.Eof do
  begin
    //if MTE_DstSubItem.FieldByName('SubTestItemName').Value = strDstText then
    begin
        MTE_DstSubItem.Delete;

        //Exit;
    end;
    //MTE_DstSubItem.Next;

  end;
  MTE_DstSubItem.Active:=False;
        MTE_DstSubItem.Active:=True;
  //DstList.Items.Clear;
  //SetItem(DstList, 0);
  SetButtons;
end;

procedure TfrmUserSubTestItem.MoveSelected(List: TCustomListBox; Items: TStrings);
var
  I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;
end;

procedure TfrmUserSubTestItem.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := SrcList.Items.Count = 0;
  DstEmpty := MTE_DstSubItem.FieldCount = 0;
  IncludeBtn.Enabled := not SrcEmpty;
  IncAllBtn.Enabled := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
  ExAllBtn.Enabled := not DstEmpty;
end;

function TfrmUserSubTestItem.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure TfrmUserSubTestItem.SetItem(List: TListBox; Index: Integer);
var
  MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    if Index = LB_ERR then Index := 0
    else if Index > MaxIndex then Index := MaxIndex;
    Selected[Index] := True;
  end;
  SetButtons;
end;

procedure TfrmUserSubTestItem.FormCreate(Sender: TObject);
var
    strTemp:string;
begin
    while not MTE_SubTestItem.Eof do
    begin
        strTemp:=DS_SubTestItem.DataSet.FieldByName('SubTestItemName').AsString;
        SrcList.Items.Add(strTemp);
        //dblstId.Items.Add(strTemp);
        DS_SubTestItem.DataSet.Next;
    end;

    MTE_DstSubItem.Close;
    MTE_DstSubItem.Open;

    MTE_SubTestItem.Close;
    MTE_SubTestItem.Open;
end;


end.
