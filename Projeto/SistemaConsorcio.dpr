program SistemaConsorcio;

uses
  Vcl.Forms,
  F_MenuPrincipal in '..\Menu Principal\F_MenuPrincipal.pas' {FMenuPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  DM_Banco in '..\Banco\DM_Banco.pas' {DMBanco: TDataModule},
  Funcoes.FormPrincipal in '..\Comum\Funcoes.FormPrincipal.pas',
  Funcoes in '..\Comum\Funcoes.pas',
  Variaveis_Sistema in '..\Comum\Variaveis_Sistema.pas',
  Cad_Funcionario in '..\P_Funcionario\Cad_Funcionario.pas' {FCad_Funcionario},
  F_Funcionario in '..\P_Funcionario\F_Funcionario.pas' {FFuncionario},
  FormularioBase in '..\Comum\FormularioBase.pas' {Formulario},
  F_Cliente in '..\Cliente\F_Cliente.pas' {FCliente},
  Cad_Cliente in '..\Cliente\Cad_Cliente.pas' {FCad_Cliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMenuPrincipal, FMenuPrincipal);
  Application.CreateForm(TDMBanco, DMBanco);
  Application.Run;
end.


