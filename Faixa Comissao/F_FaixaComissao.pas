unit F_FaixaComissao;

interface

uses
  FormularioBase,
  DM_Banco,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  JvMemoryDataset,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Grids,
  Vcl.DBGrids,
  JvExDBGrids,
  JvDBGrid,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TFFaixaComissao = class(TFormulario)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    btnPesquisa: TSpeedButton;
    edtPesquisa: TEdit;
    cbbColuna: TComboBox;
    Grid: TJvDBGrid;
    pnl2: TPanel;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    QFaixaComissao: TFDQuery;
    TFaixaComissao: TJvMemoryData;
    TFaixaComissaoST_MARCADO: TBooleanField;
    SFaixaComissao: TDataSource;
    QFaixaComissaoCD_FAIXACOMISSAO: TFDAutoIncField;
    QFaixaComissaoDS_FAIXACOMISSAO: TStringField;
    TFaixaComissaoDS_FAIXACOMISSAO: TStringField;
    TFaixaComissaoCD_FAIXACOMISSAO: TIntegerField;
    QFaixaComissaoNR_PARCELAS: TIntegerField;
    QFaixaComissaoVL_MINIMO: TFMTBCDField;
    QFaixaComissaoVL_MAXIMO: TFMTBCDField;
    QFaixaComissaoDT_CADASTRO: TDateTimeField;
    TFaixaComissaoNR_PARCELAS: TIntegerField;
    TFaixaComissaoVL_MINIMO: TFloatField;
    TFaixaComissaoVL_MAXIMO: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure TFaixaComissaoAfterInsert(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    procedure CarregaDados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFaixaComissao: TFFaixaComissao;

implementation
uses Funcoes, Funcoes.FormPrincipal, Cad_FaixaComissao;

{$R *.dfm}

{ TFFaixaComissao }

procedure TFFaixaComissao.btnEditarClick(Sender: TObject);
var
  FCad: TFCad_FaixaComissao;
begin
  FCad := TFCad_FaixaComissao.Create(Self);
  try
    CopiaRegistro(TFaixaComissao, FCad.TFaixaComissao);
    if FCad.ShowModal = mrOk then
      CarregaDados;
  finally
    FreeAndNil(FCad);
  end;
end;

procedure TFFaixaComissao.btnExcluirClick(Sender: TObject);
begin
  ExcluirRegistroSelecionadoGenerico(TFaixaComissao,
                                     QFaixaComissao,
                                     'CD_FAIXACOMISSAO',
                                     TFaixaComissaoCD_FAIXACOMISSAO.AsInteger);
end;

procedure TFFaixaComissao.btnNovoClick(Sender: TObject);
var
  FCad: TFCad_FaixaComissao;
begin
  FCad := TFCad_FaixaComissao.Create(Self);
  try
    if FCad.ShowModal = mrOk then
      CarregaDados;
  finally
    FreeAndNil(FCad);
  end;
end;

procedure TFFaixaComissao.btnPesquisaClick(Sender: TObject);
begin
  PesquisaGenerica(TFaixaComissao, PegaNomeCampoCombo(cbbColuna, Grid), edtPesquisa.Text);
end;

procedure TFFaixaComissao.CarregaDados;
begin
  QFaixaComissao.Close;
  QFaixaComissao.Open;

  TFaixaComissao.Close;
  TFaixaComissao.Open;

  while not QFaixaComissao.Eof do
  begin
    CopiaRegistro(QFaixaComissao, TFaixaComissao);
    QFaixaComissao.Next;
  end;
  TFaixaComissao.First;
end;

procedure TFFaixaComissao.FormCreate(Sender: TObject);
begin
  inherited;
  TFaixaComissao.Open;
  CarregaComboPesquisa(cbbColuna, Grid);
end;

procedure TFFaixaComissao.FormDestroy(Sender: TObject);
begin
  TFaixaComissao.Close;
  QFaixaComissao.Close;
end;

procedure TFFaixaComissao.FormShow(Sender: TObject);
begin
  CarregaDados;
end;

procedure TFFaixaComissao.GridDblClick(Sender: TObject);
begin
  SelecionaRegistroGrid(TFaixaComissao);
end;

procedure TFFaixaComissao.TFaixaComissaoAfterInsert(DataSet: TDataSet);
begin
  TFaixaComissaoST_MARCADO.AsBoolean := False;
end;

end.

