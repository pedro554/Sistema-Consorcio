inherited FConsulta_Funcionario: TFConsulta_Funcionario
  Caption = 'Consulta Funcion'#225'rio/Vendedor'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    inherited btnNovo: TSpeedButton
      OnClick = btnNovoClick
    end
    inherited btnEditar: TSpeedButton
      OnClick = btnEditarClick
    end
  end
  inherited Grid: TJvDBGrid
    DataSource = SFuncionario
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_FUNCIONARIO'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_FUNCIONARIO'
        Width = 567
        Visible = True
      end>
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
      'FUNCIONARIO.ST_ATIVO = '#39'SIM'#39)
    Left = 384
    Top = 176
    object QFuncionarioCD_FUNCIONARIO: TFDAutoIncField
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QFuncionarioNM_FUNCIONARIO: TStringField
      FieldName = 'NM_FUNCIONARIO'
      Origin = 'NM_FUNCIONARIO'
      Required = True
      Size = 50
    end
    object QFuncionarioDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
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
    Left = 416
    Top = 176
    object TFuncionarioNM_FUNCIONARIO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_FUNCIONARIO'
      Origin = 'NM_FUNCIONARIO'
      Required = True
      Size = 50
    end
    object TFuncionarioDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object TFuncionarioST_ATIVO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ST_ATIVO'
      Origin = 'ST_ATIVO'
      Size = 3
    end
    object TFuncionarioCD_FUNCIONARIO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_FUNCIONARIO'
    end
  end
  object SFuncionario: TDataSource
    DataSet = TFuncionario
    Left = 448
    Top = 176
  end
end
