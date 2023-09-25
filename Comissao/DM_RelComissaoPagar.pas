unit DM_RelComissaoPagar;

interface

uses
  DM_Banco,
  Funcoes,
  System.SysUtils, System.Classes, frxClass, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  JvMemoryDataset, frxDBSet, Variants;

type
  TParametros = record
    DataInicio: Integer;
    DataFim: Integer;
    Funcionario: Integer;
  end;

  TDMRelComissaoPagar = class(TDataModule)
    RelComissao: TfrxReport;
    QComissao: TFDQuery;
    TComissao: TJvMemoryData;
    QComissaoCD_COMISSAOPARCELA: TFDAutoIncField;
    QComissaoNR_PARCELA: TIntegerField;
    QComissaoPC_COMISSAO: TFMTBCDField;
    QComissaoVL_COMISSAO: TFMTBCDField;
    QComissaoCD_CRM: TIntegerField;
    QComissaoCD_FAIXACOMISSAO: TIntegerField;
    QComissaoCD_FUNCIONARIO: TIntegerField;
    QComissaoCD_CLIENTE: TIntegerField;
    QComissaoTP_PARCELA: TStringField;
    QComissaoDT_CADASTRO: TDateTimeField;
    QComissaoNR_MESPAGAMENTO: TIntegerField;
    QComissaoNR_ANOPAGAMENTO: TIntegerField;
    QComissaoNM_FUNCIONARIO: TStringField;
    SComissao: TfrxDBDataset;
    TComissaoVL_COMISSAO: TFMTBCDField;
    TComissaoCD_FUNCIONARIO: TIntegerField;
    TComissaoNR_MESPAGAMENTO: TIntegerField;
    TComissaoNR_ANOPAGAMENTO: TIntegerField;
    TComissaoNM_FUNCIONARIO: TStringField;
    QComissaoDT_PAGAMENTO: TIntegerField;
    TComissaoDT_PAGAMENTO: TIntegerField;
  private
    Param: TParametros;
    procedure CarregaDados;
    { Private declarations }
  public
    procedure Inicializa(ADatasetFiltro: TDataSet);
    { Public declarations }
  end;

var
  DMRelComissaoPagar: TDMRelComissaoPagar;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMRelComissaoPagar }

procedure TDMRelComissaoPagar.CarregaDados;
begin
  QComissao.Close;
  QComissao.ParamByName('DT_INICIO').AsInteger := Param.DataInicio;
  QComissao.ParamByName('DT_FIM').AsInteger := Param.DataFim;
  QComissao.Open;
  TComissao.Close;
  TComissao.Open;

  while not QComissao.Eof do
  begin
    if TComissao.Locate('CD_FUNCIONARIO;DT_PAGAMENTO',
                        VarArrayOf([QComissaoCD_FUNCIONARIO.AsInteger, QComissaoDT_PAGAMENTO.AsInteger]),
                        []) then
      TComissao.Edit
    else
      TComissao.Append;

    TComissaoNM_FUNCIONARIO.AsString := QComissaoCD_FUNCIONARIO.AsString + ' - ' + QComissaoNM_FUNCIONARIO.AsString;
    TComissaoVL_COMISSAO.AsFloat := TComissaoVL_COMISSAO.AsFloat + QComissaoVL_COMISSAO.AsFloat;
    TComissaoCD_FUNCIONARIO.AsInteger := QComissaoCD_FUNCIONARIO.AsInteger;
    TComissaoNR_MESPAGAMENTO.AsInteger := QComissaoNR_MESPAGAMENTO.AsInteger;
    TComissaoNR_ANOPAGAMENTO.AsInteger := QComissaoNR_ANOPAGAMENTO.AsInteger;
    TComissaoDT_PAGAMENTO.AsInteger := QComissaoDT_PAGAMENTO.AsInteger;
    TComissao.Post;
    QComissao.Next;
  end;
end;

procedure TDMRelComissaoPagar.Inicializa(ADatasetFiltro: TDataSet);
begin
  Param.DataInicio  := ADatasetFiltro.FieldByName('DT_INICIO').AsInteger;
  Param.DataFim     := ADatasetFiltro.FieldByName('DT_FIM').AsInteger;

  CarregaDados;

  RelComissao.ShowReport;
end;

end.
