object FProcesso: TFProcesso
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 77
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl: TPanel
    Left = 3
    Top = 10
    Width = 474
    Height = 22
    BevelOuter = bvNone
    TabOrder = 0
    object lblDescricao: TLabel
      Left = 0
      Top = 0
      Width = 57
      Height = 13
      Align = alClient
      Alignment = taCenter
      Caption = 'Carregando'
    end
  end
  object progressPrincipal: TJvProgressBar
    Left = 90
    Top = 38
    Width = 300
    Height = 17
    TabOrder = 1
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 24
    Top = 8
  end
end
