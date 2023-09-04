object Formulario: TFormulario
  Left = 0
  Top = 0
  Caption = 'Formulario'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object EnterAsTab: TJvEnterAsTab
    Left = 312
    Top = 156
  end
  object actlstBase: TActionList
    Left = 268
    Top = 156
    object ACT_ESC: TAction
      Caption = 'ACT_ESC'
      ShortCut = 27
      OnExecute = ACT_ESCExecute
    end
  end
end
