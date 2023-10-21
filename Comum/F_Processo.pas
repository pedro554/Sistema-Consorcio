unit F_Processo;

interface

uses
  FormularioBase,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Gauges, Vcl.StdCtrls,
  IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, Vcl.ComCtrls,
  JvExComCtrls, JvProgressBar, Vcl.ExtCtrls;

type
  TOnExecutaProc = procedure of object;

  TFProcesso = class(TFormulario)
    IdAntiFreeze1: TIdAntiFreeze;
    progressPrincipal: TJvProgressBar;
    pnl: TPanel;
    lblDescricao: TLabel;
    procedure FormShow(Sender: TObject);
  private
    FTItulo: String;
    { Private declarations }
  public
    OnExecutaProc: TOnExecutaProc;
    property Titulo: String read FTItulo write FTitulo;

    procedure Inicializa;
    procedure IncrementaProgresso(AVal: Integer);
    procedure ReiniciaProgresso;
    procedure AtualizaDescricao(ADescricao: String);
    procedure Finaliza;
    procedure ConfiguraProgressoPrincipal(AMax: Integer);
    { Public declarations }
  end;

var
  FProcesso: TFProcesso;

implementation

{$R *.dfm}

procedure TFProcesso.AtualizaDescricao(ADescricao: String);
begin
  lblDescricao.Caption := ADescricao;
end;

procedure TFProcesso.ConfiguraProgressoPrincipal(AMax: Integer);
begin
  progressPrincipal.Max := AMax;
end;

procedure TFProcesso.Finaliza;
begin
  OnExecutaProc := nil;
  ReiniciaProgresso;
  Self.Close;
end;

procedure TFProcesso.FormShow(Sender: TObject);
begin
  Self.Caption := FTItulo;
end;

procedure TFProcesso.IncrementaProgresso(AVal: Integer);
begin
  progressPrincipal.Position := AVal;
end;

procedure TFProcesso.Inicializa;
begin
  Self.Show;
  OnExecutaProc;
end;

procedure TFProcesso.ReiniciaProgresso;
begin
  progressPrincipal.Position := 0;
end;

end.
