object FFaixaComissao: TFFaixaComissao
  Left = 0
  Top = 0
  Caption = 'Faixa de Comiss'#227'o'
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
    Top = 236
    Width = 635
    Height = 63
    Align = alBottom
    TabOrder = 2
    object lbl1: TLabel
      Left = 16
      Top = 9
      Width = 42
      Height = 13
      Caption = 'Pesquisa'
    end
    object lbl2: TLabel
      Left = 25
      Top = 32
      Width = 33
      Height = 13
      Caption = 'Coluna'
    end
    object edtPesquisa: TEdit
      Left = 64
      Top = 6
      Width = 200
      Height = 21
      TabOrder = 0
    end
    object cbbColuna: TComboBox
      Left = 64
      Top = 29
      Width = 200
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
    object btnPesquisa: TButton
      Left = 270
      Top = 29
      Width = 120
      Height = 21
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btnPesquisaClick
    end
  end
  object Grid: TJvDBGrid
    Left = 0
    Top = 41
    Width = 635
    Height = 195
    Align = alClient
    DataSource = SFaixaComissao
    DrawingStyle = gdsClassic
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = GridDblClick
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
        FieldName = 'ST_MARCADO'
        Title.Alignment = taCenter
        Title.Caption = '[X]'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CD_FAIXACOMISSAO'
        Title.Caption = 'C'#243'digo'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FAIXACOMISSAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 529
        Visible = True
      end>
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 635
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
      ExplicitLeft = 126
      ExplicitTop = 8
      ExplicitHeight = 21
    end
    object btnEditar: TSpeedButton
      Left = 121
      Top = 1
      Width = 120
      Height = 39
      Align = alLeft
      Caption = 'Editar'
      OnClick = btnEditarClick
      ExplicitLeft = 225
    end
    object btnExcluir: TSpeedButton
      Left = 241
      Top = 1
      Width = 120
      Height = 39
      Align = alLeft
      Caption = 'Excluir'
      OnClick = btnExcluirClick
      ExplicitLeft = 341
    end
  end
  object QFaixaComissao: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'FAIXACOMISSAO.*'
      ''
      'FROM'
      'FAIXACOMISSAO')
    Left = 216
    Top = 116
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
    object QFaixaComissaoDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
  end
  object TFaixaComissao: TJvMemoryData
    FieldDefs = <>
    AfterInsert = TFaixaComissaoAfterInsert
    Left = 252
    Top = 116
    object TFaixaComissaoCD_FAIXACOMISSAO: TIntegerField
      FieldName = 'CD_FAIXACOMISSAO'
    end
    object TFaixaComissaoDS_FAIXACOMISSAO: TStringField
      FieldName = 'DS_FAIXACOMISSAO'
      Origin = 'DS_FAIXACOMISSAO'
      Required = True
      Size = 50
    end
    object TFaixaComissaoNR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
    end
    object TFaixaComissaoVL_MINIMO: TFloatField
      FieldName = 'VL_MINIMO'
    end
    object TFaixaComissaoVL_MAXIMO: TFloatField
      FieldName = 'VL_MAXIMO'
    end
    object TFaixaComissaoST_MARCADO: TBooleanField
      FieldName = 'ST_MARCADO'
    end
  end
  object SFaixaComissao: TDataSource
    DataSet = TFaixaComissao
    Left = 280
    Top = 116
  end
  object QExcluiFaixaComissaoParcela: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      
        'DELETE FROM FAIXACOMISSAOPARCELA WHERE FAIXACOMISSAOPARCELA.CD_F' +
        'AIXACOMISSAO = :CD_FAIXACOMISSAO')
    Left = 352
    Top = 116
    ParamData = <
      item
        Name = 'CD_FAIXACOMISSAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'DS_FAIXACOMISSAO'
      Origin = 'DS_FAIXACOMISSAO'
      Required = True
      Size = 50
    end
    object IntegerField1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NR_PARCELAS'
      Origin = 'NR_PARCELAS'
    end
    object FMTBCDField1: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_MINIMO'
      Origin = 'VL_MINIMO'
      Precision = 20
      Size = 6
    end
    object FMTBCDField2: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_MAXIMO'
      Origin = 'VL_MAXIMO'
      Precision = 20
      Size = 6
    end
    object DateTimeField1: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
  end
end
