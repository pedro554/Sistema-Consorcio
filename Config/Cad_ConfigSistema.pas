unit Cad_ConfigSistema;

interface

uses
  FormularioBase,
  Funcoes,
  DM_Banco,
  DM_ConfigSistema,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrBase, ACBrMail, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, JvExStdCtrls, JvCombobox, JvDBCombobox, System.Actions,
  Vcl.ActnList;

type
  TFCad_ConfigSistema = class(TFormulario)
    pnl: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    SConfigSistema: TDataSource;
    pgc: TPageControl;
    tsEmail: TTabSheet;
    Label2: TLabel;
    lbl2: TLabel;
    Label1: TLabel;
    lbl1: TLabel;
    edtDS_USERNAME: TDBEdit;
    edtDS_SENHA: TDBEdit;
    edtDS_NOMEEMAIL: TDBEdit;
    edtNR_PORTA: TDBEdit;
    chkST_TLS: TDBCheckBox;
    chkST_SSL: TDBCheckBox;
    actlst1: TActionList;
    ACT_F8: TAction;
    Label3: TLabel;
    edtDS_HOSTEMAIL: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCad_ConfigSistema: TFCad_ConfigSistema;

implementation

{$R *.dfm}

procedure TFCad_ConfigSistema.btnCancelarClick(Sender: TObject);
begin
  DMConfigSistema.CancelaAlteracao;
  ModalResult := mrCancel;
end;

procedure TFCad_ConfigSistema.btnGravarClick(Sender: TObject);
begin
  DMConfigSistema.GravarConfiguracao;
  ModalResult := mrOk;
end;

procedure TFCad_ConfigSistema.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult <> mrOk then
    DMConfigSistema.CancelaAlteracao;
end;

procedure TFCad_ConfigSistema.FormShow(Sender: TObject);
begin
  DMConfigSistema.CarregaConfigSistema;
end;

end.
