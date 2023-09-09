unit Cad_FaixaComissao;

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
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, JvMemoryDataset, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TFCad_FaixaComissao = class(TFormulario)
    QFaixaComissao: TFDQuery;
    TFaixaComissao: TJvMemoryData;
    QFaixaComissaoCD_FAIXACOMISSAO: TFDAutoIncField;
    QFaixaComissaoDS_FAIXACOMISSAO: TStringField;
    QFaixaComissaoNR_PARCELAS: TIntegerField;
    QFaixaComissaoVL_MINIMO: TFMTBCDField;
    QFaixaComissaoVL_MAXIMO: TFMTBCDField;
    TFaixaComissaoCD_FAIXACOMISSAO: TIntegerField;
    TFaixaComissaoDS_FAIXACOMISSAO: TStringField;
    TFaixaComissaoNR_PARCELAS: TIntegerField;
    TFaixaComissaoVL_MINIMO: TFloatField;
    TFaixaComissaoVL_MAXIMO: TFloatField;
    SFaixaComissao: TDataSource;
    edtDS_FAIXACOMISSAO: TDBEdit;
    edtNR_PARCELAS: TDBEdit;
    edtVL_MINIMO: TDBEdit;
    edtVL_MAXIMO: TDBEdit;
    pnl1: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCad_FaixaComissao: TFCad_FaixaComissao;

implementation
uses Funcoes;

{$R *.dfm}

procedure TFCad_FaixaComissao.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFCad_FaixaComissao.btnGravarClick(Sender: TObject);
begin
  if TFaixaComissao.State in [dsEdit, dsInsert] then
    TFaixaComissao.Post;

  ValidaCampo(TFaixaComissaoDS_FAIXACOMISSAO);
  ValidaCampo(TFaixaComissaoNR_PARCELAS);
  ValidaCampo(TFaixaComissaoVL_MAXIMO);
  if TFaixaComissaoVL_MINIMO.AsFloat > TFaixaComissaoVL_MAXIMO.AsFloat then
  begin
    MyMessage('O Valor Mínimo não pode ser maior que o Valor Máximo!');
    Abort;
  end;

  QFaixaComissao.Close;
  QFaixaComissao.ParamByName('CD_FAIXACOMISSAO').AsInteger := TFaixaComissaoCD_FAIXACOMISSAO.AsInteger;
  QFaixaComissao.Open;

  CopiaRegistro(TFaixaComissao, QFaixaComissao, QFaixaComissao.IsEmpty);

  ModalResult := mrOk;
end;

procedure TFCad_FaixaComissao.FormCreate(Sender: TObject);
begin
  TFaixaComissao.Open;
end;

procedure TFCad_FaixaComissao.FormDestroy(Sender: TObject);
begin
  TFaixaComissao.Close;
  QFaixaComissao.Close;
end;

end.

