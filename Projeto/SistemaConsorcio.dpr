program SistemaConsorcio;

uses
  Vcl.Forms,
  F_MenuPrincipal in '..\Menu Principal\F_MenuPrincipal.pas' {FMenuPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  Variaveis_Sistema in '..\Comum\Variaveis_Sistema.pas',
  FormularioBase in '..\Comum\FormularioBase.pas' {Formulario},
  DM_Banco in '..\Banco\DM_Banco.pas' {DMBanco: TDataModule},
  Funcoes in '..\Comum\Funcoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMenuPrincipal, FMenuPrincipal);
  Application.CreateForm(TDMBanco, DMBanco);
  Application.Run;
end.
