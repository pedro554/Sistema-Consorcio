unit FormularioBase.Consulta;

interface

uses
  FormularioBase,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  JvMemoryDataset, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TOnCarregaDados = procedure of object;

  TFormularioConsulta = class(TFormulario)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    edtPesquisa: TEdit;
    cbbColuna: TComboBox;
    btnPesquisa: TButton;
    pnl2: TPanel;
    btnSelecionar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Grid: TJvDBGrid;
    actlst: TActionList;
    ACT_F8: TAction;
    ACT_F6: TAction;
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    OnCarregaDados: TOnCarregaDados;
    { Public declarations }
  end;

var
  FormularioConsulta: TFormularioConsulta;

implementation
uses DM_Funcoes.Consulta;

{$R *.dfm}

procedure TFormularioConsulta.btnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFormularioConsulta.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  Grid.SetFocus;
end;

procedure TFormularioConsulta.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFormularioConsulta.FormShow(Sender: TObject);
begin
  inherited;
  DMFuncoesConsulta.CarregaComboBoxColuna(cbbColuna, Grid);

  if Assigned(OnCarregaDados) then
    OnCarregaDados;
end;

end.
