object DMBanco: TDMBanco
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 384
  Width = 402
  object con: TFDConnection
    Params.Strings = (
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 56
    Top = 28
  end
  object driver: TFDPhysMySQLDriverLink
    Left = 56
    Top = 84
  end
end
