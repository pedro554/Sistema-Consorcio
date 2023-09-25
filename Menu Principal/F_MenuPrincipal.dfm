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
  end
  object mm: TMainMenu
    Left = 184
    Top = 116
    object MGeral: TMenuItem
      Caption = 'Geral'
      object MVendedorFuncionario: TMenuItem
        Caption = 'Vendedor/Funcion'#225'rio'
        OnClick = MVendedorFuncionarioClick
      end
      object Clientes1: TMenuItem
        Caption = 'Cliente'
        OnClick = Clientes1Click
      end
      object MFaixaComissao: TMenuItem
        Caption = 'Faixa de Comiss'#227'o'
        OnClick = MFaixaComissaoClick
      end
    end
    object CRM1: TMenuItem
      Caption = 'CRM'
      OnClick = CRM1Click
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Comisso1: TMenuItem
        Caption = 'Comiss'#227'o'
        object RelatriodePagamentodeComisso1: TMenuItem
          Caption = 'Relat'#243'rio de Pagamento de Comiss'#227'o'
          OnClick = RelatriodePagamentodeComisso1Click
        end
      end
    end
    object Configurao1: TMenuItem
      Caption = 'Configura'#231#227'o'
      object BancodeDados1: TMenuItem
        Caption = 'Banco de Dados'
        OnClick = BancodeDados1Click
      end
    end
  end
end
