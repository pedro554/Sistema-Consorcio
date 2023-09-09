object FCad_FaixaComissao: TFCad_FaixaComissao
  Left = 0
  Top = 0
  Caption = 'Cadastro de Faixa de Comiss'#227'o'
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
    Top = 258
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 4
    ExplicitLeft = 4
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
    Left = 8
    Top = 8
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
    Left = 40
    Top = 8
    object TFaixaComissaoCD_FAIXACOMISSAO: TIntegerField
      FieldName = 'CD_FAIXACOMISSAO'
    end
    object TFaixaComissaoDS_FAIXACOMISSAO: TStringField
      FieldName = 'DS_FAIXACOMISSAO'
      Size = 50
    end
    object TFaixaComissaoNR_PARCELAS: TIntegerField
      FieldName = 'NR_PARCELAS'
    end
    object TFaixaComissaoVL_MINIMO: TFloatField
      FieldName = 'VL_MINIMO'
      DisplayFormat = '#.###,##'
    end
    object TFaixaComissaoVL_MAXIMO: TFloatField
      FieldName = 'VL_MAXIMO'
      DisplayFormat = '#.###,##'
    end
  end
  object SFaixaComissao: TDataSource
    DataSet = TFaixaComissao
    Left = 72
    Top = 8
  end
end
