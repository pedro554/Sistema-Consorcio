object FCad_ConfigSistema: TFCad_ConfigSistema
  Left = 0
  Top = 0
  Caption = 'Configura'#231#227'o do sistema'
  ClientHeight = 224
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl: TPanel
    Left = 0
    Top = 183
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 232
    ExplicitTop = 152
    ExplicitWidth = 185
    object btnGravar: TSpeedButton
      Left = 195
      Top = 10
      Width = 120
      Height = 21
      Caption = 'Gravar - F8'
      OnClick = btnGravarClick
    end
    object btnCancelar: TSpeedButton
      Left = 321
      Top = 10
      Width = 120
      Height = 21
      Caption = 'Cancelar - F6'
      OnClick = btnCancelarClick
    end
  end
  object pgc: TPageControl
    Left = 0
    Top = 0
    Width = 635
    Height = 183
    ActivePage = tsEmail
    Align = alClient
    TabOrder = 0
    object tsEmail: TTabSheet
      Caption = 'E-Mail'
      object Label2: TLabel
        Left = 136
        Top = 119
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = 'Porta'
      end
      object lbl2: TLabel
        Left = 135
        Top = 73
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome'
      end
      object Label1: TLabel
        Left = 132
        Top = 50
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Senha'
      end
      object lbl1: TLabel
        Left = 126
        Top = 27
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Usu'#225'rio'
      end
      object Label3: TLabel
        Left = 140
        Top = 96
        Width = 22
        Height = 13
        Alignment = taRightJustify
        Caption = 'Host'
      end
      object edtDS_USERNAME: TDBEdit
        Left = 168
        Top = 24
        Width = 300
        Height = 21
        DataField = 'DS_USERNAME'
        DataSource = SConfigSistema
        TabOrder = 0
      end
      object edtDS_SENHA: TDBEdit
        Left = 168
        Top = 47
        Width = 300
        Height = 21
        DataField = 'DS_SENHA'
        DataSource = SConfigSistema
        PasswordChar = '*'
        TabOrder = 1
      end
      object edtDS_NOMEEMAIL: TDBEdit
        Left = 168
        Top = 70
        Width = 300
        Height = 21
        DataField = 'DS_NOMEEMAIL'
        DataSource = SConfigSistema
        TabOrder = 2
      end
      object edtNR_PORTA: TDBEdit
        Left = 168
        Top = 116
        Width = 78
        Height = 21
        DataField = 'NR_PORTA'
        DataSource = SConfigSistema
        TabOrder = 4
      end
      object chkST_TLS: TDBCheckBox
        Left = 301
        Top = 118
        Width = 47
        Height = 17
        Caption = 'TLS'
        DataField = 'ST_TLS'
        DataSource = SConfigSistema
        TabOrder = 5
        ValueChecked = 'SIM'
        ValueUnchecked = 'N'#195'O'
      end
      object chkST_SSL: TDBCheckBox
        Left = 354
        Top = 118
        Width = 47
        Height = 17
        Caption = 'SSL'
        DataField = 'ST_SSL'
        DataSource = SConfigSistema
        TabOrder = 6
        ValueChecked = 'SIM'
        ValueUnchecked = 'N'#195'O'
      end
      object edtDS_HOSTEMAIL: TDBEdit
        Left = 168
        Top = 93
        Width = 300
        Height = 21
        DataField = 'DS_HOSTEMAIL'
        DataSource = SConfigSistema
        TabOrder = 3
      end
    end
  end
  object SConfigSistema: TDataSource
    DataSet = DMConfigSistema.TConfigSistema
    Left = 480
    Top = 96
  end
  object actlst1: TActionList
    Left = 512
    Top = 40
    object ACT_F8: TAction
      Caption = 'ACT_F8'
      ShortCut = 119
      OnExecute = btnGravarClick
    end
  end
end
