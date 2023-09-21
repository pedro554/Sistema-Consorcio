unit Cad_CRM;

interface

uses
  FormularioBase, DM_Banco, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, JvMemoryDataset, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, JvExStdCtrls, JvCombobox, JvDBCombobox,
  System.Actions, Vcl.ActnList;

type
  TFCad_CRM = class(TFormulario)
    QCRM: TFDQuery;
    SCRM: TDataSource;
    TCRM: TJvMemoryData;
    QCRMCD_CRM: TFDAutoIncField;
    QCRMCD_CLIENTE: TIntegerField;
    QCRMCD_STATUS: TIntegerField;
    QCRMDS_OBS: TStringField;
    QCRMDT_CADASTRO: TDateTimeField;
    QCRMNM_CLIENTE: TStringField;
    TCRMCD_CLIENTE: TIntegerField;
    TCRMCD_STATUS: TIntegerField;
    TCRMDS_OBS: TStringField;
    TCRMNM_CLIENTE: TStringField;
    TCRMCD_CRM: TIntegerField;
    edtCD_CLIENTE: TDBEdit;
    edtNM_CLIENTE: TDBEdit;
    lbl1: TLabel;
    edtDS_OBS: TDBMemo;
    lbl2: TLabel;
    pnl1: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    CD_STATUS: TJvDBComboBox;
    lbl3: TLabel;
    btnPsqCliente: TSpeedButton;
    edtDT_CADASTRO: TDBEdit;
    lbl4: TLabel;
    edtCD_FUNCIONARIO: TDBEdit;
    edtNM_FUNCIONARIO: TDBEdit;
    lbl5: TLabel;
    btnPsqFuncionario: TSpeedButton;
    TCRMCD_FUNCIONARIO: TIntegerField;
    TCRMNM_FUNCIONARIO: TStringField;
    edtVL_CREDITO: TDBEdit;
    lbl6: TLabel;
    TCRMVL_CREDITO: TFloatField;
    TCRMDT_ATUALIZACAO: TDateTimeField;
    edtDT_ATUALIZACAO: TDBEdit;
    lbl7: TLabel;
    TCRMDT_CADASTRO: TDateTimeField;
    QCRMCD_FUNCIONARIO: TIntegerField;
    QCRMVL_CREDITO: TFMTBCDField;
    QCRMDT_ATUALIZACAO: TDateTimeField;
    actlst: TActionList;
    ACT_F8: TAction;
    ACT_F6: TAction;
    QCRMCD_FAIXACOMISSAO: TIntegerField;
    TCRMCD_FAIXACOMISSAO: TIntegerField;
    QFaixaComissao: TFDQuery;
    QFaixaComissaoCD_FAIXACOMISSAO: TFDAutoIncField;
    QFaixaComissaoDS_FAIXACOMISSAO: TStringField;
    TCRMDS_FAIXACOMISSAO: TStringField;
    lbl8: TLabel;
    edtCD_FAIXACOMISSAO: TDBEdit;
    edtDS_FAIXACOMISSAO: TDBEdit;
    QFaixaComissaoVL_MINIMO: TFMTBCDField;
    QFaixaComissaoVL_MAXIMO: TFMTBCDField;
    QCRMDS_FAIXACOMISSAO: TStringField;
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnPsqClienteClick(Sender: TObject);
    procedure btnPsqFuncionarioClick(Sender: TObject);
    procedure TCRMVL_CREDITOChange(Sender: TField);
  private
    procedure CarregaCRM(ACodCRM: Integer);
    procedure ValidaFaixaComissao;
    { Private declarations }
  public
    procedure Inicializa(ACodCRM: Integer);
    { Public declarations }
  end;

var
  FCad_CRM: TFCad_CRM;

implementation

uses
  Funcoes, Consulta_Cliente, Consulta_Funcionario;

{$R *.dfm}

{ TFCad_CRM }

procedure TFCad_CRM.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFCad_CRM.btnGravarClick(Sender: TObject);
begin
  if TCRM.State in [dsEdit, dsInsert] then
    TCRM.Post;
  ValidaCampo(TCRMCD_CLIENTE);
  ValidaCampo(TCRMCD_FUNCIONARIO);
  ValidaCampo(TCRMCD_STATUS);
  ValidaCampo(TCRMVL_CREDITO);
  ValidaFaixaComissao;

  CarregaCRM(TCRMCD_CRM.AsInteger);
  CopiaRegistro(TCRM, QCRM, QCRM.IsEmpty);

  ModalResult := mrOk;
end;

procedure TFCad_CRM.btnPsqClienteClick(Sender: TObject);
var
  FConsulta_Cliente: TFConsulta_Cliente;
begin
  FConsulta_Cliente := TFConsulta_Cliente.Create(Self);
  try
    if FConsulta_Cliente.ShowModal = mrOk then
      CopiaRegistro(FConsulta_Cliente.TCliente, TCRM, False);
  finally
    FreeAndNil(FConsulta_Cliente);
  end;
end;

procedure TFCad_CRM.btnPsqFuncionarioClick(Sender: TObject);
var
  FConsulta_Funcionario: TFConsulta_Funcionario;
begin
  FConsulta_Funcionario := TFConsulta_Funcionario.Create(Self);
  try
    if FConsulta_Funcionario.ShowModal = mrOk then
      CopiaRegistro(FConsulta_Funcionario.TFuncionario, TCRM, False);
  finally
    FreeAndNil(FConsulta_Funcionario);
  end;
end;

procedure TFCad_CRM.CarregaCRM(ACodCRM: Integer);
begin
  QCRM.Close;
  QCRM.ParamByName('CD_CRM').AsInteger := ACodCRM;
  QCRM.Open;
end;

procedure TFCad_CRM.FormDestroy(Sender: TObject);
begin
  QCRM.Close;
  TCRM.Close;
  QFaixaComissao.Close;
end;

procedure TFCad_CRM.Inicializa(ACodCRM: Integer);
begin
  TCRM.Close;
  TCRM.Open;
  CarregaCRM(ACodCRM);
  TCRMVL_CREDITO.OnChange := nil;
  try
    CopiaRegistro(QCRM, TCRM);
  finally
    TCRMVL_CREDITO.OnChange := TCRMVL_CREDITOChange;
  end;
end;

procedure TFCad_CRM.TCRMVL_CREDITOChange(Sender: TField);
begin
  TCRMVL_CREDITO.OnChange := nil;
  try
    ValidaFaixaComissao;
    TCRMCD_FAIXACOMISSAO.AsInteger := QFaixaComissaoCD_FAIXACOMISSAO.AsInteger;
    TCRMDS_FAIXACOMISSAO.AsString := QFaixaComissaoDS_FAIXACOMISSAO.AsString;
  finally
    TCRMVL_CREDITO.OnChange := TCRMVL_CREDITOChange;
  end;
end;

procedure TFCad_CRM.ValidaFaixaComissao;
begin
  QFaixaComissao.Close;
  QFaixaComissao.ParamByName('VL_CREDITO').AsFloat := TCRMVL_CREDITO.AsFloat;
  QFaixaComissao.Open;
  if QFaixaComissao.IsEmpty then
  begin
    MyMessage('Nenhuma faixa de comissão encontrada para este valor de crédito. Verifique!');
    Abort;
  end;
end;

end.

