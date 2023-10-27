object FCad_CRMHistorico: TFCad_CRMHistorico
  Left = 0
  Top = 0
  Caption = 'Hist'#243'rico de Atendimento'
  ClientHeight = 603
  ClientWidth = 635
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
  object edtHistorico: TDBMemo
    Left = 0
    Top = 0
    Width = 635
    Height = 562
    Align = alClient
    DataField = 'DS_HISTORICO'
    DataSource = SCRM
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 562
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnGravar: TSpeedButton
      Left = 257
      Top = 10
      Width = 120
      Height = 21
      Caption = 'Ok - F8'
      OnClick = btnGravarClick
    end
  end
  object SCRM: TDataSource
    DataSet = FCad_CRM.TCRM
    Left = 456
    Top = 216
  end
end
