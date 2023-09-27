object FCad_ManutComissao: TFCad_ManutComissao
  Left = 0
  Top = 0
  Caption = 'Manuten'#231#227'o de Comiss'#245'es'
  ClientHeight = 299
  ClientWidth = 803
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
  object lbl5: TLabel
    Left = 166
    Top = 11
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
    Left = 561
    Top = 8
    Width = 23
    Height = 21
    Caption = '...'
    OnClick = btnPsqFuncionarioClick
  end
  object lbl1: TLabel
    Left = 161
    Top = 34
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Inicio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnFiltrar: TSpeedButton
    Left = 464
    Top = 54
    Width = 120
    Height = 21
    Caption = 'Filtrar'
    OnClick = btnFiltrarClick
  end
  object lbl2: TLabel
    Left = 170
    Top = 57
    Width = 42
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Fim'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtCD_FUNCIONARIO: TDBEdit
    Left = 218
    Top = 8
    Width = 81
    Height = 21
    TabStop = False
    DataField = 'CD_FUNCIONARIO'
    DataSource = SFiltro
    Enabled = False
    TabOrder = 0
  end
  object edtNM_FUNCIONARIO: TDBEdit
    Left = 305
    Top = 8
    Width = 250
    Height = 21
    TabStop = False
    DataField = 'NM_FUNCIONARIO'
    DataSource = SFiltro
    Enabled = False
    TabOrder = 1
  end
  object NR_MESINICIO: TJvDBComboBox
    Left = 218
    Top = 31
    Width = 121
    Height = 21
    DataField = 'NR_MESINICIO'
    DataSource = SFiltro
    Items.Strings = (
      'JANEIRO'
      'FEVEREIRO'
      'MAR'#199'O'
      'ABRIL'
      'MAIO'
      'JUNHO'
      'JULHO'
      'AGOSTO'
      'SETEMBRO'
      'OUTUBRO'
      'NOVEMBRO'
      'DEZEMBRO')
    TabOrder = 2
    Values.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12')
    ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
    ListSettings.OutfilteredValueFont.Color = clRed
    ListSettings.OutfilteredValueFont.Height = -11
    ListSettings.OutfilteredValueFont.Name = 'Tahoma'
    ListSettings.OutfilteredValueFont.Style = []
  end
  object edtNR_ANOINICIO: TDBEdit
    Left = 345
    Top = 31
    Width = 82
    Height = 21
    DataField = 'NR_ANOINICIO'
    DataSource = SFiltro
    TabOrder = 3
  end
  object Grid1: TJvDBGrid
    Left = 8
    Top = 81
    Width = 787
    Height = 171
    DataSource = SComissaoParcela
    DrawingStyle = gdsClassic
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    PostOnEnterKey = True
    AutoSizeColumns = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    CanDelete = False
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'NR_PARCELA'
        ReadOnly = True
        Title.Caption = 'N'#186' Parcela'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_CREDITO'
        Title.Caption = 'Valor Cr'#233'dito'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_CLIENTE'
        Title.Caption = 'Cliente'
        Width = 204
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PC_COMISSAO'
        ReadOnly = True
        Title.Caption = '%'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_COMISSAO'
        ReadOnly = True
        Title.Caption = 'Valor'
        Width = 105
        Visible = True
      end
      item
        Color = clCream
        Expanded = False
        FieldName = 'TP_PARCELA'
        PickList.Strings = (
          'M'
          'N')
        Title.Caption = 'Tipo Parcela'
        Width = 75
        Visible = True
      end
      item
        Color = clCream
        Expanded = False
        FieldName = 'NR_MESPAGAMENTO'
        Title.Caption = 'M'#234's Pag.'
        Width = 67
        Visible = True
      end
      item
        Color = clCream
        Expanded = False
        FieldName = 'NR_ANOPAGAMENTO'
        Title.Caption = 'Ano Pag.'
        Width = 103
        Visible = True
      end>
  end
  object pnl1: TPanel
    Left = 0
    Top = 258
    Width = 803
    Height = 41
    Align = alBottom
    TabOrder = 7
    object btnGravar: TSpeedButton
      Left = 278
      Top = 10
      Width = 120
      Height = 21
      Caption = 'Gravar - F8'
      OnClick = btnGravarClick
    end
    object btnCancelar: TSpeedButton
      Left = 404
      Top = 10
      Width = 120
      Height = 21
      Caption = 'Cancelar - F6'
      OnClick = btnCancelarClick
    end
  end
  object JvDBComboBox1: TJvDBComboBox
    Left = 218
    Top = 54
    Width = 121
    Height = 21
    DataField = 'NR_MESFIM'
    DataSource = SFiltro
    Items.Strings = (
      'JANEIRO'
      'FEVEREIRO'
      'MAR'#199'O'
      'ABRIL'
      'MAIO'
      'JUNHO'
      'JULHO'
      'AGOSTO'
      'SETEMBRO'
      'OUTUBRO'
      'NOVEMBRO'
      'DEZEMBRO')
    TabOrder = 4
    Values.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12')
    ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
    ListSettings.OutfilteredValueFont.Color = clRed
    ListSettings.OutfilteredValueFont.Height = -11
    ListSettings.OutfilteredValueFont.Name = 'Tahoma'
    ListSettings.OutfilteredValueFont.Style = []
  end
  object edtNR_MESINICIO: TDBEdit
    Left = 345
    Top = 54
    Width = 82
    Height = 21
    DataField = 'NR_ANOFIM'
    DataSource = SFiltro
    TabOrder = 5
  end
  object TFiltro: TJvMemoryData
    FieldDefs = <>
    AfterInsert = TFiltroAfterInsert
    Left = 512
    Top = 152
    object TFiltroCD_FUNCIONARIO: TIntegerField
      DisplayLabel = 'Funcion'#225'rio'
      FieldName = 'CD_FUNCIONARIO'
    end
    object TFiltroNM_FUNCIONARIO: TStringField
      FieldName = 'NM_FUNCIONARIO'
      Size = 50
    end
    object TFiltroNR_MESINICIO: TIntegerField
      DisplayLabel = 'M'#234's Inicio'
      FieldName = 'NR_MESINICIO'
    end
    object TFiltroNR_ANOINICIO: TIntegerField
      DisplayLabel = 'Ano Inicio'
      FieldName = 'NR_ANOINICIO'
    end
    object TFiltroNR_MESFIM: TIntegerField
      DisplayLabel = 'M'#234's Fim'
      FieldName = 'NR_MESFIM'
    end
    object TFiltroNR_ANOFIM: TIntegerField
      DisplayLabel = 'Ano Fim'
      FieldName = 'NR_ANOFIM'
    end
  end
  object SFiltro: TDataSource
    DataSet = TFiltro
    Left = 544
    Top = 152
  end
  object QComissaoParcela: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT '
      'COMISSAOPARCELA.*,'
      'CRM.VL_CREDITO,'
      'CLIENTE.NM_CLIENTE'
      ''
      'FROM'
      'COMISSAOPARCELA'
      ''
      'LEFT JOIN CRM ON'
      'CRM.CD_CRM = COMISSAOPARCELA.CD_CRM'
      ''
      'LEFT JOIN CLIENTE ON'
      'CLIENTE.CD_CLIENTE = COMISSAOPARCELA.CD_CLIENTE'
      ''
      'WHERE'
      'COMISSAOPARCELA.CD_FUNCIONARIO = :CD_FUNCIONARIO AND'
      'COMISSAOPARCELA.DT_PAGAMENTO BETWEEN :DT_INICIO AND :DT_FIM')
    Left = 512
    Top = 184
    ParamData = <
      item
        Name = 'CD_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT_INICIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT_FIM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QComissaoParcelaCD_COMISSAOPARCELA: TFDAutoIncField
      FieldName = 'CD_COMISSAOPARCELA'
      Origin = 'CD_COMISSAOPARCELA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QComissaoParcelaNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
      Origin = 'NR_PARCELA'
      Required = True
    end
    object QComissaoParcelaPC_COMISSAO: TFMTBCDField
      FieldName = 'PC_COMISSAO'
      Origin = 'PC_COMISSAO'
      Required = True
      Precision = 20
      Size = 6
    end
    object QComissaoParcelaVL_COMISSAO: TFMTBCDField
      FieldName = 'VL_COMISSAO'
      Origin = 'VL_COMISSAO'
      Required = True
      Precision = 20
      Size = 6
    end
    object QComissaoParcelaCD_CRM: TIntegerField
      FieldName = 'CD_CRM'
      Origin = 'CD_CRM'
      Required = True
    end
    object QComissaoParcelaCD_FAIXACOMISSAO: TIntegerField
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
      Required = True
    end
    object QComissaoParcelaCD_FUNCIONARIO: TIntegerField
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
      Required = True
    end
    object QComissaoParcelaCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
      Required = True
    end
    object QComissaoParcelaTP_PARCELA: TStringField
      FieldName = 'TP_PARCELA'
      Origin = 'TP_PARCELA'
      Required = True
      Size = 1
    end
    object QComissaoParcelaDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object QComissaoParcelaNR_MESPAGAMENTO: TIntegerField
      FieldName = 'NR_MESPAGAMENTO'
      Origin = 'NR_MESPAGAMENTO'
      Required = True
    end
    object QComissaoParcelaNR_ANOPAGAMENTO: TIntegerField
      FieldName = 'NR_ANOPAGAMENTO'
      Origin = 'NR_ANOPAGAMENTO'
      Required = True
    end
    object QComissaoParcelaDT_PAGAMENTO: TIntegerField
      FieldName = 'DT_PAGAMENTO'
      Origin = 'DT_PAGAMENTO'
      Required = True
    end
    object QComissaoParcelaVL_CREDITO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_CREDITO'
      Origin = 'VL_CREDITO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 20
      Size = 6
    end
    object QComissaoParcelaNM_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object SComissaoParcela: TDataSource
    DataSet = TComissaoParcela
    Left = 544
    Top = 184
  end
  object TComissaoParcela: TJvMemoryData
    FieldDefs = <
      item
        Name = 'CD_COMISSAOPARCELA'
        DataType = ftInteger
      end
      item
        Name = 'NR_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'PC_COMISSAO'
        DataType = ftFMTBcd
        Precision = 20
        Size = 6
      end
      item
        Name = 'VL_COMISSAO'
        DataType = ftFMTBcd
        Precision = 20
        Size = 6
      end
      item
        Name = 'CD_CRM'
        DataType = ftInteger
      end
      item
        Name = 'CD_FAIXACOMISSAO'
        DataType = ftInteger
      end
      item
        Name = 'CD_FUNCIONARIO'
        DataType = ftInteger
      end
      item
        Name = 'CD_CLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'TP_PARCELA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DT_CADASTRO'
        DataType = ftDateTime
      end
      item
        Name = 'NR_MESPAGAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'NR_ANOPAGAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'DT_PAGAMENTO'
        DataType = ftInteger
      end>
    BeforePost = TComissaoParcelaBeforePost
    Left = 512
    Top = 216
    object TComissaoParcelaCD_COMISSAOPARCELA: TIntegerField
      FieldName = 'CD_COMISSAOPARCELA'
    end
    object TComissaoParcelaNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
      Origin = 'NR_PARCELA'
    end
    object TComissaoParcelaPC_COMISSAO: TFMTBCDField
      FieldName = 'PC_COMISSAO'
      Origin = 'PC_COMISSAO'
      DisplayFormat = '#0.00'
      Precision = 20
      Size = 6
    end
    object TComissaoParcelaVL_COMISSAO: TFMTBCDField
      FieldName = 'VL_COMISSAO'
      Origin = 'VL_COMISSAO'
      DisplayFormat = '#,0.00'
      Precision = 20
      Size = 6
    end
    object TComissaoParcelaCD_CRM: TIntegerField
      FieldName = 'CD_CRM'
      Origin = 'CD_CRM'
      DisplayFormat = '#,0.00'
    end
    object TComissaoParcelaCD_FAIXACOMISSAO: TIntegerField
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
    end
    object TComissaoParcelaCD_FUNCIONARIO: TIntegerField
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
    end
    object TComissaoParcelaCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
    end
    object TComissaoParcelaTP_PARCELA: TStringField
      FieldName = 'TP_PARCELA'
      Origin = 'TP_PARCELA'
      Size = 1
    end
    object TComissaoParcelaDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object TComissaoParcelaNR_MESPAGAMENTO: TIntegerField
      DisplayWidth = 2
      FieldName = 'NR_MESPAGAMENTO'
      Origin = 'NR_MESPAGAMENTO'
    end
    object TComissaoParcelaNR_ANOPAGAMENTO: TIntegerField
      DisplayWidth = 4
      FieldName = 'NR_ANOPAGAMENTO'
      Origin = 'NR_ANOPAGAMENTO'
    end
    object TComissaoParcelaDT_PAGAMENTO: TIntegerField
      FieldName = 'DT_PAGAMENTO'
      Origin = 'DT_PAGAMENTO'
    end
    object TComissaoParcelaVL_CREDITO: TFloatField
      FieldName = 'VL_CREDITO'
      DisplayFormat = '#,0.00'
    end
    object TComissaoParcelaNM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      Size = 50
    end
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
      'FAIXACOMISSAOPARCELA.CD_FAIXACOMISSAO = :CD_FAIXACOMISSAO AND'
      'FAIXACOMISSAOPARCELA.NR_PARCELA = :NR_PARCELA AND'
      'FAIXACOMISSAOPARCELA.TP_PARCELA = :TP_PARCELA')
    Left = 400
    Top = 184
    ParamData = <
      item
        Name = 'CD_FAIXACOMISSAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NR_PARCELA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TP_PARCELA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object QFaixaComissaoParcelaCD_FAIXACOMISSAOPARCELA: TFDAutoIncField
      FieldName = 'CD_FAIXACOMISSAOPARCELA'
      Origin = 'CD_FAIXACOMISSAOPARCELA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QFaixaComissaoParcelaCD_FAIXACOMISSAO: TIntegerField
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
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
  end
  object actlst: TActionList
    Left = 312
    Top = 168
    object ACT_F6: TAction
      Caption = 'ACT_F6'
      ShortCut = 117
      OnExecute = btnCancelarClick
    end
  end
end
