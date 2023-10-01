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
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 28
  end
  object driver: TFDPhysMySQLDriverLink
    VendorLib = 
      'D:\Projetos\Sistema-Consorcio\Projeto\Win32\Debug\lib\libmysql.d' +
      'll'
    Left = 56
    Top = 84
  end
  object conValidade: TFDConnection
    Params.Strings = (
      'Database=sistema_validade'
      'Password=spsg91g8'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 168
    Top = 28
  end
  object QValidade: TFDQuery
    Connection = conValidade
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'CLIENTE'
      ''
      'WHERE '
      'CLIENTE.NR_CPFCNPJ = :NR_CPFCNPJ')
    Left = 168
    Top = 88
    ParamData = <
      item
        Name = 'NR_CPFCNPJ'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
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
end
