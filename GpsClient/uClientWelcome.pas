unit uClientWelcome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, {SUIMgr, ExtCtrls, SUIForm, SUISkinForm, SUIImagePanel,
  SUISkinControl, SUIButton, SUIProgressBar,} StdCtrls, ExtCtrls;

type
  TfrmClientWelcome = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientWelcome: TfrmClientWelcome;

implementation

var
  i:integer;

{$R *.dfm}

procedure TfrmClientWelcome.Timer1Timer(Sender: TObject);
var
sTemp:string;      
j:integer;
begin
  if i > 6 then i := 1;
  for j:=1 to i do
    begin
      sTemp := sTemp + '．';
    end;
  Label1.Caption := '正在初始化，请稍后' + sTemp;
  inc(i);
end;

procedure TfrmClientWelcome.FormCreate(Sender: TObject);
begin
  i := 1;
end;

end.
