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
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure Conectar;
    { Private declarations }
  public
    function SequenciaTabela(ATabela: String): Integer;
    { Public declarations }
  end;

var
  DMBanco: TDMBanco;

implementation
uses Funcoes;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMBanco }

procedure TDMBanco.Conectar;
begin
  if con.Connected then
    Con.Connected := False;

  con.Params.Clear;

  con.Params.DriverID := 'MySQL';
  con.Params.Database := 'sistema';
  con.Params.UserName := 'root';
  con.Params.Password := 'spsg91g8';
  driver.VendorLib := DiretorioSistema + '\lib\libmysql.dll';

  try
    con.Connected := True;
  except
    on e: exception do
      raise Exception.Create('Falha ao conectar no banco de dados: ' + #13 + e.message);
  end;
end;

procedure TDMBanco.DataModuleCreate(Sender: TObject);
begin
  Conectar;
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
