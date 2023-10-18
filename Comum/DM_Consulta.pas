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
    { Public declarations }
  end;

var
  DMConsulta: TDMConsulta;

implementation
uses Consulta_Funcionario;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

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
