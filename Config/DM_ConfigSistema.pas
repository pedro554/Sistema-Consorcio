unit DM_ConfigSistema;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Themes, JvMemoryDataset;

type
  TDMConfigSistema = class(TDataModule)
    QConfigEmail: TFDQuery;
    QConfigEmailDS_USERNAME: TStringField;
    QConfigEmailDS_SENHA: TStringField;
    QConfigEmailDS_NOMEEMAIL: TStringField;
    QConfigEmailDS_HOSTEMAIL: TStringField;
    QConfigEmailNR_PORTA: TStringField;
    QConfigEmailST_TLS: TStringField;
    QConfigEmailST_SSL: TStringField;
    TConfigEmail: TJvMemoryData;
    TConfigEmailDS_USERNAME: TStringField;
    TConfigEmailDS_SENHA: TStringField;
    TConfigEmailDS_NOMEEMAIL: TStringField;
    TConfigEmailDS_HOSTEMAIL: TStringField;
    TConfigEmailNR_PORTA: TStringField;
    TConfigEmailST_TLS: TStringField;
    TConfigEmailST_SSL: TStringField;
  private
    { Private declarations }
  public
    procedure CarregaConfigEmail;
    procedure GravarConfiguracao;
    procedure CancelaAlteracao;
    { Public declarations }
  end;

var
  DMConfigSistema: TDMConfigSistema;

implementation
uses Funcoes;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMConfigSistema.CancelaAlteracao;
begin
  CarregaConfigEmail;
end;

procedure TDMConfigSistema.CarregaConfigEmail;
begin
  QConfigEmail.Close;
  QConfigEmail.Open;

  TConfigEmail.Close;
  TConfigEmail.Open;

  CopiaRegistro(QConfigEmail, TConfigEmail);
end;

procedure TDMConfigSistema.GravarConfiguracao;
begin
  if TConfigEmail.State in [dsEdit, dsInsert] then
    TConfigEmail.Post;

  if TConfigEmailDS_USERNAME.AsString <> EmptyStr then
    if not ValidaEmail(TConfigEmailDS_USERNAME.AsString) then
    begin
      MyMessage('E-Mail inválido');
      Abort;
    end;

  CopiaRegistro(TConfigEmail, QConfigEmail, QConfigEmail.IsEmpty);
end;

end.
