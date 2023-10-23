unit DM_ConfigSistema;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Themes, JvMemoryDataset;

type
  TDMConfigSistema = class(TDataModule)
    QConfigSistema: TFDQuery;
    QConfigSistemaDS_USERNAME: TStringField;
    QConfigSistemaDS_SENHA: TStringField;
    QConfigSistemaDS_NOMEEMAIL: TStringField;
    QConfigSistemaDS_HOSTEMAIL: TStringField;
    QConfigSistemaNR_PORTA: TStringField;
    QConfigSistemaST_TLS: TStringField;
    QConfigSistemaST_SSL: TStringField;
    TConfigSistema: TJvMemoryData;
    TConfigSistemaDS_USERNAME: TStringField;
    TConfigSistemaDS_SENHA: TStringField;
    TConfigSistemaDS_NOMEEMAIL: TStringField;
    TConfigSistemaDS_HOSTEMAIL: TStringField;
    TConfigSistemaNR_PORTA: TStringField;
    TConfigSistemaST_TLS: TStringField;
    TConfigSistemaST_SSL: TStringField;
  private
    { Private declarations }
  public
    procedure CarregaConfigSistema;
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
  CarregaConfigSistema;
end;

procedure TDMConfigSistema.CarregaConfigSistema;
begin
  QConfigSistema.Close;
  QConfigSistema.Open;

  TConfigSistema.Close;
  TConfigSistema.Open;

  CopiaRegistro(QConfigSistema, TConfigSistema);
end;

procedure TDMConfigSistema.GravarConfiguracao;
begin
  if TConfigSistema.State in [dsEdit, dsInsert] then
    TConfigSistema.Post;

  if TConfigSistemaDS_USERNAME.AsString <> EmptyStr then
    if not ValidaEmail(TConfigSistemaDS_USERNAME.AsString) then
    begin
      MyMessage('E-Mail inválido');
      Abort;
    end;

  CopiaRegistro(TConfigSistema, QConfigSistema, QConfigSistema.IsEmpty);
end;

end.
