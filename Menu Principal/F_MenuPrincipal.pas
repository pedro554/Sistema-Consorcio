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
    MFaixaComissao: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MVendedorFuncionarioClick(Sender: TObject);
  private
    Pacote: HModule;
    FormClasse: TFormClass;
    Form: TForm;

    procedure CarregaClasse(APacote, AClasse: string);
    procedure CarregaPacote(APacote, AClasse: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuPrincipal: TFMenuPrincipal;

implementation

{$R *.dfm}

procedure TFMenuPrincipal.CarregaClasse(APacote, AClasse: string);
begin
  FormClasse := TFormClass(GetClass(AClasse));
  if FormClasse = nil then
  begin
    UnloadPackage(Pacote);
    raise Exception.Create('Classe ' + AClasse + ' não encontrado no pacote ' + APacote);
  end;
end;

procedure TFMenuPrincipal.CarregaPacote(APacote, AClasse: string);
begin
  Pacote := LoadPackage(GetCurrentDir + '\' + APacote + '.bpl');
  if Pacote = 0 then
    raise Exception.Create('Pacote ' + APacote + ' não encontrado!');

  CarregaClasse(APacote, AClasse);

  Form := TFormClass(FormClasse).Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;

  UnloadPackage(Pacote);
end;

procedure TFMenuPrincipal.FormCreate(Sender: TObject);
begin
  stat.Panels.Items[0].Text := 'Versão: ' + IntToStr(VAR_VERSAO);
end;

procedure TFMenuPrincipal.MVendedorFuncionarioClick(Sender: TObject);
begin
  CarregaPacote('Funcionario', 'TFFuncionario');
end;

end.

