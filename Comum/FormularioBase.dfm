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
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object JvEnterAsTab1: TJvEnterAsTab
    Left = 312
    Top = 156
  end
  object actlstpadrao: TActionList
    Left = 360
    Top = 168
    object ACT_ESC: TAction
      Caption = 'ACT_ESC'
      ShortCut = 27
      OnExecute = ACT_ESCExecute
    end
  end
end
