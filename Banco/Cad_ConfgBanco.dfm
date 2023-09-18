object FCad_ConfigBanco: TFCad_ConfigBanco
  Left = 0
  Top = 0
  Caption = 'Configura'#231#227'o do Banco de dados'
  ClientHeight = 147
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
  object lbl2: TLabel
    Left = 176
    Top = 34
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = 'Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 202
    Top = 57
    Width = 10
    Height = 13
    Alignment = taRightJustify
    Caption = 'IP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtUsuario: TEdit
    Left = 218
    Top = 31
    Width = 200
    Height = 21
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 106
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 114
    object btnGravar: TSpeedButton
      Left = 257
      Top = 10
      Width = 120
      Height = 21
      Caption = 'Gravar - F8'
      OnClick = btnGravarClick
    end
    object btnCancelar: TSpeedButton
      Left = 383
      Top = 10
      Width = 120
      Height = 21
      Caption = 'Cancelar - F6'
      OnClick = btnCancelarClick
    end
    object btnTestar: TSpeedButton
      Left = 131
      Top = 10
      Width = 120
      Height = 21
      Caption = 'Testar'
      OnClick = btnTestarClick
    end
  end
  object edtIP: TEdit
    Left = 218
    Top = 54
    Width = 200
    Height = 21
    TabOrder = 1
  end
  object actlst: TActionList
    Left = 64
    Top = 8
    object ACT_F8: TAction
      Caption = 'ACT_F8'
      ShortCut = 119
      OnExecute = btnGravarClick
    end
    object ACT_F6: TAction
      Caption = 'ACT_F6'
      ShortCut = 117
      OnExecute = btnCancelarClick
    end
  end
end
