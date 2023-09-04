program SistemaConsorcio;

uses
  Vcl.Forms,
  F_MenuPrincipal in '..\Menu Principal\F_MenuPrincipal.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  Funcoes in '..\Comum\Funcoes.pas',
  Variaveis_Sistema in '..\Comum\Variaveis_Sistema.pas',
  FormularioBase in '..\Comum\FormularioBase.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
