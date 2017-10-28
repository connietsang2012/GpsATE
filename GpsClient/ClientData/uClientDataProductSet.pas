unit uClientDataProductSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uClientDataModuleForm, DB, ADODB, ImgList, ActnList, ComCtrls,
  GridsEh, DBGridEh, ToolWin, StdCtrls, Mask, DBCtrls;

type
  TfrmClientProductSet = class(TfrmClientDataModule)
    lbl1: TLabel;
    Edt_Model: TDBEdit;
    lbl2: TLabel;
    Edt_Version: TDBEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    Edt_SnPro: TDBEdit;
    lbl5: TLabel;
    Edt_SnDate: TDBEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    Edt_SnBegin: TDBEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    Edt_SnEnd: TDBEdit;
    lbl11: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientProductSet: TfrmClientProductSet;

implementation

{$R *.dfm}

procedure TfrmClientProductSet.FormCreate(Sender: TObject);
begin
  inherited;
    PrimaryKey:='SetId';
    PrimaryKeyType:='String';
    TableName:='Gps_Set';

end;

end.
