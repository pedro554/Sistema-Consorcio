unit Cad_Funcionario;

interface

uses
  FormularioBase,
  DM_Banco,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  JvMemoryDataset,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFCad_Funcionario = class(TFormulario)
    QFuncionario: TFDQuery;
    TFuncionario: TJvMemoryData;
    SFuncionario: TDataSource;
    QFuncionarioNM_FUNCIONARIO: TStringField;
    QFuncionarioCD_FUNCIONARIO: TIntegerField;
    TFuncionarioCD_FUNCIONARIO: TIntegerField;
    TFuncionarioNM_FUNCIONARIO: TStringField;
    pnl1: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    actlst: TActionList;
    ACT_F8: TAction;
    ACT_F6: TAction;
    edtNM_FUNCIONARIO: TDBEdit;
    lbl1: TLabel;
    Transacao: TFDTransaction;
    chkST_ATIVO: TDBCheckBox;
    QFuncionarioST_ATIVO: TStringField;
    TFuncionarioST_ATIVO: TStringField;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCad_Funcionario: TFCad_Funcionario;

implementation
uses
  Funcoes;

{$R *.dfm}

procedure TFCad_Funcionario.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFCad_Funcionario.btnGravarClick(Sender: TObject);
begin
  if TFuncionario.State in [dsEdit, dsInsert] then
    TFuncionario.Post;

  ValidaCampo(TFuncionarioNM_FUNCIONARIO);
  Transacao.StartTransaction;
  try
    QFuncionario.Close;
    QFuncionario.ParamByName('CD_FUNCIONARIO').AsInteger := TFuncionarioCD_FUNCIONARIO.AsInteger;
    QFuncionario.Open;
    CopiaRegistro(TFuncionario, QFuncionario, QFuncionario.IsEmpty);
    Transacao.Commit;
  except
    on e: exception do
    begin
      Transacao.Rollback;
      MyMessage('Falha ao gravar registro no banco de dados' + #13 + e.message);
      Abort;
    end;
  end;

  ModalResult := mrOk;
end;

procedure TFCad_Funcionario.FormCreate(Sender: TObject);
begin
  TFuncionario.Open;
end;

procedure TFCad_Funcionario.FormDestroy(Sender: TObject);
begin
  TFuncionario.Close;
  QFuncionario.Close;
end;

end.

