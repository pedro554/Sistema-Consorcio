unit Consulta_Cliente;

interface

uses
  FormularioBase,
  DM_Banco,
  DM_Funcoes.Consulta,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  JvExDBGrids,
  JvDBGrid,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  JvMemoryDataset,
  System.Actions,
  Vcl.ActnList;

type
  TFConsulta_Cliente = class(TFormulario)
    pnl1: TPanel;
    edtPesquisa: TEdit;
    lbl1: TLabel;
    pnl2: TPanel;
    btnSelecionar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Grid: TJvDBGrid;
    QCliente: TFDQuery;
    TCliente: TJvMemoryData;
    QClienteCD_CLIENTE: TFDAutoIncField;
    QClienteNM_CLIENTE: TStringField;
    QClienteNR_FONE: TStringField;
    QClienteDT_CADASTRO: TDateTimeField;
    QClienteST_ATIVO: TStringField;
    TClienteNM_CLIENTE: TStringField;
    TClienteNR_FONE: TStringField;
    TClienteDT_CADASTRO: TDateTimeField;
    TClienteST_ATIVO: TStringField;
    TClienteCD_CLIENTE: TIntegerField;
    SCliente: TDataSource;
    actlst: TActionList;
    ACT_F8: TAction;
    ACT_F6: TAction;
    cbbColuna: TComboBox;
    lbl2: TLabel;
    btnPesquisa: TButton;
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    procedure CarregaDados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsulta_Cliente: TFConsulta_Cliente;

implementation

uses
  Funcoes;

{$R *.dfm}

procedure TFConsulta_Cliente.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFConsulta_Cliente.btnPesquisaClick(Sender: TObject);
begin
  DMFuncoesConsulta.PesquisaGenerica(TCliente,
                                     DMFuncoesConsulta.PegaNomeCampoCombo(cbbColuna, Grid),
                                     edtPesquisa.Text);
  Grid.SetFocus;
end;

procedure TFConsulta_Cliente.btnSelecionarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFConsulta_Cliente.CarregaDados;
begin
  QCliente.Close;
  QCliente.Open;
  TCliente.Close;
  TCliente.Open;
  CopiaTabela(QCliente, TCliente);
  TCliente.First;
end;

procedure TFConsulta_Cliente.FormCreate(Sender: TObject);
begin
  DMFuncoesConsulta.CarregaComboBoxColuna(cbbColuna, Grid);
end;

procedure TFConsulta_Cliente.FormDestroy(Sender: TObject);
begin
  TCliente.Close;
  QCliente.Close;
end;

procedure TFConsulta_Cliente.FormShow(Sender: TObject);
begin
  CarregaDados;
end;

end.

