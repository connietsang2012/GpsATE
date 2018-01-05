unit uCartonParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModuleForm, ExtCtrls, DB, DBActns, ActnList, ImgList, ComCtrls,
  ToolWin, GridsEh, DBGridEh, MemDS, DBAccess, Uni, DBCtrls, StdCtrls, Mask;

type
  TfrmCartonParam = class(TfrmModuleForm)
    UniQuery_CartonParam: TUniQuery;
    UniQuery_ManuDesc: TUniQuery;
    UniQuery_ManuDescStatusId: TIntegerField;
    UniQuery_ManuDescManuSheetStatusNo: TStringField;
    UniQuery_ManuDescManuSheetStatusDes: TStringField;
    UniQuery_ManuDesc_MASK_FROM_V2: TBytesField;
    UniQuery_CartonParamId: TIntegerField;
    UniQuery_CartonParamZhiDan: TStringField;
    UniQuery_CartonParamSoftModel: TStringField;
    UniQuery_CartonParamBoxNo1: TStringField;
    UniQuery_CartonParamBoxNo2: TStringField;
    UniQuery_CartonParamProductDate: TStringField;
    UniQuery_CartonParamColor: TStringField;
    UniQuery_CartonParamWeight: TStringField;
    UniQuery_CartonParamQty: TStringField;
    UniQuery_CartonParamProductNo: TStringField;
    UniQuery_CartonParamVersion: TStringField;
    UniQuery_CartonParamIMEIStart: TStringField;
    UniQuery_CartonParamIMEIEnd: TStringField;
    UniQuery_CartonParamTACInfo: TStringField;
    UniQuery_CartonParamCompanyName: TStringField;
    UniQuery_CartonParamRemark1: TStringField;
    UniQuery_CartonParamRemark2: TStringField;
    UniQuery_CartonParamRemark3: TStringField;
    UniQuery_CartonParamRemark4: TStringField;
    UniQuery_CartonParamRemark5: TStringField;
    UniQuery_CartonParamStatus: TIntegerField;
    UniQuery_CartonParam_MASK_FROM_V2: TBytesField;
    UniQuery_CartonParamStatusDesc: TStringField;
    UniQuery_CartonParamIndex: TStringField;
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
    Label9: TLabel;
    Label6: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBLookupComboBox_Status: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label7: TLabel;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCartonParam: TfrmCartonParam;

implementation

{$R *.dfm}

end.
