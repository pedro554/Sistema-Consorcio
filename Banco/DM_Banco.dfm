object DMBanco: TDMBanco
  OldCreateOrder = False
  Height = 384
  Width = 402
  object con: TFDConnection
    Params.Strings = (
      'Database=sistema'
      'Password=spsg91g8'
      'User_Name=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 56
    Top = 28
  end
  object driver: TFDPhysMySQLDriverLink
    Left = 56
    Top = 84
  end
  object conServidor: TFDConnection
    Params.Strings = (
      'Server='
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 168
    Top = 28
  end
  object QValidade: TFDQuery
    Connection = conServidor
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'CLIENTE'
      ''
      'WHERE '
      'CLIENTE.NR_MACADRESS = :NR_MACADRESS')
    Left = 168
    Top = 88
    ParamData = <
      item
        Name = 'NR_MACADRESS'
        ParamType = ptInput
      end>
    object QValidadeDT_VALIDADE: TDateTimeField
      FieldName = 'DT_VALIDADE'
      Origin = 'DT_VALIDADE'
      Required = True
    end
  end
  object QEmpresa: TFDQuery
    Connection = con
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'EMPRESA')
    Left = 168
    Top = 136
    object QEmpresaNR_CPFCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_CPFCNPJ'
      Origin = 'NR_CPFCNPJ'
      Size = 14
    end
  end
  object QAtualizacao: TFDQuery
    Connection = conServidor
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'ATUALIZACAO_BANCO'
      ''
      'WHERE'
      'NR_VERSAO > :NR_VERSAO')
    Left = 168
    Top = 200
    ParamData = <
      item
        Name = 'NR_VERSAO'
        ParamType = ptInput
      end>
    object QAtualizacaoNR_VERSAO: TIntegerField
      FieldName = 'NR_VERSAO'
      Origin = 'NR_VERSAO'
      Required = True
    end
    object QAtualizacaoDS_COMANDO: TBlobField
      FieldName = 'DS_COMANDO'
      Size = 1000
    end
  end
  object TAtualizacao: TJvMemoryData
    FieldDefs = <>
    Left = 232
    Top = 256
    object TAtualizacaoDS_ARQUIVO: TStringField
      FieldName = 'DS_ARQUIVO'
      Size = 200
    end
    object TAtualizacaoNR_VERSAO: TIntegerField
      FieldName = 'NR_VERSAO'
    end
  end
  object QVersao: TFDQuery
    Connection = con
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'VERSAO')
    Left = 40
    Top = 136
    object QVersaoNR_VERSAOBANCO: TIntegerField
      FieldName = 'NR_VERSAOBANCO'
      Origin = 'NR_VERSAOBANCO'
      Required = True
    end
    object QVersaoNR_VERSAOSISTEMA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NR_VERSAOSISTEMA'
      Origin = 'NR_VERSAOSISTEMA'
    end
  end
end
