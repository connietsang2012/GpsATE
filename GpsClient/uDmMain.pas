unit uDmMain;

interface

uses
  SysUtils, Classes, MemTableDataEh, Db, ADODB, DataDriverEh, uGlobalVar,IniFiles,
  UniProvider, DBAccess, UniDacVcl, Uni, Messages,Forms,
  ODBCUniProvider, AccessUniProvider, SQLServerUniProvider;

type
  TDMMain = class(TDataModule)
    UniConGpsTest: TUniConnection;
    UniConDGpsTest: TUniConnectDialog;
    SQLServerUniGpsTest: TSQLServerUniProvider;
    UniConnectionAutoTest: TUniConnection;
    UniConDAutoTest: TUniConnectDialog;
    AccessUniAutoTest: TAccessUniProvider;
    conConnGpsTest: TADOConnection;
    con1: TUniConnection;
    procedure DataModuleDestroy(Sender: TObject);
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

procedure TDMMain.DataModuleDestroy(Sender: TObject);
begin
  UniConGpsTest.Disconnect;
end;


procedure TDMMain.DataModuleCreate(Sender: TObject);
var
    ParamFilename,SerIp:string;
    MyIniFile:Tinifile;
    sDBName : string ;   //配置文件中读取数据库名称 2014.2.17
    lDBName : string ;
begin
    //从文件读取参数 (TCP/基本设置/GPS设置),并将其显示各控件上。
    ParamFilename:=ExtractFilePath(Paramstr(0))+'Param.ini';
    MyIniFile:=Tinifile.Create(ParamFilename);

    with MyIniFile do
    begin
        SerIp:=ReadString('DataBase', 'Ip','127.0.0.1');
        sDBName := ReadString('DataBase', 'DBName','GPSTest'); //2014.2.17
        lDBName:= ReadString('DataBase', 'LocalDBName','');
    end;
    MyIniFile.Free;

    //设置连接数据库
    with UniConGpsTest do
    begin
        Disconnect;
        ProviderName:='SQL Server';
        Username:='sa';
        Password:='sa123ABC';
        //Port:=123456789;
        Server:=SerIp;
        Database:=sDBName;
        try
          Connect;
        except
          on E:Exception do
          begin
              Application.MessageBox('sss','警告');
              Sleep(1);
          end;
        end;
    end;
    with con1 do
    begin
        Disconnect;
        ProviderName:='Access';
        Database:=lDBName;
        try
          Connect;
        except
          on E:Exception do
          begin
              Sleep(1);
          end;
        end;
    end;
end;
end.
