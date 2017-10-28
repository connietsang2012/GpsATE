unit uClientDataUserType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  MemTableDataEh, Db, MemTableEh, ImgList,
  ActnList, ExtCtrls, GridsEh, DBGridEh, ComCtrls, ToolWin,
  uClientDataModuleForm, ADODB, StdCtrls, Mask, DBCtrls;

type
  TfrmClientUserType = class(TfrmClientDataModule)
    lbl1: TLabel;
    Edt_TypeName: TDBEdit;
    lbl2: TLabel;
    Edt_TypeDes: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientUserType: TfrmClientUserType;

implementation

{$R *.dfm}



procedure TfrmClientUserType.FormCreate(Sender: TObject);
begin
  inherited;
    PrimaryKey:='TypeId';
    PrimaryKeyType:='String';
    TableName:='Gps_UserType';
  
end;

end.
