unit Cad_ManutComissao;

interface

uses
  DM_Banco, FormularioBase, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB,
  JvMemoryDataset, JvExStdCtrls, JvCombobox, JvDBCombobox, DateUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ExtCtrls, System.Actions, Vcl.ActnList,
  Vcl.Menus;

type
  TFCad_ManutComissao = class(TFormulario)
    TFiltro: TJvMemoryData;
    TFiltroCD_FUNCIONARIO: TIntegerField;
    TFiltroNM_FUNCIONARIO: TStringField;
    SFiltro: TDataSource;
    TFiltroNR_MESINICIO: TIntegerField;
    TFiltroNR_ANOINICIO: TIntegerField;
    QComissaoParcela: TFDQuery;
    Grid1: TJvDBGrid;
    pnl1: TPanel;
    SComissaoParcela: TDataSource;
    TComissaoParcela: TJvMemoryData;
    QComissaoParcelaCD_COMISSAOPARCELA: TFDAutoIncField;
    QComissaoParcelaNR_PARCELA: TIntegerField;
    QComissaoParcelaPC_COMISSAO: TFMTBCDField;
    QComissaoParcelaVL_COMISSAO: TFMTBCDField;
    QComissaoParcelaCD_CRM: TIntegerField;
    QComissaoParcelaCD_FAIXACOMISSAO: TIntegerField;
    QComissaoParcelaCD_FUNCIONARIO: TIntegerField;
    QComissaoParcelaCD_CLIENTE: TIntegerField;
    QComissaoParcelaTP_PARCELA: TStringField;
    QComissaoParcelaDT_CADASTRO: TDateTimeField;
    QComissaoParcelaNR_MESPAGAMENTO: TIntegerField;
    QComissaoParcelaNR_ANOPAGAMENTO: TIntegerField;
    QComissaoParcelaDT_PAGAMENTO: TIntegerField;
    TComissaoParcelaNR_PARCELA: TIntegerField;
    TComissaoParcelaPC_COMISSAO: TFMTBCDField;
    TComissaoParcelaVL_COMISSAO: TFMTBCDField;
    TComissaoParcelaCD_CRM: TIntegerField;
    TComissaoParcelaCD_FAIXACOMISSAO: TIntegerField;
    TComissaoParcelaCD_FUNCIONARIO: TIntegerField;
    TComissaoParcelaCD_CLIENTE: TIntegerField;
    TComissaoParcelaTP_PARCELA: TStringField;
    TComissaoParcelaDT_CADASTRO: TDateTimeField;
    TComissaoParcelaNR_MESPAGAMENTO: TIntegerField;
    TComissaoParcelaNR_ANOPAGAMENTO: TIntegerField;
    TComissaoParcelaDT_PAGAMENTO: TIntegerField;
    TComissaoParcelaCD_COMISSAOPARCELA: TIntegerField;
    TFiltroNR_MESFIM: TIntegerField;
    TFiltroNR_ANOFIM: TIntegerField;
    QFaixaComissaoParcela: TFDQuery;
    QFaixaComissaoParcelaCD_FAIXACOMISSAOPARCELA: TFDAutoIncField;
    QFaixaComissaoParcelaCD_FAIXACOMISSAO: TIntegerField;
    QFaixaComissaoParcelaNR_PARCELA: TIntegerField;
    QFaixaComissaoParcelaPC_COMISSAO: TFMTBCDField;
    QFaixaComissaoParcelaTP_PARCELA: TStringField;
    QComissaoParcelaVL_CREDITO: TFMTBCDField;
    TComissaoParcelaVL_CREDITO: TFloatField;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    actlst: TActionList;
    ACT_F6: TAction;
    QComissaoParcelaNM_CLIENTE: TStringField;
    TComissaoParcelaNM_CLIENTE: TStringField;
    pnl2: TPanel;
    lbl5: TLabel;
    btnPsqFuncionario: TSpeedButton;
    lbl1: TLabel;
    btnFiltrar: TSpeedButton;
    lbl2: TLabel;
    edtCD_FUNCIONARIO: TDBEdit;
    edtNM_FUNCIONARIO: TDBEdit;
    NR_MESINICIO: TJvDBComboBox;
    edtNR_ANOINICIO: TDBEdit;
    JvDBComboBox1: TJvDBComboBox;
    edtNR_MESINICIO: TDBEdit;
    lbl6: TLabel;
    edtCD_CLIENTE: TDBEdit;
    edtNM_CLIENTE: TDBEdit;
    btnPsqCliente: TSpeedButton;
    TFiltroCD_CLIENTE: TIntegerField;
    TFiltroNM_CLIENTE: TStringField;
    QComissaoParcelaST_ESTORNO: TStringField;
    TComissaoParcelaST_ESTORNO: TStringField;
    procedure btnPsqFuncionarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TFiltroAfterInsert(DataSet: TDataSet);
    procedure btnFiltrarClick(Sender: TObject);
    procedure TComissaoParcelaBeforePost(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnPsqClienteClick(Sender: TObject);
  private
    procedure AbreComissaoParcela;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCad_ManutComissao: TFCad_ManutComissao;

implementation

uses
  DM_Consulta, Funcoes, Consulta_Cliente;

{$R *.dfm}

procedure TFCad_ManutComissao.AbreComissaoParcela;

  {$REGION 'SubMetodo que retorna a pesquisa SQL do filtro'}
  function MontaSQLPesquisa: String;
  begin
    Result := 'SELECT ' +
              'COMISSAOPARCELA.*, ' +
              'CRM.VL_CREDITO, ' +
              'CLIENTE.NM_CLIENTE ' +
              'FROM ' +
              'COMISSAOPARCELA ' +
              'LEFT JOIN CRM ON ' +
              'CRM.CD_CRM = COMISSAOPARCELA.CD_CRM ' +
              'LEFT JOIN CLIENTE ON ' +
              'CLIENTE.CD_CLIENTE = COMISSAOPARCELA.CD_CLIENTE ' +
              'WHERE ' +
              'COMISSAOPARCELA.CD_FUNCIONARIO = :CD_FUNCIONARIO AND ' +
              'COMISSAOPARCELA.DT_PAGAMENTO BETWEEN :DT_INICIO AND :DT_FIM ';

    if TFiltroCD_CLIENTE.AsInteger <> 0 then
    begin
      Result := Result + 'AND COMISSAOPARCELA.CD_CLIENTE = :CD_CLIENTE';
    end;
  end;
  {$ENDREGION}

begin
  QComissaoParcela.Close;
  QComissaoParcela.SQL.Clear;
  QComissaoParcela.SQL.Add(MontaSQLPesquisa);
  QComissaoParcela.ParamByName('CD_FUNCIONARIO').AsInteger := TFiltroCD_FUNCIONARIO.AsInteger;
  QComissaoParcela.ParamByName('DT_INICIO').AsInteger := AnoMesCalc(TFiltroNR_MESINICIO.AsInteger, TFiltroNR_ANOINICIO.AsInteger);
  QComissaoParcela.ParamByName('DT_FIM').AsInteger := AnoMesCalc(TFiltroNR_MESFIM.AsInteger, TFiltroNR_ANOFIM.AsInteger);
  if QComissaoParcela.FindParam('CD_CLIENTE') <> nil then
    QComissaoParcela.ParamByName('CD_CLIENTE').AsInteger := TFiltroCD_CLIENTE.AsInteger;
  QComissaoParcela.Open;
end;

procedure TFCad_ManutComissao.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFCad_ManutComissao.btnFiltrarClick(Sender: TObject);
var
  lvDataIncio, lvDataFim: TDateTime;
begin
  if TFiltro.State in [dsEdit, dsInsert] then
    TFiltro.Post;

  ValidaCampo(TFiltroCD_FUNCIONARIO);
  ValidaCampo(TFiltroNR_MESINICIO);
  ValidaCampo(TFiltroNR_MESFIM);
  ValidaCampo(TFiltroNR_ANOINICIO);
  ValidaCampo(TFiltroNR_ANOFIM);

  lvDataIncio := StrToDateTime('01/' + TFiltroNR_MESINICIO.AsString + '/' + TFiltroNR_ANOINICIO.AsString);
  lvDataFim := StrToDateTime('01/' + TFiltroNR_MESFIM.AsString + '/' + TFiltroNR_ANOFIM.AsString);

  if lvDataIncio > lvDataFim then
  begin
    MyMessage('Data Inicial n�o pode ser maior que o Data Final!');
    Abort;
  end;

  AbreComissaoParcela;

  TComissaoParcela.Close;
  TComissaoParcela.Open;

  if QComissaoParcela.IsEmpty then
  begin
    MyMessage('Nenhum registro encontrado!');
    Abort;
  end;
  TComissaoParcela.BeforePost := nil;
  try
    while not QComissaoParcela.Eof do
    begin
      CopiaRegistro(QComissaoParcela, TComissaoParcela);
      QComissaoParcela.Next;
    end;
  finally
    TComissaoParcela.BeforePost := TComissaoParcelaBeforePost;
  end;
end;

procedure TFCad_ManutComissao.btnGravarClick(Sender: TObject);
var
  lvContinuar: Boolean;
begin
  if TComissaoParcela.IsEmpty then
    Abort;
  if MyMessage('Deseja gravar as altera��es realizadas?', 4) <> 6 then
    Abort;

  if TComissaoParcela.State in [dsEdit, dsInsert] then
    TComissaoParcela.Post;

  TComissaoParcela.DisableControls;
  try
    AbreComissaoParcela;
    TComissaoParcela.First;
    try
      while not TComissaoParcela.Eof do
      begin
        QComissaoParcela.Locate('CD_COMISSAOPARCELA', TComissaoParcelaCD_COMISSAOPARCELA.AsInteger, []);
        CopiaRegistro(TComissaoParcela, QComissaoParcela, False);
        TComissaoParcela.Next;
      end;
      lvContinuar := MyMessage('Grava��o finalizada.' + #13#10 + 'Deseja continuar na tela de Manuten��o de Comiss�es?', 4) = 6;
    except
      on e: exception do
      begin
        MyMessage('Falha ao gravar registro no banco de dados: ' + #13#10 + e.Message);
        Abort;
      end;
    end;
  finally
    TComissaoParcela.EnableControls;
  end;

  if not lvContinuar then
    ModalResult := mrOk;
end;

procedure TFCad_ManutComissao.btnPsqClienteClick(Sender: TObject);
begin
  DMConsulta.ConsultaClietne(TFiltro);
end;

procedure TFCad_ManutComissao.btnPsqFuncionarioClick(Sender: TObject);
begin
  DMConsulta.ConsultaFuncionario(TFiltro);
end;

procedure TFCad_ManutComissao.FormCreate(Sender: TObject);
begin
  TFiltro.Open;
end;

procedure TFCad_ManutComissao.FormDestroy(Sender: TObject);
begin
  TFiltro.Close;
  TComissaoParcela.Close;
  QComissaoParcela.Close;
  QFaixaComissaoParcela.Close;
end;

procedure TFCad_ManutComissao.TComissaoParcelaBeforePost(DataSet: TDataSet);
begin
  if (TComissaoParcelaTP_PARCELA.AsString <> 'N') and (TComissaoParcelaTP_PARCELA.AsString <> 'M') then
  begin
    MyMessage('Valor inv�lido para o campo "Tipo Parcela".' + #13#10 + 'Valores permitidos:' + #13#10 + 'M - Meia Parcela / N - Parcela Normal');
    Abort;
  end;

  if (TComissaoParcelaNR_MESPAGAMENTO.AsInteger < 1) or (TComissaoParcelaNR_MESPAGAMENTO.AsInteger > 12) then
  begin
    MyMessage('Valor inv�lido para o campo "M�s Pag."');
    Abort;
  end;

  if Length(TComissaoParcelaNR_ANOPAGAMENTO.AsString) <> 4 then
  begin
    MyMessage('Valor inv�lido para o campo "Ano Pag."');
    Abort;
  end;

  if (TComissaoParcelaST_ESTORNO.AsString <> 'SIM') and (TComissaoParcelaST_ESTORNO.AsString <> 'N�O') then
  begin
    MyMessage('Valor inv�lido para o campo "Estorno"');
    Abort;
  end;

  QFaixaComissaoParcela.Close;
  QFaixaComissaoParcela.ParamByName('CD_FAIXACOMISSAO').AsInteger := TComissaoParcelaCD_FAIXACOMISSAO.AsInteger;
  QFaixaComissaoParcela.ParamByName('NR_PARCELA').AsInteger := TComissaoParcelaNR_PARCELA.AsInteger;
  QFaixaComissaoParcela.ParamByName('TP_PARCELA').AsString := TComissaoParcelaTP_PARCELA.AsString;
  QFaixaComissaoParcela.Open;

  TComissaoParcelaPC_COMISSAO.AsFloat := QFaixaComissaoParcelaPC_COMISSAO.AsFloat;
  TComissaoParcelaVL_COMISSAO.AsFloat := (TComissaoParcelaPC_COMISSAO.AsFloat / 100) * TComissaoParcelaVL_CREDITO.AsFloat;
end;

procedure TFCad_ManutComissao.TFiltroAfterInsert(DataSet: TDataSet);
begin
  TFiltroNR_MESINICIO.AsInteger := MonthOf(Date);
  TFiltroNR_ANOINICIO.AsInteger := YearOf(Date);
  TFiltroNR_MESFIM.AsInteger := MonthOf(Date);
  TFiltroNR_ANOFIM.AsInteger := YearOf(Date);
end;

end.

