unit Cad_Cliente;

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
  Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, System.Actions,
  Vcl.ActnList, Data.DB, JvMemoryDataset, FireDAC.Comp.DataSet,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, JvExMask,
  JvToolEdit, JvMaskEdit, JvDBControls;

type
  TFCad_Cliente = class(TFormulario)
    lbl1: TLabel;
    pnl1: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    edtNM_CLIENTE: TDBEdit;
    QCliente: TFDQuery;
    TCliente: TJvMemoryData;
    SCliente: TDataSource;
    actlst: TActionList;
    ACT_F8: TAction;
    ACT_F6: TAction;
    Transacao: TFDTransaction;
    QClienteCD_CLIENTE: TFDAutoIncField;
    QClienteNM_CLIENTE: TStringField;
    QClienteNR_FONE: TStringField;
    TClienteCD_CLIENTE: TIntegerField;
    TClienteNM_CLIENTE: TStringField;
    TClienteNR_FONE: TStringField;
    lbl2: TLabel;
    edtNR_FONE: TDBEdit;
    chkST_ATIVO: TDBCheckBox;
    QClienteST_ATIVO: TStringField;
    TClienteST_ATIVO: TStringField;
    procedure TClienteAfterInsert(DataSet: TDataSet);
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
  FCad_Cliente: TFCad_Cliente;

implementation
uses Funcoes;

{$R *.dfm}

procedure TFCad_Cliente.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFCad_Cliente.btnGravarClick(Sender: TObject);
begin
  if TCliente.State in [dsEdit, dsInsert] then
    TCliente.Post;

  ValidaCampo(TClienteNM_CLIENTE);
  Transacao.StartTransaction;
  try
    QCliente.Close;
    QCliente.ParamByName('CD_CLIENTE').AsInteger := TClienteCD_CLIENTE.AsInteger;
    QCliente.Open;

    CopiaRegistro(TCliente, QCliente, QCliente.IsEmpty);
    Transacao.Commit;
  except
    on e: exception do
    begin
      Transacao.Rollback;
      MyMessage('Falha ao gravar registro' + #13 + e.message);
      Abort;
    end;
  end;
  ModalResult := mrOk;
end;

procedure TFCad_Cliente.TClienteAfterInsert(DataSet: TDataSet);
begin
  TClienteST_ATIVO.AsString := 'SIM';
end;

procedure TFCad_Cliente.FormCreate(Sender: TObject);
begin
  TCliente.Open;
end;

procedure TFCad_Cliente.FormDestroy(Sender: TObject);
begin
  TCliente.Close;
  QCliente.Close;
end;

end.

