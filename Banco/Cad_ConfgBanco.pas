unit Cad_ConfgBanco;

interface

uses
  DM_Banco, FormularioBase, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, IniFiles,
  System.Actions, Vcl.ActnList;

type
  TFCad_ConfigBanco = class(TFormulario)
    edtUsuario: TEdit;
    lbl2: TLabel;
    pnl1: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    edtIP: TEdit;
    lbl4: TLabel;
    btnTestar: TSpeedButton;
    actlst: TActionList;
    ACT_F8: TAction;
    ACT_F6: TAction;
    lbl5: TLabel;
    edtDB: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnTestarClick(Sender: TObject);
  private
    Ini: TIniFile;
    procedure CarregarArquivoIni;
    procedure GravaArquivoIni;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCad_ConfigBanco: TFCad_ConfigBanco;

implementation

uses
  Funcoes;

{$R *.dfm}

procedure TFCad_ConfigBanco.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFCad_ConfigBanco.btnGravarClick(Sender: TObject);
begin
  GravaArquivoIni;
  ModalResult := mrOk;
end;

procedure TFCad_ConfigBanco.btnTestarClick(Sender: TObject);
begin
  DMBanco.Conectar(edtUsuario.Text, edtIP.Text, edtDB.Text, False);
  if DMBanco.con.Connected then
    MyMessage('Conexão realizada com sucesso!');
end;

procedure TFCad_ConfigBanco.CarregarArquivoIni;
begin
  edtUsuario.Text := Ini.ReadString('banco', 'usuario', 'root');
  edtIP.Text := Ini.ReadString('banco', 'ip', 'localhost');
  edtDB.Text := Ini.ReadString('banco', 'db', 'sistema');
end;

procedure TFCad_ConfigBanco.FormCreate(Sender: TObject);
begin
  Ini := TIniFile.Create(DiretorioSistema + '\cfgbanco.ini');
  CarregarArquivoIni;
end;

procedure TFCad_ConfigBanco.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Ini);
end;

procedure TFCad_ConfigBanco.GravaArquivoIni;
begin
  Ini.WriteString('banco', 'usuario', edtUsuario.Text);
  Ini.WriteString('banco', 'ip', edtIP.Text);
  Ini.WriteString('banco', 'db', edtDb.Text);
end;

end.

