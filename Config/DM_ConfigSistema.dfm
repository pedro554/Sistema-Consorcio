object DMConfigSistema: TDMConfigSistema
  OldCreateOrder = False
  Height = 257
  Width = 387
  object QConfigSistema: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'CONFIG_SISTEMA.*'
      ''
      'FROM'
      'CONFIG_SISTEMA')
    Left = 123
    Top = 48
    object QConfigSistemaDS_USERNAME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_USERNAME'
      Origin = 'DS_USERNAME'
      Size = 50
    end
    object QConfigSistemaDS_SENHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_SENHA'
      Origin = 'DS_SENHA'
      Size = 50
    end
    object QConfigSistemaDS_NOMEEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_NOMEEMAIL'
      Origin = 'DS_NOMEEMAIL'
      Size = 50
    end
    object QConfigSistemaDS_HOSTEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_HOSTEMAIL'
      Origin = 'DS_HOSTEMAIL'
      Size = 50
    end
    object QConfigSistemaNR_PORTA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_PORTA'
      Origin = 'NR_PORTA'
      Size = 50
    end
    object QConfigSistemaST_TLS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ST_TLS'
      Origin = 'ST_TLS'
      Size = 3
    end
    object QConfigSistemaST_SSL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ST_SSL'
      Origin = 'ST_SSL'
      Size = 3
    end
  end
  object TConfigSistema: TJvMemoryData
    FieldDefs = <>
    Left = 120
    Top = 96
    object TConfigSistemaDS_USERNAME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_USERNAME'
      Origin = 'DS_USERNAME'
      Size = 50
    end
    object TConfigSistemaDS_SENHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_SENHA'
      Origin = 'DS_SENHA'
      Size = 50
    end
    object TConfigSistemaDS_NOMEEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_NOMEEMAIL'
      Origin = 'DS_NOMEEMAIL'
      Size = 50
    end
    object TConfigSistemaDS_HOSTEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_HOSTEMAIL'
      Origin = 'DS_HOSTEMAIL'
      Size = 50
    end
    object TConfigSistemaNR_PORTA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_PORTA'
      Origin = 'NR_PORTA'
      Size = 50
    end
    object TConfigSistemaST_TLS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ST_TLS'
      Origin = 'ST_TLS'
      Size = 3
    end
    object TConfigSistemaST_SSL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ST_SSL'
      Origin = 'ST_SSL'
      Size = 3
    end
  end
end
