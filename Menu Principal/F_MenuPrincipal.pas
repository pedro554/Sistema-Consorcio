unit F_MenuPrincipal;

interface

uses
  FormularioBase,
  Variaveis_Sistema,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.Menus;

type
  TFMenuPrincipal = class(TFormulario)
    stat: TStatusBar;
    mm: TMainMenu;
    MGeral: TMenuItem;
    MVendedorFuncionario: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MVendedorFuncionarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuPrincipal: TFMenuPrincipal;

implementation
uses Funcoes, F_Funcionario;

{$R *.dfm}

procedure TFMenuPrincipal.FormCreate(Sender: TObject);
begin
  stat.Panels.Items[0].Text := 'Versão: ' + IntToStr(VAR_VERSAO);
end;

procedure TFMenuPrincipal.MVendedorFuncionarioClick(Sender: TObject);
var
  AForm: TFFuncionario;
begin
  AbreForm(TFFuncionario, TObject(AForm));
end;

end.

