object FCRM: TFCRM
  Left = 0
  Top = 0
  Margins.Top = 5
  Caption = 'CRM'
  ClientHeight = 580
  ClientWidth = 1078
  Color = clBtnFace
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = pm
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 41
    Width = 1078
    Height = 539
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    TabOrder = 1
    object pnl4: TPanel
      Tag = 2
      Left = 388
      Top = 0
      Width = 388
      Height = 518
      Align = alLeft
      Caption = 'pnl1'
      Color = clCream
      ParentBackground = False
      TabOrder = 1
      object lbl4: TLabel
        Left = 1
        Top = 1
        Width = 386
        Height = 29
        Align = alTop
        Alignment = taCenter
        Caption = 'Apresenta'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 144
      end
      object GridApresentacao: TStringGrid
        Tag = 2
        AlignWithMargins = True
        Left = 6
        Top = 35
        Width = 376
        Height = 477
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        ColCount = 2
        DefaultRowHeight = 22
        DoubleBuffered = True
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ParentColor = True
        ParentDoubleBuffered = False
        PopupMenu = pm
        TabOrder = 0
        OnDragDrop = GridAbertoDragDrop
        OnDragOver = GridAbertoDragOver
        OnMouseDown = GridAbertoMouseDown
        ColWidths = (
          240
          130)
        ColAligments = (
          0
          1)
      end
    end
    object pnl2: TPanel
      Tag = 3
      Left = 776
      Top = 0
      Width = 388
      Height = 518
      Align = alLeft
      Caption = 'pnl1'
      Color = clGradientInactiveCaption
      ParentBackground = False
      TabOrder = 2
      object lbl2: TLabel
        Left = 1
        Top = 1
        Width = 386
        Height = 29
        Align = alTop
        Alignment = taCenter
        Caption = 'Em Negocia'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 162
      end
      object GridNegociacao: TStringGrid
        Tag = 2
        AlignWithMargins = True
        Left = 6
        Top = 35
        Width = 376
        Height = 477
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        ColCount = 2
        DefaultRowHeight = 22
        DoubleBuffered = True
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ParentColor = True
        ParentDoubleBuffered = False
        PopupMenu = pm
        TabOrder = 0
        OnDragDrop = GridAbertoDragDrop
        OnDragOver = GridAbertoDragOver
        OnMouseDown = GridAbertoMouseDown
        ColWidths = (
          240
          130)
        ColAligments = (
          0
          1)
      end
    end
    object pnl3: TPanel
      Tag = 4
      Left = 1164
      Top = 0
      Width = 388
      Height = 518
      Align = alLeft
      Caption = 'pnl1'
      Color = clInfoBk
      ParentBackground = False
      TabOrder = 3
      object lbl3: TLabel
        Left = 1
        Top = 1
        Width = 386
        Height = 29
        Align = alTop
        Alignment = taCenter
        Caption = 'Aguardando'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 127
      end
      object GridAguardando: TStringGrid
        Tag = 2
        AlignWithMargins = True
        Left = 6
        Top = 35
        Width = 376
        Height = 477
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        ColCount = 2
        DefaultRowHeight = 22
        DoubleBuffered = True
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ParentColor = True
        ParentDoubleBuffered = False
        PopupMenu = pm
        TabOrder = 0
        OnDragDrop = GridAbertoDragDrop
        OnDragOver = GridAbertoDragOver
        OnMouseDown = GridAbertoMouseDown
        ColWidths = (
          240
          130)
        ColAligments = (
          0
          1)
      end
    end
    object pnl6: TPanel
      Tag = 6
      Left = 1940
      Top = 0
      Width = 388
      Height = 518
      Align = alLeft
      Caption = 'pnl1'
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 5
      object lbl6: TLabel
        Left = 1
        Top = 1
        Width = 386
        Height = 29
        Align = alTop
        Alignment = taCenter
        Caption = 'Fechado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 89
      end
      object GridFechado: TStringGrid
        Tag = 2
        AlignWithMargins = True
        Left = 6
        Top = 35
        Width = 376
        Height = 477
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        ColCount = 2
        DefaultRowHeight = 22
        DoubleBuffered = True
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ParentColor = True
        ParentDoubleBuffered = False
        PopupMenu = pm
        TabOrder = 0
        OnDragDrop = GridAbertoDragDrop
        OnDragOver = GridAbertoDragOver
        OnMouseDown = GridAbertoMouseDown
        ColWidths = (
          240
          130)
        ColAligments = (
          0
          1)
      end
    end
    object pnl5: TPanel
      Tag = 5
      Left = 1552
      Top = 0
      Width = 388
      Height = 518
      Align = alLeft
      Caption = 'pnl1'
      Color = clSkyBlue
      ParentBackground = False
      TabOrder = 4
      object lbl5: TLabel
        Left = 1
        Top = 1
        Width = 386
        Height = 29
        Align = alTop
        Alignment = taCenter
        Caption = 'Sem Interesse'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 154
      end
      object GridSemInteresse: TStringGrid
        Tag = 2
        AlignWithMargins = True
        Left = 6
        Top = 35
        Width = 376
        Height = 477
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        ColCount = 2
        DefaultRowHeight = 22
        DoubleBuffered = True
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ParentColor = True
        ParentDoubleBuffered = False
        PopupMenu = pm
        TabOrder = 0
        OnDragDrop = GridAbertoDragDrop
        OnDragOver = GridAbertoDragOver
        OnMouseDown = GridAbertoMouseDown
        ColWidths = (
          240
          130)
        ColAligments = (
          0
          1)
      end
    end
    object pnl1: TPanel
      Tag = 1
      Left = 0
      Top = 0
      Width = 388
      Height = 518
      Align = alLeft
      Caption = 'pnl1'
      Color = clHighlightText
      ParentBackground = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 1
        Top = 1
        Width = 386
        Height = 29
        Align = alTop
        Alignment = taCenter
        Caption = 'Aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 70
      end
      object GridAberto: TStringGrid
        Tag = 2
        AlignWithMargins = True
        Left = 6
        Top = 35
        Width = 376
        Height = 477
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        ColCount = 2
        DefaultRowHeight = 22
        DoubleBuffered = True
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ParentColor = True
        ParentDoubleBuffered = False
        PopupMenu = pm
        TabOrder = 0
        OnDragDrop = GridAbertoDragDrop
        OnDragOver = GridAbertoDragOver
        OnMouseDown = GridAbertoMouseDown
        ColWidths = (
          240
          130)
        ColAligments = (
          0
          1)
      end
    end
  end
  object pnl7: TPanel
    Left = 0
    Top = 0
    Width = 1078
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnNovo: TSpeedButton
      Left = 1
      Top = 1
      Width = 120
      Height = 39
      Align = alLeft
      Caption = 'Novo'
      OnClick = btnNovoClick
    end
    object btnFinalizarMovimento: TSpeedButton
      Left = 361
      Top = 1
      Width = 120
      Height = 39
      Align = alLeft
      Caption = 'Finalizar Movimento'
      Enabled = False
      OnClick = btnFinalizarMovimentoClick
      ExplicitLeft = 313
      ExplicitTop = 7
    end
    object btnExcluir: TSpeedButton
      Left = 241
      Top = 1
      Width = 120
      Height = 39
      Align = alLeft
      Caption = 'Excluir'
      OnClick = btnExcluirClick
      ExplicitLeft = 143
      ExplicitTop = 2
    end
    object btnAlterar: TSpeedButton
      Left = 121
      Top = 1
      Width = 120
      Height = 39
      Align = alLeft
      Caption = 'Alterar'
      OnClick = btnAlterarClick
      ExplicitLeft = 209
      ExplicitTop = -1
    end
  end
  object QAberto: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'CRM.*,'
      'CLIENTE.NM_CLIENTE,'
      'CLIENTE.NR_FONE'
      ''
      'FROM'
      'CRM'
      ''
      'LEFT JOIN CLIENTE ON'
      'CRM.CD_CLIENTE = CLIENTE.CD_CLIENTE'
      ''
      'WHERE'
      'CRM.CD_STATUS = 1')
    Left = 68
    Top = 280
    object QAbertoCD_CRM: TFDAutoIncField
      FieldName = 'CD_CRM'
      Origin = 'CD_CRM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QAbertoCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
      Required = True
    end
    object QAbertoDS_OBS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_OBS'
      Origin = 'DS_OBS'
      Size = 500
    end
    object QAbertoDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object QAbertoNM_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QAbertoNR_FONE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_FONE'
      Origin = 'NR_FONE'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object QAbertoCD_STATUS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_STATUS'
      Origin = 'CD_STATUS'
    end
    object QAbertoCD_FUNCIONARIO: TIntegerField
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
      Required = True
    end
    object QAbertoVL_CREDITO: TFMTBCDField
      FieldName = 'VL_CREDITO'
      Origin = 'VL_CREDITO'
      Required = True
      currency = True
      Precision = 20
      Size = 6
    end
    object QAbertoDT_ATUALIZACAO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_ATUALIZACAO'
      Origin = 'DT_ATUALIZACAO'
    end
    object QAbertoCD_FAIXACOMISSAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
    end
  end
  object QNegociacao: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'CRM.*,'
      'CLIENTE.NM_CLIENTE,'
      'CLIENTE.NR_FONE'
      ''
      'FROM'
      'CRM'
      ''
      'LEFT JOIN CLIENTE ON'
      'CRM.CD_CLIENTE = CLIENTE.CD_CLIENTE'
      ''
      'WHERE'
      'CRM.CD_STATUS = 3')
    Left = 166
    Top = 312
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'CD_CRM'
      Origin = 'CD_CRM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
      Required = True
    end
    object StringField2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_OBS'
      Origin = 'DS_OBS'
      Size = 500
    end
    object DateTimeField1: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object StringField3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object StringField4: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_FONE'
      Origin = 'NR_FONE'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object QNegociacaoCD_STATUS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_STATUS'
      Origin = 'CD_STATUS'
    end
    object QNegociacaoCD_FUNCIONARIO: TIntegerField
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
      Required = True
    end
    object QNegociacaoVL_CREDITO: TFMTBCDField
      FieldName = 'VL_CREDITO'
      Origin = 'VL_CREDITO'
      Required = True
      currency = True
      Precision = 20
      Size = 6
    end
    object QNegociacaoDT_ATUALIZACAO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_ATUALIZACAO'
      Origin = 'DT_ATUALIZACAO'
    end
    object QNegociacaoCD_FAIXACOMISSAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
    end
  end
  object QAguardando: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'CRM.*,'
      'CLIENTE.NM_CLIENTE,'
      'CLIENTE.NR_FONE'
      ''
      'FROM'
      'CRM'
      ''
      'LEFT JOIN CLIENTE ON'
      'CRM.CD_CLIENTE = CLIENTE.CD_CLIENTE'
      ''
      'WHERE'
      'CRM.CD_STATUS = 4')
    Left = 46
    Top = 406
    object FDAutoIncField2: TFDAutoIncField
      FieldName = 'CD_CRM'
      Origin = 'CD_CRM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
      Required = True
    end
    object StringField6: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_OBS'
      Origin = 'DS_OBS'
      Size = 500
    end
    object DateTimeField2: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object StringField7: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object StringField8: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_FONE'
      Origin = 'NR_FONE'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object QAguardandoCD_STATUS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_STATUS'
      Origin = 'CD_STATUS'
    end
    object QAguardandoCD_FUNCIONARIO: TIntegerField
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
      Required = True
    end
    object QAguardandoVL_CREDITO: TFMTBCDField
      FieldName = 'VL_CREDITO'
      Origin = 'VL_CREDITO'
      Required = True
      currency = True
      Precision = 20
      Size = 6
    end
    object QAguardandoDT_ATUALIZACAO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_ATUALIZACAO'
      Origin = 'DT_ATUALIZACAO'
    end
    object QAguardandoCD_FAIXACOMISSAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
    end
  end
  object QAtualizaStatus: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'UPDATE '
      'CRM '
      ''
      'SET '
      'CRM.CD_STATUS = :CD_STATUS '
      ''
      'WHERE '
      'CRM.CD_CRM = :CD_CRM')
    Left = 372
    Top = 360
    ParamData = <
      item
        Name = 'CD_STATUS'
        ParamType = ptInput
      end
      item
        Name = 'CD_CRM'
        ParamType = ptInput
      end>
  end
  object QApresentacao: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'CRM.*,'
      'CLIENTE.NM_CLIENTE,'
      'CLIENTE.NR_FONE'
      ''
      'FROM'
      'CRM'
      ''
      'LEFT JOIN CLIENTE ON'
      'CRM.CD_CLIENTE = CLIENTE.CD_CLIENTE'
      ''
      'WHERE'
      'CRM.CD_STATUS = 2')
    Left = 102
    Top = 278
    object FDAutoIncField3: TFDAutoIncField
      FieldName = 'CD_CRM'
      Origin = 'CD_CRM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
      Required = True
    end
    object StringField10: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_OBS'
      Origin = 'DS_OBS'
      Size = 500
    end
    object DateTimeField3: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object StringField11: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object StringField12: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_FONE'
      Origin = 'NR_FONE'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object QApresentacaoCD_STATUS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_STATUS'
      Origin = 'CD_STATUS'
    end
    object QApresentacaoCD_FUNCIONARIO: TIntegerField
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
      Required = True
    end
    object QApresentacaoVL_CREDITO: TFMTBCDField
      FieldName = 'VL_CREDITO'
      Origin = 'VL_CREDITO'
      Required = True
      currency = True
      Precision = 20
      Size = 6
    end
    object QApresentacaoDT_ATUALIZACAO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_ATUALIZACAO'
      Origin = 'DT_ATUALIZACAO'
    end
    object QApresentacaoCD_FAIXACOMISSAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
    end
  end
  object QSemInteresse: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'CRM.*,'
      'CLIENTE.NM_CLIENTE,'
      'CLIENTE.NR_FONE'
      ''
      'FROM'
      'CRM'
      ''
      'LEFT JOIN CLIENTE ON'
      'CRM.CD_CLIENTE = CLIENTE.CD_CLIENTE'
      ''
      'WHERE'
      'CRM.CD_STATUS = 5')
    Left = 98
    Top = 406
    object FDAutoIncField4: TFDAutoIncField
      FieldName = 'CD_CRM'
      Origin = 'CD_CRM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
      Required = True
    end
    object StringField14: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_OBS'
      Origin = 'DS_OBS'
      Size = 500
    end
    object DateTimeField4: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object StringField15: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object StringField16: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_FONE'
      Origin = 'NR_FONE'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object QSemInteresseCD_STATUS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_STATUS'
      Origin = 'CD_STATUS'
    end
    object QSemInteresseCD_FUNCIONARIO: TIntegerField
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
      Required = True
    end
    object QSemInteresseVL_CREDITO: TFMTBCDField
      FieldName = 'VL_CREDITO'
      Origin = 'VL_CREDITO'
      Required = True
      currency = True
      Precision = 20
      Size = 6
    end
    object QSemInteresseDT_ATUALIZACAO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_ATUALIZACAO'
      Origin = 'DT_ATUALIZACAO'
    end
    object QSemInteresseCD_FAIXACOMISSAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
    end
  end
  object QFechado: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'CRM.*,'
      'CLIENTE.NM_CLIENTE,'
      'CLIENTE.NR_FONE'
      ''
      'FROM'
      'CRM'
      ''
      'LEFT JOIN CLIENTE ON'
      'CRM.CD_CLIENTE = CLIENTE.CD_CLIENTE'
      ''
      'WHERE'
      'CRM.CD_STATUS = 6')
    Left = 148
    Top = 400
    object FDAutoIncField5: TFDAutoIncField
      FieldName = 'CD_CRM'
      Origin = 'CD_CRM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
      Required = True
    end
    object StringField18: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_OBS'
      Origin = 'DS_OBS'
      Size = 500
    end
    object DateTimeField5: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object StringField19: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object StringField20: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_FONE'
      Origin = 'NR_FONE'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object QFechadoCD_STATUS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_STATUS'
      Origin = 'CD_STATUS'
    end
    object QFechadoCD_FUNCIONARIO: TIntegerField
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
      Required = True
    end
    object QFechadoVL_CREDITO: TFMTBCDField
      FieldName = 'VL_CREDITO'
      Origin = 'VL_CREDITO'
      Required = True
      currency = True
      Precision = 20
      Size = 6
    end
    object QFechadoDT_ATUALIZACAO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_ATUALIZACAO'
      Origin = 'DT_ATUALIZACAO'
    end
    object QFechadoCD_FAIXACOMISSAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
    end
  end
  object BindSourceAberto: TBindSourceDB
    DataSet = QAberto
    ScopeMappings = <>
    Left = 68
    Top = 310
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 218
    Top = 247
    object LinkGridToDataSourceBindSourceFechado: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceFechado
      GridControl = GridFechado
      Columns = <
        item
          MemberName = 'NM_CLIENTE'
          Header = 'Cliente'
          Width = 240
        end
        item
          MemberName = 'VL_CREDITO'
          Header = 'Valor Cr'#233'dito'
        end>
    end
    object LinkGridToDataSourceBindSourceAguardando: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceAguardando
      GridControl = GridAguardando
      Columns = <
        item
          MemberName = 'NM_CLIENTE'
          Header = 'Cliente'
          Width = 240
        end
        item
          MemberName = 'VL_CREDITO'
          Header = 'Valor Cr'#233'dito'
        end>
    end
    object LinkGridToDataSourceBindSourceNegociacao: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceNegociacao
      GridControl = GridNegociacao
      Columns = <
        item
          MemberName = 'NM_CLIENTE'
          Header = 'Cliente'
          Width = 240
        end
        item
          MemberName = 'VL_CREDITO'
          Header = 'Valor Cr'#233'dito'
        end>
    end
    object LinkGridToDataSourceBindSourceAberto: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceAberto
      GridControl = GridAberto
      Columns = <
        item
          MemberName = 'NM_CLIENTE'
          Header = 'Cliente'
          Width = 240
        end
        item
          MemberName = 'VL_CREDITO'
          Header = 'Valor Cr'#233'dito'
          ShowThousandSeparator = False
        end>
    end
    object LinkGridToDataSourceBindSourceApresentacao: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceApresentacao
      GridControl = GridApresentacao
      Columns = <
        item
          MemberName = 'NM_CLIENTE'
          Header = 'Cliente'
          Width = 240
        end
        item
          MemberName = 'VL_CREDITO'
          Header = 'Valor Cr'#233'dito'
        end>
    end
    object LinkGridToDataSourceBindSourceSemInteresse: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceSemInteresse
      GridControl = GridSemInteresse
      Columns = <
        item
          MemberName = 'NM_CLIENTE'
          Header = 'Cliente'
          Width = 240
        end
        item
          MemberName = 'VL_CREDITO'
          Header = 'Valor Cr'#233'dito'
          Width = -1
        end>
    end
  end
  object BindSourceApresentacao: TBindSourceDB
    DataSet = QApresentacao
    ScopeMappings = <>
    Left = 100
    Top = 308
  end
  object BindSourceNegociacao: TBindSourceDB
    DataSet = QNegociacao
    ScopeMappings = <>
    Left = 166
    Top = 342
  end
  object BindSourceAguardando: TBindSourceDB
    DataSet = QAguardando
    ScopeMappings = <>
    Left = 46
    Top = 438
  end
  object BindSourceSemInteresse: TBindSourceDB
    DataSet = QSemInteresse
    ScopeMappings = <>
    Left = 98
    Top = 436
  end
  object BindSourceFechado: TBindSourceDB
    DataSet = QFechado
    ScopeMappings = <>
    Left = 148
    Top = 432
  end
  object pm: TPopupMenu
    Left = 472
    Top = 292
    object Excluir1: TMenuItem
      Caption = 'Excluir'
    end
  end
  object QExcluiCRM: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'DELETE FROM '
      'CRM'
      ''
      'WHERE'
      'CRM.CD_CRM = :CD_CRM')
    Left = 372
    Top = 392
    ParamData = <
      item
        Name = 'CD_CRM'
        ParamType = ptInput
      end>
  end
end
