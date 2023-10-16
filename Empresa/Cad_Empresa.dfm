object FCad_Empresa: TFCad_Empresa
  Left = 0
  Top = 0
  Caption = 'Cadastro de Empresa'
  ClientHeight = 127
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
  object lbl1: TLabel
    Left = 65
    Top = 27
    Width = 97
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nome / Raz'#227'o Social'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 108
    Top = 50
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = 'CPF / CNPJ'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtNM_CLIENTE: TDBEdit
    Left = 168
    Top = 24
    Width = 300
    Height = 21
    DataField = 'NM_CLIENTE'
    DataSource = SEmpresa
    TabOrder = 0
  end
  object edtNR_CPFCNPJ: TDBEdit
    Left = 168
    Top = 47
    Width = 150
    Height = 21
    DataField = 'NR_CPFCNPJ'
    DataSource = SEmpresa
    TabOrder = 1
  end
  object pnl1: TPanel
    Left = 0
    Top = 86
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnGravar: TSpeedButton
      Left = 195
      Top = 8
      Width = 120
      Height = 21
      Caption = 'Gravar - F8'
      OnClick = btnGravarClick
    end
    object btnCancelar: TSpeedButton
      Left = 321
      Top = 8
      Width = 120
      Height = 21
      Caption = 'Cancelar - F6'
      OnClick = btnCancelarClick
    end
  end
  object QEmpresa: TFDQuery
    Connection = DMBanco.conServidor
    SQL.Strings = (
      'SELECT '
      'CLIENTE.*'
      ''
      'FROM'
      'CLIENTE'
      ''
      'LIMIT '
      '1')
    Left = 8
    Top = 8
    object QEmpresaNR_CPFCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CPFCNPJ'
      Origin = 'NR_CPFCNPJ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 14
    end
    object QEmpresaDT_VALIDADE: TDateTimeField
      FieldName = 'DT_VALIDADE'
      Origin = 'DT_VALIDADE'
      Required = True
    end
    object QEmpresaNM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
      Required = True
      Size = 50
    end
    object QEmpresaNR_MACADRESS: TStringField
      FieldName = 'NR_MACADRESS'
      Size = 50
    end
  end
  object SEmpresa: TDataSource
    DataSet = TEmpresa
    Left = 40
    Top = 8
  end
  object TEmpresa: TJvMemoryData
    FieldDefs = <>
    AfterInsert = TEmpresaAfterInsert
    Left = 528
    Top = 16
    object TEmpresaNR_CPFCNPJ: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'NR_CPFCNPJ'
      Origin = 'NR_CPFCNPJ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 14
    end
    object TEmpresaDT_VALIDADE: TDateTimeField
      FieldName = 'DT_VALIDADE'
      Origin = 'DT_VALIDADE'
    end
    object TEmpresaNM_CLIENTE: TStringField
      DisplayLabel = 'Nome / Raz'#227'o Social'
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
      Size = 50
    end
    object TEmpresaNR_MACADRESS: TStringField
      FieldName = 'NR_MACADRESS'
      Size = 50
    end
  end
  object QEmpresaLocal: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT '
      'EMPRESA.*'
      ''
      'FROM'
      'EMPRESA'
      ''
      'LIMIT '
      '1')
    Left = 8
    Top = 40
    object QEmpresaLocalNR_CPFCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CPFCNPJ'
      Origin = 'NR_CPFCNPJ'
      Size = 14
    end
  end
end
