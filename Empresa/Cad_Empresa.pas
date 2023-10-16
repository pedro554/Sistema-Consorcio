unit Cad_Empresa;

interface

uses
  DM_Banco, FormularioBase, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, JvMemoryDataset;

type
  TFCad_Empresa = class(TFormulario)
    QEmpresa: TFDQuery;
    QEmpresaNR_CPFCNPJ: TStringField;
    QEmpresaDT_VALIDADE: TDateTimeField;
    QEmpresaNM_CLIENTE: TStringField;
    edtNM_CLIENTE: TDBEdit;
    SEmpresa: TDataSource;
    lbl1: TLabel;
    edtNR_CPFCNPJ: TDBEdit;
    lbl2: TLabel;
    pnl1: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    TEmpresa: TJvMemoryData;
    TEmpresaNR_CPFCNPJ: TStringField;
    TEmpresaDT_VALIDADE: TDateTimeField;
    TEmpresaNM_CLIENTE: TStringField;
    QEmpresaLocal: TFDQuery;
    QEmpresaLocalNR_CPFCNPJ: TStringField;
    TEmpresaNR_MACADRESS: TStringField;
    QEmpresaNR_MACADRESS: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure TEmpresaAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCad_Empresa: TFCad_Empresa;

implementation
uses Funcoes, Constantes;

{$R *.dfm}

procedure TFCad_Empresa.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFCad_Empresa.btnGravarClick(Sender: TObject);
begin
  if TEmpresa.State in [dsEdit, dsInsert] then TEmpresa.Post;

  ValidaCampo(TEmpresaNM_CLIENTE);
  ValidaCampo(TEmpresaNR_CPFCNPJ);
  ValidaCPFCNPJ(TEmpresaNR_CPFCNPJ.AsString);

  QEmpresa.Close;
  QEmpresa.Open;
  QEmpresa.Append;
  CopiaRegistro(TEmpresa, QEmpresa);

  QEmpresaLocal.Close;
  QEmpresaLocal.Open;
  QEmpresaLocal.Append;
  CopiaRegistro(TEmpresa, QEmpresaLocal);

  ModalResult := mrOk;
end;

procedure TFCad_Empresa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TEmpresa.Close;
  QEmpresa.Close;
end;

procedure TFCad_Empresa.FormShow(Sender: TObject);
begin
  TEmpresa.Open;
  TEmpresa.Append;
end;

procedure TFCad_Empresa.TEmpresaAfterInsert(DataSet: TDataSet);
begin
  TEmpresaDT_VALIDADE.AsDateTime := Date + C_DIASVERSAOTESTE;
  TEmpresaNR_MACADRESS.AsString := GetMacAddress;
end;

end.

