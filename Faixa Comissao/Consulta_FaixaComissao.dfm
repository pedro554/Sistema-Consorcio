inherited FConsulta_FaixaComissao: TFConsulta_FaixaComissao
  Caption = 'Consulta Faixa de Comiss'#227'o'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TJvDBGrid
    DataSource = SFaixaComissao
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_FAIXACOMISSAO'
        Title.Caption = 'C'#243'digo'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_FAIXACOMISSAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 564
        Visible = True
      end>
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
      '/*WHERE*/')
    Left = 344
    Top = 152
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
    object QFaixaComissaoDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
  end
  object SFaixaComissao: TDataSource
    DataSet = TFaixaComissao
    Left = 376
    Top = 152
  end
  object TFaixaComissao: TJvMemoryData
    FieldDefs = <>
    Left = 408
    Top = 152
    object TFaixaComissaoCD_FAIXACOMISSAO: TIntegerField
      FieldName = 'CD_FAIXACOMISSAO'
    end
    object TFaixaComissaoDS_FAIXACOMISSAO: TStringField
      FieldName = 'DS_FAIXACOMISSAO'
      Origin = 'DS_FAIXACOMISSAO'
      Size = 50
    end
    object TFaixaComissaoNR_PARCELAS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NR_PARCELAS'
      Origin = 'NR_PARCELAS'
    end
    object TFaixaComissaoVL_MINIMO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_MINIMO'
      Origin = 'VL_MINIMO'
      Precision = 20
      Size = 6
    end
    object TFaixaComissaoVL_MAXIMO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_MAXIMO'
      Origin = 'VL_MAXIMO'
      Precision = 20
      Size = 6
    end
    object TFaixaComissaoDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
  end
end
