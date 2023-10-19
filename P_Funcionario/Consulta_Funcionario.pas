unit Consulta_Funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormularioBase.Consulta, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  JvMemoryDataset, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Phys.Intf, FireDAC.DApt.Intf;

type
  TFConsulta_Funcionario = class(TFormularioConsulta)
    QFuncionario: TFDQuery;
    QFuncionarioCD_FUNCIONARIO: TFDAutoIncField;
    QFuncionarioNM_FUNCIONARIO: TStringField;
    QFuncionarioDT_CADASTRO: TDateTimeField;
    QFuncionarioST_ATIVO: TStringField;
    TFuncionario: TJvMemoryData;
    TFuncionarioNM_FUNCIONARIO: TStringField;
    TFuncionarioDT_CADASTRO: TDateTimeField;
    TFuncionarioST_ATIVO: TStringField;
    TFuncionarioCD_FUNCIONARIO: TIntegerField;
    SFuncionario: TDataSource;
    procedure FormDestroy(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    procedure CarregaDados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsulta_Funcionario: TFConsulta_Funcionario;

implementation
uses Funcoes, DM_Funcoes.Consulta, Cad_Funcionario;

{$R *.dfm}

{ TFConsulta_Funcionario }

procedure TFConsulta_Funcionario.btnEditarClick(Sender: TObject);
var
  FCad: TFCad_Funcionario;
begin
  inherited;
  FCad := TFCad_Funcionario.Create(Self);
  try
    CopiaRegistro(TFuncionario, FCad.TFuncionario);
    if FCad.ShowModal = mrOk then
      CarregaDados;
  finally
    FreeAndNil(FCad);
  end;
end;

procedure TFConsulta_Funcionario.btnNovoClick(Sender: TObject);
var
  FCad: TFCad_Funcionario;
begin
  inherited;
  FCad := TFCad_Funcionario.Create(Self);
  try
    if FCad.ShowModal = mrOk then
      CarregaDados;
  finally
    FreeAndNil(FCad);
  end;
end;

procedure TFConsulta_Funcionario.btnPesquisaClick(Sender: TObject);
begin
  DMFuncoesConsulta.PesquisaGenerica(TFuncionario,
                                     DMFuncoesConsulta.PegaNomeCampoCombo(cbbColuna, Grid),
                                     edtPesquisa.Text);
  inherited;
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
  inherited;
  OnCarregaDados := CarregaDados;
end;

procedure TFConsulta_Funcionario.FormDestroy(Sender: TObject);
begin
  inherited;
  QFuncionario.Close;
  TFuncionario.Close;
end;

end.
