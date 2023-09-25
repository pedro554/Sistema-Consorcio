unit F_FiltroRelComissao;

interface

uses
  DM_Banco,
  FormularioBase,
  Funcoes,
  DM_RelComissaoPagar,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, JvMemoryDataset,
  Vcl.StdCtrls, JvExStdCtrls, JvCombobox, JvDBCombobox, Vcl.Samples.Spin,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, DateUtils;

type
  TFFiltroRelComissao = class(TFormulario)
    TFiltro: TJvMemoryData;
    SFiltro: TDataSource;
    TFiltroNR_MESINICIO: TIntegerField;
    TFiltroNR_MESFIM: TIntegerField;
    TFiltroNR_ANOINICIO: TIntegerField;
    TFiltroNR_ANOFIM: TIntegerField;
    NR_MESINICIO: TJvDBComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    JvDBComboBox1: TJvDBComboBox;
    edtNR_ANOINICIO: TDBEdit;
    edtNR_ANOFIM: TDBEdit;
    pnl1: TPanel;
    btnGerarRel: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnReiniciaFiltro: TSpeedButton;
    TFiltroDT_INICIO: TIntegerField;
    TFiltroDT_FIM: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TFiltroAfterInsert(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGerarRelClick(Sender: TObject);
    procedure btnReiniciaFiltroClick(Sender: TObject);
    procedure TFiltroBeforePost(DataSet: TDataSet);
  private
    DMRel: TDMRelComissaoPagar;
    procedure ReiniciaFiltro;
    procedure ValidaFiltro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFiltroRelComissao: TFFiltroRelComissao;

implementation
uses
  Consulta_Funcionario;

{$R *.dfm}

procedure TFFiltroRelComissao.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFFiltroRelComissao.btnGerarRelClick(Sender: TObject);
begin
  if TFiltro.State in [dsEdit, dsInsert] then
    TFiltro.Post;

  ValidaFiltro;
  DMRel.Inicializa(TFiltro);
  ReiniciaFiltro;
end;

procedure TFFiltroRelComissao.btnReiniciaFiltroClick(Sender: TObject);
begin
  ReiniciaFiltro;
end;

procedure TFFiltroRelComissao.FormCreate(Sender: TObject);
begin
  DMRel := TDMRelComissaoPagar.Create(nil);
  ReiniciaFiltro;
end;

procedure TFFiltroRelComissao.FormDestroy(Sender: TObject);
begin
  TFiltro.Close;
  FreeAndNil(DMRel);
end;

procedure TFFiltroRelComissao.ReiniciaFiltro;
begin
  TFiltro.Close;
  TFiltro.Open;
  TFiltro.Append;
end;

procedure TFFiltroRelComissao.TFiltroAfterInsert(DataSet: TDataSet);
begin
  TFiltroNR_MESINICIO.AsInteger := MonthOf(Date);
  TFiltroNR_MESFIM.AsInteger := MonthOf(Date);
  TFiltroNR_ANOINICIO.AsInteger := YearOf(Date);
  TFiltroNR_ANOFIM.AsInteger := YearOf(Date);
end;

procedure TFFiltroRelComissao.TFiltroBeforePost(DataSet: TDataSet);
begin
  TFiltroDT_INICIO.AsInteger := AnoMesCalc(TFiltroNR_MESINICIO.AsInteger, TFiltroNR_ANOINICIO.AsInteger);
  TFiltroDT_FIM.AsInteger := AnoMesCalc(TFiltroNR_MESFIM.AsInteger, TFiltroNR_ANOFIM.AsInteger);
end;

procedure TFFiltroRelComissao.ValidaFiltro;
var
  lvDataIncio, lvDataFim: TDateTime;
begin
  ValidaCampo(TFiltroNR_MESINICIO);
  ValidaCampo(TFiltroNR_MESFIM);
  ValidaCampo(TFiltroNR_ANOINICIO);
  ValidaCampo(TFiltroNR_ANOFIM);

  lvDataIncio := StrToDateTime('01/' + TFiltroNR_MESINICIO.AsString + '/' + TFiltroNR_ANOINICIO.AsString);
  lvDataFim   := StrToDateTime('01/' + TFiltroNR_MESFIM.AsString + '/' + TFiltroNR_ANOFIM.AsString);

  if lvDataIncio > lvDataFim then
  begin
    MyMessage('Data Inicial não pode ser maior que o Data Final!');
    Abort;
  end;
end;

end.
