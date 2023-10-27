unit Cad_CRMHistorico;

interface

uses
  FormularioBase,
  Funcoes,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TParam = record
    DatasetCRM: TDataSet;
  end;

  TFCad_CRMHistorico = class(TFormulario)
    edtHistorico: TDBMemo;
    SCRM: TDataSource;
    pnl1: TPanel;
    btnGravar: TSpeedButton;
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Parametros: TParam;
    { Public declarations }
  end;

var
  FCad_CRMHistorico: TFCad_CRMHistorico;

implementation

{$R *.dfm}

procedure TFCad_CRMHistorico.btnGravarClick(Sender: TObject);
begin
  if Parametros.DatasetCRM.State in [dsEdit, dsInsert] then
    Parametros.DatasetCRM.Post;
  ModalResult := mrOk;
end;

procedure TFCad_CRMHistorico.FormShow(Sender: TObject);
begin
  SCRM.DataSet := Parametros.DatasetCRM;
end;

end.
