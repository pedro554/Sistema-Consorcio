unit Consulta_Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormularioBase.Consulta, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvMemoryDataset, DM_Banco;

type
  TFConsulta_Cliente = class(TFormularioConsulta)
    QCliente: TFDQuery;
    TCliente: TJvMemoryData;
    SCliente: TDataSource;
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
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    procedure CarregaDados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsulta_Cliente: TFConsulta_Cliente;

implementation
uses Funcoes, DM_Funcoes.Consulta, Cad_Cliente;

{$R *.dfm}

{ TFConsulta_Cliente }

procedure TFConsulta_Cliente.btnEditarClick(Sender: TObject);
var
  FCad: TFCad_Cliente;
begin
  inherited;
  FCad := TFCad_Cliente.Create(Self);
  try
    CopiaRegistro(TCliente, FCad.TCliente);
    if FCad.ShowModal = mrOk then
      CarregaDados;
  finally
    FreeAndNil(FCad);
  end;
end;

procedure TFConsulta_Cliente.btnNovoClick(Sender: TObject);
var
  FCad: TFCad_Cliente;
begin
  inherited;
  FCad := TFCad_Cliente.Create(Self);
  try
    if FCad.ShowModal = mrOk then
      CarregaDados;
  finally
    FreeAndNil(FCad);
  end;
end;

procedure TFConsulta_Cliente.btnPesquisaClick(Sender: TObject);
begin
  DMFuncoesConsulta.PesquisaGenerica(TCliente,
                                     DMFuncoesConsulta.PegaNomeCampoCombo(cbbColuna, Grid),
                                     edtPesquisa.Text);
  inherited;
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
  inherited;
  OnCarregaDados := CarregaDados;
end;

procedure TFConsulta_Cliente.FormDestroy(Sender: TObject);
begin
  inherited;
  TCliente.Close;
  QCliente.Close;
end;

end.
