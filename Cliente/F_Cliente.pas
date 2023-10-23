unit F_Cliente;

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
  TFCliente = class(TFormulario)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtPesquisa: TEdit;
    cbbColuna: TComboBox;
    Grid: TJvDBGrid;
    pnl2: TPanel;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    QCliente: TFDQuery;
    TCliente: TJvMemoryData;
    SCliente: TDataSource;
    QClienteCD_CLIENTE: TFDAutoIncField;
    QClienteNM_CLIENTE: TStringField;
    QClienteNR_FONE: TStringField;
    TClienteNM_CLIENTE: TStringField;
    TClienteNR_FONE: TStringField;
    TClienteCD_CLIENTE: TIntegerField;
    TClienteST_MARCADO: TBooleanField;
    TClienteST_ATIVO: TStringField;
    QClienteST_ATIVO: TStringField;
    btnPesquisa: TButton;
    QClienteDS_EMAIL: TStringField;
    TClienteDS_EMAIL: TStringField;
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
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
  FCliente: TFCliente;

implementation
uses Funcoes, Funcoes.FormPrincipal, Cad_Cliente;

{$R *.dfm}

procedure TFCliente.btnEditarClick(Sender: TObject);
var
  FCad: TFCad_Cliente;
begin
  FCad := TFCad_Cliente.Create(Self);
  try
    CopiaRegistro(TCliente, FCad.TCliente);
    if FCad.ShowModal = mrOk then
      CarregaDados;
  finally
    FreeAndNil(FCad);
  end;
end;

procedure TFCliente.btnExcluirClick(Sender: TObject);
begin
  TCliente.DisableControls;
  FiltraMarcado(TCliente);
  try
    if TCliente.IsEmpty then
    begin
      MyMessage('Nenhum registro selecionado!');
      Abort;
    end;

    if MyMessage('Deseja excluir os registros selecionados?', 4) = 6 then
    begin
      TCliente.First;
      while not TCliente.Eof do
      begin
        if QCliente.Locate('CD_CLIENTE', TClienteCD_CLIENTE.AsInteger, []) then
          QCliente.Delete;
        TCliente.Delete;
      end;
    end;
  finally
    RemoveFiltroTabela(TCliente);
    TCliente.EnableControls;
  end;
end;

procedure TFCliente.btnNovoClick(Sender: TObject);
var
  FCad: TFCad_Cliente;
begin
  FCad := TFCad_Cliente.Create(Self);
  try
    if FCad.ShowModal = mrOk then
      CarregaDados;
  finally
    FreeAndNil(FCad);
  end;
end;

procedure TFCliente.btnPesquisaClick(Sender: TObject);
begin
  PesquisaGenerica(TCliente, PegaNomeCampoCombo(cbbColuna, Grid), edtPesquisa.Text);
  Grid.SetFocus;
end;

procedure TFCliente.FormCreate(Sender: TObject);
begin
  inherited;
  TCliente.Open;
  CarregaComboPesquisa(cbbColuna, Grid);
end;

procedure TFCliente.FormDestroy(Sender: TObject);
begin
  TCliente.Close;
  QCliente.Close;
end;

procedure TFCliente.CarregaDados;
begin
  CarregaDadosQueryMemoria(QCliente, TCliente);
end;

procedure TFCliente.FormShow(Sender: TObject);
begin
  CarregaDados;
end;

procedure TFCliente.GridDblClick(Sender: TObject);
begin
  SelecionaRegistroGrid(TCliente);
end;

end.

