object FMenuPrincipal: TFMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object stat: TStatusBar
    Left = 0
    Top = 280
    Width = 635
    Height = 19
    Panels = <
      item
        Text = 'Vers'#227'o'
        Width = 200
      end>
    ExplicitLeft = 324
    ExplicitTop = 160
    ExplicitWidth = 0
  end
  object mm: TMainMenu
    Left = 184
    Top = 116
    object MGeral: TMenuItem
      Caption = 'Geral'
      object CadastrodeVendedores1: TMenuItem
        Caption = 'Cadastro Vendedor/Funcion'#225'rio'
      end
      object CadastroFaixadeComisso1: TMenuItem
        Caption = 'Cadastro Faixa de Comiss'#227'o'
      end
    end
  end
end
