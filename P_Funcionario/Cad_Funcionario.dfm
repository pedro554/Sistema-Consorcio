object FCad_Funcionario: TFCad_Funcionario
  Left = 0
  Top = 0
  Caption = 'Cadastro de Funcion'#225'rio/Vendedor'
  ClientHeight = 159
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
    Top = 43
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
  object pnl1: TPanel
    Left = 0
    Top = 118
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 2
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
    Top = 40
    Width = 300
    Height = 21
    DataField = 'NM_FUNCIONARIO'
    DataSource = SFuncionario
    TabOrder = 0
  end
  object chkST_ATIVO: TDBCheckBox
    Left = 168
    Top = 63
    Width = 97
    Height = 17
    Caption = 'Ativo'
    DataField = 'ST_ATIVO'
    DataSource = SFuncionario
    TabOrder = 1
    ValueChecked = 'SIM'
    ValueUnchecked = 'N'#195'O'
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
