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
    QComissaoST_ESTORNO: TStringField;
    TComissaoST_ESTORNO: TStringField;
    TComissaoVL_PAGAR: TFloatField;
    procedure DataModuleDestroy(Sender: TObject);
  private
    Param: TParametros;
    procedure CarregaDados;
    function RetornaSQL: String;
    { Private declarations }
  public
    procedure Inicializa(ADatasetFiltro: TDataSet);
    { Public declarations }
  end;

var
  DMRelComissaoPagar: TDMRelComissaoPagar;

implementation
uses Constantes;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMRelComissaoPagar }

procedure TDMRelComissaoPagar.CarregaDados;
begin
  QComissao.Close;
  QComissao.SQL.Clear;
  QComissao.SQL.Add(RetornaSQL);
  QComissao.ParamByName('DT_INICIO').AsInteger := Param.DataInicio;
  QComissao.ParamByName('DT_FIM').AsInteger := Param.DataFim;
  if QComissao.FindParam('CD_FUNCIONARIO') <> nil then
    QComissao.ParamByName('CD_FUNCIONARIO').AsInteger := Param.Funcionario;
  QComissao.Open;

  if QComissao.IsEmpty then
  begin
    MyMessage(C_NENHUM_REGISTRO);
    Abort;
  end;

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
    TComissaoST_ESTORNO.AsString := QComissaoST_ESTORNO.AsString;
    if TComissaoST_ESTORNO.AsString = 'SIM' then
      TComissaoVL_PAGAR.AsFloat := 0
    else
      TComissaoVL_PAGAR.AsFloat := TComissaoVL_COMISSAO.AsFloat;
    TComissao.Post;
    QComissao.Next;
  end;
end;

procedure TDMRelComissaoPagar.DataModuleDestroy(Sender: TObject);
begin
  TComissao.Close;
  QComissao.Close;
end;

procedure TDMRelComissaoPagar.Inicializa(ADatasetFiltro: TDataSet);
begin
  Param.DataInicio  := ADatasetFiltro.FieldByName('DT_INICIO').AsInteger;
  Param.DataFim     := ADatasetFiltro.FieldByName('DT_FIM').AsInteger;
  Param.Funcionario := ADatasetFiltro.FieldByName('CD_FUNCIONARIO').AsInteger;

  CarregaDados;

  RelComissao.ShowReport;
end;

function TDMRelComissaoPagar.RetornaSQL: String;
begin
  Result := 'SELECT ' +
            'COMISSAOPARCELA.*, ' +
            'FUNCIONARIO.NM_FUNCIONARIO ' +
            'FROM ' +
            'COMISSAOPARCELA ' +
            'LEFT JOIN FUNCIONARIO ON ' +
            'FUNCIONARIO.CD_FUNCIONARIO = COMISSAOPARCELA.CD_FUNCIONARIO ' +
            'WHERE ' +
            'COMISSAOPARCELA.DT_PAGAMENTO BETWEEN :DT_INICIO AND :DT_FIM ';

  if Param.Funcionario <> 0 then
  begin
    Result := Result + 'AND COMISSAOPARCELA.CD_FUNCIONARIO = :CD_FUNCIONARIO ';
  end;

  Result := Result + 'ORDER BY ' +
                     'COMISSAOPARCELA.CD_FUNCIONARIO ';
end;

end.
