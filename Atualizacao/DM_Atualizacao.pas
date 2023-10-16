unit DM_Atualizacao;

interface

uses
  System.SysUtils, System.Classes, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDMAtualizacao = class(TDataModule)
    ftpAtualizacao: TIdFTP;
    QVerificaAtualizacao: TFDQuery;
    QVersao: TFDQuery;
    QVersaoNR_VERSAOSISTEMA: TIntegerField;
    procedure DataModuleDestroy(Sender: TObject);
  private
    function ConectarServidorFTP(out AMsgErro: String): Boolean;
    procedure DesconectarFTP;
    function VerificaTemAtualizacao: Boolean;
    procedure ConsultaVersao;
    { Private declarations }
  public
    function BaixarAtualizacao: Boolean;
    procedure ExcluirExecutavelOLD;
    { Public declarations }
  end;

var
  DMAtualizacao: TDMAtualizacao;

implementation
uses Constantes, Funcoes, DM_Banco, Variaveis_Sistema;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMAtualizacao }

function TDMAtualizacao.BaixarAtualizacao: Boolean;
var
  lvMsgErro: String;
begin
  Result := False;
  if not ConectarServidorFTP(lvMsgErro) then
  begin
    MyMessage(lvMsgErro);
    Abort;
  end;

  try
    if not VerificaTemAtualizacao then
      Exit;

    if MyMessage('Atualização do sistema encontrada. Deseja atualizar agora?', 4) <> 6 then
      Exit;

    RenameFile(DiretorioSistema + '\SistemaConsorcio.exe', DiretorioSistema + '\SistemaConsorcioOLD.exe');
    ftpAtualizacao.Get(C_DIRETORIOATUALIZACAO + 'SistemaConsorcio.exe', DiretorioSistema + '\SistemaConsorcio.exe', False);
    Result := True;

    ConsultaVersao;
    if not (QVersao.State in [dsEdit, dsInsert]) then
      QVersao.Edit;

    QVersaoNR_VERSAOSISTEMA.AsInteger := QVerificaAtualizacao.FieldByName('NR_VERSAO').AsInteger;
    QVersao.Post;
  finally
    DesconectarFTP;
  end;
end;

function TDMAtualizacao.ConectarServidorFTP(out AMsgErro: String): Boolean;
begin
  if ftpAtualizacao.Connected then
    ftpAtualizacao.Disconnect;

  ftpAtualizacao.Host := C_HOSTFTP;
  ftpAtualizacao.Port := C_PORTAFTP;
  ftpAtualizacao.Password := C_SENHAFTP;
  ftpAtualizacao.Username := C_USUARIOFTP;

  try
    ftpAtualizacao.Connect;
    Result := ftpAtualizacao.Connected;
  except
    on e: exception do
    begin
      AMsgErro := 'Falha ao conectar com o servidor FTP: ' + #13#10 + e.Message;
      Result := False;
      Exit;
    end;
  end;
end;

procedure TDMAtualizacao.ConsultaVersao;
begin
  QVersao.Close;
  QVersao.Open;
end;

procedure TDMAtualizacao.DataModuleDestroy(Sender: TObject);
begin
  DesconectarFTP;
end;

procedure TDMAtualizacao.DesconectarFTP;
begin
  if ftpAtualizacao.Connected then
    ftpAtualizacao.Disconnect;
end;

procedure TDMAtualizacao.ExcluirExecutavelOLD;
begin
  if FileExists(DiretorioSistema + '\SistemaConsorcioOLD.exe') then
    DeleteFile(DiretorioSistema + '\SistemaConsorcioOLD.exe');
end;

function TDMAtualizacao.VerificaTemAtualizacao: Boolean;
begin
  try
    ConsultaVersao;

    if QVersao.IsEmpty then
    begin
      QVersao.Append;
      QVersao.Post;
    end;

    QVerificaAtualizacao.Close;
    QVerificaAtualizacao.Open;
    Result := QVerificaAtualizacao.FieldByName('NR_VERSAO').AsInteger > QVersaoNR_VERSAOSISTEMA.AsInteger;
  except
    on e: exception do
    begin
      MyMessage('Falha ao verificar número da versão do sistema.' + #13#10 + TratarMsgErroBanco(e.Message));
      Result := False;
      Exit;
    end;
  end;
end;

end.
