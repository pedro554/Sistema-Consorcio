unit Consulta_Funcionario;

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
  Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, System.Actions,
  Vcl.ActnList, JvMemoryDataset, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TFConsulta_Funcionario = class(TFormulario)
    pnl1: TPanel;
    lbl1: TLabel;
    btnPesquisar: TSpeedButton;
    lbl2: TLabel;
    edtPesquisa: TEdit;
    cbbColuna: TComboBox;
    pnl2: TPanel;
    btnSelecionar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Grid: TJvDBGrid;
    QFuncionario: TFDQuery;
    TFuncionario: TJvMemoryData;
    SFuncionario: TDataSource;
    actlst: TActionList;
    ACT_F8: TAction;
    ACT_F6: TAction;
    QFuncionarioCD_FUNCIONARIO: TFDAutoIncField;
    QFuncionarioNM_FUNCIONARIO: TStringField;
    QFuncionarioDT_CADASTRO: TDateTimeField;
    QFuncionarioST_ATIVO: TStringField;
    TFuncionarioNM_FUNCIONARIO: TStringField;
    TFuncionarioDT_CADASTRO: TDateTimeField;
    TFuncionarioST_ATIVO: TStringField;
    TFuncionarioCD_FUNCIONARIO: TIntegerField;
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CarregaDados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsulta_Funcionario: TFConsulta_Funcionario;

implementation
uses Funcoes;

{$R *.dfm}

procedure TFConsulta_Funcionario.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFConsulta_Funcionario.btnPesquisarClick(Sender: TObject);
begin
  DMFuncoesConsulta.PesquisaGenerica(TFuncionario,
                                     DMFuncoesConsulta.PegaNomeCampoCombo(cbbColuna, Grid),
                                     edtPesquisa.Text);
end;

procedure TFConsulta_Funcionario.btnSelecionarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFConsulta_Funcionario.CarregaDados;
begin
  QFuncionario.Close;
  QFuncionario.Open;
  TFuncionario.Close;
  TFuncionario.Open;
  CopiaTabela(QFuncionario, TFuncionario);
  TFuncionario.First;
end;

procedure TFConsulta_Funcionario.FormCreate(Sender: TObject);
begin
  DMFuncoesConsulta.CarregaComboBoxColuna(cbbColuna, Grid);
end;

procedure TFConsulta_Funcionario.FormDestroy(Sender: TObject);
begin
  QFuncionario.Close;
  TFuncionario.Close;
end;

procedure TFConsulta_Funcionario.FormShow(Sender: TObject);
begin
  CarregaDados;
end;

end.

