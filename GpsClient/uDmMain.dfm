object DMMain: TDMMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 373
  Top = 236
  Height = 495
  Width = 359
  object UniConGpsTest: TUniConnection
    ProviderName = 'SQL Server'
    Database = 'GPSTest'
    Username = 'sa'
    Password = 'sa123ABC'
    Server = '10.10.11.130'
    Connected = True
    ConnectDialog = UniConDGpsTest
    LoginPrompt = False
    Left = 56
    Top = 80
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
    Top = 136
  end
  object SQLServerUniGpsTest: TSQLServerUniProvider
    Left = 56
    Top = 184
  end
  object UniConnectionAutoTest: TUniConnection
    ProviderName = 'Access'
    Database = '.\GT02D.mdb'
    Server = '192.168.1.249'
    ConnectDialog = UniConDAutoTest
    LoginPrompt = False
    Left = 272
    Top = 72
  end
  object UniConDAutoTest: TUniConnectDialog
    DatabaseLabel = 'Database'
    PortLabel = 'Port'
    ProviderLabel = 'Provider'
    Caption = 'Connect'
    UsernameLabel = 'User Name'
    PasswordLabel = 'Password'
    ServerLabel = 'Server'
    ConnectButton = 'Connect'
    CancelButton = 'Cancel'
    Left = 272
    Top = 128
  end
  object AccessUniAutoTest: TAccessUniProvider
    Left = 272
    Top = 184
  end
  object conConnGpsTest: TADOConnection
    ConnectionTimeout = 30
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 248
  end
  object con1: TUniConnection
    ProviderName = 'Access'
    Database = '.\GT02D.mdb'
    LoginPrompt = False
    Left = 264
    Top = 256
  end
end
