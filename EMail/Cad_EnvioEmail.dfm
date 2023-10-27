object FCad_EnvioEmail: TFCad_EnvioEmail
  Left = 0
  Top = 0
  Caption = 'Envio de E-Mail'
  ClientHeight = 349
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
  object Label1: TLabel
    Left = 122
    Top = 19
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Assunto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 114
    Top = 46
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = 'Conte'#250'do'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 125
    Top = 175
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = 'Anexos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnAddAnexo: TSpeedButton
    Left = 473
    Top = 175
    Width = 120
    Height = 21
    Caption = 'Adicionar Anexo'
    OnClick = btnAddAnexoClick
  end
  object btnRemoverAnexo: TSpeedButton
    Left = 473
    Top = 198
    Width = 120
    Height = 21
    Caption = 'Remover Anexo'
    OnClick = btnRemoverAnexoClick
  end
  object DS_ASSUNTO: TDBEdit
    Left = 167
    Top = 16
    Width = 300
    Height = 21
    DataField = 'DS_ASSUNTO'
    DataSource = SEmail
    TabOrder = 0
  end
  object DS_CONTEUDO: TDBMemo
    Left = 167
    Top = 43
    Width = 300
    Height = 126
    DataField = 'DS_CONTEUDO'
    DataSource = SEmail
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 308
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 3
    object btnEnviar: TSpeedButton
      Left = 195
      Top = 10
      Width = 120
      Height = 21
      Caption = 'Enviar - F8'
      OnClick = btnEnviarClick
    end
    object Cancelar: TSpeedButton
      Left = 321
      Top = 10
      Width = 120
      Height = 21
      Caption = 'Cancelar - F6'
      OnClick = CancelarClick
    end
  end
  object GridAnexos: TJvDBGrid
    Left = 167
    Top = 175
    Width = 300
    Height = 120
    DataSource = SAnexos
    DrawingStyle = gdsClassic
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    AutoSizeColumns = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'DS_ARQUIVO'
        Title.Caption = 'Arquivo'
        Width = 283
        Visible = True
      end>
  end
  object mail: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    OnMailProcess = mailMailProcess
    Left = 496
    Top = 40
  end
  object QConfigEmail: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'CONFIG_email')
    Left = 496
    Top = 8
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
  object TEmail: TJvMemoryData
    FieldDefs = <>
    Left = 536
    Top = 8
    object TEmailDS_ASSUNTO: TStringField
      DisplayLabel = 'Assunto'
      FieldName = 'DS_ASSUNTO'
      Size = 100
    end
    object TEmailDS_CONTEUDO: TBlobField
      DisplayLabel = 'Conte'#250'do'
      FieldName = 'DS_CONTEUDO'
      Size = 500
    end
    object TEmailCD_CRM: TIntegerField
      FieldName = 'CD_CRM'
    end
    object TEmailCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
    end
    object TEmailDS_EMAILCLIENTE: TStringField
      FieldName = 'DS_EMAILCLIENTE'
      Size = 100
    end
    object TEmailNM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      Size = 50
    end
  end
  object SEmail: TDataSource
    DataSet = TEmail
    Left = 568
    Top = 8
  end
  object TAnexos: TJvMemoryData
    FieldDefs = <>
    Left = 536
    Top = 40
    object TAnexosCD_ANEXO: TIntegerField
      FieldName = 'CD_ANEXO'
    end
    object TAnexosDS_ARQUIVO: TStringField
      FieldName = 'DS_ARQUIVO'
      Size = 500
    end
  end
  object SAnexos: TDataSource
    DataSet = TAnexos
    Left = 568
    Top = 40
  end
  object dlgAnexo: TOpenDialog
    Left = 536
    Top = 72
  end
  object QCliente: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'CD_CLIENTE,'
      'NM_CLIENTE,'
      'DS_EMAIL'
      ''
      'FROM'
      'CLIENTE'
      ''
      'WHERE'
      'CLIENTE.CD_CLIENTE = :CD_CLIENTE')
    Left = 496
    Top = 80
    ParamData = <
      item
        Name = 'CD_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
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
    object QClienteDS_EMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_EMAIL'
      Origin = 'DS_EMAIL'
      Size = 50
    end
  end
  object QHistoricoEmail: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'HISTORICO_EMAIL'
      ''
      'LIMIT 1')
    Left = 552
    Top = 120
    object QHistoricoEmailCD_HISTORICOEMAIL: TFDAutoIncField
      FieldName = 'CD_HISTORICOEMAIL'
      Origin = 'CD_HISTORICOEMAIL'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QHistoricoEmailDS_ASSUNTO: TStringField
      FieldName = 'DS_ASSUNTO'
      Origin = 'DS_ASSUNTO'
      Required = True
      Size = 100
    end
    object QHistoricoEmailDS_CONTEUDO: TStringField
      FieldName = 'DS_CONTEUDO'
      Origin = 'DS_CONTEUDO'
      Required = True
      Size = 500
    end
    object QHistoricoEmailCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
      Required = True
    end
    object QHistoricoEmailCD_CRM: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_CRM'
      Origin = 'CD_CRM'
    end
    object QHistoricoEmailDT_ENVIO: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DT_ENVIO'
      Origin = 'DT_ENVIO'
    end
  end
  object QHistoricoEmailAnexo: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'HISTORICO_EMAIL_ANEXO')
    Left = 512
    Top = 128
    object QHistoricoEmailAnexoCD_HISTORICOEMAIL: TIntegerField
      FieldName = 'CD_HISTORICOEMAIL'
      Origin = 'CD_HISTORICOEMAIL'
      Required = True
    end
    object QHistoricoEmailAnexoCD_ANEXO: TFDAutoIncField
      FieldName = 'CD_ANEXO'
      Origin = 'CD_ANEXO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QHistoricoEmailAnexoDS_ARQUIVO: TStringField
      FieldName = 'DS_ARQUIVO'
      Origin = 'DS_ARQUIVO'
      Required = True
      Size = 100
    end
  end
end
