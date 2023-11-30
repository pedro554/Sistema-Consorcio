unit Consulta_FaixaComissao;

interface

uses
  DM_Banco,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormularioBase.Consulta, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  JvMemoryDataset, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFConsulta_FaixaComissao = class(TFormularioConsulta)
    QFaixaComissao: TFDQuery;
    SFaixaComissao: TDataSource;
    TFaixaComissao: TJvMemoryData;
    QFaixaComissaoCD_FAIXACOMISSAO: TFDAutoIncField;
    QFaixaComissaoDS_FAIXACOMISSAO: TStringField;
    QFaixaComissaoNR_PARCELAS: TIntegerField;
    QFaixaComissaoVL_MINIMO: TFMTBCDField;
    QFaixaComissaoVL_MAXIMO: TFMTBCDField;
    QFaixaComissaoDT_CADASTRO: TDateTimeField;
    TFaixaComissaoDS_FAIXACOMISSAO: TStringField;
    TFaixaComissaoNR_PARCELAS: TIntegerField;
    TFaixaComissaoVL_MINIMO: TFMTBCDField;
    TFaixaComissaoVL_MAXIMO: TFMTBCDField;
    TFaixaComissaoDT_CADASTRO: TDateTimeField;
    TFaixaComissaoCD_FAIXACOMISSAO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    FSQLWhere: string;

    procedure CarregaDados;
    { Private declarations }
  public
    property SQLWhere: string read FSQLWhere write FSQLWhere;
    { Public declarations }
  end;

var
  FConsulta_FaixaComissao: TFConsulta_FaixaComissao;

implementation
uses Funcoes, DM_Funcoes.Consulta;

{$R *.dfm}

{ TFConsulta_FaixaComissao }

procedure TFConsulta_FaixaComissao.btnPesquisaClick(Sender: TObject);
begin
  DMFuncoesConsulta.PesquisaGenerica(TFaixaComissao,
                                     DMFuncoesConsulta.PegaNomeCampoCombo(cbbColuna, Grid),
                                     edtPesquisa.Text);
  inherited;
end;

procedure TFConsulta_FaixaComissao.CarregaDados;
begin
  QFaixaComissao.Close;
  QFaixaComissao.SQL.Clear;
  QFaixaComissao.SQL.Add('SELECT FAIXACOMISSAO.* FROM FAIXACOMISSAO ');
  if FSQLWhere <> EmptyStr then
    QFaixaComissao.SQL.Add(FSQLWhere);
  QFaixaComissao.Open;

  TFaixaComissao.Close;
  TFaixaComissao.Open;

  CopiaTabela(QFaixaComissao, TFaixaComissao);
end;

procedure TFConsulta_FaixaComissao.FormCreate(Sender: TObject);
begin
  inherited;
  Self.OnCarregaDados := CarregaDados;
end;

procedure TFConsulta_FaixaComissao.FormDestroy(Sender: TObject);
begin
  inherited;
  QFaixaComissao.Close;
  TFaixaComissao.Close;
end;

end.
