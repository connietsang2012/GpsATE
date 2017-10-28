unit uPrintProcess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TfrmPrintProcess = class(TForm)
    pb1: TProgressBar;
    lbl1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintProcess: TfrmPrintProcess;

implementation
uses uSMTIQCTest;
{$R *.dfm}

procedure TfrmPrintProcess.FormCreate(Sender: TObject);
var
i:integer;
begin
   {lbl1.Caption:='数据保存...';
   i:=strOQCList.Count;
   pb1.Min:=0;
   pb1.Max:=i;
   pb1.Position:=0;
   while i>0 do
   begin
     i:=i-1;
     pb1.Position:=pb1.Position+1;
   end;
   lbl1.Caption:='数据保存成功！';
   }
end;

end.
