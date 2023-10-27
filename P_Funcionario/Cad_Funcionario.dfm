object FCad_Funcionario: TFCad_Funcionario
  Left = 0
  Top = 0
  Caption = 'Cadastro de Funcion'#225'rio/Vendedor'
  ClientHeight = 156
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
    Top = 27
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
  object Label1: TLabel
    Left = 130
    Top = 50
    Width = 32
    Height = 13
    Alignment = taRightJustify
    Caption = 'Sal'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 52
    Top = 73
    Width = 110
    Height = 13
    Alignment = taRightJustify
    Caption = 'Outros Valores (Custo)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pnl1: TPanel
    Left = 0
    Top = 115
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 4
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
  object edtNM_FUNCIONARIO: TDBEdit
    Left = 168
    Top = 24
    Width = 300
    Height = 21
    DataField = 'NM_FUNCIONARIO'
    DataSource = SFuncionario
    TabOrder = 0
  end
  object chkST_ATIVO: TDBCheckBox
    Left = 422
    Top = 49
    Width = 46
    Height = 17
    TabStop = False
    Caption = 'Ativo'
    DataField = 'ST_ATIVO'
    DataSource = SFuncionario
    TabOrder = 2
    ValueChecked = 'SIM'
    ValueUnchecked = 'N'#195'O'
  end
  object edtVL_SALARIO: TDBEdit
    Left = 168
    Top = 47
    Width = 100
    Height = 21
    DataField = 'VL_SALARIO'
    DataSource = SFuncionario
    TabOrder = 1
  end
  object edtVL_OUTRO: TDBEdit
    Left = 168
    Top = 70
    Width = 100
    Height = 21
    DataField = 'VL_OUTRO'
    DataSource = SFuncionario
    TabOrder = 3
  end
  object QFuncionario: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'FUNCIONARIO.*'
      ''
      'FROM'
      'FUNCIONARIO'
      ''
      'WHERE'
      'FUNCIONARIO.CD_FUNCIONARIO = :CD_FUNCIONARIO')
    Left = 4
    Top = 4
    ParamData = <
      item
        Name = 'CD_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QFuncionarioCD_FUNCIONARIO: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CD_FUNCIONARIO'
      Calculated = True
    end
    object QFuncionarioNM_FUNCIONARIO: TStringField
      FieldName = 'NM_FUNCIONARIO'
      Origin = 'NM_FUNCIONARIO'
      Required = True
      Size = 50
    end
    object QFuncionarioST_ATIVO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ST_ATIVO'
      Origin = 'ST_ATIVO'
      Size = 3
    end
    object QFuncionarioDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object QFuncionarioVL_SALARIO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_SALARIO'
      Origin = 'VL_SALARIO'
      Precision = 10
      Size = 2
    end
    object QFuncionarioVL_OUTRO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_OUTRO'
      Origin = 'VL_OUTRO'
      Precision = 10
      Size = 2
    end
  end
  object TFuncionario: TJvMemoryData
    FieldDefs = <>
    Left = 36
    Top = 4
    object TFuncionarioCD_FUNCIONARIO: TIntegerField
      FieldName = 'CD_FUNCIONARIO'
    end
    object TFuncionarioNM_FUNCIONARIO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_FUNCIONARIO'
      Origin = 'NM_FUNCIONARIO'
      Size = 50
    end
    object TFuncionarioVL_SALARIO: TFloatField
      FieldName = 'VL_SALARIO'
      DisplayFormat = '#0.00'
    end
    object TFuncionarioVL_OUTRO: TFloatField
      FieldName = 'VL_OUTRO'
      DisplayFormat = '#0.00'
    end
    object TFuncionarioST_ATIVO: TStringField
      FieldName = 'ST_ATIVO'
      Size = 3
    end
  end
  object SFuncionario: TDataSource
    DataSet = TFuncionario
    Left = 68
    Top = 4
  end
  object actlst: TActionList
    Left = 104
    Top = 4
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
    Left = 140
    Top = 4
  end
end
