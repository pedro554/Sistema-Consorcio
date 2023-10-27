unit Cad_EnvioEmail;

interface

uses
  FormularioBase, DM_Banco, Funcoes, F_Processo, Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, ACBrBase, ACBrMail, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvMemoryDataset,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TFCad_EnvioEmail = class(TFormulario)
    mail: TACBrMail;
    QConfigEmail: TFDQuery;
    QConfigEmailDS_USERNAME: TStringField;
    QConfigEmailDS_SENHA: TStringField;
    QConfigEmailDS_NOMEEMAIL: TStringField;
    QConfigEmailDS_HOSTEMAIL: TStringField;
    QConfigEmailNR_PORTA: TStringField;
    QConfigEmailST_TLS: TStringField;
    QConfigEmailST_SSL: TStringField;
    TEmail: TJvMemoryData;
    TEmailDS_ASSUNTO: TStringField;
    DS_ASSUNTO: TDBEdit;
    SEmail: TDataSource;
    Label1: TLabel;
    DS_CONTEUDO: TDBMemo;
    Label2: TLabel;
    TEmailDS_CONTEUDO: TBlobField;
    Panel1: TPanel;
    btnEnviar: TSpeedButton;
    Cancelar: TSpeedButton;
    TEmailCD_CRM: TIntegerField;
    TAnexos: TJvMemoryData;
    SAnexos: TDataSource;
    TAnexosDS_ARQUIVO: TStringField;
    Label3: TLabel;
    GridAnexos: TJvDBGrid;
    btnAddAnexo: TSpeedButton;
    btnRemoverAnexo: TSpeedButton;
    dlgAnexo: TOpenDialog;
    TAnexosCD_ANEXO: TIntegerField;
    TEmailCD_CLIENTE: TIntegerField;
    TEmailDS_EMAILCLIENTE: TStringField;
    TEmailNM_CLIENTE: TStringField;
    QCliente: TFDQuery;
    QClienteCD_CLIENTE: TFDAutoIncField;
    QClienteNM_CLIENTE: TStringField;
    QClienteDS_EMAIL: TStringField;
    QHistoricoEmail: TFDQuery;
    QHistoricoEmailCD_HISTORICOEMAIL: TFDAutoIncField;
    QHistoricoEmailDS_ASSUNTO: TStringField;
    QHistoricoEmailDS_CONTEUDO: TStringField;
    QHistoricoEmailCD_CLIENTE: TIntegerField;
    QHistoricoEmailCD_CRM: TIntegerField;
    QHistoricoEmailDT_ENVIO: TSQLTimeStampField;
    QHistoricoEmailAnexo: TFDQuery;
    QHistoricoEmailAnexoCD_HISTORICOEMAIL: TIntegerField;
    QHistoricoEmailAnexoCD_ANEXO: TFDAutoIncField;
    QHistoricoEmailAnexoDS_ARQUIVO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnRemoverAnexoClick(Sender: TObject);
    procedure btnAddAnexoClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure mailMailProcess(const AMail: TACBrMail; const aStatus: TMailStatus);
  private
    FProcesso: TFProcesso;
    FCD_Cliente: Integer;
    FCD_CRM: Integer;
    procedure CarregaConfigEmail;
    procedure CarregaCliente;
    procedure GravaHistoricoEmail;
    { Private declarations }
  public
    procedure Inicializa(ACliente: Integer; ACRM: Integer = 0);
    { Public declarations }
  end;

var
  FCad_EnvioEmail: TFCad_EnvioEmail;

implementation

{$R *.dfm}

{ TFCad_EnvioEmail }

procedure TFCad_EnvioEmail.btnAddAnexoClick(Sender: TObject);
begin
  if dlgAnexo.Execute then
  begin
    TAnexos.Append;
    TAnexosDS_ARQUIVO.AsString := dlgAnexo.FileName;
    TAnexos.Post;
  end;
end;

procedure TFCad_EnvioEmail.btnEnviarClick(Sender: TObject);
var
  lvArquivo: string;
begin
  if TEmail.State in [dsEdit, dsInsert] then
    TEmail.Post;

  ValidaCampo(TEmailDS_ASSUNTO);
  ValidaCampo(TEmailDS_CONTEUDO);

  try
    CarregaConfigEmail;
    mail.Subject := TEmailDS_ASSUNTO.AsString;
    mail.AddAddress(TEmailDS_EMAILCLIENTE.AsString, TEmailNM_CLIENTE.AsString);
    mail.AltBody.Add(TEmailDS_CONTEUDO.AsString);

    TAnexos.First;
    while not TAnexos.Eof do
    begin
      lvArquivo := TAnexosDS_ARQUIVO.AsString;
      mail.AddAttachment(lvArquivo, lvArquivo, adAttachment);
      TAnexos.Next;
    end;

    FProcesso.Inicializa;
    mail.Send(False);
    GravaHistoricoEmail;
  except
    on e: exception do
    begin
      MyMessage('Falha ao enviar E-Mail: ' + e.Message);
      FProcesso.Close;
      Abort;
    end;
  end;

  ModalResult := mrOk;
end;

procedure TFCad_EnvioEmail.btnRemoverAnexoClick(Sender: TObject);
begin
  if TAnexos.IsEmpty then
    Abort;

  if MyMessage('Deseja remover o anexo selecionado?', 4) <> 6 then
    Abort;

  TAnexos.Delete;
end;

procedure TFCad_EnvioEmail.CancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFCad_EnvioEmail.CarregaCliente;
begin
  QCliente.Close;
  QCliente.ParamByName('CD_CLIENTE').AsInteger := FCD_Cliente;
  QCliente.Open;

  if QClienteDS_EMAIL.IsNull then
  begin
    MyMessage('Este cliente não possu E-Mail cadastrado. Verifique!');
    Abort;
  end;

  TEmailCD_CLIENTE.AsInteger := FCD_Cliente;
  TEmailDS_EMAILCLIENTE.AsString := QClienteDS_EMAIL.AsString;
  TEmailNM_CLIENTE.AsString := QClienteNM_CLIENTE.AsString;
end;

procedure TFCad_EnvioEmail.CarregaConfigEmail;
begin
  QConfigEmail.Close;
  QConfigEmail.Open;
  if QConfigEmail.IsEmpty then
  begin
    MyMessage('E-Mail não cadastrado nas configurações do sistema. Verifique!');
    Self.Close;
    Abort;
  end;
  mail.Host := QConfigEmailDS_HOSTEMAIL.AsString;
  mail.Password := QConfigEmailDS_SENHA.AsString;
  mail.Port := QConfigEmailNR_PORTA.AsString;
  mail.SetSSL := QConfigEmailST_SSL.AsString = 'SIM';
  mail.SetTLS := QConfigEmailST_TLS.AsString = 'SIM';
  mail.Username := QConfigEmailDS_USERNAME.AsString;
  mail.FromName := QConfigEmailDS_NOMEEMAIL.AsString;
  mail.From := mail.Username;
end;

procedure TFCad_EnvioEmail.FormCreate(Sender: TObject);
begin
  FProcesso := TFProcesso.Create(Self);
  FProcesso.ConfiguraProgressoPrincipal(10);
  TEmail.Open;
  TAnexos.Open;
end;

procedure TFCad_EnvioEmail.FormDestroy(Sender: TObject);
begin
  TEmail.Close;
  TAnexos.Close;
  QConfigEmail.Close;
  QCliente.Close;
  FProcesso.Free;
end;

procedure TFCad_EnvioEmail.GravaHistoricoEmail;
var
  lvCD_HISTORICOEMAIL: Integer;
  lvArquivo: String;
begin
  QHistoricoEmail.Close;
  QHistoricoEmail.Open;
  QHistoricoEmailAnexo.Close;
  QHistoricoEmailAnexo.Open;

  QHistoricoEmail.Append;
  lvCD_HISTORICOEMAIL := DMBanco.SequenciaTabela('HISTORICO_EMAIL');
  QHistoricoEmailDS_ASSUNTO.AsString := TEmailDS_ASSUNTO.AsString;
  QHistoricoEmailDS_CONTEUDO.AsString := TEmailDS_CONTEUDO.AsString;
  QHistoricoEmailCD_CLIENTE.AsInteger := TEmailCD_CLIENTE.AsInteger;
  if FCD_CRM <> 0 then
    QHistoricoEmailCD_CRM.AsInteger := FCD_CRM;
  QHistoricoEmail.Post;

  TAnexos.DisableControls;
  try
    if not TAnexos.IsEmpty then
    begin
      TAnexos.First;
      while not TAnexos.Eof do
      begin
        if not DirectoryExists(DiretorioSistema + '\ArquivosEmail') then
          CreateDir(DiretorioSistema + '\ArquivosEmail');
        lvArquivo := DiretorioSistema + '\ArquivosEmail\' + GeraGUID + RetornaExtensaoArquivo(TAnexosDS_ARQUIVO.AsString);
        CopiarArquivo(TAnexosDS_ARQUIVO.AsString, lvArquivo);
        QHistoricoEmailAnexo.Append;
        QHistoricoEmailAnexoCD_HISTORICOEMAIL.AsInteger := lvCD_HISTORICOEMAIL;
        QHistoricoEmailAnexoDS_ARQUIVO.AsString := lvArquivo;
        QHistoricoEmailAnexo.Post;
        TAnexos.Next;
      end;
    end;
  finally
    TAnexos.EnableControls;
  end;
end;

procedure TFCad_EnvioEmail.Inicializa(ACliente: Integer; ACRM: Integer = 0);
begin
  FCD_Cliente := ACliente;
  FCD_CRM := ACRM;
  TEmail.Append;
  CarregaCliente;
  Self.ShowModal;
end;

procedure TFCad_EnvioEmail.mailMailProcess(const AMail: TACBrMail; const aStatus: TMailStatus);
begin
  case aStatus of
    pmsStartProcess:
      begin
        FProcesso.AtualizaDescricao('Iniciando processo de envio.');
        FProcesso.IncrementaProgresso(0);
      end;
    pmsConfigHeaders:
      begin
        FProcesso.AtualizaDescricao('Configurando o cabeçalho do e-mail.');
        FProcesso.IncrementaProgresso(1);
      end;
    pmsLoginSMTP:
      begin
        FProcesso.AtualizaDescricao('Logando no servidor de e-mail.');
        FProcesso.IncrementaProgresso(2);
      end;
    pmsStartSends:
      begin
        FProcesso.AtualizaDescricao('Iniciando os envios.');
        FProcesso.IncrementaProgresso(3);
      end;
    pmsSendTo:
      begin
        FProcesso.AtualizaDescricao('Processando lista de destinatários.');
        FProcesso.IncrementaProgresso(4);
      end;
    pmsSendCC:
      begin
        FProcesso.AtualizaDescricao('Processando lista CC.');
        FProcesso.IncrementaProgresso(5);
      end;
    pmsSendBCC:
      begin
        FProcesso.AtualizaDescricao('Processando lista BCC.');
        FProcesso.IncrementaProgresso(6);
      end;
    pmsSendReplyTo:
      begin
        FProcesso.AtualizaDescricao('Processando lista ReplyTo.');
        FProcesso.IncrementaProgresso(7);
      end;
    pmsSendData:
      begin
        FProcesso.AtualizaDescricao('Enviando dados.');
        FProcesso.IncrementaProgresso(8);
      end;
    pmsLogoutSMTP:
      begin
        FProcesso.AtualizaDescricao('Fazendo Logout no servidor de e-mail.');
        FProcesso.IncrementaProgresso(9);
      end;
    pmsDone:
      begin
        FProcesso.AtualizaDescricao('Terminando.');
        FProcesso.IncrementaProgresso(10);
      end;
  end;
end;

end.

