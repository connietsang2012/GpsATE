unit uDmMain;

interface

uses
  SysUtils, Classes, MemTableDataEh, Db, ADODB, DataDriverEh, MemTableEh;

type
  TDMMain = class(TDataModule)
    DSD_TestItemParam: TDataSetDriverEh;
    QR_TestItemParam: TADOQuery;
    atncfldQR_TestItemParamID: TAutoIncField;
    wdstrngfldQR_TestItemParamItemName: TWideStringField;
    wdstrngfldQR_TestItemParamSubTestItemName: TWideStringField;
    wdstrngfldQR_TestItemParamAtCommand: TWideStringField;
    wdstrngfldQR_TestItemParamReturnText: TWideStringField;
    blnfldQR_TestItemParamCompare: TBooleanField;
    wdstrngfldQR_TestItemParamCompareValue: TWideStringField;
    intgrfldQR_TestItemParamTestTimeOut: TIntegerField;
    wdstrngfldQR_TestItemParamRemark: TWideStringField;
    blnfldQR_TestItemParamSendAtCommand: TBooleanField;
    DSD_TestItem: TDataSetDriverEh;
    QR_TestItem: TADOQuery;
    atncfldQR_TestItemItemId: TAutoIncField;
    wdstrngfldQR_TestItemItemName: TWideStringField;
    DSD_SourceItem: TDataSetDriverEh;
    QR_SourceItem: TADOQuery;
    atncfldQR_SourceItemId: TAutoIncField;
    wdstrngfldQR_SourceItemItemName: TWideStringField;
    DSD_DstItem: TDataSetDriverEh;
    QR_DstItem: TADOQuery;
    atncfldQR_DstItemId: TAutoIncField;
    wdstrngfldQR_DstItemItemName: TWideStringField;
    DSD_TestResult1: TDataSetDriverEh;
    QR_TestItemParam_ByItemName: TADOQuery;
    atncfldQR_TestItemParam_ByItemNameID: TAutoIncField;
    wdstrngfldQR_TestItemParam_ByItemNameItemName: TWideStringField;
    wdstrngfldQR_TestItemParam_ByItemNameSubTestItemName: TWideStringField;
    wdstrngfldQR_TestItemParam_ByItemNameAtCommand: TWideStringField;
    wdstrngfldQR_TestItemParam_ByItemNameReturnText: TWideStringField;
    blnfldQR_TestItemParam_ByItemNameCompare: TBooleanField;
    wdstrngfldQR_TestItemParam_ByItemNameCompareValue: TWideStringField;
    intgrfldQR_TestItemParam_ByItemNameTestTimeOut: TIntegerField;
    wdstrngfldQR_TestItemParam_ByItemNameRemark: TWideStringField;
    blnfldQR_TestItemParam_ByItemNameSendAtCommand: TBooleanField;
    DSD_TestItemParam_ByItemName: TDataSetDriverEh;
    conConnGpsTest: TADOConnection;
    ADOQuery1: TADOQuery;
    AutoIncField1: TAutoIncField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    DS_AutoTestModel: TDataSource;
    MTE_AutoTestModel: TMemTableEh;
    MTE_AutoTestModelId: TAutoIncField;
    MTE_AutoTestModelModel: TStringField;
    MTE_AutoTestModelModelDes: TStringField;
    DSD_AutoTestModel: TDataSetDriverEh;
    QR_AutoTestModel: TADOQuery;
    QR_GpsTestParamter: TADOQuery;
    DSD_GpsTestParamter: TDataSetDriverEh;
    MTE_GpsTestParamter: TMemTableEh;
    DS_GpsTestParamter: TDataSource;
    MTE_GpsTestParamterId: TAutoIncField;
    MTE_GpsTestParamterCoupleTestTestTime: TIntegerField;
    MTE_GpsTestParamterParamDownloadTestTime: TIntegerField;
    MTE_GpsTestParamterAutoTestTestTime: TIntegerField;
    MTE_GpsTestParamterWriteImeiTestTime: TIntegerField;
    MTE_GpsTestParamterTwiceTestTime: TIntegerField;
    MTE_GpsTestParamterGPSNumbers: TIntegerField;
    MTE_GpsTestParamterGPSDb: TIntegerField;
    MTE_GpsTestParamterEPOLatitude: TStringField;
    MTE_GpsTestParamterEPOLongitude: TStringField;
    MTE_GpsTestParamterEPOAltitude: TStringField;
    MTE_GpsTestParamterCheckTestTime: TIntegerField;
    MTE_GpsTestParamterCheckTestAtCommand: TStringField;
    MTE_GpsTestParamterCheckTestAtReturn: TStringField;
    MTE_GpsTestParamterCheckTestAtTimeOut: TIntegerField;
    MTE_GpsTestParamterCheckTestAllowTestCount: TIntegerField;
    QR_VersionModel: TADOQuery;
    DSD_VersionModel: TDataSetDriverEh;
    MTE_VersionModel: TMemTableEh;
    AutoIncField2: TAutoIncField;
    StringField1: TStringField;
    DS_VersionModel: TDataSource;
    MTE_VersionModelVersion: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMain: TDMMain;

implementation

{$R *.dfm}

procedure TDMMain.DataModuleCreate(Sender: TObject);
var
    strConn:string;
begin
strConn:='Provider=SQLOLEDB.1;Password=sa123abc;';
    strConn:=strConn+'Persist Security Info=True;User ID=sa;    Initial Catalog=GPSTest;';
    strConn:=strConn+'Data Source=192.168.0.240;Use Procedure for Prepare=1;    Auto Translate=True;Packet Size=4096;Workstation ID=ZK;    Use Encryption for Data=False;Tag with column collation when possible=False';
    conConnGpsTest.Connected:=False;
    conConnGpsTest.ConnectionString:=strConn;
    conConnGpsTest.Connected:=True;
end;


end.
