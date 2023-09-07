unit Funcoes.FormPrincipal;

interface

uses
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
  Vcl.StdCtrls;

procedure CarregaComboPesquisa(ACombo: TComboBox; AGrid: TJvDBGrid);
function PegaNomeCampoCombo(ACombo: TComboBox; AGrid: TDBGrid): String;
procedure PesquisaGenerica(ADataset: TDataSet; AColuna, AValor: String);
procedure CarregaDadosQueryMemoria(AQuery, AMemoria: TDataset);

implementation
uses Funcoes;

procedure CarregaDadosQueryMemoria(AQuery, AMemoria: TDataset);
begin
  AQuery.Close;
  AQuery.Open;

  AMemoria.Close;
  AMemoria.Open;

  while not AQuery.Eof do
  begin
    CopiaRegistro(AQuery, AMemoria, True, False);
    if AMemoria.FindField('ST_MARCADO') <> nil then
      AMemoria.FieldByName('ST_MARCADO').AsBoolean := False;
    AMemoria.Post;
    AQuery.Next;
  end;
  AMemoria.First;
end;

procedure PesquisaGenerica(ADataset: TDataSet; AColuna, AValor: String);
begin
  ADataset.Filtered := False;
  ADataset.Filter := AColuna + ' LIKE ' + QuotedStr('*'+AValor+'*');
  ADataset.Filtered := True;
end;

function PegaNomeCampoCombo(ACombo: TComboBox; AGrid: TDBGrid): String;
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

procedure CarregaComboPesquisa(ACombo: TComboBox; AGrid: TJvDBGrid);
var
  I: Integer;
begin
  ACombo.Items.Clear;
  for I := 0 to AGrid.Columns.Count-1 do
  begin
    if AGrid.Columns.Items[I].FieldName = 'ST_MARCADO' then
      Continue;

    ACombo.Items.Add(AGrid.Columns.Items[I].Title.Caption);
  end;
  ACombo.ItemIndex := 0;
end;

end.

