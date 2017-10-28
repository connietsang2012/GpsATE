unit uCartonBoxMan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, Menus, GridsEh, DBGridEh;

type
  TfrmCartonBoxMan = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    PopupMenu1: TPopupMenu;
    V1: TMenuItem;
    N1: TMenuItem;
    V3: TMenuItem;
    DBGridEh1: TDBGridEh;
    procedure Button1Click(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure V3Click(Sender: TObject);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCartonBoxMan: TfrmCartonBoxMan;

implementation
uses
    uClientDM;
{$R *.dfm}

procedure TfrmCartonBoxMan.Button1Click(Sender: TObject);
begin
    {dmClient.qryCartonBox.Filter:='imei='+QuotedStr(edit1.Text);
    dmClient.qryCartonBox.Filtered:=True;}
end;

procedure TfrmCartonBoxMan.V1Click(Sender: TObject);
begin
    {dmClient.qryCartonBox.Delete;}
end;

procedure TfrmCartonBoxMan.V3Click(Sender: TObject);
begin
    {dmClient.qryCartonBox.Requery;}
end;

procedure TfrmCartonBoxMan.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);

begin

    if Column.Title.SortMarker=smUpEh then
    begin
        Column.Title.SortMarker:=smDownEh;
        {dmClient.qryCartonBox.Sort:='';
        dmClient.qryCartonBox.Sort:=(Column.FieldName+' DESC');}

    end
    else if Column.Title.SortMarker=smNoneEh then
    begin
        Column.Title.SortMarker:=smUpEh;
        {dmClient.qryCartonBox.Sort:='';
        dmClient.qryCartonBox.Sort:=(Column.FieldName+' ASC'); }
    end
    else if Column.Title.SortMarker=smDownEh then
    begin
        Column.Title.SortMarker:=smUpEh;
        {dmClient.qryCartonBox.Sort:='';
        dmClient.qryCartonBox.Sort:=(Column.FieldName+' ASC'); }
    end;
end;

end.
