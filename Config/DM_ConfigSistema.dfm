object DMConfigSistema: TDMConfigSistema
  OldCreateOrder = False
  Height = 257
  Width = 387
  object QConfigEmail: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'CONFIG_email.*'
      ''
      'FROM'
      'CONFIG_email')
    Left = 123
    Top = 48
    object QConfigEmailDS_USERNAME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_USERNAME'
      Origin = 'DS_USERNAME'
      Size = 50
    end
    object QConfigEmailDS_SENHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_SENHA'
      Origin = 'DS_SENHA'
      Size = 50
    end
    object QConfigEmailDS_NOMEEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_NOMEEMAIL'
      Origin = 'DS_NOMEEMAIL'
      Size = 50
    end
    object QConfigEmailDS_HOSTEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_HOSTEMAIL'
      Origin = 'DS_HOSTEMAIL'
      Size = 50
    end
    object QConfigEmailNR_PORTA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_PORTA'
      Origin = 'NR_PORTA'
      Size = 50
    end
    object QConfigEmailST_TLS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ST_TLS'
      Origin = 'ST_TLS'
      Size = 3
    end
    object QConfigEmailST_SSL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ST_SSL'
      Origin = 'ST_SSL'
      Size = 3
    end
  end
  object TConfigEmail: TJvMemoryData
    FieldDefs = <>
    Left = 120
    Top = 96
    object TConfigEmailDS_USERNAME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_USERNAME'
      Origin = 'DS_USERNAME'
      Size = 50
    end
    object TConfigEmailDS_SENHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_SENHA'
      Origin = 'DS_SENHA'
      Size = 50
    end
    object TConfigEmailDS_NOMEEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_NOMEEMAIL'
      Origin = 'DS_NOMEEMAIL'
      Size = 50
    end
    object TConfigEmailDS_HOSTEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_HOSTEMAIL'
      Origin = 'DS_HOSTEMAIL'
      Size = 50
    end
    object TConfigEmailNR_PORTA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NR_PORTA'
      Origin = 'NR_PORTA'
      Size = 50
    end
    object TConfigEmailST_TLS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ST_TLS'
      Origin = 'ST_TLS'
      Size = 3
    end
    object TConfigEmailST_SSL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ST_SSL'
      Origin = 'ST_SSL'
      Size = 3
    end
  end
end
