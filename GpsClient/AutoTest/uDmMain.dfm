object DMMain: TDMMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 304
  Top = 173
  Height = 526
  Width = 632
  object DSD_TestItemParam: TDataSetDriverEh
    ProviderDataSet = QR_TestItemParam
    Left = 112
    Top = 72
  end
  object QR_TestItemParam: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ItemName'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from t_Test_ItemParam '
      'Where t_Test_ItemParam.ItemName=:ItemName')
    Left = 216
    Top = 72
    object atncfldQR_TestItemParamID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object wdstrngfldQR_TestItemParamItemName: TWideStringField
      FieldName = 'ItemName'
      Size = 50
    end
    object wdstrngfldQR_TestItemParamSubTestItemName: TWideStringField
      FieldName = 'SubTestItemName'
      Size = 50
    end
    object wdstrngfldQR_TestItemParamAtCommand: TWideStringField
      FieldName = 'AtCommand'
      Size = 50
    end
    object wdstrngfldQR_TestItemParamReturnText: TWideStringField
      FieldName = 'ReturnText'
      Size = 50
    end
    object blnfldQR_TestItemParamCompare: TBooleanField
      FieldName = 'Compare'
    end
    object wdstrngfldQR_TestItemParamCompareValue: TWideStringField
      FieldName = 'CompareValue'
      Size = 50
    end
    object intgrfldQR_TestItemParamTestTimeOut: TIntegerField
      FieldName = 'TestTimeOut'
    end
    object wdstrngfldQR_TestItemParamRemark: TWideStringField
      FieldName = 'Remark'
      Size = 50
    end
    object blnfldQR_TestItemParamSendAtCommand: TBooleanField
      FieldName = 'SendAtCommand'
    end
  end
  object DSD_TestItem: TDataSetDriverEh
    ProviderDataSet = QR_TestItem
    Left = 112
    Top = 16
  end
  object QR_TestItem: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from t_Test_Item')
    Left = 216
    Top = 16
    object atncfldQR_TestItemItemId: TAutoIncField
      FieldName = 'ItemId'
      ReadOnly = True
    end
    object wdstrngfldQR_TestItemItemName: TWideStringField
      FieldName = 'ItemName'
      KeyFields = 'ItemName'
      Size = 50
    end
  end
  object DSD_SourceItem: TDataSetDriverEh
    ProviderDataSet = QR_SourceItem
    Left = 112
    Top = 136
  end
  object QR_SourceItem: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from t_Test_SourceItem')
    Left = 216
    Top = 136
    object atncfldQR_SourceItemId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object wdstrngfldQR_SourceItemItemName: TWideStringField
      FieldName = 'ItemName'
      Size = 50
    end
  end
  object DSD_DstItem: TDataSetDriverEh
    ProviderDataSet = QR_DstItem
    Left = 112
    Top = 192
  end
  object QR_DstItem: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from t_Test_DstItem')
    Left = 216
    Top = 192
    object atncfldQR_DstItemId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object wdstrngfldQR_DstItemItemName: TWideStringField
      FieldName = 'ItemName'
      Size = 50
    end
  end
  object DSD_TestResult1: TDataSetDriverEh
    Left = 312
    Top = 24
  end
  object QR_TestItemParam_ByItemName: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ItemName'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from t_Test_ItemParam '
      'Where t_Test_ItemParam.ItemName=:ItemName')
    Left = 424
    Top = 80
    object atncfldQR_TestItemParam_ByItemNameID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object wdstrngfldQR_TestItemParam_ByItemNameItemName: TWideStringField
      FieldName = 'ItemName'
      Size = 50
    end
    object wdstrngfldQR_TestItemParam_ByItemNameSubTestItemName: TWideStringField
      FieldName = 'SubTestItemName'
      Size = 50
    end
    object wdstrngfldQR_TestItemParam_ByItemNameAtCommand: TWideStringField
      FieldName = 'AtCommand'
      Size = 50
    end
    object wdstrngfldQR_TestItemParam_ByItemNameReturnText: TWideStringField
      FieldName = 'ReturnText'
      Size = 50
    end
    object blnfldQR_TestItemParam_ByItemNameCompare: TBooleanField
      FieldName = 'Compare'
    end
    object wdstrngfldQR_TestItemParam_ByItemNameCompareValue: TWideStringField
      FieldName = 'CompareValue'
      Size = 50
    end
    object intgrfldQR_TestItemParam_ByItemNameTestTimeOut: TIntegerField
      FieldName = 'TestTimeOut'
    end
    object wdstrngfldQR_TestItemParam_ByItemNameRemark: TWideStringField
      FieldName = 'Remark'
      Size = 50
    end
    object blnfldQR_TestItemParam_ByItemNameSendAtCommand: TBooleanField
      FieldName = 'SendAtCommand'
    end
  end
  object DSD_TestItemParam_ByItemName: TDataSetDriverEh
    ProviderDataSet = QR_TestItemParam_ByItemName
    Left = 320
    Top = 80
  end
  object conConnGpsTest: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=sa123abc;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=GPSTest;Data Source=192.168.0.240;Us' +
      'e Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;W' +
      'orkstation ID=ZK;Use Encryption for Data=False;Tag with column '
    ConnectionTimeout = 30
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 88
  end
  object ADOQuery1: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from t_Test_Result1')
    Left = 480
    Top = 32
    object AutoIncField1: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object WideStringField1: TWideStringField
      FieldName = 'TestItem'
      Size = 50
    end
    object WideStringField2: TWideStringField
      FieldName = 'TestResult'
      Size = 50
    end
    object WideStringField3: TWideStringField
      FieldName = 'SubTestItem'
      Size = 50
    end
    object WideStringField4: TWideStringField
      FieldName = 'TestValue'
      Size = 50
    end
  end
  object DS_AutoTestModel: TDataSource
    DataSet = MTE_AutoTestModel
    Left = 176
    Top = 288
  end
  object MTE_AutoTestModel: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Model'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    DataDriver = DSD_AutoTestModel
    StoreDefs = True
    Left = 280
    Top = 296
    object MTE_AutoTestModelId: TAutoIncField
      FieldName = 'Id'
    end
    object MTE_AutoTestModelModel: TStringField
      FieldName = 'Model'
    end
    object MTE_AutoTestModelModelDes: TStringField
      FieldKind = fkLookup
      FieldName = 'ModelDes'
      LookupDataSet = QR_AutoTestModel
      LookupKeyFields = 'Id'
      LookupResultField = 'Model'
      KeyFields = 'Id'
      Lookup = True
    end
  end
  object DSD_AutoTestModel: TDataSetDriverEh
    ProviderDataSet = QR_AutoTestModel
    Left = 392
    Top = 296
  end
  object QR_AutoTestModel: TADOQuery
    Connection = conConnGpsTest
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Gps_AutoTest_Model')
    Left = 488
    Top = 296
  end
  object QR_GpsTestParamter: TADOQuery
    Connection = conConnGpsTest
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Gps_TestParamter')
    Left = 520
    Top = 352
  end
  object DSD_GpsTestParamter: TDataSetDriverEh
    ProviderDataSet = QR_GpsTestParamter
    Left = 408
    Top = 352
  end
  object MTE_GpsTestParamter: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'CoupleTestTestTime'
        DataType = ftInteger
      end
      item
        Name = 'ParamDownloadTestTime'
        DataType = ftInteger
      end
      item
        Name = 'AutoTestTestTime'
        DataType = ftInteger
      end
      item
        Name = 'WriteImeiTestTime'
        DataType = ftInteger
      end
      item
        Name = 'TwiceTestTime'
        DataType = ftInteger
      end
      item
        Name = 'GPSNumbers'
        DataType = ftInteger
      end
      item
        Name = 'GPSDb'
        DataType = ftInteger
      end
      item
        Name = 'EPOLatitude'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EPOLongitude'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EPOAltitude'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CheckTestTime'
        DataType = ftInteger
      end
      item
        Name = 'CheckTestAtCommand'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CheckTestAtReturn'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CheckTestAtTimeOut'
        DataType = ftInteger
      end
      item
        Name = 'CheckTestAllowTestCount'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    DataDriver = DSD_GpsTestParamter
    StoreDefs = True
    Left = 288
    Top = 352
    object MTE_GpsTestParamterId: TAutoIncField
      FieldName = 'Id'
    end
    object MTE_GpsTestParamterCoupleTestTestTime: TIntegerField
      FieldName = 'CoupleTestTestTime'
    end
    object MTE_GpsTestParamterParamDownloadTestTime: TIntegerField
      FieldName = 'ParamDownloadTestTime'
    end
    object MTE_GpsTestParamterAutoTestTestTime: TIntegerField
      FieldName = 'AutoTestTestTime'
    end
    object MTE_GpsTestParamterWriteImeiTestTime: TIntegerField
      FieldName = 'WriteImeiTestTime'
    end
    object MTE_GpsTestParamterTwiceTestTime: TIntegerField
      FieldName = 'TwiceTestTime'
    end
    object MTE_GpsTestParamterGPSNumbers: TIntegerField
      FieldName = 'GPSNumbers'
    end
    object MTE_GpsTestParamterGPSDb: TIntegerField
      FieldName = 'GPSDb'
    end
    object MTE_GpsTestParamterEPOLatitude: TStringField
      FieldName = 'EPOLatitude'
    end
    object MTE_GpsTestParamterEPOLongitude: TStringField
      FieldName = 'EPOLongitude'
    end
    object MTE_GpsTestParamterEPOAltitude: TStringField
      FieldName = 'EPOAltitude'
    end
    object MTE_GpsTestParamterCheckTestTime: TIntegerField
      FieldName = 'CheckTestTime'
    end
    object MTE_GpsTestParamterCheckTestAtCommand: TStringField
      FieldName = 'CheckTestAtCommand'
      Size = 50
    end
    object MTE_GpsTestParamterCheckTestAtReturn: TStringField
      FieldName = 'CheckTestAtReturn'
      Size = 50
    end
    object MTE_GpsTestParamterCheckTestAtTimeOut: TIntegerField
      FieldName = 'CheckTestAtTimeOut'
    end
    object MTE_GpsTestParamterCheckTestAllowTestCount: TIntegerField
      FieldName = 'CheckTestAllowTestCount'
    end
  end
  object DS_GpsTestParamter: TDataSource
    DataSet = MTE_GpsTestParamter
    Left = 176
    Top = 344
  end
  object QR_VersionModel: TADOQuery
    Connection = conConnGpsTest
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Gps_VersionModel')
    Left = 496
    Top = 408
  end
  object DSD_VersionModel: TDataSetDriverEh
    ProviderDataSet = QR_VersionModel
    Left = 400
    Top = 408
  end
  object MTE_VersionModel: TMemTableEh
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Version'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Model'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    DataDriver = DSD_VersionModel
    StoreDefs = True
    Left = 288
    Top = 408
    object AutoIncField2: TAutoIncField
      FieldName = 'Id'
    end
    object StringField1: TStringField
      FieldName = 'Model'
    end
    object MTE_VersionModelVersion: TStringField
      FieldName = 'Version'
      Size = 100
    end
  end
  object DS_VersionModel: TDataSource
    DataSet = MTE_VersionModel
    Left = 184
    Top = 400
  end
end
