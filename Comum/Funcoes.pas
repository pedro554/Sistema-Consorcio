unit Funcoes;

interface

uses
  Data.DB, Vcl.Dialogs, Vcl.Forms, Variaveis_Sistema, Winapi.Windows,
  System.SysUtils, DateUtils, pcnAuxiliar, IpHlpApi, IpTypes, WinSock2, JvMemoryDataset,
  System.Win.ComObj, tlHelp32;

procedure CopiaRegistro(AOrigem, ADestino: TDataSet; AAppend: Boolean = True; APost: Boolean = True);
procedure CopiaTabela(AOrigem, ADestino: TDataSet);
procedure ValidaCampo(ACampo: TField; APermiteVazio: Boolean = False; APermiteZero: Boolean = False; APermiteMenorZero: Boolean = False);
function MyMessage(AMsg: string; ABtn: Integer = 0): Integer;
procedure ValidarCPF(const CPF: string);
procedure ValidarCNPJ(const CNPJ: string);
procedure SelecionaRegistroGrid(ADataset: TDataSet);
procedure FiltraMarcado(ADataset: TDataSet);
procedure RemoveFiltroTabela(ADataset: TDataSet);
function DiretorioSistema: string;
procedure AbreForm(AClasse: TFormClass; AVarForm: TObject);
function AnoMesCalc(Mes, Ano: Integer): Integer; overload;
function AnoMesCalc(Data: TDateTime): Integer; overload;
procedure ValidaCPFCNPJ(const ACPFCNPJ: string);
function ExtraiNumeros(const AString: string): string;
procedure OrdenarTabelaMemoriaPorCampo(ADataset: TJvMemoryData; campo: TField);
function DelphiAberto: Boolean;
function GetMacAddress: string;
function TratarMsgErroBanco(AMsg: String): String;
function IsVersaoInterna: Boolean;

implementation

function IsVersaoInterna: Boolean;
begin
  Result := FileExists(DiretorioSistema + '\versaointerna.siscon');
end;

function TratarMsgErroBanco(AMsg: String): String;
begin
  Result := StringReplace(AMsg, '[FireDAC][Phys][MySQL] ', 'Tipo de erro: ', []);
end;

function GetMacAddress: string;
var
Lib: Cardinal;
Func: function(GUID: PGUID): Longint; stdcall;
GUID1, GUID2: TGUID;
begin
Result := '';
Lib := LoadLibrary('rpcrt4.dll');
if Lib <> 0 then
begin
    @Func := GetProcAddress(Lib, 'UuidCreateSequential');
    if Assigned(Func) then
    begin
         if (Func(@GUID1) = 0) and (Func(@GUID2) = 0) and
         (GUID1.D4[2] = GUID2.D4[2]) and (GUID1.D4[3] = GUID2.D4[3]) and
         (GUID1.D4[4] = GUID2.D4[4]) and (GUID1.D4[5] = GUID2.D4[5]) and
         (GUID1.D4[6] = GUID2.D4[6]) and (GUID1.D4[7] = GUID2.D4[7]) then
         begin
              Result := IntToHex(GUID1.D4[2], 2) + '-' +
                   IntToHex(GUID1.D4[3], 2) + '-' +
                   IntToHex(GUID1.D4[4], 2) + '-' +
                   IntToHex(GUID1.D4[5], 2) + '-' +
                   IntToHex(GUID1.D4[6], 2) + '-' +
                   IntToHex(GUID1.D4[7], 2);
         end;
    end;
end;
end;

function DelphiAberto: Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := False;

  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(TProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if (UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase('bds.exe')) then
    begin
      Result := True;
      Break;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;

  CloseHandle(FSnapshotHandle);
end;

procedure OrdenarTabelaMemoriaPorCampo(ADataset: TJvMemoryData; campo: TField);
begin
  if not ADataset.Active then
    Exit;

  ADataset.SortOnFields(campo.FieldName);
end;

function ExtraiNumeros(const AString: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(AString) do
  begin
    if AString[i] in ['0'..'9'] then
      Result := Result + AString[i];
  end;
end;

procedure ValidaCPFCNPJ(const ACPFCNPJ: string);
begin
  if not ValidarCNPJouCPF(ACPFCNPJ) then
  begin
    MyMessage('CPF / CNPJ inválido!');
    Abort;
  end;
end;

function AnoMesCalc(Mes, Ano: Integer): Integer;
begin
  Result := (Ano * 12) + Mes;
end;

function AnoMesCalc(Data: TDateTime): Integer;
begin
  Result := (YearOf(Data) * 12) + MonthOf(Data);
end;

procedure AbreForm(AClasse: TFormClass; AVarForm: TObject);
begin
  AVarForm := AClasse.Create(Application);
  try
    TForm(AVarForm).ShowModal;
  finally
    FreeAndNil(AVarForm);
  end;
end;

function DiretorioSistema: string;
begin
  Result := ExtractFileDir(Application.ExeName);
end;

procedure RemoveFiltroTabela(ADataset: TDataSet);
begin
  ADataset.Filtered := False;
  ADataset.Filter := '';
end;

procedure FiltraMarcado(ADataset: TDataSet);
begin
  ADataset.Filtered := False;
  ADataset.Filter := 'ST_MARCADO="True"';
  ADataset.Filtered := True;
end;

procedure SelecionaRegistroGrid(ADataset: TDataSet);
begin
  if ADataset.IsEmpty then
    Exit;

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
      MyMessage('CNPJ inválido!');
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
      MyMessage('CPF inválido!');
      Abort;
    end;
  end;
end;

function MyMessage(AMsg: string; ABtn: Integer = 0): Integer;
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
  lvDisplayCampo: string;
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
    MyMessage('O Campo ' + lvDisplayCampo + ' não possui um valor válido!');
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
  lvFieldName: string;
begin
  if not ADestino.Active then
    ADestino.Open;

  if AAppend then
    ADestino.Append
  else
    ADestino.Edit;

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

