unit F_Funcionario;

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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  JvExDBGrids,
  JvDBGrid,
  Vcl.ExtCtrls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  JvMemoryDataset,
  Vcl.StdCtrls,
  Vcl.Buttons;

type
  TFFuncionario = class(TFormulario)
    QFuncionario: TFDQuery;
    TFuncionario: TJvMemoryData;
    TFuncionarioCD_FUNCIONARIO: TIntegerField;
    TFuncionarioNM_FUNCIONARIO: TStringField;
    SFuncioario: TDataSource;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    btnPesquisa: TSpeedButton;
    edtPesquisa: TEdit;
    cbbColuna: TComboBox;
    Grid: TJvDBGrid;
    pnl2: TPanel;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    TFuncionarioST_MARCADO: TBooleanField;
    QFuncionarioCD_FUNCIONARIO: TFDAutoIncField;
    QFuncionarioNM_FUNCIONARIO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure TFuncionarioAfterInsert(DataSet: TDataSet);
    procedure GridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    procedure CarregaDados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFuncionario: TFFuncionario;

implementation

uses
  Funcoes,
  Funcoes.FormPrincipal,
  Cad_Funcionario;

{$R *.dfm}

{ TFFuncionario }

procedure TFFuncionario.btnEditarClick(Sender: TObject);
var
  FCad: TFCad_Funcionario;
begin
  FCad := TFCad_Funcionario.Create(Self);
  try
    CopiaRegistro(TFuncionario, FCad.TFuncionario);
    if FCad.ShowModal = mrOk then
      CarregaDados;
  finally
    FreeAndNil(FCad);
  end;
end;

procedure TFFuncionario.btnExcluirClick(Sender: TObject);
begin
  TFuncionario.DisableControls;
  FiltraMarcado(TFuncionario);
  try
    if TFuncionario.IsEmpty then
    begin
      MyMessage('Nenhum registro selecionado!');
      Abort;
    end;

    if MyMessage('Deseja excluir os registros selecionados?', 4) = 6 then
    begin
      TFuncionario.First;
      while not TFuncionario.Eof do
      begin
        if QFuncionario.Locate('CD_FUNCIONARIO', TFuncionarioCD_FUNCIONARIO.AsInteger, []) then
          QFuncionario.Delete;
        TFuncionario.Delete;
      end;
    end;
  finally
    RemoveFiltroTabela(TFuncionario);
    TFuncionario.EnableControls;
  end;
end;

procedure TFFuncionario.btnNovoClick(Sender: TObject);
var
  FCad: TFCad_Funcionario;
begin
  FCad := TFCad_Funcionario.Create(Self);
  try
    if FCad.ShowModal = mrOk then
      CarregaDados;
  finally
    FreeAndNil(FCad);
  end;
end;

procedure TFFuncionario.btnPesquisaClick(Sender: TObject);
begin
  PesquisaGenerica(TFuncionario, PegaNomeCampoCombo(cbbColuna, Grid), edtPesquisa.Text);
end;

procedure TFFuncionario.CarregaDados;
begin
  QFuncionario.Close;
  QFuncionario.Open;

  TFuncionario.Close;
  TFuncionario.Open;

  while not QFuncionario.Eof do
  begin
    CopiaRegistro(QFuncionario, TFuncionario);
    QFuncionario.Next;
  end;
  TFuncionario.First;
end;

procedure TFFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  TFuncionario.Open;
  CarregaComboPesquisa(cbbColuna, Grid);
end;

procedure TFFuncionario.FormDestroy(Sender: TObject);
begin
  TFuncionario.Close;
  QFuncionario.Close;
end;

procedure TFFuncionario.FormShow(Sender: TObject);
begin
  inherited;
  CarregaDados;
end;

procedure TFFuncionario.GridDblClick(Sender: TObject);
begin
  SelecionaRegistroGrid(TFuncionario);
end;

procedure TFFuncionario.TFuncionarioAfterInsert(DataSet: TDataSet);
begin
  inherited;
  TFuncionarioST_MARCADO.AsBoolean := False;
end;

end.

