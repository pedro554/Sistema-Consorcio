object FCad_CRM: TFCad_CRM
  Left = 0
  Top = 0
  Caption = 'Cadastro de Movimenta'#231#227'o'
  ClientHeight = 296
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 110
    Top = 27
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 102
    Top = 161
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'Objetivo'
  end
  object lbl3: TLabel
    Left = 112
    Top = 73
    Width = 31
    Height = 13
    Alignment = taRightJustify
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnPsqCliente: TSpeedButton
    Left = 492
    Top = 24
    Width = 23
    Height = 21
    Caption = '...'
    OnClick = btnPsqClienteClick
  end
  object lbl4: TLabel
    Left = 321
    Top = 73
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Cad.'
  end
  object lbl5: TLabel
    Left = 97
    Top = 50
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vendedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnPsqFuncionario: TSpeedButton
    Left = 492
    Top = 47
    Width = 23
    Height = 21
    Caption = '...'
    OnClick = btnPsqFuncionarioClick
  end
  object lbl6: TLabel
    Left = 81
    Top = 96
    Width = 62
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor Cr'#233'dito'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl7: TLabel
    Left = 289
    Top = 96
    Width = 81
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Atualiza'#231#227'o'
  end
  object lbl8: TLabel
    Left = 54
    Top = 119
    Width = 89
    Height = 13
    Alignment = taRightJustify
    Caption = 'Faixa de Comiss'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtCD_CLIENTE: TDBEdit
    Left = 149
    Top = 24
    Width = 81
    Height = 21
    TabStop = False
    DataField = 'CD_CLIENTE'
    DataSource = SCRM
    Enabled = False
    TabOrder = 0
  end
  object edtNM_CLIENTE: TDBEdit
    Left = 236
    Top = 24
    Width = 250
    Height = 21
    TabStop = False
    DataField = 'NM_CLIENTE'
    DataSource = SCRM
    Enabled = False
    TabOrder = 1
  end
  object edtDS_OBS: TDBMemo
    Left = 149
    Top = 158
    Width = 337
    Height = 89
    DataField = 'DS_OBS'
    DataSource = SCRM
    TabOrder = 11
  end
  object pnl1: TPanel
    Left = 0
    Top = 255
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 12
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
  object CD_STATUS: TJvDBComboBox
    Left = 149
    Top = 70
    Width = 166
    Height = 21
    DataField = 'CD_STATUS'
    DataSource = SCRM
    Items.Strings = (
      'ABERTO'
      'APRESENTA'#199#195'O'
      'NEGOCIA'#199#195'O'
      'AGUARDANDO'
      'SEM INTERESSE'
      'FECHADO')
    TabOrder = 4
    Values.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4'
      '5')
    ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
    ListSettings.OutfilteredValueFont.Color = clRed
    ListSettings.OutfilteredValueFont.Height = -11
    ListSettings.OutfilteredValueFont.Name = 'Tahoma'
    ListSettings.OutfilteredValueFont.Style = []
  end
  object edtDT_CADASTRO: TDBEdit
    Left = 376
    Top = 70
    Width = 110
    Height = 21
    TabStop = False
    DataField = 'DT_CADASTRO'
    DataSource = SCRM
    Enabled = False
    TabOrder = 5
  end
  object edtCD_FUNCIONARIO: TDBEdit
    Left = 149
    Top = 47
    Width = 81
    Height = 21
    TabStop = False
    DataField = 'CD_FUNCIONARIO'
    DataSource = SCRM
    Enabled = False
    TabOrder = 2
  end
  object edtNM_FUNCIONARIO: TDBEdit
    Left = 236
    Top = 47
    Width = 250
    Height = 21
    TabStop = False
    DataField = 'NM_FUNCIONARIO'
    DataSource = SCRM
    Enabled = False
    TabOrder = 3
  end
  object edtVL_CREDITO: TDBEdit
    Left = 149
    Top = 93
    Width = 108
    Height = 21
    DataField = 'VL_CREDITO'
    DataSource = SCRM
    TabOrder = 6
  end
  object edtDT_ATUALIZACAO: TDBEdit
    Left = 376
    Top = 93
    Width = 110
    Height = 21
    TabStop = False
    DataField = 'DT_ATUALIZACAO'
    DataSource = SCRM
    Enabled = False
    TabOrder = 7
  end
  object edtCD_FAIXACOMISSAO: TDBEdit
    Left = 149
    Top = 116
    Width = 81
    Height = 21
    TabStop = False
    DataField = 'CD_FAIXACOMISSAO'
    DataSource = SCRM
    Enabled = False
    TabOrder = 8
  end
  object edtDS_FAIXACOMISSAO: TDBEdit
    Left = 236
    Top = 116
    Width = 250
    Height = 21
    TabStop = False
    DataField = 'DS_FAIXACOMISSAO'
    DataSource = SCRM
    Enabled = False
    TabOrder = 9
  end
  object chkTP_PARCELA: TDBCheckBox
    Left = 149
    Top = 139
    Width = 97
    Height = 17
    Caption = 'Meia Parcela'
    DataField = 'TP_PARCELA'
    DataSource = SCRM
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    ValueChecked = 'M'
    ValueUnchecked = 'N'
  end
  object QCRM: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'CRM.*,'
      'CLIENTE.NM_CLIENTE,'
      'FAIXACOMISSAO.DS_FAIXACOMISSAO'
      ''
      'FROM'
      'CRM'
      ''
      'LEFT JOIN CLIENTE ON'
      'CLIENTE.CD_CLIENTE = CRM.CD_CLIENTE'
      ''
      'LEFT JOIN FAIXACOMISSAO ON'
      'FAIXACOMISSAO.CD_FAIXACOMISSAO = CRM.CD_FAIXACOMISSAO'
      ''
      'WHERE'
      'CRM.CD_CRM = :CD_CRM')
    Left = 8
    Top = 8
    ParamData = <
      item
        Name = 'CD_CRM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QCRMCD_CRM: TFDAutoIncField
      FieldName = 'CD_CRM'
      Origin = 'CD_CRM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QCRMCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
      Required = True
    end
    object QCRMCD_STATUS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_STATUS'
      Origin = 'CD_STATUS'
    end
    object QCRMDS_OBS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_OBS'
      Origin = 'DS_OBS'
      Size = 500
    end
    object QCRMDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object QCRMNM_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QCRMCD_FUNCIONARIO: TIntegerField
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
      Required = True
    end
    object QCRMVL_CREDITO: TFMTBCDField
      FieldName = 'VL_CREDITO'
      Origin = 'VL_CREDITO'
      Required = True
      Precision = 20
      Size = 6
    end
    object QCRMDT_ATUALIZACAO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_ATUALIZACAO'
      Origin = 'DT_ATUALIZACAO'
    end
    object QCRMCD_FAIXACOMISSAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
    end
    object QCRMDS_FAIXACOMISSAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_FAIXACOMISSAO'
      Origin = 'DS_FAIXACOMISSAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QCRMTP_PARCELA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TP_PARCELA'
      Origin = 'TP_PARCELA'
      Size = 1
    end
  end
  object SCRM: TDataSource
    DataSet = TCRM
    Left = 8
    Top = 40
  end
  object TCRM: TJvMemoryData
    FieldDefs = <>
    AfterInsert = TCRMAfterInsert
    Left = 40
    Top = 8
    object TCRMCD_CRM: TIntegerField
      FieldName = 'CD_CRM'
    end
    object TCRMCD_CLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
    end
    object TCRMCD_STATUS: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Status'
      FieldName = 'CD_STATUS'
      Origin = 'CD_STATUS'
    end
    object TCRMDS_OBS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_OBS'
      Origin = 'DS_OBS'
      Size = 500
    end
    object TCRMNM_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
      ProviderFlags = []
      Size = 50
    end
    object TCRMCD_FUNCIONARIO: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'CD_FUNCIONARIO'
    end
    object TCRMNM_FUNCIONARIO: TStringField
      FieldName = 'NM_FUNCIONARIO'
      Size = 50
    end
    object TCRMVL_CREDITO: TFloatField
      DisplayLabel = 'Valor Cr'#233'dito'
      FieldName = 'VL_CREDITO'
      OnChange = TCRMVL_CREDITOChange
      DisplayFormat = '#0.00'
    end
    object TCRMDT_ATUALIZACAO: TDateTimeField
      FieldName = 'DT_ATUALIZACAO'
    end
    object TCRMDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
    end
    object TCRMCD_FAIXACOMISSAO: TIntegerField
      FieldName = 'CD_FAIXACOMISSAO'
    end
    object TCRMDS_FAIXACOMISSAO: TStringField
      FieldName = 'DS_FAIXACOMISSAO'
      Size = 50
    end
    object TCRMTP_PARCELA: TStringField
      FieldName = 'TP_PARCELA'
      Size = 1
    end
  end
  object actlst: TActionList
    Left = 40
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
  object QFaixaComissao: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'FAIXACOMISSAO.*'
      ''
      'FROM'
      'FAIXACOMISSAO'
      ''
      'WHERE'
      'FAIXACOMISSAO.VL_MINIMO <= :VL_CREDITO AND'
      'FAIXACOMISSAO.VL_MAXIMO >= :VL_CREDITO')
    Left = 8
    Top = 72
    ParamData = <
      item
        Name = 'VL_CREDITO'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end>
    object QFaixaComissaoCD_FAIXACOMISSAO: TFDAutoIncField
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QFaixaComissaoDS_FAIXACOMISSAO: TStringField
      FieldName = 'DS_FAIXACOMISSAO'
      Origin = 'DS_FAIXACOMISSAO'
      Required = True
      Size = 50
    end
    object QFaixaComissaoVL_MINIMO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_MINIMO'
      Origin = 'VL_MINIMO'
      Precision = 20
      Size = 6
    end
    object QFaixaComissaoVL_MAXIMO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_MAXIMO'
      Origin = 'VL_MAXIMO'
      Precision = 20
      Size = 6
    end
  end
end
