object FCad_Cliente: TFCad_Cliente
  Left = 0
  Top = 0
  Caption = 'Cadastro Cliente'
  ClientHeight = 183
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 135
    Top = 43
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 138
    Top = 66
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = 'Fone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pnl1: TPanel
    Left = 0
    Top = 142
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 3
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
  object edtNM_CLIENTE: TDBEdit
    Left = 168
    Top = 40
    Width = 300
    Height = 21
    DataField = 'NM_CLIENTE'
    DataSource = SCliente
    TabOrder = 0
  end
  object edtNR_FONE: TDBEdit
    Left = 168
    Top = 63
    Width = 125
    Height = 21
    DataField = 'NR_FONE'
    DataSource = SCliente
    TabOrder = 1
  end
  object chkST_ATIVO: TDBCheckBox
    Left = 168
    Top = 86
    Width = 62
    Height = 17
    Caption = 'Ativo'
    DataField = 'ST_ATIVO'
    DataSource = SCliente
    TabOrder = 2
    ValueChecked = 'SIM'
    ValueUnchecked = 'N'#195'O'
  end
  object QCliente: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'CLIENTE.*'
      ''
      'FROM'
      'CLIENTE'
      ''
      'WHERE'
      'CLIENTE.CD_CLIENTE = :CD_CLIENTE')
    Left = 4
    Top = 4
    ParamData = <
      item
        Name = 'CD_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QClienteCD_CLIENTE: TFDAutoIncField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QClienteNM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
      Required = True
      Size = 50
    end
    object QClienteNR_FONE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_FONE'
      Origin = 'NR_FONE'
      Size = 14
    end
    object QClienteST_ATIVO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ST_ATIVO'
      Origin = 'ST_ATIVO'
      Size = 3
    end
  end
  object TCliente: TJvMemoryData
    FieldDefs = <>
    AfterInsert = TClienteAfterInsert
    Left = 36
    Top = 4
    object TClienteCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
    end
    object TClienteNM_CLIENTE: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_CLIENTE'
      Size = 50
    end
    object TClienteNR_FONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'NR_FONE'
      EditMask = '(##)#####-####'
      Size = 14
    end
    object TClienteST_ATIVO: TStringField
      FieldName = 'ST_ATIVO'
      Size = 3
    end
  end
  object SCliente: TDataSource
    DataSet = TCliente
    Left = 4
    Top = 40
  end
  object actlst: TActionList
    Left = 36
    Top = 40
    object ACT_F8: TAction
      Caption = 'ACT_F8'
      ShortCut = 119
      OnExecute = btnGravarClick
    end
    object ACT_F6: TAction
      Caption = 'ACT_F6'
      ShortCut = 117
      OnExecute = btnCancelarClick
    end
  end
  object Transacao: TFDTransaction
    Connection = DMBanco.con
    Left = 76
    Top = 4
  end
end
