unit Funcoes;

interface
uses
  Data.DB, Vcl.Dialogs, Vcl.Forms, Variaveis_Sistema, Winapi.Windows, System.SysUtils;

procedure CopiaRegistro(AOrigem, ADestino: TDataSet; AAppend: Boolean = True; APost: Boolean = True);
procedure CopiaTabela(AOrigem, ADestino: TDataSet);
procedure ValidaCampo(ACampo: TField; APermiteVazio: Boolean = False; APermiteZero: Boolean = False; APermiteMenorZero: Boolean = False);
function MyMessage(AMsg: String; ABtn: Integer = 0): Integer;
procedure ValidarCPF(const CPF: string);
procedure ValidarCNPJ(const CNPJ: string);
procedure SelecionaRegistroGrid(ADataset: TDataSet);
procedure FiltraMarcado(ADataset: TDataSet);
procedure RemoveFiltroTabela(ADataset: TDataSet);

implementation

procedure RemoveFiltroTabela(ADataset: TDataSet);
begin
  ADataset.Filtered := False;
  ADataset.Filter := '';
end;

procedure FiltraMarcado(ADataset: TDataSet);
begin
  ADataSet.Filtered := False;
  ADataset.Filter := 'ST_MARCADO="True"';
  ADataset.Filtered := True;
end;

procedure SelecionaRegistroGrid(ADataset: TDataSet);
begin
  if not (ADataset.State in [dsEdit, dsInsert]) then
    ADataset.Edit;
  ADataset.FieldByName('ST_MARCADO').AsBoolean := not ADataset.FieldByName('ST_MARCADO').AsBoolean;
  ADataset.Post;
end;

procedure ValidarCNPJ(const CNPJ: string);
var
  Soma, Resto, Digito, Peso: Integer;
begin
  if Length(CNPJ) <> 14 then
    Exit;

  Soma := 0;
  Peso := 2;
  for Digito := 12 downto 1 do
  begin
    Soma := Soma + StrToInt(CNPJ[Digito]) * Peso;
    Inc(Peso);
    if Peso > 9 then
      Peso := 2;
  end;

  Resto := Soma mod 11;
  if (Resto = 0) or (Resto = 1) then
    Resto := 0
  else
    Resto := 11 - Resto;

  if Resto = StrToInt(CNPJ[13]) then
  begin
    Soma := 0;
    Peso := 2;
    for Digito := 13 downto 1 do
    begin
      Soma := Soma + StrToInt(CNPJ[Digito]) * Peso;
      Inc(Peso);
      if Peso > 9 then
        Peso := 2;
    end;

    Resto := Soma mod 11;
    if (Resto = 0) or (Resto = 1) then
      Resto := 0
    else
      Resto := 11 - Resto;

    if not Resto = StrToInt(CNPJ[14]) then
    begin
      MyMessage('CNPJ inv�lido!');
      Abort;
    end;
  end;
end;

procedure ValidarCPF(const CPF: string);
var
  Soma, Resto, Digito: Integer;
begin
  if Length(CPF) <> 11 then
    Exit;

  Soma := 0;
  for Digito := 1 to 9 do
    Soma := Soma + StrToInt(CPF[Digito]) * (11 - Digito);

  Resto := (Soma * 10) mod 11;
  if (Resto = 10) or (Resto = StrToInt(CPF[10])) then
  begin
    Soma := 0;
    for Digito := 1 to 10 do
      Soma := Soma + StrToInt(CPF[Digito]) * (12 - Digito);

    Resto := (Soma * 10) mod 11;
    if not ((Resto = 10) or (Resto = StrToInt(CPF[11]))) then
    begin
      MyMessage('CPF inv�lido!');
      Abort;
    end;
  end;
end;

function MyMessage(AMsg: String; ABtn: Integer = 0): Integer;
begin
  {
  MB_OK = 0;
  MB_OKCANCEL = 1;
  MB_ABORTRETRYIGNORE = 2;
  MB_YESNOCANCEL = 3;
  MB_YESNO = 4;
  MB_RETRYCANCEL = 5;
  }
  Result := Application.MessageBox(PChar(AMsg), PChar(VAR_SISTEMA), ABtn);
end;

procedure ValidaCampo(ACampo: TField; APermiteVazio: Boolean = False; APermiteZero: Boolean = False; APermiteMenorZero: Boolean = False);
var
  lvValida: Boolean;
  lvDisplayCampo: String;
begin
  lvValida := False;
  case ACampo.DataType of
    ftString, ftBlob, ftMemo:
    begin
      if not APermiteVazio then
        lvValida := ACampo.AsString <> '';
    end;
    ftInteger:
    begin
      if not APermiteZero then
        lvValida := ACampo.AsInteger > 0
      else if not APermiteMenorZero then
        lvValida := ACampo.AsInteger >= 0;
    end;
    ftFloat, ftCurrency:
    begin
      if not APermiteZero then
        lvValida := ACampo.AsFloat > 0
      else if not APermiteMenorZero then
        lvValida := ACampo.AsFloat >= 0;
    end;
    ftDate, ftTime, ftDateTime, ftTimeStamp:
    begin
      if not APermiteVazio then
        lvValida := ACampo.AsInteger <> 0
    end;
  end;

  lvDisplayCampo := ACampo.DisplayLabel;
  if not lvValida then
  begin
    MyMessage('O Campo ' + lvDisplayCampo + ' n�o possui um valor v�lido!');
    Abort;
  end;
end;

procedure CopiaTabela(AOrigem, ADestino: TDataSet);
begin
  AOrigem.First;
  while not AOrigem.Eof do
  begin
    CopiaRegistro(AOrigem, ADestino);
    AOrigem.Next;
  end;
end;

procedure CopiaRegistro(AOrigem, ADestino: TDataSet; AAppend: Boolean = True; APost: Boolean = True);
var
  I: Integer;
  lvFieldName: String;
begin
  if not ADestino.Active then
    ADestino.Open;

  if AAppend then
    ADestino.Append;

  for I := 0 to ADestino.FieldCount - 1 do
  begin
    lvFieldName := ADestino.Fields.Fields[I].FieldName;
    if ADestino.Fields.Fields[I].ReadOnly then
      Continue;
    if AOrigem.FindField(lvFieldName) <> nil then
    begin
      if not (ADestino.State in [dsEdit, dsInsert]) then
        ADestino.Edit;
      ADestino.FieldByName(lvFieldName).Value := AOrigem.FieldByName(lvFieldName).Value;
    end;
  end;

  if APost then
    ADestino.Post;
end;

end.
