object FFuncionario: TFFuncionario
  Left = 0
  Top = 0
  Caption = 'Funcion'#225'rio/Vendedor'
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 236
    Width = 635
    Height = 63
    Align = alBottom
    TabOrder = 2
    object lbl1: TLabel
      Left = 16
      Top = 9
      Width = 42
      Height = 13
      Caption = 'Pesquisa'
    end
    object lbl2: TLabel
      Left = 25
      Top = 32
      Width = 33
      Height = 13
      Caption = 'Coluna'
    end
    object btnPesquisa: TSpeedButton
      Left = 270
      Top = 29
      Width = 120
      Height = 21
      Caption = 'Pesquisar'
      OnClick = btnPesquisaClick
    end
    object edtPesquisa: TEdit
      Left = 64
      Top = 6
      Width = 200
      Height = 21
      TabOrder = 0
    end
    object cbbColuna: TComboBox
      Left = 64
      Top = 29
      Width = 200
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
  end
  object Grid: TJvDBGrid
    Left = 0
    Top = 41
    Width = 635
    Height = 195
    Align = alClient
    DataSource = SFuncioario
    DrawingStyle = gdsClassic
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = GridDblClick
    AutoAppend = False
    AutoSizeColumns = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'ST_MARCADO'
        Title.Alignment = taCenter
        Title.Caption = '[X]'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CD_FUNCIONARIO'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_FUNCIONARIO'
        Width = 529
        Visible = True
      end>
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnNovo: TSpeedButton
      Left = 1
      Top = 1
      Width = 120
      Height = 39
      Align = alLeft
      Caption = 'Novo'
      OnClick = btnNovoClick
      ExplicitLeft = 126
      ExplicitTop = 8
      ExplicitHeight = 21
    end
    object btnEditar: TSpeedButton
      Left = 121
      Top = 1
      Width = 120
      Height = 39
      Align = alLeft
      Caption = 'Editar'
      OnClick = btnEditarClick
      ExplicitLeft = 225
    end
    object btnExcluir: TSpeedButton
      Left = 241
      Top = 1
      Width = 120
      Height = 39
      Align = alLeft
      Caption = 'Excluir'
      OnClick = btnExcluirClick
      ExplicitLeft = 341
    end
  end
  object QFuncionario: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'FUNCIONARIO.*'
      ''
      'FROM'
      'FUNCIONARIO')
    Left = 216
    Top = 116
    object QFuncionarioCD_FUNCIONARIO: TFDAutoIncField
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QFuncionarioNM_FUNCIONARIO: TStringField
      FieldName = 'NM_FUNCIONARIO'
      Origin = 'NM_FUNCIONARIO'
      Required = True
      Size = 50
    end
    object QFuncionarioST_ATIVO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ST_ATIVO'
      Origin = 'ST_ATIVO'
      Size = 3
    end
  end
  object TFuncionario: TJvMemoryData
    FieldDefs = <>
    AfterInsert = TFuncionarioAfterInsert
    Left = 252
    Top = 116
    object TFuncionarioCD_FUNCIONARIO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_FUNCIONARIO'
    end
    object TFuncionarioNM_FUNCIONARIO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_FUNCIONARIO'
      Size = 50
    end
    object TFuncionarioST_MARCADO: TBooleanField
      FieldName = 'ST_MARCADO'
    end
    object TFuncionarioST_ATIVO: TStringField
      FieldName = 'ST_ATIVO'
      Size = 3
    end
  end
  object SFuncioario: TDataSource
    DataSet = TFuncionario
    Left = 280
    Top = 116
  end
end
