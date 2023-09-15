unit DM_Funcoes.Consulta;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  JvExDBGrids,
  JvDBGrid,
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
  FireDAC.Comp.Client;

type
  TDMFuncoesConsulta = class(TDataModule)
  private
    { Private declarations }
  public
    function PegaNomeCampoCombo(ACombo: TComboBox; AGrid: TDBGrid): string;
    procedure CarregaComboBoxColuna(ACombo: TComboBox; AGrid: TDBGrid);
    procedure PesquisaGenerica(ADataset: TDataSet; AColuna, AValor: string);
    { Public declarations }
  end;

var
  DMFuncoesConsulta: TDMFuncoesConsulta;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMFuncoesConsulta }

procedure TDMFuncoesConsulta.CarregaComboBoxColuna(ACombo: TComboBox; AGrid: TDBGrid);
var
  I: Integer;
begin
  ACombo.Items.Clear;
  for I := 0 to AGrid.Columns.Count - 1 do
    ACombo.Items.Add(AGrid.Columns[I].Title.Caption);
  ACombo.ItemIndex := 0;
end;

function TDMFuncoesConsulta.PegaNomeCampoCombo(ACombo: TComboBox; AGrid: TDBGrid): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to AGrid.Columns.Count - 1 do
  begin
    if ACombo.Text = AGrid.Columns[I].Title.Caption then
    begin
      Result := AGrid.Columns[I].FieldName;
      Break;
    end;
  end;
end;

procedure TDMFuncoesConsulta.PesquisaGenerica(ADataset: TDataSet; AColuna, AValor: string);
begin
  ADataset.Filtered := False;
  ADataset.Filter := AColuna + ' LIKE ' + QuotedStr('*' + AValor + '*');
  ADataset.Filtered := True;
end;

end.

