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
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

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
    QFaixaComissaoParcela: TFDQuery;
    TFaixaComissaoParcelaMeia: TJvMemoryData;
    QFaixaComissaoParcelaCD_FAIXACOMISSAO: TIntegerField;
    QFaixaComissaoParcelaNR_PARCELA: TIntegerField;
    TFaixaComissaoParcelaMeiaNR_PARCELA: TIntegerField;
    TFaixaComissaoParcelaMeiaPC_COMISSAO: TFloatField;
    QFaixaComissaoParcelaPC_COMISSAO: TFMTBCDField;
    GridParcelaMeia: TJvDBGrid;
    GridParcelaNormal: TJvDBGrid;
    SFaixaComissaoParcelaMeia: TDataSource;
    TFaixaComissaoParcelaNormal: TJvMemoryData;
    SFaixaComissaoParcelaNormal: TDataSource;
    TFaixaComissaoParcelaNormalCD_FAIXACOMISSAO: TIntegerField;
    TFaixaComissaoParcelaNormalNR_PARCELA: TIntegerField;
    TFaixaComissaoParcelaNormalPC_COMISSAO: TFloatField;
    TFaixaComissaoParcelaMeiaCD_FAIXACOMISSAO: TIntegerField;
    QFaixaComissaoParcelaTP_PARCELA: TStringField;
    TFaixaComissaoParcelaMeiaTP_PARCELA: TStringField;
    TFaixaComissaoParcelaNormalTP_PARCELA: TStringField;
    NavFaixaComissaoParcelaMeia: TDBNavigator;
    NavFaixaComissaoParcelaNormal: TDBNavigator;
    lbl5: TLabel;
    lbl6: TLabel;
    QFaixaComissaoParcelaCD_FAIXACOMISSAOPARCELA: TFDAutoIncField;
    TFaixaComissaoParcelaMeiaCD_FAIXACOMISSAOPARCELA: TIntegerField;
    TFaixaComissaoParcelaNormalCD_FAIXACOMISSAOPARCELA: TIntegerField;
    QValorMinMax: TFDQuery;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TFaixaComissaoNR_PARCELASChange(Sender: TField);
    procedure TFaixaComissaoAfterInsert(DataSet: TDataSet);
  private
    procedure CarregaFaixaComissaoParcela;
    procedure GravaFaixaComissaoParcela(ADataset: TDataSet);
    procedure GeraParcelas(ADataset: TDataSet; ATipoParcela: String);
    procedure ValidaFaixaComissaoMeia;
    procedure ValidaFaixaComissaoNormal;
    procedure ValidaValorMinMax;
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
  ValidaFaixaComissaoMeia;
  ValidaFaixaComissaoNormal;
  ValidaValorMinMax;

  QFaixaComissao.Close;
  QFaixaComissao.ParamByName('CD_FAIXACOMISSAO').AsInteger := TFaixaComissaoCD_FAIXACOMISSAO.AsInteger;
  QFaixaComissao.Open;

  CopiaRegistro(TFaixaComissao, QFaixaComissao, QFaixaComissao.IsEmpty);
  GravaFaixaComissaoParcela(TFaixaComissaoParcelaMeia);
  GravaFaixaComissaoParcela(TFaixaComissaoParcelaNormal);

  ModalResult := mrOk;
end;

procedure TFCad_FaixaComissao.CarregaFaixaComissaoParcela;
begin
  QFaixaComissaoParcela.Close;
  QFaixaComissaoParcela.ParamByName('CD_FAIXACOMISSAO').AsInteger := TFaixaComissaoCD_FAIXACOMISSAO.AsInteger;
  QFaixaComissaoParcela.Open;

  while not QFaixaComissaoParcela.Eof do
  begin
    if QFaixaComissaoParcelaTP_PARCELA.AsString = 'M' then
      CopiaRegistro(QFaixaComissaoParcela, TFaixaComissaoParcelaMeia)
    else
      CopiaRegistro(QFaixaComissaoParcela, TFaixaComissaoParcelaNormal);

    QFaixaComissaoParcela.Next;
  end;
end;

procedure TFCad_FaixaComissao.FormCreate(Sender: TObject);
begin
  TFaixaComissao.Open;
  TFaixaComissaoParcelaMeia.Open;
  TFaixaComissaoParcelaNormal.Open;
end;

procedure TFCad_FaixaComissao.FormDestroy(Sender: TObject);
begin
  TFaixaComissao.Close;
  QFaixaComissao.Close;
  QFaixaComissaoParcela.Close;
  TFaixaComissaoParcelaMeia.Close;
  TFaixaComissaoParcelaNormal.Close;
end;

procedure TFCad_FaixaComissao.FormShow(Sender: TObject);
begin
  CarregaFaixaComissaoParcela;
  edtNR_PARCELAS.Enabled := TFaixaComissaoCD_FAIXACOMISSAO.IsNull;
  edtVL_MINIMO.Enabled := TFaixaComissaoCD_FAIXACOMISSAO.IsNull;
  edtVL_MAXIMO.Enabled := TFaixaComissaoCD_FAIXACOMISSAO.IsNull;
end;

procedure TFCad_FaixaComissao.GeraParcelas(ADataset: TDataSet; ATipoParcela: String);
var
  I: Integer;
begin
  ADataset.Close;
  ADataset.Open;
  for I := 1 to TFaixaComissaoNR_PARCELAS.AsInteger do
  begin
    ADataset.Append;
    ADataset.FieldByName('NR_PARCELA').AsInteger := I;
    ADataset.FieldByName('PC_COMISSAO').AsFloat := 0;
    ADataset.FieldByName('TP_PARCELA').AsString := ATipoParcela;
    ADataset.FieldByName('CD_FAIXACOMISSAO').AsInteger := TFaixaComissaoCD_FAIXACOMISSAO.AsInteger;
    ADataset.Post;
  end;
end;

procedure TFCad_FaixaComissao.GravaFaixaComissaoParcela(ADataset: TDataSet);
begin
  if ADataset.State in [dsEdit, dsInsert] then
    ADataset.Post;

  ADataset.First;
  while not ADataset.Eof do
  begin
    if QFaixaComissaoParcela.Locate('CD_FAIXACOMISSAOPARCELA', ADataset.FieldByName('CD_FAIXACOMISSAOPARCELA').AsInteger, []) then
      CopiaRegistro(ADataset, QFaixaComissaoParcela, False)
    else
      CopiaRegistro(ADataset, QFaixaComissaoParcela, True);
    ADataset.Next;
  end;
end;

procedure TFCad_FaixaComissao.TFaixaComissaoAfterInsert(DataSet: TDataSet);
begin
  if TFaixaComissaoCD_FAIXACOMISSAO.IsNull then
    TFaixaComissaoCD_FAIXACOMISSAO.AsInteger := DMBanco.SequenciaTabela('faixacomissao');
end;

procedure TFCad_FaixaComissao.TFaixaComissaoNR_PARCELASChange(
  Sender: TField);
begin
  GeraParcelas(TFaixaComissaoParcelaMeia, 'M');
  GeraParcelas(TFaixaComissaoParcelaNormal, 'N');
end;

procedure TFCad_FaixaComissao.ValidaFaixaComissaoMeia;
begin
  TFaixaComissaoParcelaMeia.First;
  while not TFaixaComissaoParcelaMeia.Eof do
  begin
    if TFaixaComissaoParcelaMeiaPC_COMISSAO.AsFloat = 0 then
    begin
      MyMessage('Parcela Nº ' +
                TFaixaComissaoParcelaMeiaNR_PARCELA.AsString +
                ' do grid de meia parcela, está com o percentual zerado. Verifique!');
      Abort;
    end;
    TFaixaComissaoParcelaMeia.Next;
  end;
end;

procedure TFCad_FaixaComissao.ValidaFaixaComissaoNormal;
begin
  TFaixaComissaoParcelaNormal.First;
  while not TFaixaComissaoParcelaNormal.Eof do
  begin
    if TFaixaComissaoParcelaNormalPC_COMISSAO.AsFloat = 0 then
    begin
      MyMessage('Parcela Nº ' +
                TFaixaComissaoParcelaNormalNR_PARCELA.AsString +
                ' do grid de parcela normal, está com o percentual zerado. Verifique!');
      Abort;
    end;
    TFaixaComissaoParcelaNormal.Next;
  end;
end;

procedure TFCad_FaixaComissao.ValidaValorMinMax;
begin
  if not (edtVL_MINIMO.Enabled and edtVL_MAXIMO.Enabled) then
    Exit;

  QValorMinMax.Close;
  QValorMinMax.ParamByName('VL_MINIMO').AsFloat := TFaixaComissaoVL_MINIMO.AsFloat;
  QValorMinMax.ParamByName('VL_MAXIMO').AsFloat := TFaixaComissaoVL_MAXIMO.AsFloat;
  QValorMinMax.Open;
  if QValorMinMax.Fields.Fields[0].AsInteger > 0 then
  begin
    if MyMessage('Valor mínimo e máximo convergem com outra faixa de comissão.' + sLineBreak +
              'Deseja continuar mesmo assim?', 4) <> mrYes then
    Abort;
  end;
end;

end.
