inherited FConsulta_Cliente: TFConsulta_Cliente
  Caption = 'Consulta Cliente'
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
    DataSource = SCliente
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_CLIENTE'
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_CLIENTE'
        Title.Caption = 'Nome'
        Width = 422
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_FONE'
        Title.Caption = 'Telefone'
        Width = 144
        Visible = True
      end>
  end
  object QCliente: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'CLIENTE'
      ''
      'WHERE'
      'CLIENTE.ST_ATIVO = '#39'SIM'#39)
    Left = 344
    Top = 152
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
    Left = 376
    Top = 152
    object TClienteCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
    end
    object TClienteNM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
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
  end
  object SCliente: TDataSource
    DataSet = TCliente
    Left = 408
    Top = 152
  end
end
