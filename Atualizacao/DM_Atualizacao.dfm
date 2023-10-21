object DMAtualizacao: TDMAtualizacao
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 301
  Width = 355
  object ftpAtualizacao: TIdFTP
    OnWork = ftpAtualizacaoWork
    Passive = True
    ConnectTimeout = 0
    TransferType = ftBinary
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 144
    Top = 64
  end
  object QVerificaAtualizacao: TFDQuery
    Connection = DMBanco.conServidor
    SQL.Strings = (
      'SELECT'
      'NR_VERSAO'
      ''
      'FROM'
      'VERSAO')
    Left = 160
    Top = 136
  end
  object QVersao: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      '*'
      ''
      'FROM'
      'VERSAO')
    Left = 40
    Top = 136
    object QVersaoNR_VERSAOSISTEMA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NR_VERSAOSISTEMA'
      Origin = 'NR_VERSAOSISTEMA'
    end
  end
end
