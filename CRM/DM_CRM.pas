unit DM_CRM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DateUtils;

type
  TDMCRM = class(TDataModule)
    QFaixaComissaoParcela: TFDQuery;
    QFaixaComissaoParcelaCD_FAIXACOMISSAO: TIntegerField;
    QFaixaComissaoParcelaNR_PARCELA: TIntegerField;
    QFaixaComissaoParcelaPC_COMISSAO: TFMTBCDField;
    QFaixaComissaoParcelaTP_PARCELA: TStringField;
    QComissaoParcela: TFDQuery;
    QComissaoParcelaNR_PARCELA: TIntegerField;
    QComissaoParcelaPC_COMISSAO: TFMTBCDField;
    QComissaoParcelaVL_COMISSAO: TFMTBCDField;
    QComissaoParcelaCD_CRM: TIntegerField;
    QComissaoParcelaCD_FAIXACOMISSAO: TIntegerField;
    QComissaoParcelaCD_FUNCIONARIO: TIntegerField;
    QComissaoParcelaCD_CLIENTE: TIntegerField;
    QComissaoParcelaTP_PARCELA: TStringField;
    QCRM: TFDQuery;
    QCRMCD_CRM: TFDAutoIncField;
    QCRMCD_CLIENTE: TIntegerField;
    QCRMCD_STATUS: TIntegerField;
    QCRMDS_OBS: TStringField;
    QCRMDT_CADASTRO: TDateTimeField;
    QCRMNM_CLIENTE: TStringField;
    QCRMCD_FUNCIONARIO: TIntegerField;
    QCRMVL_CREDITO: TFMTBCDField;
    QCRMDT_ATUALIZACAO: TDateTimeField;
    QCRMCD_FAIXACOMISSAO: TIntegerField;
    QCRMDS_FAIXACOMISSAO: TStringField;
    QCRMTP_PARCELA: TStringField;
    QComissaoParcelaNR_MESPAGAMENTO: TIntegerField;
    QComissaoParcelaNR_ANOPAGAMENTO: TIntegerField;
  private
    procedure CarregaFaixaComissaoParcela(const AFaixa: Integer; const ATipoParcela: string);
    function CalcularComissao(const porcentagemComissao: Double; const valorVenda: Double): Double;
    procedure CarregaMovimento(ACodMov: Integer);
    { Private declarations }
  public
    procedure FinalizaMovimento(const ACodMovimento: Integer);
    function MontaTitle(ATexto: String): String;
    function MontaDescricao(ATexto: String): String;
    { Public declarations }
  end;

var
  DMCRM: TDMCRM;

implementation

uses
  DM_Banco, Funcoes, Constantes;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMCRM }

function TDMCRM.CalcularComissao(const porcentagemComissao, valorVenda: Double): Double;
begin
  Result := (porcentagemComissao / 100) * valorVenda;
end;

procedure TDMCRM.CarregaFaixaComissaoParcela(const AFaixa: Integer; const ATipoParcela: string);
begin
  QFaixaComissaoParcela.Close;
  QFaixaComissaoParcela.ParamByName('CD_FAIXACOMISSAO').AsInteger := AFaixa;
  QFaixaComissaoParcela.ParamByName('TP_PARCELA').AsString := ATipoParcela;
  QFaixaComissaoParcela.Open;
end;

procedure TDMCRM.CarregaMovimento(ACodMov: Integer);
begin
  QCRM.Close;
  QCRM.ParamByName('CD_CRM').AsInteger := ACodMov;
  QCRM.Open;
end;

procedure TDMCRM.FinalizaMovimento(const ACodMovimento: Integer);
var
  lvNrParcela: Integer;
  lvPercentualComissao: Double;
  lvDataPagamento: TDateTime;
begin
  CarregaMovimento(ACodMovimento);
  CarregaFaixaComissaoParcela(QCRMCD_FAIXACOMISSAO.AsInteger,
                              QCRMTP_PARCELA.AsString);

  QComissaoParcela.Close;
  QComissaoParcela.Open;
  lvNrParcela := 1;
  lvDataPagamento := Date;

  QFaixaComissaoParcela.First;
  while not QFaixaComissaoParcela.Eof do
  begin
    lvPercentualComissao := QFaixaComissaoParcelaPC_COMISSAO.AsFloat;

    QComissaoParcela.Append;
    QComissaoParcelaNR_PARCELA.AsInteger        := lvNrParcela;
    QComissaoParcelaPC_COMISSAO.AsFloat         := QFaixaComissaoParcelaPC_COMISSAO.AsFloat;
    QComissaoParcelaVL_COMISSAO.AsFloat         := CalcularComissao(lvPercentualComissao, QCRMVL_CREDITO.AsFloat) / QFaixaComissaoParcela.RecordCount;
    QComissaoParcelaCD_CRM.AsFloat              := QCRMCD_CRM.AsInteger;
    QComissaoParcelaCD_FAIXACOMISSAO.AsInteger  := QCRMCD_FAIXACOMISSAO.AsInteger;
    QComissaoParcelaCD_FUNCIONARIO.AsInteger    := QCRMCD_FUNCIONARIO.AsInteger;
    QComissaoParcelaCD_CLIENTE.AsInteger        := QCRMCD_CLIENTE.AsInteger;
    QComissaoParcelaTP_PARCELA.AsString         := QCRMTP_PARCELA.AsString;
    QComissaoParcelaNR_MESPAGAMENTO.AsInteger   := MonthOf(lvDataPagamento);
    QComissaoParcelaNR_ANOPAGAMENTO.AsInteger   := YearOf(lvDataPagamento);
    QComissaoParcela.Post;
    QFaixaComissaoParcela.Next;
    Inc(lvNrParcela);
    lvDataPagamento := IncMonth(lvDataPagamento);
  end;

  MyMessage('Movimento finalizado!');
end;

function TDMCRM.MontaTitle(ATexto: String): String;
begin
  Result := '<font color="' + C_COR_TITLE + '">' + ATexto  + '</font>';
end;

function TDMCRM.MontaDescricao(ATexto: String): String;
begin
  Result := '<font color="' + C_COR_DESCRICAO + '">' + ATexto  + '</font>';
end;

end.

