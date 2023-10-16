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
  Vcl.Menus, IdBaseComponent, IdThreadComponent;

type
  TFMenuPrincipal = class(TFormulario)
    stat: TStatusBar;
    mm: TMainMenu;
    MGeral: TMenuItem;
    MVendedorFuncionario: TMenuItem;
    Clientes1: TMenuItem;
    MFaixaComissao: TMenuItem;
    CRM1: TMenuItem;
    Configurao1: TMenuItem;
    BancodeDados1: TMenuItem;
    Relatrios1: TMenuItem;
    Comisso1: TMenuItem;
    RelatriodePagamentodeComisso1: TMenuItem;
    Manuteno1: TMenuItem;
    ManutenodeComisses1: TMenuItem;
    ThreadAtualizacao: TIdThreadComponent;
    procedure MVendedorFuncionarioClick(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure MFaixaComissaoClick(Sender: TObject);
    procedure CRM1Click(Sender: TObject);
    procedure BancodeDados1Click(Sender: TObject);
    procedure RelatriodePagamentodeComisso1Click(Sender: TObject);
    procedure ManutenodeComisses1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ThreadAtualizacaoRun(Sender: TIdThreadComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuPrincipal: TFMenuPrincipal;

implementation
uses Funcoes, F_Funcionario, F_Cliente, F_FaixaComissao, F_CRM, Cad_ConfgBanco,
F_FiltroRelComissao, Cad_ManutComissao, DM_Atualizacao;

{$R *.dfm}

procedure TFMenuPrincipal.BancodeDados1Click(Sender: TObject);
var
  AForm: TFCad_ConfigBanco;
begin
  AbreForm(TFCad_ConfigBanco, TObject(AForm));
end;

procedure TFMenuPrincipal.Clientes1Click(Sender: TObject);
var
  AForm: TFCliente;
begin
  AbreForm(TFCliente, TObject(AForm));
end;

procedure TFMenuPrincipal.CRM1Click(Sender: TObject);
var
  AForm: TFCRM;
begin
  AbreForm(TFCRM, TObject(AForm));
end;

procedure TFMenuPrincipal.FormShow(Sender: TObject);
begin
  stat.Panels.Items[0].Text := 'Vers�o: ' + IntToStr(VAR_VERSAO);
  stat.Panels.Items[1].Text := 'CPF/CNPJ: ' + VAR_CPFCNPJ;
  stat.Panels.Items[2].Text := 'Validade: ' + VAR_VALIDADE;
  ThreadAtualizacao.Start;
end;

procedure TFMenuPrincipal.ManutenodeComisses1Click(Sender: TObject);
var
  AForm: TFFaixaComissao;
begin
  AbreForm(TFCad_ManutComissao, TObject(AForm));
end;

procedure TFMenuPrincipal.MFaixaComissaoClick(Sender: TObject);
var
  AForm: TFFaixaComissao;
begin
  AbreForm(TFFaixaComissao, TObject(AForm));
end;

procedure TFMenuPrincipal.MVendedorFuncionarioClick(Sender: TObject);
var
  AForm: TFFuncionario;
begin
  AbreForm(TFFuncionario, TObject(AForm));
end;

procedure TFMenuPrincipal.RelatriodePagamentodeComisso1Click(
  Sender: TObject);
var
  AForm: TFFaixaComissao;
begin
  AbreForm(TFFiltroRelComissao, TObject(AForm));
end;

procedure TFMenuPrincipal.ThreadAtualizacaoRun(Sender: TIdThreadComponent);
begin
  try
  if DMAtualizacao.BaixarAtualizacao then
    MyMessage('Atualiza��o do sistema finalizada!');
  finally
    Sender.Terminate;
  end;
end;

end.

