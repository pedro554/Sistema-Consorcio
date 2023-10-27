unit F_CRM;

interface

uses
  FormularioBase,
  DM_Banco,
  DM_CRM,
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
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Grids,
  JvExGrids,
  JvStringGrid,
  JvMemoryDataset,
  Vcl.ExtCtrls,
  Data.Bind.Components,
  Data.Bind.DBScope,
  Data.Bind.EngExt,
  Vcl.Bind.DBEngExt,
  Vcl.Bind.Grid,
  System.Rtti,
  System.Bindings.Outputs,
  Vcl.Bind.Editors,
  Data.Bind.Grid,
  Vcl.StdCtrls, Vcl.Menus, Vcl.Buttons, AdvCustomControl,
  AdvCustomScrollControl, AdvKanbanBoard, AdvCustomComponent,
  AdvKanbanBoardDatabaseAdapter;

type
  TFCRM = class(TFormulario)
    QAtualizaStatus: TFDQuery;
    QExcluiCRM: TFDQuery;
    pnl7: TPanel;
    btnNovo: TSpeedButton;
    btnFinalizarMovimento: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    KanbanBoard: TAdvKanbanBoard;
    QCRM: TFDQuery;
    QCRMCD_CRM: TFDAutoIncField;
    QCRMCD_CLIENTE: TIntegerField;
    QCRMDS_OBS: TStringField;
    QCRMDT_CADASTRO: TDateTimeField;
    QCRMCD_FUNCIONARIO: TIntegerField;
    QCRMVL_CREDITO: TFMTBCDField;
    QCRMDT_ATUALIZACAO: TDateTimeField;
    QCRMCD_FAIXACOMISSAO: TIntegerField;
    QCRMTP_PARCELA: TStringField;
    QCRMNM_CLIENTE: TStringField;
    QCRMNR_FONE: TStringField;
    KanbanBoardDatabaseAdapter: TAdvKanbanBoardDatabaseAdapter;
    SCRM: TDataSource;
    QCRMCD_STATUS: TIntegerField;
    TCRM: TJvMemoryData;
    TCRMCD_CRM: TIntegerField;
    TCRMDS_CRM: TStringField;
    TCRMCD_STATUS: TIntegerField;
    TCRMVL_CREDITO: TStringField;
    TCRMNM_CLIENTE: TStringField;
    TCRMVL_CREDITOMSG: TFloatField;
    TCRMNR_FONE: TStringField;
    pnlFiltro: TPanel;
    lbl1: TLabel;
    edtPesquisa: TEdit;
    btnFiltrar: TButton;
    procedure GridAbertoDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnFinalizarMovimentoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure KanbanBoardAfterDropItem(Sender: TObject; AFromColumn,
      AToColumn: TAdvKanbanBoardColumn; AFromItem,
      AToItem: TAdvKanbanBoardItem);
    procedure KanbanBoardSelectItem(Sender: TObject;
      AColumn: TAdvKanbanBoardColumn; AItem: TAdvKanbanBoardItem);
    procedure btnFiltrarClick(Sender: TObject);
  private
    pvCodCRM: String;

    DMCRM: TDMCRM;
    procedure CarregaDados;
    procedure ConfigSelecaoFechado;
    procedure AtualizaStatus(AStatus: Integer; ACodRM: String);
    procedure ValidaSelecaoGrid;
    function RetornaSQLCRM: String;
    function RetornaNomeStatus(AStatus: Integer): String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCRM: TFCRM;

implementation
uses Funcoes, Cad_CRM, Constantes;

{$R *.dfm}

{ TFCRM }

procedure TFCRM.btnAlterarClick(Sender: TObject);
var
  FCadCRM: TFCad_CRM;
begin
  ValidaSelecaoGrid;
  FCadCRM := TFCad_CRM.Create(Self);
  try
    FCadCRM.Inicializa(TCRMCD_CRM.AsInteger);
    if FCadCRM.ShowModal = mrOk then
      CarregaDados;
  finally
    FreeAndNil(FCadCRM);
  end;
end;

procedure TFCRM.btnExcluirClick(Sender: TObject);
begin
  ValidaSelecaoGrid;
  QExcluiCRM.Close;
  QExcluiCRM.ParamByName('CD_CRM').AsString := pvCodCRM;
  QExcluiCRM.ExecSQL;
  CarregaDados;
end;

procedure TFCRM.btnFinalizarMovimentoClick(Sender: TObject);
begin
  ValidaSelecaoGrid;

  if (TCRMCD_STATUS.AsInteger <> C_INTFECHADO) then
  begin
    MyMessage('Status do registro não é ' + C_STRFECHADO);
    Abort;
  end;

  if not QCRM.Locate('CD_CRM', TCRMCD_CRM.AsInteger, []) then
    Exit;

  if MyMessage('Cliente: ' + TCRMNM_CLIENTE.AsString + #13#10 +
               'Fone: ' + TCRMNR_FONE.AsString + #13#10 +
               'Crédito: ' + FormatFloat('#,0.00', QCRMVL_CREDITO.AsFloat) + #13#10#13#10 +
               'Deseja finalizar o movimento?', 4) <> 6 then
    Abort;

  DMCRM.FinalizaMovimento(TCRMCD_CRM.AsInteger);
  AtualizaStatus(C_INTFINALIZADO, TCRMCD_CRM.AsString);
  CarregaDados;
end;

procedure TFCRM.btnNovoClick(Sender: TObject);
var
  FCadCRM: TFCad_CRM;
begin
  FCadCRM := TFCad_CRM.Create(Self);
  try
    FCadCRM.Inicializa(0);
    if FCadCRM.ShowModal = mrOk then
      CarregaDados;
  finally
    FreeAndNil(FCadCRM);
  end;
end;

procedure TFCRM.btnFiltrarClick(Sender: TObject);
begin
  CarregaDados;
end;

procedure TFCRM.CarregaDados;
begin
  KanbanBoardDatabaseAdapter.Active := False;
  QCRM.Close;
  QCRM.SQL.Clear;
  QCRM.SQL.Add(RetornaSQLCRM);
  QCRM.ParamByName('NM_CLIENTE').AsString := '%'+edtPesquisa.Text+'%';
  QCRM.Open;
  TCRM.Close;
  TCRM.Open;

  while not QCRM.Eof do
  begin
    TCRM.Append;
    TCRMCD_CRM.AsInteger := QCRMCD_CRM.AsInteger;
    TCRMNM_CLIENTE.AsString := QCRMNM_CLIENTE.AsString;
    TCRMVL_CREDITOMSG.AsFloat := QCRMVL_CREDITO.AsFloat;
    TCRMNR_FONE.AsString := QCRMNR_FONE.AsString;
    TCRMVL_CREDITO.AsString := DMCRM.MontaTitle('Crédito: ' + FormatFloat('#,0.00', QCRMVL_CREDITO.AsFloat));
    TCRMCD_STATUS.AsInteger := QCRMCD_STATUS.AsInteger;
    TCRMDS_CRM.AsString := DMCRM.MontaDescricao('Cliente: ' + QCRMNM_CLIENTE.AsString + #13#10 +
                                                'Fone: ' + QCRMNR_FONE.AsString + #13#10 +
                                                'Objetivo: ' + QCRMDS_OBS.AsString);
    TCRM.Post;
    QCRM.Next;
  end;
  KanbanBoardDatabaseAdapter.BeginUpdate;
  KanbanBoardDatabaseAdapter.KanbanBoard := KanbanBoard;
  KanbanBoardDatabaseAdapter.Active := True;
  KanbanBoardDatabaseAdapter.EndUpdate;
end;

procedure TFCRM.ConfigSelecaoFechado;
begin
  btnFinalizarMovimento.Enabled := True;
end;

procedure TFCRM.FormCreate(Sender: TObject);
begin
  inherited;
  DMCRM := TDMCRM.Create(nil);
end;

procedure TFCRM.FormDestroy(Sender: TObject);
begin
  QCRM.Close;
  TCRM.Close;
  QAtualizaStatus.Close;
  QExcluiCRM.Close;
  FreeAndNil(DMCRM)
end;

procedure TFCRM.FormShow(Sender: TObject);
begin
  CarregaDados;
end;

procedure TFCRM.GridAbertoDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TStringGrid;
end;

procedure TFCRM.KanbanBoardAfterDropItem(Sender: TObject; AFromColumn,
  AToColumn: TAdvKanbanBoardColumn; AFromItem,
  AToItem: TAdvKanbanBoardItem);
var
  lvStatus: Integer;
begin
  if AToColumn.HeaderText = C_STRABERTO then lvStatus := 0
  else if AToColumn.HeaderText = C_STRAPRESENTACAO then lvStatus := 1
  else if AToColumn.HeaderText = C_STRNEGOCIACAO then lvStatus := 2
  else if AToColumn.HeaderText = C_STRAGUARDANDO then lvStatus := 3
  else if AToColumn.HeaderText = C_STRSEMINTERESSE then lvStatus := 4
  else if AToColumn.HeaderText = C_STRFECHADO then lvStatus := 5;

  AtualizaStatus(lvStatus, AToItem.DBKey);
end;

procedure TFCRM.KanbanBoardSelectItem(Sender: TObject;
  AColumn: TAdvKanbanBoardColumn; AItem: TAdvKanbanBoardItem);
begin
  pvCodCRM := AItem.DBKey;
end;

function TFCRM.RetornaNomeStatus(AStatus: Integer): String;
begin
  case AStatus of
    0: Result := C_STRABERTO;
    1: Result := C_STRAPRESENTACAO;
    2: Result := C_STRNEGOCIACAO;
    3: Result := C_STRAGUARDANDO;
    4: Result := C_STRSEMINTERESSE;
    5: Result := C_STRFECHADO;
    99: Result := C_STRFINALIZADO;
  end;
end;

function TFCRM.RetornaSQLCRM: String;
begin
  Result := 'SELECT ' +
            'CRM.*, ' +
            'CLIENTE.NM_CLIENTE, ' +
            'CLIENTE.NR_FONE ' +
            'FROM ' +
            'CRM ' +
            'LEFT JOIN CLIENTE ON ' +
            'CLIENTE.CD_CLIENTE = CRM.CD_CLIENTE ' +
            'WHERE CLIENTE.NM_CLIENTE LIKE :NM_CLIENTE';
end;

procedure TFCRM.AtualizaStatus(AStatus: Integer; ACodRM: String);
begin
  ValidaSelecaoGrid;
  QAtualizaStatus.Close;
  QAtualizaStatus.ParamByName('CD_STATUS').AsInteger := AStatus;
  QAtualizaStatus.ParamByName('CD_CRM').AsString := ACodRM;
  QAtualizaStatus.ParamByName('DS_HISTORICO').AsString := DateTimeToStr(Date) + ' - ' +
                                                          'Status: ' + RetornaNomeStatus(AStatus) +
                                                          #13#10#13#10;
  QAtualizaStatus.ExecSQL;
  TCRM.Locate('CD_CRM', pvCodCRM, []);
  TCRM.Edit;
  TCRMCD_STATUS.AsInteger := AStatus;
  TCRM.Post;
end;

procedure TFCRM.ValidaSelecaoGrid;
begin
  if pvCodCRM = '' then
  begin
    MyMessage('Nenhum registro selecionado!');
    Abort;
  end;

  if not TCRM.Locate('CD_CRM', pvCodCRM, []) then
  begin
    MyMessage('Registro não localizado na memória!');
    Abort;
  end;
end;

end.
