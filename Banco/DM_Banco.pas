unit DM_Banco;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL;

type
  TDMBanco = class(TDataModule)
    con: TFDConnection;
    driver: TFDPhysMySQLDriverLink;
  private
    { Private declarations }
  public
    function SequenciaTabela(ATabela: String): Integer;
    function Conectar(AUsuario, AHost: String; AMostraTelaConfig: Boolean): Boolean;
    { Public declarations }
  end;

var
  DMBanco: TDMBanco;

implementation
uses Funcoes, Cad_ConfgBanco;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMBanco }

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

end.
