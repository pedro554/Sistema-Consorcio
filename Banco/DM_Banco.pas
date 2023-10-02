unit DM_Banco;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, JvMemoryDataset;

type
  TDMBanco = class(TDataModule)
    con: TFDConnection;
    driver: TFDPhysMySQLDriverLink;
    conValidade: TFDConnection;
    QValidade: TFDQuery;
    QEmpresa: TFDQuery;
    QValidadeDT_VALIDADE: TDateTimeField;
    QEmpresaNR_CPFCNPJ: TStringField;
    QAtualizacao: TFDQuery;
    QAtualizacaoDT_ATUALIZACAO: TDateTimeField;
    QAtualizacaoNR_VERSAO: TIntegerField;
    TAtualizacao: TJvMemoryData;
    TAtualizacaoDS_ARQUIVO: TStringField;
    TAtualizacaoNR_VERSAO: TIntegerField;
  private
    { Private declarations }
  public
    function SequenciaTabela(ATabela: String): Integer;
    function Conectar(AUsuario, AHost: String; AMostraTelaConfig: Boolean): Boolean;
    function ValidaValidadeSistema(out AMsg: String): Boolean;
    function AtualizaBancoDeDados(out AMsg: String): Boolean;
    { Public declarations }
  end;

var
  DMBanco: TDMBanco;

implementation
uses Funcoes, Cad_ConfgBanco, Variaveis_Sistema, Constantes, Cad_Empresa;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMBanco }

function TDMBanco.AtualizaBancoDeDados(out AMsg: String): Boolean;
var
  searchResult: TSearchRec;
  Query: TFDQuery;
  lvSQL: TStringList;
begin
  Result := DelphiAberto;
  QAtualizacao.Close;
  QAtualizacao.Open;
  TAtualizacao.Close;
  TAtualizacao.Open;

  if FindFirst(DiretorioSistema + '\bdatualizacao\*.sql', faAnyFile, searchResult) = 0 then
  begin
    try
      repeat
        if (searchResult.Name <> '.') and (searchResult.Name <> '..') then
        begin
          if StrToInt(ExtraiNumeros(searchResult.Name)) > QAtualizacaoNR_VERSAO.AsInteger then
          begin
            TAtualizacao.Append;
            TAtualizacaoNR_VERSAO.AsString := ExtraiNumeros(searchResult.Name);
            TAtualizacaoDS_ARQUIVO.AsString := DiretorioSistema + '\bdatualizacao\' + searchResult.Name;
            TAtualizacao.Post;
          end;
        end;
      until FindNext(searchResult) <> 0;
    finally
      FindClose(searchResult);
    end;
  end;

  if TAtualizacao.IsEmpty then
    Exit;

  OrdenarTabelaMemoriaPorCampo(TAtualizacao, TAtualizacaoNR_VERSAO);

  TAtualizacao.First;
  try
    Query := TFDQuery.Create(nil);
    Query.Connection := con;
    lvSQL := TStringList.Create;

    while not TAtualizacao.Eof do
    begin
      lvSQL.LoadFromFile(TAtualizacaoDS_ARQUIVO.AsString);
      try
        Query.ExecSQL(lvSQL.Text);
      except
        on e: exception do
        begin
          if not DelphiAberto then
          begin
            AMsg := 'Falha ao atualizar banco de dados.' + #13#10 +
                    'Nº Atualização: ' + TAtualizacaoNR_VERSAO.AsString + #13#10 +
                    e.Message;
            Exit;
          end;
        end;
      end;
      if not DelphiAberto then
        DeleteFile(TAtualizacaoDS_ARQUIVO.AsString);
      TAtualizacao.Next;
    end;
    Result := True;
  finally
    Query.Free;
    lvSQL.Free;
  end;
end;

function TDMBanco.Conectar(AUsuario, AHost: String; AMostraTelaConfig: Boolean): Boolean;
var
  FCad_ConfigBanco: TFCad_ConfigBanco;
begin
  if con.Connected then
    Con.Connected := False;

  con.Params.Clear;

  con.Params.DriverID := 'MySQL';
  con.Params.Database := 'sistema';
  con.Params.UserName := AUsuario;
  con.Params.Values['Server'] := AHost;
  con.Params.Password := 'spsg91g8';
  driver.VendorLib := DiretorioSistema + '\lib\libmysql.dll';

  try
    con.Connected := True;
    Result := con.Connected;
  except
    on e: exception do
    begin
      if not AMostraTelaConfig then
      begin
        MyMessage('Falha ao conectar no banco de dados: ' + #13 + e.message);
        Result := False;
      end
      else
      begin
        FCad_ConfigBanco := TFCad_ConfigBanco.Create(nil);
        try
          if FCad_ConfigBanco.ShowModal = 1 then
            Result := Conectar(
              FCad_ConfigBanco.edtUsuario.Text,
              FCad_ConfigBanco.edtIP.Text,
              False
            );
        finally
          FCad_ConfigBanco.Free;
        end;
      end;
    end;
  end;
end;

function TDMBanco.SequenciaTabela(ATabela: String): Integer;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := con;
    Query.SQL.Text := 'SELECT AUTO_INCREMENT ' +
                      'FROM information_schema.TABLES ' +
                      'WHERE TABLE_SCHEMA = ''sistema'' ' +
                      'AND TABLE_NAME = ' + QuotedStr(ATabela);
    Query.Open;

    if not Query.IsEmpty then
      Result := Query.Fields[0].AsInteger
    else
      Result := -1;
  finally
    Query.Free;
  end;
end;

function TDMBanco.ValidaValidadeSistema(out AMsg: String): Boolean;
var
  FCad_Empresa: TFCad_Empresa;
  lvRecarregaQuery: Boolean;
begin
  lvRecarregaQuery := False;

  if conValidade.Connected then
    conValidade.Connected := False;

  conValidade.Params.Clear;

  conValidade.Params.DriverID := 'MySQL';
  conValidade.Params.Database := C_NOMEBANCOVALIDADE;
  conValidade.Params.UserName := C_USUARIOBANCOVALIDADE;
  conValidade.Params.Values['Server'] := C_HOSTBANCOVALIDADE;
  conValidade.Params.Password := C_SENHABANCOVALIDADE;

  try
    conValidade.Connected := True;
  except
    on e: exception do
    begin
      AMsg := 'Falha ao conectar no banco de dados para verificar a validade do sistema!' + #13#10 + e.message;
      Result := False;
      lvRecarregaQuery := True;
      Exit;
    end;
  end;

  QEmpresa.Close;
  QEmpresa.Open;
  VAR_CPFCNPJ := QEmpresaNR_CPFCNPJ.AsString;
  try
    QValidade.Close;
    QValidade.ParamByName('NR_CPFCNPJ').AsString := VAR_CPFCNPJ;
    QValidade.Open;

    if QValidade.IsEmpty then
    begin
      FCad_Empresa := TFCad_Empresa.Create(nil);
      try
        if FCad_Empresa.ShowModal <> 1 then
        begin
          AMsg := 'É necessário cadastrar uma empresa para utilizar o sistema!';
          Result := False;
          Exit;
        end;
        lvRecarregaQuery := True;
      finally
        FCad_Empresa.Free;
      end;
    end;

    if lvRecarregaQuery then
    begin
      QEmpresa.Close;
      QEmpresa.Open;
      VAR_CPFCNPJ := QEmpresaNR_CPFCNPJ.AsString;
      QValidade.Close;
      QValidade.ParamByName('NR_CPFCNPJ').AsString := VAR_CPFCNPJ;
      QValidade.Open;
    end;

    VAR_VALIDADE := QValidadeDT_VALIDADE.AsString;
    Result := not ((QValidadeDT_VALIDADE.AsDateTime < Date) or QValidade.IsEmpty);
    AMsg := 'A ativação do sistema está vencida ou não foi encontrada, entre em contato com a empresa para renovar/ativar o sistema.';
  except
    on e: exception do
    begin
      AMsg := 'Falha ao verificar validade do sistema.' + #13#10 + e.Message;
      Result := False;
      Exit;
    end;
  end;
end;

end.
