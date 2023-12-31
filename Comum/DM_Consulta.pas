unit DM_Consulta;

interface

uses
  System.SysUtils, System.Classes, Funcoes, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMConsulta = class(TDataModule)
  private
    { Private declarations }
  public
    procedure ConsultaFuncionario(ADatasetDestino: TDataSet);
    procedure ConsultaClietne(ADatasetDestino: TDataSet);
    procedure ConsultaFaixaComissao(ADatasetDestino: TDataSet; ASQLWhere: String = '');
    { Public declarations }
  end;

var
  DMConsulta: TDMConsulta;

implementation
uses Consulta_Funcionario, Cad_Funcionario, Consulta_Cliente, Cad_Cliente,
Consulta_FaixaComissao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDMConsulta.ConsultaClietne(ADatasetDestino: TDataSet);
var
  FConsulta_Cliente: TFConsulta_Cliente;
begin
  FConsulta_Cliente := TFConsulta_Cliente.Create(Self);
  try
    if FConsulta_Cliente.ShowModal = 1 then
      CopiaRegistro(FConsulta_Cliente.TCliente, ADatasetDestino, False);
  finally
    FreeAndNil(FConsulta_Cliente);
  end;
end;

procedure TDMConsulta.ConsultaFaixaComissao(ADatasetDestino: TDataSet; ASQLWhere: String = '');
var
  FConsulta_FaixaComissao: TFConsulta_FaixaComissao;
begin
  FConsulta_FaixaComissao := TFConsulta_FaixaComissao.Create(Self);
  try
    FConsulta_FaixaComissao.SQLWhere := ASQLWhere;

    if FConsulta_FaixaComissao.ShowModal = 1 then
      CopiaRegistro(FConsulta_FaixaComissao.TFaixaComissao, ADatasetDestino, False);
  finally
    FreeAndNil(FConsulta_FaixaComissao);
  end;
end;

procedure TDMConsulta.ConsultaFuncionario(ADatasetDestino: TDataSet);
var
  FConsulta_Funcionario: TFConsulta_Funcionario;
begin
  FConsulta_Funcionario := TFConsulta_Funcionario.Create(Self);
  try
    if FConsulta_Funcionario.ShowModal = 1 then
      CopiaRegistro(FConsulta_Funcionario.TFuncionario, ADatasetDestino, False);
  finally
    FreeAndNil(FConsulta_Funcionario);
  end;
end;

end.
