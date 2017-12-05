unit uCartonBoxSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,uPublicFunc, ExtCtrls;

type
  TfrmCartonBoxSet = class(TForm)
    cbbPrintCount: TComboBox;
    cbbPrintType: TComboBox;
    btnOk: TButton;
    btnCancel: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    rg1: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure cbbPrintCountChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCartonBoxSet: TfrmCartonBoxSet;

implementation

{$R *.dfm}

procedure TfrmCartonBoxSet.FormShow(Sender: TObject);
begin
//    cbbPrintCount.ItemIndex:=?cbbPrintCount.Items.IndexOf(ReadIni('CartonBoxSet','PrintCount','10'));
//    cbbPrintType.ItemIndex:=cbbPrintType.Items.IndexOf(ReadIni('CartonBoxSet','PrintType','默认'));
//    cbbPrintCount.OnChange(cbbPrintCount);
end;

procedure TfrmCartonBoxSet.btnOkClick(Sender: TObject);
begin
  try
    WriteIni('CartonBoxSet','PrintCount',cbbPrintCount.Text);
    WriteIni('CartonBoxSet','PrintType',cbbPrintType.Text);
    frmCartonBoxSet.Close;
    ShowCartonBoxForm();
  except
  end;
end;

procedure TfrmCartonBoxSet.btnCancelClick(Sender: TObject);
begin
    frmCartonBoxSet.Close;
end;

procedure TfrmCartonBoxSet.cbbPrintCountChange(Sender: TObject);
begin
    {if cbbPrintCount.ItemIndex=0 then
    begin
        cbbPrintType.ItemIndex:=0;
        cbbPrintType.Enabled:=False;
    end
    else }
    begin
        cbbPrintType.Enabled:=True;
        cbbPrintType.Items.Clear;
        cbbPrintType.Items.Add('中文');
        cbbPrintType.Items.Add('英文');
        cbbPrintType.ItemIndex:=0;
    end;
end;

end.
