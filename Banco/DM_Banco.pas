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
    conServidor: TFDConnection;
    QValidade: TFDQuery;
    QEmpresa: TFDQuery;
    QValidadeDT_VALIDADE: TDateTimeField;
    QEmpresaNR_CPFCNPJ: TStringField;
    QAtualizacao: TFDQuery;
    QAtualizacaoNR_VERSAO: TIntegerField;
    TAtualizacao: TJvMemoryData;
    TAtualizacaoDS_ARQUIVO: TStringField;
    TAtualizacaoNR_VERSAO: TIntegerField;
    QAtualizacaoDS_COMANDO: TBlobField;
    QVersao: TFDQuery;
    QVersaoNR_VERSAOBANCO: TIntegerField;
    QVersaoNR_VERSAOSISTEMA: TIntegerField;
    QCadMac: TFDQuery;
    QCadMacNR_MACADRESS: TStringField;
    QCadMacNR_CPFCNPJ: TStringField;
    QCadMacNM_CLIENTE: TStringField;
    QCadMacDT_VALIDADE: TDateTimeField;
  private
    function ConectarServidor(out AMsg: String): Boolean;
    { Private declarations }
  public
    function SequenciaTabela(ATabela: String): Integer;
    function Conectar(AUsuario, AHost: String; AMostraTelaConfig: Boolean): Boolean;
    function ValidaValidadeSistema(out AMsg: String): Boolean;
    function AtualizaBancoDeDados(out AMsg: String): Boolean;
    function RetornaVersaoSistema: String;
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
  Query: TFDQuery;
begin
  Result := True;
  QVersao.Close;
  QVersao.Open;

  if QVersao.IsEmpty then
    QVersao.Append;

  QAtualizacao.Close;
  QAtualizacao.ParamByName('NR_VERSAO').AsInteger := QVersaoNR_VERSAOBANCO.AsInteger;
  QAtualizacao.Open;

  {$REGION 'Looping atualizacao do banco de dados local'}
  while not QAtualizacao.Eof do
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := con;
      try
        Query.ExecSQL(QAtualizacaoDS_COMANDO.AsString);

        if not (QVersao.State in [dsEdit, dsInsert]) then
          QVersao.Edit;

        QVersaoNR_VERSAOBANCO.AsInteger := QAtualizacaoNR_VERSAO.AsInteger;
        QVersao.Post;
      except
        on e: exception do
        begin
          AMsg := 'Falha ao atualizar banco de dados.' + #13#10 + TratarMsgErroBanco(e.Message);
          Result := False;
          Exit;
        end;
      end;
    finally
      Query.Free;
    end;
    QAtualizacao.Next;
  end;
  {$ENDREGION}
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

  {$REGION 'Conectar ao banco de dados'}
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
  {$ENDREGION}
end;

function TDMBanco.ConectarServidor(out AMsg: String): Boolean;
begin
  if conServidor.Connected then
    conServidor.Connected := False;

  conServidor.Params.Clear;
  conServidor.Params.DriverID := 'MySQL';
  conServidor.Params.Database := C_NOMEBANCOVALIDADE;
  conServidor.Params.UserName := C_USUARIOBANCOVALIDADE;
  conServidor.Params.Values['Server'] := C_HOSTBANCOVALIDADE;
  conServidor.Params.Password := C_SENHABANCOVALIDADE;

  try
    conServidor.Connected := True;
    Result := True;
  except
    on e: exception do
    begin
      AMsg := 'Falha ao conectar no banco de dados para verificar a validade do sistema!' +
              #13#10#13#10 +
              TratarMsgErroBanco(e.Message) +
              #13#10#13#10 +
              'Verifique se a VPN está conectada ou entre em contato com a empresa.';
      Result := False;
      Exit;
    end;
  end;
end;

function TDMBanco.RetornaVersaoSistema: String;
begin
  QVersao.Close;
  QVersao.Open;
  Result := QVersaoNR_VERSAOSISTEMA.AsString;
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
  if not ConectarServidor(AMsg) then
    Exit;

  {$REGION 'Verificar cadastro da empresa'}
  QEmpresa.Close;
  QEmpresa.Open;
  if QEmpresa.IsEmpty and (not FileExists(DiretorioSistema + '\versaointerna.siscon')) then
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
  {$ENDREGION}

  if lvRecarregaQuery then
  begin
    QEmpresa.Close;
    QEmpresa.Open;
  end;
  VAR_CPFCNPJ := QEmpresaNR_CPFCNPJ.AsString;

  {$REGION 'Validar maquina/validade sistema'}
  try
    QValidade.Close;
    QValidade.ParamByName('NR_MACADRESS').AsString := GetMacAddress;
    QValidade.Open;

    if QValidade.IsEmpty then
    begin
      if FileExists(DiretorioSistema + '\versaointerna.siscon') then
      begin
        QCadMac.Close;
        QCadMac.Open;
        QCadMac.Append;
        QCadMacNR_MACADRESS.AsString := GetMacAddress;
        QCadMacNR_CPFCNPJ.AsString := 'VERSAOINTERNA';
        QCadMacNM_CLIENTE.AsString := 'VERSAOINTERNA';
        QCadMacDT_VALIDADE.AsDateTime := Now + 999;
        QCadMac.Post;
        Result := True;
        Exit;
      end
      else
      begin
        Result := False;
        AMsg := 'Este computador não está cadastrado para utilizar o sistema. Entre em contato com a empresa!';
        Exit;
      end;
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
  {$ENDREGION}
end;

end.
