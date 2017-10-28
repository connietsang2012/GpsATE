unit uSMTTcDataForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, DB, MemDS, DBAccess, Uni, 
  StdCtrls, ExtCtrls, DBActns, ActnList, ImgList, GridsEh, DBGridEh;

type
  TFrmSMTTcDataForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EditSMT_SN: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    BtnSearch: TButton;
    DBGridEh1: TDBGridEh;
    DataSc_SMT: TDataSource;
    UniQuery_SMT_GpsTcData: TUniQuery;
    procedure BtnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private                                                   
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSMTTcDataForm: TFrmSMTTcDataForm;
  sSQL,sWhere,sProm,sTitle : string;
implementation
uses
  uDmMain;
{$R *.dfm}

//查询
procedure TFrmSMTTcDataForm.BtnSearchClick(Sender: TObject);
begin
  sWhere := ' where SN like ''%' + Trim(EditSMT_SN.Text) + '%'' ';
  UniQuery_SMT_GpsTcData.Close;
  UniQuery_SMT_GpsTcData.SQL.Clear;
  UniQuery_SMT_GpsTcData.SQL.Add(sSQL + sWhere);
  UniQuery_SMT_GpsTcData.Open;
  UniQuery_SMT_GpsTcData.Last;
end;

procedure TFrmSMTTcDataForm.FormShow(Sender: TObject);
begin
  sSQL := 'select * from GpsSMT_TcData ';
  UniQuery_SMT_GpsTcData.Close;
  UniQuery_SMT_GpsTcData.SQL.Clear;
  UniQuery_SMT_GpsTcData.SQL.Add(sSQL);
  UniQuery_SMT_GpsTcData.Open;
end;

procedure TFrmSMTTcDataForm.DBGridEh1DblClick(Sender: TObject);
begin
  if UniQuery_SMT_GpsTcData.RecordCount > 0 then
  begin
    sTitle := FrmSMTTcDataForm.Caption;
    sProm :=        '     -------------显示当前-------------' +#10;
    sProm := sProm +'           Id：' + UniQuery_SMT_GpsTcData.fieldbyname('Id').AsString +#10;
    sProm := sProm +'       设备SN：' + UniQuery_SMT_GpsTcData.fieldbyname('SN').AsString +#10;
    sProm := sProm +'     定位模式：' + UniQuery_SMT_GpsTcData.fieldbyname('FixMode').AsString+#10;
    sProm := sProm +'  ×1信号强度：' + UniQuery_SMT_GpsTcData.fieldbyname('GpsDb_0').AsString+#10;
    sProm := sProm +'  ×2信号强度：' + UniQuery_SMT_GpsTcData.fieldbyname('GpsDb_1').AsString+#10;
    sProm := sProm +'  ×3信号强度：' + UniQuery_SMT_GpsTcData.fieldbyname('GpsDb_2').AsString+#10;
    sProm := sProm +'  ×4信号强度：' + UniQuery_SMT_GpsTcData.fieldbyname('GpsDb_3').AsString+#10;
    sProm := sProm +'  ×5信号强度：' + UniQuery_SMT_GpsTcData.fieldbyname('GpsDb_4').AsString+#10;
    sProm := sProm +'  ×6信号强度：' + UniQuery_SMT_GpsTcData.fieldbyname('GpsDb_5').AsString+#10;
    sProm := sProm +'  ×7信号强度：' + UniQuery_SMT_GpsTcData.fieldbyname('GpsDb_6').AsString+#10;
    sProm := sProm +'  ×8信号强度：' + UniQuery_SMT_GpsTcData.fieldbyname('GpsDb_7').AsString+#10;
    sProm := sProm +'  ×9信号强度：' + UniQuery_SMT_GpsTcData.fieldbyname('GpsDb_8').AsString+#10;
    sProm := sProm +' ×10信号强度：' + UniQuery_SMT_GpsTcData.fieldbyname('GpsDb_9').AsString+#10;
    sProm := sProm +' ×11信号强度：' + UniQuery_SMT_GpsTcData.fieldbyname('GpsDb_10').AsString+#10;
    sProm := sProm +' ×12信号强度：' + UniQuery_SMT_GpsTcData.fieldbyname('GpsDb_11').AsString;
    Application.MessageBox(PChar(sProm),PChar(sTitle),MB_ICONINFORMATION);
  end;  
end;

end.
