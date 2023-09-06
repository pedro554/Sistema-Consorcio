unit FormularioBase;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  System.Actions,
  Vcl.ActnList,
  JvComponentBase,
  JvEnterTab;

type
  TFormulario = class(TForm)
    JvEnterAsTab1: TJvEnterAsTab;
    actlstpadrao: TActionList;
    ACT_ESC: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ACT_ESCExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formulario: TFormulario;

implementation
uses  Variaveis_Sistema;

{$R *.dfm}

procedure TFormulario.ACT_ESCExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormulario.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;
  Self.Caption := Self.Caption + ' | ' + VAR_SISTEMA;
  Self.Color := clBtnFace;
end;

end.

