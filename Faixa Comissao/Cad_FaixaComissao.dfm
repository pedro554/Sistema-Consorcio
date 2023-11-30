object FCad_FaixaComissao: TFCad_FaixaComissao
  Left = 0
  Top = 0
  Caption = 'Cadastro de Faixa de Comiss'#227'o'
  ClientHeight = 341
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
  object lbl1: TLabel
    Left = 116
    Top = 23
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 107
    Top = 46
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#186' Parcelas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 103
    Top = 69
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor M'#237'nimo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 99
    Top = 92
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor M'#225'ximo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 201
    Top = 116
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = 'Meia Parcela'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 326
    Top = 116
    Width = 71
    Height = 13
    Alignment = taRightJustify
    Caption = 'Parcela Normal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtDS_FAIXACOMISSAO: TDBEdit
    Left = 168
    Top = 20
    Width = 300
    Height = 21
    DataField = 'DS_FAIXACOMISSAO'
    DataSource = SFaixaComissao
    TabOrder = 0
  end
  object edtNR_PARCELAS: TDBEdit
    Left = 168
    Top = 43
    Width = 89
    Height = 21
    DataField = 'NR_PARCELAS'
    DataSource = SFaixaComissao
    TabOrder = 1
  end
  object edtVL_MINIMO: TDBEdit
    Left = 168
    Top = 66
    Width = 89
    Height = 21
    DataField = 'VL_MINIMO'
    DataSource = SFaixaComissao
    TabOrder = 2
  end
  object edtVL_MAXIMO: TDBEdit
    Left = 168
    Top = 89
    Width = 89
    Height = 21
    DataField = 'VL_MAXIMO'
    DataSource = SFaixaComissao
    TabOrder = 3
  end
  object pnl1: TPanel
    Left = 0
    Top = 300
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 8
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
  object GridParcelaMeia: TJvDBGrid
    Left = 168
    Top = 135
    Width = 129
    Height = 136
    DataSource = SFaixaComissaoParcelaMeia
    DrawingStyle = gdsClassic
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    ScrollBars = ssNone
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
        FieldName = 'NR_PARCELA'
        ReadOnly = True
        Title.Caption = 'N'#186
        Width = 44
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'PC_COMISSAO'
        Title.Caption = '% Comiss'#227'o'
        Width = 79
        Visible = True
      end>
  end
  object GridParcelaNormal: TJvDBGrid
    Left = 303
    Top = 135
    Width = 129
    Height = 136
    DataSource = SFaixaComissaoParcelaNormal
    DrawingStyle = gdsClassic
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    ScrollBars = ssNone
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
        FieldName = 'NR_PARCELA'
        ReadOnly = True
        Title.Caption = 'N'#186
        Width = 43
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'PC_COMISSAO'
        Title.Caption = '% Comiss'#227'o'
        Width = 80
        Visible = True
      end>
  end
  object NavFaixaComissaoParcelaMeia: TDBNavigator
    Left = 168
    Top = 273
    Width = 128
    Height = 21
    DataSource = SFaixaComissaoParcelaMeia
    VisibleButtons = [nbPost, nbCancel]
    TabOrder = 6
  end
  object NavFaixaComissaoParcelaNormal: TDBNavigator
    Left = 303
    Top = 273
    Width = 128
    Height = 21
    DataSource = SFaixaComissaoParcelaNormal
    VisibleButtons = [nbPost, nbCancel]
    TabOrder = 7
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
      'FAIXACOMISSAO.CD_FAIXACOMISSAO = :CD_FAIXACOMISSAO')
    Left = 48
    Top = 32
    ParamData = <
      item
        Name = 'CD_FAIXACOMISSAO'
        DataType = ftInteger
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
    object QFaixaComissaoNR_PARCELAS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NR_PARCELAS'
      Origin = 'NR_PARCELAS'
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
  object TFaixaComissao: TJvMemoryData
    FieldDefs = <>
    AfterInsert = TFaixaComissaoAfterInsert
    Left = 520
    Top = 184
    object TFaixaComissaoCD_FAIXACOMISSAO: TIntegerField
      FieldName = 'CD_FAIXACOMISSAO'
    end
    object TFaixaComissaoDS_FAIXACOMISSAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DS_FAIXACOMISSAO'
      Size = 50
    end
    object TFaixaComissaoNR_PARCELAS: TIntegerField
      DisplayLabel = 'N'#186' Parcelas'
      FieldName = 'NR_PARCELAS'
      OnChange = TFaixaComissaoNR_PARCELASChange
    end
    object TFaixaComissaoVL_MINIMO: TFloatField
      FieldName = 'VL_MINIMO'
      DisplayFormat = '#.###,##'
    end
    object TFaixaComissaoVL_MAXIMO: TFloatField
      DisplayLabel = 'Valor M'#225'ximo'
      FieldName = 'VL_MAXIMO'
      DisplayFormat = '#.###,##'
    end
  end
  object SFaixaComissao: TDataSource
    DataSet = TFaixaComissao
    Left = 320
    Top = 48
  end
  object QFaixaComissaoParcela: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'FAIXACOMISSAOPARCELA.*'
      ''
      'FROM'
      'FAIXACOMISSAOPARCELA'
      ''
      'WHERE'
      'FAIXACOMISSAOPARCELA.CD_FAIXACOMISSAO = :CD_FAIXACOMISSAO')
    Left = 96
    Top = 116
    ParamData = <
      item
        Name = 'CD_FAIXACOMISSAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QFaixaComissaoParcelaCD_FAIXACOMISSAO: TIntegerField
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QFaixaComissaoParcelaNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
      Origin = 'NR_PARCELA'
      Required = True
    end
    object QFaixaComissaoParcelaPC_COMISSAO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PC_COMISSAO'
      Origin = 'PC_COMISSAO'
      Precision = 20
      Size = 6
    end
    object QFaixaComissaoParcelaTP_PARCELA: TStringField
      FieldName = 'TP_PARCELA'
      Origin = 'TP_PARCELA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QFaixaComissaoParcelaCD_FAIXACOMISSAOPARCELA: TFDAutoIncField
      FieldName = 'CD_FAIXACOMISSAOPARCELA'
      Origin = 'CD_FAIXACOMISSAOPARCELA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  object TFaixaComissaoParcelaMeia: TJvMemoryData
    FieldDefs = <>
    Left = 512
    Top = 124
    object TFaixaComissaoParcelaMeiaNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object TFaixaComissaoParcelaMeiaCD_FAIXACOMISSAO: TIntegerField
      FieldName = 'CD_FAIXACOMISSAO'
    end
    object TFaixaComissaoParcelaMeiaTP_PARCELA: TStringField
      FieldName = 'TP_PARCELA'
      Origin = 'TP_PARCELA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TFaixaComissaoParcelaMeiaPC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      DisplayFormat = '#0.00'
    end
    object TFaixaComissaoParcelaMeiaCD_FAIXACOMISSAOPARCELA: TIntegerField
      FieldName = 'CD_FAIXACOMISSAOPARCELA'
    end
  end
  object SFaixaComissaoParcelaMeia: TDataSource
    DataSet = TFaixaComissaoParcelaMeia
    Left = 448
    Top = 52
  end
  object TFaixaComissaoParcelaNormal: TJvMemoryData
    FieldDefs = <>
    Left = 64
    Top = 180
    object TFaixaComissaoParcelaNormalCD_FAIXACOMISSAO: TIntegerField
      FieldName = 'CD_FAIXACOMISSAO'
    end
    object TFaixaComissaoParcelaNormalNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
    end
    object TFaixaComissaoParcelaNormalTP_PARCELA: TStringField
      FieldName = 'TP_PARCELA'
      Origin = 'TP_PARCELA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TFaixaComissaoParcelaNormalCD_FAIXACOMISSAOPARCELA: TIntegerField
      FieldName = 'CD_FAIXACOMISSAOPARCELA'
    end
    object TFaixaComissaoParcelaNormalPC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      DisplayFormat = '#0.00'
    end
  end
  object SFaixaComissaoParcelaNormal: TDataSource
    DataSet = TFaixaComissaoParcelaNormal
    Left = 104
    Top = 244
  end
  object QValorMinMax: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT '
      'COUNT(*)'
      ''
      'FROM'
      'faixacomissao'
      ''
      'WHERE'
      'faixacomissao.VL_MAXIMO >= :VL_MINIMO AND'
      'faixacomissao.VL_MINIMO <= :VL_MAXIMO')
    Left = 8
    Top = 108
    ParamData = <
      item
        Name = 'VL_MINIMO'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VL_MAXIMO'
        ParamType = ptInput
      end>
  end
end
