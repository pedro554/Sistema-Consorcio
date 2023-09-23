object FCRM: TFCRM
  Left = 0
  Top = 0
  Margins.Top = 5
  Caption = 'CRM'
  ClientHeight = 638
  ClientWidth = 1029
  Color = clBtnFace
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl7: TPanel
    Left = 0
    Top = 0
    Width = 1029
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
  object KanbanBoard: TAdvKanbanBoard
    Left = 0
    Top = 41
    Width = 1029
    Height = 597
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
    OnDblClick = btnAlterarClick
    Columns = <
      item
        Name = 'KAberto'
        HeaderText = 'ABERTO'
        FooterText = 'Footer 0'
        Width = 250.000000000000000000
        Stroke.Color = 11119017
        HeaderFill.Kind = gfkNone
        HeaderStroke.Color = clWindowText
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = [fsBold]
        FooterFill.Kind = gfkNone
        FooterStroke.Color = 11119017
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Items = <>
        Expandable = True
        Filter = <>
      end
      item
        Name = 'Header1'
        HeaderText = 'APRESENTA'#199#195'O'
        FooterText = 'Footer 1'
        Width = 250.000000000000000000
        Stroke.Color = 11119017
        HeaderFill.Kind = gfkNone
        HeaderStroke.Color = 11119017
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = [fsBold]
        FooterFill.Kind = gfkNone
        FooterStroke.Color = 11119017
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Items = <>
        Expandable = True
        Filter = <>
      end
      item
        Name = 'Header2'
        HeaderText = 'EM NEGOCIA'#199#195'O'
        FooterText = 'Footer 2'
        Width = 250.000000000000000000
        Stroke.Color = 11119017
        HeaderFill.Kind = gfkNone
        HeaderStroke.Color = 11119017
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = [fsBold]
        FooterFill.Kind = gfkNone
        FooterStroke.Color = 11119017
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Items = <>
        Expandable = True
        Filter = <>
      end
      item
        Name = 'Header3'
        HeaderText = 'AGUARDANDO'
        FooterText = 'Footer 3'
        Width = 250.000000000000000000
        Stroke.Color = 11119017
        HeaderFill.Kind = gfkNone
        HeaderStroke.Color = 11119017
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = [fsBold]
        FooterFill.Kind = gfkNone
        FooterStroke.Color = 11119017
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Items = <>
        Expandable = True
        Filter = <>
      end
      item
        Name = 'Header4'
        HeaderText = 'SEM INTERESSE'
        FooterText = 'Footer 4'
        Width = 250.000000000000000000
        Stroke.Color = 11119017
        HeaderFill.Kind = gfkNone
        HeaderStroke.Color = 11119017
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = [fsBold]
        FooterFill.Kind = gfkNone
        FooterStroke.Color = 11119017
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Items = <>
        Expandable = True
        Filter = <>
      end
      item
        Name = 'Header5'
        HeaderText = 'FECHADO'
        FooterText = 'Footer 5'
        Width = 250.000000000000000000
        Stroke.Color = 11119017
        HeaderFill.Kind = gfkNone
        HeaderStroke.Color = 11119017
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = [fsBold]
        FooterFill.Kind = gfkNone
        FooterStroke.Color = 11119017
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Items = <>
        Expandable = True
        Filter = <>
      end>
    ColumnsAppearance.Margins.Left = 10.000000000000000000
    ColumnsAppearance.Margins.Top = 10.000000000000000000
    ColumnsAppearance.Margins.Right = 10.000000000000000000
    ColumnsAppearance.Margins.Bottom = 10.000000000000000000
    ColumnsAppearance.HeaderFont.Charset = DEFAULT_CHARSET
    ColumnsAppearance.HeaderFont.Color = clBlack
    ColumnsAppearance.HeaderFont.Height = -20
    ColumnsAppearance.HeaderFont.Name = 'Tahoma'
    ColumnsAppearance.HeaderFont.Style = []
    ColumnsAppearance.FooterFont.Charset = DEFAULT_CHARSET
    ColumnsAppearance.FooterFont.Color = clBlack
    ColumnsAppearance.FooterFont.Height = -11
    ColumnsAppearance.FooterFont.Name = 'Tahoma'
    ColumnsAppearance.FooterFont.Style = []
    ColumnsAppearance.HeaderStroke.Color = 11119017
    ColumnsAppearance.FooterStroke.Color = 11119017
    ColumnsAppearance.Stroke.Color = 11119017
    Interaction.AutoOpenURL = False
    Interaction.DragDropMode = kbdmMove
    ItemsAppearance.Font.Charset = DEFAULT_CHARSET
    ItemsAppearance.Font.Color = clBlack
    ItemsAppearance.Font.Height = -12
    ItemsAppearance.Font.Name = 'Tahoma'
    ItemsAppearance.Font.Style = []
    ItemsAppearance.TitleFont.Charset = DEFAULT_CHARSET
    ItemsAppearance.TitleFont.Color = clWindowText
    ItemsAppearance.TitleFont.Height = -16
    ItemsAppearance.TitleFont.Name = 'Tahoma'
    ItemsAppearance.TitleFont.Style = []
    ItemsAppearance.Margins.Left = 10.000000000000000000
    ItemsAppearance.Margins.Top = 10.000000000000000000
    ItemsAppearance.Margins.Right = 10.000000000000000000
    ItemsAppearance.Margins.Bottom = 10.000000000000000000
    ItemsAppearance.Stroke.Color = 15987699
    ItemsAppearance.SelectedFill.Color = 16297243
    ItemsAppearance.SelectedStroke.Color = 16297243
    ItemsAppearance.DisabledFill.Color = 11119017
    ItemsAppearance.DisabledStroke.Kind = gskNone
    ItemsAppearance.DisabledStroke.Color = 11119017
    ItemsAppearance.FixedHeight = 25.000000000000000000
    OnAfterDropItem = KanbanBoardAfterDropItem
    OnSelectItem = KanbanBoardSelectItem
    ExplicitLeft = 200
    ExplicitTop = 46
    object KanbanBoardDatabaseAdapter: TAdvKanbanBoardDatabaseAdapter
      Left = 712
      Top = 200
      Width = 26
      Height = 26
      Visible = True
      Item.DataSource = SCRM
      Item.Title = 'VL_CREDITO'
      Item.Text = 'DS_CRM'
      Item.Column = 'CD_STATUS'
      Item.DBKey = 'CD_CRM'
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
    Left = 812
    Top = 192
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
  object QExcluiCRM: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'DELETE FROM '
      'CRM'
      ''
      'WHERE'
      'CRM.CD_CRM = :CD_CRM')
    Left = 900
    Top = 200
    ParamData = <
      item
        Name = 'CD_CRM'
        ParamType = ptInput
      end>
  end
  object QCRM: TFDQuery
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
      'CLIENTE.CD_CLIENTE = CRM.CD_CLIENTE')
    Left = 864
    Top = 120
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
    object QCRMCD_FUNCIONARIO: TIntegerField
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
      Required = True
    end
    object QCRMVL_CREDITO: TFMTBCDField
      FieldName = 'VL_CREDITO'
      Origin = 'VL_CREDITO'
      Required = True
      DisplayFormat = '#,0.00'
      Precision = 20
      Size = 6
    end
    object QCRMDT_ATUALIZACAO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_ATUALIZACAO'
      Origin = 'DT_ATUALIZACAO'
    end
    object QCRMCD_FAIXACOMISSAO: TIntegerField
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
      Required = True
    end
    object QCRMTP_PARCELA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TP_PARCELA'
      Origin = 'TP_PARCELA'
      Size = 1
    end
    object QCRMNM_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QCRMNR_FONE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_FONE'
      Origin = 'NR_FONE'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object QCRMCD_STATUS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_STATUS'
      Origin = 'CD_STATUS'
    end
  end
  object SCRM: TDataSource
    DataSet = TCRM
    Left = 808
    Top = 256
  end
  object TCRM: TJvMemoryData
    FieldDefs = <>
    Left = 808
    Top = 288
    object TCRMCD_CRM: TIntegerField
      FieldName = 'CD_CRM'
    end
    object TCRMDS_CRM: TStringField
      FieldName = 'DS_CRM'
      Size = 200
    end
    object TCRMCD_STATUS: TIntegerField
      FieldName = 'CD_STATUS'
    end
    object TCRMVL_CREDITO: TStringField
      FieldName = 'VL_CREDITO'
      Size = 50
    end
    object TCRMNM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      Size = 50
    end
    object TCRMVL_CREDITOMSG: TFloatField
      FieldName = 'VL_CREDITOMSG'
    end
    object TCRMNR_FONE: TStringField
      FieldName = 'NR_FONE'
      Size = 30
    end
  end
end
