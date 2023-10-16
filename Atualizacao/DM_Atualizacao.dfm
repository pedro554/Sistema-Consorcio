object DMAtualizacao: TDMAtualizacao
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 301
  Width = 355
  object ftpAtualizacao: TIdFTP
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
end
