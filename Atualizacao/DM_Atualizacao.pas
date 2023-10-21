unit DM_Atualizacao;

interface

uses
  F_Processo,
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
    procedure ftpAtualizacaoWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
  private
    FProcesso: TFProcesso;
    function ConectarServidorFTP(out AMsgErro: String): Boolean;
    procedure DesconectarFTP;
    function VerificaTemAtualizacao: Boolean;
    procedure ConsultaVersao;
    procedure AtualizaSistema;
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

procedure TDMAtualizacao.AtualizaSistema;
begin
  FProcesso.AtualizaDescricao('Renomeando arquivos...');
  RenameFile(DiretorioSistema + '\' + C_NOMEEXECUTAVEL, DiretorioSistema + '\' + C_NOMEEXECUTAVELOLD);

  FProcesso.AtualizaDescricao('Baixando atualização...');
  FProcesso.ConfiguraProgressoPrincipal(ftpAtualizacao.Size(C_DIRETORIOATUALIZACAO + C_NOMEEXECUTAVEL) div 1024);
  try
    ftpAtualizacao.Get(C_DIRETORIOATUALIZACAO + C_NOMEEXECUTAVEL, DiretorioSistema + '\' + C_NOMEEXECUTAVEL, False);
  except
    on E: Exception do
    begin
      MyMessage('Erro ao baixar a atualização: ' + E.Message);
      Abort;
    end;
  end;

  FProcesso.AtualizaDescricao('Atualizando número da versão...');
  ConsultaVersao;
  if not (QVersao.State in [dsEdit, dsInsert]) then
    QVersao.Edit;

  QVersaoNR_VERSAOSISTEMA.AsInteger := QVerificaAtualizacao.FieldByName('NR_VERSAO').AsInteger;
  QVersao.Post;

  FProcesso.Finaliza;
end;

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

  FProcesso := TFProcesso.Create(nil);

  try
    if not VerificaTemAtualizacao then
      Exit;

    if MyMessage('Atualização do sistema encontrada. Deseja atualizar agora?', 4) <> 6 then
      Exit;

    FProcesso.Titulo := 'Atualizando sistema';
    FProcesso.OnExecutaProc := AtualizaSistema;
    FProcesso.Inicializa;

    Result := True;
  finally
    DesconectarFTP;
    FreeAndNil(FProcesso);
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
  if FileExists(DiretorioSistema + '\' + C_NOMEEXECUTAVELOLD) then
    DeleteFile(DiretorioSistema + '\' + C_NOMEEXECUTAVELOLD);
end;

procedure TDMAtualizacao.ftpAtualizacaoWork(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCount: Int64);
begin
  FProcesso.IncrementaProgresso(AWorkCount div 1024);
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
