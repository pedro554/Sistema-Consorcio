object DMCRM: TDMCRM
  OldCreateOrder = False
  Height = 591
  Width = 743
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
      'FAIXACOMISSAOPARCELA.TP_PARCELA = :TP_PARCELA')
    Left = 88
    Top = 64
    ParamData = <
      item
        Name = 'CD_FAIXACOMISSAO'
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
  object QComissaoParcela: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'COMISSAOPARCELA.*'
      ''
      'FROM'
      'COMISSAOPARCELA')
    Left = 88
    Top = 120
    object QComissaoParcelaNR_PARCELA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NR_PARCELA'
      Origin = 'NR_PARCELA'
    end
    object QComissaoParcelaPC_COMISSAO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PC_COMISSAO'
      Origin = 'PC_COMISSAO'
      Precision = 20
      Size = 6
    end
    object QComissaoParcelaVL_COMISSAO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_COMISSAO'
      Origin = 'VL_COMISSAO'
      Precision = 20
      Size = 6
    end
    object QComissaoParcelaCD_CRM: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_CRM'
      Origin = 'CD_CRM'
    end
    object QComissaoParcelaCD_FAIXACOMISSAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
    end
    object QComissaoParcelaCD_FUNCIONARIO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
    end
    object QComissaoParcelaCD_CLIENTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
    end
    object QComissaoParcelaTP_PARCELA: TStringField
      FieldName = 'TP_PARCELA'
      Origin = 'TP_PARCELA'
      Required = True
      Size = 1
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
  end
  object QCRM: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'CRM.*,'
      'CLIENTE.NM_CLIENTE,'
      'FAIXACOMISSAO.DS_FAIXACOMISSAO'
      ''
      'FROM'
      'CRM'
      ''
      'LEFT JOIN CLIENTE ON'
      'CLIENTE.CD_CLIENTE = CRM.CD_CLIENTE'
      ''
      'LEFT JOIN FAIXACOMISSAO ON'
      'FAIXACOMISSAO.CD_FAIXACOMISSAO = CRM.CD_FAIXACOMISSAO'
      ''
      'WHERE'
      'CRM.CD_CRM = :CD_CRM')
    Left = 208
    Top = 72
    ParamData = <
      item
        Name = 'CD_CRM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QCRMCD_CRM: TFDAutoIncField
      FieldName = 'CD_CRM'
      Origin = 'CD_CRM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QCRMCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
      Required = True
    end
    object QCRMCD_STATUS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_STATUS'
      Origin = 'CD_STATUS'
    end
    object QCRMDS_OBS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_OBS'
      Origin = 'DS_OBS'
      Size = 500
    end
    object QCRMDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object QCRMNM_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_CLIENTE'
      Origin = 'NM_CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QCRMCD_FUNCIONARIO: TIntegerField
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
      Required = True
    end
    object QCRMVL_CREDITO: TFMTBCDField
      FieldName = 'VL_CREDITO'
      Origin = 'VL_CREDITO'
      Required = True
      Precision = 20
      Size = 6
    end
    object QCRMDT_ATUALIZACAO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_ATUALIZACAO'
      Origin = 'DT_ATUALIZACAO'
    end
    object QCRMCD_FAIXACOMISSAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
    end
    object QCRMDS_FAIXACOMISSAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_FAIXACOMISSAO'
      Origin = 'DS_FAIXACOMISSAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QCRMTP_PARCELA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TP_PARCELA'
      Origin = 'TP_PARCELA'
      Size = 1
    end
  end
end
