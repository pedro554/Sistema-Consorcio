object DMBanco: TDMBanco
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 384
  Width = 402
  object con: TFDConnection
    Params.Strings = (
      'Database=sistema'
      'User_Name=root'
      'Password=spsg91g8'
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
end
