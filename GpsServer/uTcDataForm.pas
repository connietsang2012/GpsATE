unit uTcDataForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, MemTableDataEh, Db, MemTableEh, ExtCtrls, ActnList,
  ImgList, ComCtrls, ToolWin, GridsEh, DBGridEh, StdCtrls, MemDS, DBAccess,
  Uni, DBActns;

type
  TfrmTcData = class(TfrmModuleForm)
    grp_Query: TGroupBox;
    lbl_SN: TLabel;
    ET_SN: TEdit;
    UniQuery_GpsTcData: TUniQuery;
    intgrfldUniQuery_GpsTcDataId: TIntegerField;
    SFUniQuery_GpsTcDataSN: TStringField;
    SFUniQuery_GpsTcDataFixMode: TStringField;
    intgrfldUniQuery_GpsTcDataGpsDb_0: TIntegerField;
    intgrfldUniQuery_GpsTcDataGpsDb_1: TIntegerField;
    intgrfldUniQuery_GpsTcDataGpsDb_2: TIntegerField;
    intgrfldUniQuery_GpsTcDataGpsDb_3: TIntegerField;
    intgrfldUniQuery_GpsTcDataGpsDb_4: TIntegerField;
    intgrfldUniQuery_GpsTcDataGpsDb_5: TIntegerField;
    intgrfldUniQuery_GpsTcDataGpsDb_6: TIntegerField;
    intgrfldUniQuery_GpsTcDataGpsDb_7: TIntegerField;
    intgrfldUniQuery_GpsTcDataGpsDb_8: TIntegerField;
    intgrfldUniQuery_GpsTcDataGpsDb_9: TIntegerField;
    intgrfldUniQuery_GpsTcDataGpsDb_10: TIntegerField;
    intgrfldUniQuery_GpsTcDataGpsDb_11: TIntegerField;
    SFUniQuery_GpsTcDataIndex: TStringField;
    ac_Cancel: TAction;
    procedure UniQuery_GpsTcDataCalcFields(DataSet: TDataSet);
    procedure ac_FindExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ac_CancelExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTcData: TfrmTcData;
  sProm,sTitle : string;
implementation
uses
    uDmMain;

{$R *.dfm}

procedure TfrmTcData.UniQuery_GpsTcDataCalcFields(DataSet: TDataSet);
begin
  inherited;
    DataSet.FieldByName('Index').AsInteger:=UniQuery_GpsTcData.RecNo;
end;

procedure TfrmTcData.ac_FindExecute(Sender: TObject);
var
  strTemp,qrySql:string;
begin
  inherited;
  strTemp:= '%'+Trim(ET_SN.Text)+'%';
  qrySql := Format('sn like ''%s''',[strTemp]);
  UniQuery_GpsTcData.Filter:=qrySql;
  UniQuery_GpsTcData.Filtered:=True;
end;
procedure TfrmTcData.FormShow(Sender: TObject);
var
  i:Integer;
begin
    ET_SN.Text:='';
    for i:=0 to ComponentCount-1 do
    begin
        if Components[i].ClassName = 'TUniQuery' then
        begin
            (Components[i] as TUniQuery).Filter:='';
            (Components[i] as TUniQuery).Filtered:=False;
        end;
    end;
  inherited;

end;

procedure TfrmTcData.ac_CancelExecute(Sender: TObject);
var
  i:Integer;
begin
  inherited;
    ET_SN.Text:='';
    for i:=0 to ComponentCount-1 do
    begin
        if Components[i].ClassName = 'TUniQuery' then
        begin
            (Components[i] as TUniQuery).Filter:='';
            (Components[i] as TUniQuery).Filtered:=False;
        end;
    end;
end;

procedure TfrmTcData.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
  if UniQuery_GpsTcData.RecordCount > 0 then
  begin
    sTitle := FrmTcData.Caption;
    sProm :=        '     -------------显示当前-------------' +#10;
    sProm := sProm +'           Id：' + UniQuery_GpsTcData.fieldbyname('Id').AsString +#10;
    sProm := sProm +'       设备SN：' + UniQuery_GpsTcData.fieldbyname('SN').AsString +#10;
    sProm := sProm +'     定位模式：' + UniQuery_GpsTcData.fieldbyname('FixMode').AsString+#10;
    sProm := sProm +'  ×1信号强度：' + UniQuery_GpsTcData.fieldbyname('GpsDb_0').AsString+#10;
    sProm := sProm +'  ×2信号强度：' + UniQuery_GpsTcData.fieldbyname('GpsDb_1').AsString+#10;
    sProm := sProm +'  ×3信号强度：' + UniQuery_GpsTcData.fieldbyname('GpsDb_2').AsString+#10;
    sProm := sProm +'  ×4信号强度：' + UniQuery_GpsTcData.fieldbyname('GpsDb_3').AsString+#10;
    sProm := sProm +'  ×5信号强度：' + UniQuery_GpsTcData.fieldbyname('GpsDb_4').AsString+#10;
    sProm := sProm +'  ×6信号强度：' + UniQuery_GpsTcData.fieldbyname('GpsDb_5').AsString+#10;
    sProm := sProm +'  ×7信号强度：' + UniQuery_GpsTcData.fieldbyname('GpsDb_6').AsString+#10;
    sProm := sProm +'  ×8信号强度：' + UniQuery_GpsTcData.fieldbyname('GpsDb_7').AsString+#10;
    sProm := sProm +'  ×9信号强度：' + UniQuery_GpsTcData.fieldbyname('GpsDb_8').AsString+#10;
    sProm := sProm +' ×10信号强度：' + UniQuery_GpsTcData.fieldbyname('GpsDb_9').AsString+#10;
    sProm := sProm +' ×11信号强度：' + UniQuery_GpsTcData.fieldbyname('GpsDb_10').AsString+#10;
    sProm := sProm +' ×12信号强度：' + UniQuery_GpsTcData.fieldbyname('GpsDb_11').AsString;
    Application.MessageBox(PChar(sProm),PChar(sTitle),MB_ICONINFORMATION);
  end;
end;

end.
