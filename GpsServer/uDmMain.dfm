object DMMain: TDMMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 579
  Top = 172
  Height = 277
  Width = 202
  object UniConGpsTest: TUniConnection
    ProviderName = 'SQL Server'
    Database = 'GPSTest'
    ConnectDialog = UniConDGpsTest
    LoginPrompt = False
    Left = 64
    Top = 8
  end
  object UniConDGpsTest: TUniConnectDialog
    DatabaseLabel = 'Database'
    PortLabel = 'Port'
    ProviderLabel = 'Provider'
    Caption = 'Connect'
    UsernameLabel = 'User Name'
    PasswordLabel = 'Password'
    ServerLabel = 'Server'
    ConnectButton = 'Connect'
    CancelButton = 'Cancel'
    Left = 64
    Top = 64
  end
  object SQLServerUniGpsTest: TSQLServerUniProvider
    Left = 64
    Top = 120
  end
  object conConnGpsTest: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=sa123ABC;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=GPSTest;Data Source=10.10.11.130;Use' +
      ' Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Wo' +
      'rkstation ID=ZK;Use Encryption for Data=False;Tag with column co' +
      'llation when possible=False'
    ConnectionTimeout = 30
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'SQLOLEDB.1'
    BeforeConnect = conConnGpsTestBeforeConnect
    Left = 64
    Top = 168
  end
end
