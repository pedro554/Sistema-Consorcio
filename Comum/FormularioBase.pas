unit FormularioBase;

interface

uses
  Variaveis_Sistema,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs, JvComponentBase, JvEnterTab, System.Actions, Vcl.ActnList;

type
  TFormulario = class(TForm)
    EnterAsTab: TJvEnterAsTab;
    actlstBase: TActionList;
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

