unit ufrmMessageBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmMessagebox = class(TForm)
    btnPass: TBitBtn;
    btnFail: TBitBtn;
    lbl1: TLabel;
    procedure btnPassClick(Sender: TObject);
    procedure btnFailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMessagebox: TfrmMessagebox;

implementation

uses uAutoTest; 

//uses uTestMain;



{$R *.dfm}

procedure TfrmMessagebox.btnPassClick(Sender: TObject);
var
     CommIndex:Integer;
begin
    {CommIndex:=0;
    frmAutoTestMain.SetTestItemResult(CommIndex,frmAutoTestMain.TesItem_Comm1.Items[0],1);
    self.hide; }
end;

procedure TfrmMessagebox.btnFailClick(Sender: TObject);
var
     CommIndex:Integer;
begin
    {CommIndex:=0;
    frmAutoTestMain.SetTestItemResult(CommIndex,frmAutoTestMain.TesItem_Comm1.Items[0],0);
    self.hide;}
end;

end.
