object FFiltroRelComissao: TFFiltroRelComissao
  Left = 0
  Top = 0
  Caption = 'Filtro para Relat'#243'rios de Comiss'#227'o'
  ClientHeight = 152
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
    Left = 156
    Top = 35
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Inicio'
  end
  object lbl2: TLabel
    Left = 165
    Top = 58
    Width = 42
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Fim'
  end
  object NR_MESINICIO: TJvDBComboBox
    Left = 213
    Top = 32
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
    TabOrder = 0
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
  object JvDBComboBox1: TJvDBComboBox
    Left = 213
    Top = 55
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
    Left = 340
    Top = 32
    Width = 82
    Height = 21
    DataField = 'NR_ANOINICIO'
    DataSource = SFiltro
    TabOrder = 1
  end
  object edtNR_ANOFIM: TDBEdit
    Left = 340
    Top = 55
    Width = 82
    Height = 21
    DataField = 'NR_ANOFIM'
    DataSource = SFiltro
    TabOrder = 3
  end
  object pnl1: TPanel
    Left = 0
    Top = 111
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 4
    object btnGerarRel: TSpeedButton
      Left = 132
      Top = 10
      Width = 120
      Height = 21
      Caption = 'Gerar Relat'#243'rio'
      OnClick = btnGerarRelClick
    end
    object btnCancelar: TSpeedButton
      Left = 258
      Top = 10
      Width = 120
      Height = 21
      Caption = 'Cancelar'
      OnClick = btnCancelarClick
    end
    object btnReiniciaFiltro: TSpeedButton
      Left = 384
      Top = 10
      Width = 120
      Height = 21
      Caption = 'Reiniciar Filtro'
      OnClick = btnReiniciaFiltroClick
    end
  end
  object TFiltro: TJvMemoryData
    FieldDefs = <>
    AfterInsert = TFiltroAfterInsert
    BeforePost = TFiltroBeforePost
    Left = 16
    Top = 8
    object TFiltroNR_MESINICIO: TIntegerField
      DisplayLabel = 'M'#234's Inicio'
      FieldName = 'NR_MESINICIO'
    end
    object TFiltroNR_MESFIM: TIntegerField
      DisplayLabel = 'M'#234's Fim'
      FieldName = 'NR_MESFIM'
    end
    object TFiltroNR_ANOINICIO: TIntegerField
      DisplayLabel = 'Ano Inicio'
      DisplayWidth = 10
      FieldName = 'NR_ANOINICIO'
    end
    object TFiltroNR_ANOFIM: TIntegerField
      DisplayLabel = 'Ano Fim'
      DisplayWidth = 10
      FieldName = 'NR_ANOFIM'
    end
    object TFiltroDT_INICIO: TIntegerField
      FieldName = 'DT_INICIO'
    end
    object TFiltroDT_FIM: TIntegerField
      FieldName = 'DT_FIM'
    end
  end
  object SFiltro: TDataSource
    DataSet = TFiltro
    Left = 16
    Top = 40
  end
end
