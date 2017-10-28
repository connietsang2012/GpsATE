unit uClientDataTestWrong;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uClientDataModuleForm, DB, ADODB, ImgList, ActnList, ComCtrls,
  GridsEh, DBGridEh, ToolWin, StdCtrls, Mask, DBCtrls;

type
  TfrmClientTestWrong = class(TfrmClientDataModule)
    lbl1: TLabel;
    Edt_WrongName: TDBEdit;
    lbl2: TLabel;
    Edt_WrongDes: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientTestWrong: TfrmClientTestWrong;

implementation

{$R *.dfm}

procedure TfrmClientTestWrong.FormCreate(Sender: TObject);
begin
  inherited;
    PrimaryKey:='WrongId';
    PrimaryKeyType:='String';
    TableName:='Gps_TestWrong';
end;

end.
