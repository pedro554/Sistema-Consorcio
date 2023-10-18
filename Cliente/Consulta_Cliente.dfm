object FConsulta_Cliente: TFConsulta_Cliente
  Left = 0
  Top = 0
  Caption = 'Consulta Cliente'
  ClientHeight = 299
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 61
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 16
      Top = 14
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pesquisa'
    end
    object lbl2: TLabel
      Left = 25
      Top = 37
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coluna'
    end
    object edtPesquisa: TEdit
      Left = 64
      Top = 11
      Width = 250
      Height = 21
      TabOrder = 0
    end
    object cbbColuna: TComboBox
      Left = 64
      Top = 34
      Width = 250
      Height = 21
      Style = csDropDownList
      TabOrder = 2
    end
    object btnPesquisa: TButton
      Left = 320
      Top = 11
      Width = 120
      Height = 21
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btnPesquisaClick
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 258
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnSelecionar: TSpeedButton
      Left = 195
      Top = 10
      Width = 120
      Height = 21
      Caption = 'Selecionar - F8'
      OnClick = btnSelecionarClick
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
  object Grid: TJvDBGrid
    Left = 0
    Top = 61
    Width = 635
    Height = 197
    Align = alClient
    DataSource = SCliente
    DrawingStyle = gdsClassic
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = btnSelecionarClick
    AutoAppend = False
    AutoSizeColumns = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_CLIENTE'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_CLIENTE'
        Width = 509
        Visible = True
      end>
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
      'CLIENTE.ST_ATIVO = '#39'SIM'#39)
    Left = 384
    Top = 176
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
    object QClienteDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
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
    Left = 416
    Top = 176
    object TClienteNM_CLIENTE: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
      Required = True
      Size = 50
    end
    object TClienteNR_FONE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_FONE'
      Origin = 'NR_FONE'
      Size = 14
    end
    object TClienteDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object TClienteST_ATIVO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ST_ATIVO'
      Origin = 'ST_ATIVO'
      Size = 3
    end
    object TClienteCD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_CLIENTE'
    end
  end
  object SCliente: TDataSource
    DataSet = TCliente
    Left = 448
    Top = 176
  end
  object actlst: TActionList
    Left = 312
    Top = 152
    object ACT_F8: TAction
      Caption = 'ACT_F8'
      ShortCut = 119
      OnExecute = btnSelecionarClick
    end
    object ACT_F6: TAction
      Caption = 'ACT_F6'
      ShortCut = 117
      OnExecute = btnCancelarClick
    end
  end
end
