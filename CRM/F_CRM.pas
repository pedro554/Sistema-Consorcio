unit F_CRM;

interface

uses
  FormularioBase,
  DM_Banco,
  DM_CRM,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Grids,
  JvExGrids,
  JvStringGrid,
  JvMemoryDataset,
  Vcl.ExtCtrls,
  Data.Bind.Components,
  Data.Bind.DBScope,
  Data.Bind.EngExt,
  Vcl.Bind.DBEngExt,
  Vcl.Bind.Grid,
  System.Rtti,
  System.Bindings.Outputs,
  Vcl.Bind.Editors,
  Data.Bind.Grid,
  Vcl.StdCtrls, Vcl.Menus, Vcl.Buttons;

type
  TFCRM = class(TFormulario)
    QAberto: TFDQuery;
    QAbertoCD_CRM: TFDAutoIncField;
    QAbertoCD_CLIENTE: TIntegerField;
    QAbertoDS_OBS: TStringField;
    QAbertoDT_CADASTRO: TDateTimeField;
    QAbertoNM_CLIENTE: TStringField;
    QAbertoNR_FONE: TStringField;
    QNegociacao: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    StringField3: TStringField;
    StringField4: TStringField;
    QAguardando: TFDQuery;
    FDAutoIncField2: TFDAutoIncField;
    IntegerField2: TIntegerField;
    StringField6: TStringField;
    DateTimeField2: TDateTimeField;
    StringField7: TStringField;
    StringField8: TStringField;
    QAtualizaStatus: TFDQuery;
    QApresentacao: TFDQuery;
    FDAutoIncField3: TFDAutoIncField;
    IntegerField3: TIntegerField;
    StringField10: TStringField;
    DateTimeField3: TDateTimeField;
    StringField11: TStringField;
    StringField12: TStringField;
    QSemInteresse: TFDQuery;
    FDAutoIncField4: TFDAutoIncField;
    IntegerField4: TIntegerField;
    StringField14: TStringField;
    DateTimeField4: TDateTimeField;
    StringField15: TStringField;
    StringField16: TStringField;
    QFechado: TFDQuery;
    FDAutoIncField5: TFDAutoIncField;
    IntegerField5: TIntegerField;
    StringField18: TStringField;
    DateTimeField5: TDateTimeField;
    StringField19: TStringField;
    StringField20: TStringField;
    QAbertoCD_STATUS: TIntegerField;
    QApresentacaoCD_STATUS: TIntegerField;
    QNegociacaoCD_STATUS: TIntegerField;
    QAguardandoCD_STATUS: TIntegerField;
    QSemInteresseCD_STATUS: TIntegerField;
    QFechadoCD_STATUS: TIntegerField;
    ScrollBox1: TScrollBox;
    pnl4: TPanel;
    lbl4: TLabel;
    GridApresentacao: TStringGrid;
    pnl2: TPanel;
    lbl2: TLabel;
    GridNegociacao: TStringGrid;
    pnl3: TPanel;
    lbl3: TLabel;
    GridAguardando: TStringGrid;
    pnl6: TPanel;
    lbl6: TLabel;
    GridFechado: TStringGrid;
    pnl5: TPanel;
    lbl5: TLabel;
    GridSemInteresse: TStringGrid;
    pnl1: TPanel;
    lbl1: TLabel;
    GridAberto: TStringGrid;
    BindSourceAberto: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceApresentacao: TBindSourceDB;
    BindSourceNegociacao: TBindSourceDB;
    BindSourceAguardando: TBindSourceDB;
    BindSourceSemInteresse: TBindSourceDB;
    BindSourceFechado: TBindSourceDB;
    LinkGridToDataSourceBindSourceFechado: TLinkGridToDataSource;
    LinkGridToDataSourceBindSourceAguardando: TLinkGridToDataSource;
    LinkGridToDataSourceBindSourceNegociacao: TLinkGridToDataSource;
    LinkGridToDataSourceBindSourceAberto: TLinkGridToDataSource;
    LinkGridToDataSourceBindSourceApresentacao: TLinkGridToDataSource;
    LinkGridToDataSourceBindSourceSemInteresse: TLinkGridToDataSource;
    pm: TPopupMenu;
    Excluir1: TMenuItem;
    QExcluiCRM: TFDQuery;
    pnl7: TPanel;
    btnNovo: TSpeedButton;
    btnFinalizarMovimento: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    QAbertoCD_FUNCIONARIO: TIntegerField;
    QAbertoVL_CREDITO: TFMTBCDField;
    QAbertoDT_ATUALIZACAO: TDateTimeField;
    QApresentacaoCD_FUNCIONARIO: TIntegerField;
    QApresentacaoVL_CREDITO: TFMTBCDField;
    QApresentacaoDT_ATUALIZACAO: TDateTimeField;
    QNegociacaoCD_FUNCIONARIO: TIntegerField;
    QNegociacaoVL_CREDITO: TFMTBCDField;
    QNegociacaoDT_ATUALIZACAO: TDateTimeField;
    QAguardandoCD_FUNCIONARIO: TIntegerField;
    QAguardandoVL_CREDITO: TFMTBCDField;
    QAguardandoDT_ATUALIZACAO: TDateTimeField;
    QSemInteresseCD_FUNCIONARIO: TIntegerField;
    QSemInteresseVL_CREDITO: TFMTBCDField;
    QSemInteresseDT_ATUALIZACAO: TDateTimeField;
    QFechadoCD_FUNCIONARIO: TIntegerField;
    QFechadoVL_CREDITO: TFMTBCDField;
    QFechadoDT_ATUALIZACAO: TDateTimeField;
    QFechadoCD_FAIXACOMISSAO: TIntegerField;
    QAbertoCD_FAIXACOMISSAO: TIntegerField;
    QApresentacaoCD_FAIXACOMISSAO: TIntegerField;
    QNegociacaoCD_FAIXACOMISSAO: TIntegerField;
    QAguardandoCD_FAIXACOMISSAO: TIntegerField;
    QSemInteresseCD_FAIXACOMISSAO: TIntegerField;
    procedure GridAbertoDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure GridAbertoDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure GridAbertoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFinalizarMovimentoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FDatasetOrigem: TDataSet;
    DMCRM: TDMCRM;
    procedure CarregaDados;
    procedure AtualizaStatus(AStatus: Integer);
    procedure ConfigSelecaoFechado;
    { Private declarations }
  public
    property ADataSetOigem: TDataSet read FDatasetOrigem write FDatasetOrigem;
    { Public declarations }
  end;

const
  C_ABERTO: integer       = 1;
  C_APRESENTACAO: integer = 2;
  C_NEGOCIACAO: integer   = 3;
  C_AGUARDANDO: integer   = 4;
  C_SEMINTERESSE: integer = 5;
  C_FECHADO: integer      = 6;
  C_FINALIZADO: Integer   = 7;

var
  FCRM: TFCRM;

implementation
uses Funcoes, Cad_CRM;

{$R *.dfm}

{ TFCRM }

procedure TFCRM.AtualizaStatus(AStatus: Integer);
begin
  QAtualizaStatus.Close;
  QAtualizaStatus.ParamByName('CD_STATUS').AsInteger := AStatus;
  QAtualizaStatus.ParamByName('CD_CRM').AsInteger := FDatasetOrigem.FieldByName('CD_CRM').AsInteger;
  QAtualizaStatus.ExecSQL;
  CarregaDados;
end;

procedure TFCRM.btnAlterarClick(Sender: TObject);
var
  FCadCRM: TFCad_CRM;
begin
  FCadCRM := TFCad_CRM.Create(Self);
  try
    FCadCRM.Inicializa(FDatasetOrigem.FieldByName('CD_CRM').AsInteger);
    if FCadCRM.ShowModal = mrOk then
      CarregaDados;
  finally
    FreeAndNil(FCadCRM);
  end;
end;

procedure TFCRM.btnExcluirClick(Sender: TObject);
begin
  QExcluiCRM.Close;
  QExcluiCRM.ParamByName('CD_CRM').AsInteger := FDatasetOrigem.FieldByName('CD_CRM').AsInteger;
  QExcluiCRM.ExecSQL;

  CarregaDados;
end;

procedure TFCRM.btnFinalizarMovimentoClick(Sender: TObject);
begin
  if FDatasetOrigem.IsEmpty then
  begin
    MyMessage('Nenhum registro para ser finalizado');
    Abort;
  end;

  if MyMessage('Deseja finalizar o movimento do Cliente ' +
               FDatasetOrigem.FieldByName('NM_CLIENTE').AsString +
               ' no valor de ' +
               FormatFloat('#,0.00', FDatasetOrigem.FieldByName('VL_CREDITO').AsFloat) +
               '?', 4) <> 6 then
    Abort;

  DMCRM.FinalizaMovimento(FDatasetOrigem.FieldByName('CD_CRM').AsInteger);
  AtualizaStatus(C_FINALIZADO);
end;

procedure TFCRM.btnNovoClick(Sender: TObject);
var
  FCadCRM: TFCad_CRM;
begin
  FCadCRM := TFCad_CRM.Create(Self);
  try
    FCadCRM.Inicializa(0);
    if FCadCRM.ShowModal = mrOk then
      CarregaDados;
  finally
    FreeAndNil(FCadCRM);
  end;
end;

procedure TFCRM.CarregaDados;
begin
  QAberto.Close;
  QAberto.Open;

  QNegociacao.Close;
  QNegociacao.Open;

  QApresentacao.Close;
  QApresentacao.Open;

  QAguardando.Close;
  QAguardando.Open;

  QSemInteresse.Close;
  QSemInteresse.Open;

  QFechado.Close;
  QFechado.Open;
end;

procedure TFCRM.ConfigSelecaoFechado;
begin
  FDatasetOrigem := BindSourceFechado.DataSet;
  btnFinalizarMovimento.Enabled := True;
end;

procedure TFCRM.FormCreate(Sender: TObject);
begin
  inherited;
  DMCRM := TDMCRM.Create(nil);
end;

procedure TFCRM.FormDestroy(Sender: TObject);
begin
  QAberto.Close;
  QApresentacao.Close;
  QNegociacao.Close;
  QAguardando.Close;
  QSemInteresse.Close;
  QFechado.Close;
  QAtualizaStatus.Close;
  QExcluiCRM.Close;
  FreeAndNil(DMCRM)
end;

procedure TFCRM.FormShow(Sender: TObject);
begin
  CarregaDados;
end;

procedure TFCRM.GridAbertoDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  case TStringGrid(Sender).Parent.Tag of
    1: AtualizaStatus(C_ABERTO);
    2: AtualizaStatus(C_APRESENTACAO);
    3: AtualizaStatus(C_NEGOCIACAO);
    4: AtualizaStatus(C_AGUARDANDO);
    5: AtualizaStatus(C_SEMINTERESSE);
    6: AtualizaStatus(C_FECHADO);
  end;
end;

procedure TFCRM.GridAbertoDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TStringGrid;
end;

procedure TFCRM.GridAbertoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btnFinalizarMovimento.Enabled := False;

  case TStringGrid(Sender).Parent.Tag of
    1: FDatasetOrigem := BindSourceAberto.DataSet;
    2: FDatasetOrigem := BindSourceApresentacao.DataSet;
    3: FDatasetOrigem := BindSourceNegociacao.DataSet;
    4: FDatasetOrigem := BindSourceAguardando.DataSet;
    5: FDatasetOrigem := BindSourceSemInteresse.DataSet;
    6:  ConfigSelecaoFechado;
  end;

  if FDatasetOrigem.IsEmpty then Exit;

  if Button = mbLeft then
    TStringGrid(Sender).BeginDrag(False, 4);
end;

end.

