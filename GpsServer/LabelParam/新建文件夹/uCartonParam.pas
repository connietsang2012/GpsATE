unit uCartonParam;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uModuleForm, ExtCtrls, DB, DBActns, ActnList, ImgList, ComCtrls,
    ToolWin, GridsEh, DBGridEh, MemDS, DBAccess, Uni, DBCtrls, DBCtrlsEh,
    StdCtrls, Mask;

type
    TfrmCartonParam = class(TfrmModuleForm)
        UniQuery_GiftParam: TUniQuery;
        UniQuery_GiftParamId: TIntegerField;
        UniQuery_GiftParamZhiDan: TStringField;
        UniQuery_GiftParamSoftModel: TStringField;
        UniQuery_GiftParamSN1: TStringField;
        UniQuery_GiftParamSN2: TStringField;
        UniQuery_GiftParamSN3: TStringField;
        UniQuery_GiftParamProductDate: TStringField;
        UniQuery_GiftParamIMEIStart: TStringField;
        UniQuery_GiftParamIMEIEnd: TStringField;
        UniQuery_GiftParamTACInfo: TStringField;
        UniQuery_GiftParamSIMStart: TStringField;
        UniQuery_GiftParamSIMEnd: TStringField;
        UniQuery_GiftParamIMEIRel: TIntegerField;
        UniQuery_GiftParam_MASK_FROM_V2: TBytesField;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        Label6: TLabel;
        Label7: TLabel;
        Label8: TLabel;
        DBEdit1: TDBEdit;
        DBEdit2: TDBEdit;
        DBEdit3: TDBEdit;
        DBEdit4: TDBEdit;
        DBEdit5: TDBEdit;
        DBEdit6: TDBEdit;
        DBEdit7: TDBEdit;
        DBEdit8: TDBEdit;
        DBEdit9: TDBEdit;
        DBEdit10: TDBEdit;
        DBEdit11: TDBEdit;
        DBLookupComboBox1: TDBLookupComboBox;
        Label9: TLabel;
        Label10: TLabel;
        UniQuery_IMEIRelDesc: TUniQuery;
        UniQuery_IMEIRelDescRelId: TIntegerField;
        UniQuery_IMEIRelDescIMEIRelNo: TStringField;
        UniQuery_IMEIRelDescIMEIRelDes: TStringField;
        UniQuery_IMEIRelDesc_MASK_FROM_V2: TBytesField;
        UniQuery_GiftParamIMEIRelDesc: TStringField;
        UniQuery_GiftParamIndex: TStringField;
        UniQuery_GiftParamStatus: TIntegerField;
        Label11: TLabel;
        UniQuery_ManuDesc: TUniQuery;
        UniQuery_ManuDescStatusId: TIntegerField;
        UniQuery_ManuDescManuSheetStatusNo: TStringField;
        UniQuery_ManuDescManuSheetStatusDes: TStringField;
        UniQuery_ManuDesc_MASK_FROM_V2: TBytesField;
        DBLookupComboBox_Status: TDBLookupComboBox;
        UniQuery_GiftParamStatusDesc: TStringField;
        procedure FormCreate(Sender: TObject);
        procedure UniQuery_GiftParamCalcFields(DataSet: TDataSet);
        procedure UniQuery_GiftParamBeforeInsert(DataSet: TDataSet);
        procedure UniQuery_GiftParamBeforePost(DataSet: TDataSet);
        procedure UniQuery_GiftParamAfterScroll(DataSet: TDataSet);
    procedure UniQuery_GiftParamBeforeEdit(DataSet: TDataSet);
    procedure DS_DeleteExecute(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmCartonParam: TfrmCartonParam;

implementation

{$R *.dfm}

procedure TfrmCartonParam.FormCreate(Sender: TObject);
begin
    inherited;
    DS_Insert.Visible := True;
    DS_Delete.Visible:=False;
end;

procedure TfrmCartonParam.UniQuery_GiftParamCalcFields(DataSet: TDataSet);
begin
    inherited;
    DataSet.FieldByName('Index').AsInteger := UniQuery_GiftParam.RecNo;
end;

procedure TfrmCartonParam.UniQuery_GiftParamBeforeInsert(DataSet: TDataSet);
var
    i: Integer;
begin
    inherited;
    DS_Module.AutoEdit := True;
    DBGridEh1.ReadOnly := False;
    TabSheet2.Enabled := True;
    if PageControl1.ActivePageIndex = 1 then
    begin
        for i := 0 to ComponentCount - 1 do
        begin
            if (Components[i] is TDBEdit) and ((Components[i] as TDBEdit).TabOrder = 0) then
                if ((Components[i] as TDBEdit).Enabled) and ((Components[i] as TDBEdit).Visible) then
                    (Components[i] as TDBEdit).SetFocus;
        end;
    end;
end;

procedure TfrmCartonParam.UniQuery_GiftParamBeforePost(DataSet: TDataSet);
begin
    inherited;
    {if ((DataSet.FieldByName('status').AsInteger=2) or (DataSet.FieldByName('status').AsInteger=3)) then
    begin
        DataSet.Cancel;
    end;}

end;

procedure TfrmCartonParam.UniQuery_GiftParamAfterScroll(DataSet: TDataSet);
begin
    inherited;
    if (TDataSet(UniQuery_GiftParam).FieldByName('status').AsInteger = 2) or
        (TDataSet(UniQuery_GiftParam).FieldByName('status').AsInteger = 3) then
    begin
        if PageControl1.ActivePageIndex = 1 then
        begin
            PageControl1.ActivePage.Enabled := False;
        end;
    end
    else
    begin
        PageControl1.ActivePage.Enabled := True;
    end;
end;

procedure TfrmCartonParam.UniQuery_GiftParamBeforeEdit(DataSet: TDataSet);
begin
    inherited;
    if (DataSet.FieldByName('status').AsInteger = 2) or
        (DataSet.FieldByName('status').AsInteger = 3) then
    begin
        if PageControl1.ActivePageIndex = 1 then
        begin
          Application.MessageBox('已完成或已做废的工单不可做编辑!','信息警告',MB_ICONHAND);
            PageControl1.ActivePage.Enabled := False;
        end;
    end
    else
    begin
        PageControl1.ActivePage.Enabled := True;
    end;
end;


procedure TfrmCartonParam.DS_DeleteExecute(Sender: TObject);
begin
  //inherited;
    if (TDataSet(UniQuery_GiftParam).FieldByName('status').AsInteger = 2) or
        (TDataSet(UniQuery_GiftParam).FieldByName('status').AsInteger = 3) then
    begin
        if PageControl1.ActivePageIndex = 1 then
        begin
          Application.MessageBox('已完成或已做废的工单不可删除!','信息警告',MB_ICONHAND);
        end;
    end
    else
    begin
        SetOpInfo('删除记录');
  DS_Delete.Execute;
    end;
end;

end.

