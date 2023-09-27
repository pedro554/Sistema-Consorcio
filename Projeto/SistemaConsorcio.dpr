program SistemaConsorcio;

uses
  Vcl.Forms,
  IniFiles,
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
  Cad_Cliente in '..\Cliente\Cad_Cliente.pas' {FCad_Cliente},
  F_FaixaComissao in '..\Faixa Comissao\F_FaixaComissao.pas' {FFaixaComissao},
  Cad_FaixaComissao in '..\Faixa Comissao\Cad_FaixaComissao.pas' {FCad_FaixaComissao},
  F_CRM in '..\CRM\F_CRM.pas' {FCRM},
  Cad_CRM in '..\CRM\Cad_CRM.pas' {FCad_CRM},
  Consulta_Cliente in '..\Cliente\Consulta_Cliente.pas' {FConsulta_Cliente},
  DM_Funcoes.Consulta in '..\Comum\DM_Funcoes.Consulta.pas' {DMFuncoesConsulta: TDataModule},
  Consulta_Funcionario in '..\P_Funcionario\Consulta_Funcionario.pas' {FConsulta_Funcionario},
  Cad_ConfgBanco in '..\Banco\Cad_ConfgBanco.pas' {FCad_ConfigBanco},
  DM_CRM in '..\CRM\DM_CRM.pas' {DMCRM: TDataModule},
  Constantes in '..\Comum\Constantes.pas',
  DM_RelComissaoPagar in '..\Comissao\DM_RelComissaoPagar.pas' {DMRelComissaoPagar: TDataModule},
  F_FiltroRelComissao in '..\Comissao\F_FiltroRelComissao.pas' {FFiltroRelComissao},
  Cad_ManutComissao in '..\Comissao\Cad_ManutComissao.pas' {FCad_ManutComissao};

{$R *.res}

var
  Ini: TIniFile;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMenuPrincipal, FMenuPrincipal);
  Application.CreateForm(TDMBanco, DMBanco);
  Ini := TIniFile.Create(DiretorioSistema + '\cfgbanco.ini');
  if not DMBanco.Conectar(
    Ini.ReadString('banco', 'usuario', 'root'),
    Ini.ReadString('banco', 'ip', 'localhost'),
    True) then
  begin
    Ini.Free;
    Application.Terminate;
  end;
  Ini.Free;

  Application.CreateForm(TDMFuncoesConsulta, DMFuncoesConsulta);
  Application.Run;
end.


