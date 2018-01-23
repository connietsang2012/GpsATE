unit uManuOrderParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, ExtCtrls, DB, DBActns, ActnList, ImgList, ComCtrls,
  ToolWin, GridsEh, DBGridEh, MemDS, DBAccess, Uni, DBCtrls, StdCtrls, Mask;

type
  TfrmManuOrderParam = class(TfrmModuleForm)
    UniQuery_ManuOrderParam: TUniQuery;
    UniQuery_ManuDesc: TUniQuery;
    UniQuery_ManuDescStatusId: TIntegerField;
    UniQuery_ManuDescManuSheetStatusNo: TStringField;
    UniQuery_ManuDescManuSheetStatusDes: TStringField;
    UniQuery_ManuDesc_MASK_FROM_V2: TBytesField;
    UniQuery_ManuOrderParamId: TIntegerField;
    UniQuery_ManuOrderParamZhiDan: TStringField;
    UniQuery_ManuOrderParamSoftModel: TStringField;
    UniQuery_ManuOrderParamSN1: TStringField;
    UniQuery_ManuOrderParamSN2: TStringField;
    UniQuery_ManuOrderParamSN3: TStringField;
    UniQuery_ManuOrderParamBoxNo1: TStringField;
    UniQuery_ManuOrderParamBoxNo2: TStringField;
    UniQuery_ManuOrderParamProductDate: TStringField;
    UniQuery_ManuOrderParamColor: TStringField;
    UniQuery_ManuOrderParamWeight: TStringField;
    UniQuery_ManuOrderParamQty: TStringField;
    UniQuery_ManuOrderParamProductNo: TStringField;
    UniQuery_ManuOrderParamVersion: TStringField;
    UniQuery_ManuOrderParamIMEIStart: TStringField;
    UniQuery_ManuOrderParamIMEIEnd: TStringField;
    UniQuery_ManuOrderParamSIMStart: TStringField;
    UniQuery_ManuOrderParamSIMEnd: TStringField;
    UniQuery_ManuOrderParamIMEIRel: TIntegerField;
    UniQuery_ManuOrderParamTACInfo: TStringField;
    UniQuery_ManuOrderParamCompanyName: TStringField;
    UniQuery_ManuOrderParamRemark1: TStringField;
    UniQuery_ManuOrderParamRemark2: TStringField;
    UniQuery_ManuOrderParamRemark3: TStringField;
    UniQuery_ManuOrderParamRemark4: TStringField;
    UniQuery_ManuOrderParamRemark5: TStringField;
    UniQuery_ManuOrderParamStatus: TIntegerField;
    UniQuery_ManuOrderParam_MASK_FROM_V2: TBytesField;
    UniQuery_ManuOrderParamIndex: TStringField;
    UniQuery_ManuOrderParamStatusDesc: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label6: TLabel;
    DBEdit9: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBLookupComboBox_Status: TDBLookupComboBox;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label7: TLabel;
    DBEdit15: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label9: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    Label20: TLabel;
    DBEdit23: TDBEdit;
    Label21: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label22: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    UniQuery_IMEIRel: TUniQuery;
    UniQuery_IMEIRelRelId: TIntegerField;
    UniQuery_IMEIRelIMEIRelNo: TStringField;
    UniQuery_IMEIRelIMEIRelDes: TStringField;
    UniQuery_IMEIRel_MASK_FROM_V2: TBytesField;
    UniQuery_ManuOrderParamIMEIRelDesc: TStringField;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    DBEdit26: TDBEdit;
    UniQuery_ManuOrderParamBATStart: TStringField;
    UniQuery_ManuOrderParamBATEnd: TStringField;
    UniQuery_ManuOrderParamVIPStart: TStringField;
    UniQuery_ManuOrderParamVIPEnd: TStringField;
    Label23: TLabel;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuOrderParam: TfrmManuOrderParam;

implementation

{$R *.dfm}

end.
