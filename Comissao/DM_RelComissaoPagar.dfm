object DMRelComissaoPagar: TDMRelComissaoPagar
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 385
  Width = 609
  object RelComissao: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45194.608324618100000000
    ReportOptions.LastChange = 45194.782255289350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 88
    Top = 72
    Datasets = <
      item
        DataSet = SComissao
        DataSetName = 'SComissao'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Pagamento de Comiss'#245'es')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          HAlign = haCenter
          Memo.UTF8W = (
            'Vendedor')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 393.071120000000000000
          Top = 37.795300000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 525.354670000000000000
          Top = 37.795300000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          HAlign = haCenter
          Memo.UTF8W = (
            'M'#234's Pag.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 612.283860000000000000
          Top = 37.795300000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          HAlign = haCenter
          Memo.UTF8W = (
            'Ano Pag.')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 98.267780000000000000
        Width = 718.110700000000000000
        DataSet = SComissao
        DataSetName = 'SComissao'
        RowCount = 0
        object SComissaoNM_FUNCIONARIO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          DataField = 'NM_FUNCIONARIO'
          DataSet = SComissao
          DataSetName = 'SComissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8W = (
            '[SComissao."NM_FUNCIONARIO"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 393.071120000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DataField = 'VL_COMISSAO'
          DataSet = SComissao
          DataSetName = 'SComissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[SComissao."VL_COMISSAO"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 525.354670000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'NR_MESPAGAMENTO'
          DataSet = SComissao
          DataSetName = 'SComissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[SComissao."NR_MESPAGAMENTO"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 612.283860000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'NR_ANOPAGAMENTO'
          DataSet = SComissao
          DataSetName = 'SComissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[SComissao."NR_ANOPAGAMENTO"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 139.842610000000000000
        Width = 718.110700000000000000
        object SComissaoVL_COMISSAO: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = SComissao
          DataSetName = 'SComissao'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            
              'Total Comiss'#227'o a Pagar: [SUM(<SComissao."VL_COMISSAO">,MasterDat' +
              'a1)]')
          ParentFont = False
        end
      end
    end
  end
  object QComissao: TFDQuery
    Connection = DMBanco.con
    SQL.Strings = (
      'SELECT'
      'COMISSAOPARCELA.*,'
      'FUNCIONARIO.NM_FUNCIONARIO'
      ''
      'FROM'
      'COMISSAOPARCELA'
      ''
      'LEFT JOIN FUNCIONARIO ON'
      'FUNCIONARIO.CD_FUNCIONARIO = COMISSAOPARCELA.CD_FUNCIONARIO'
      ''
      'WHERE'
      'COMISSAOPARCELA.DT_PAGAMENTO BETWEEN :DT_INICIO AND :DT_FIM'
      ''
      'ORDER BY '
      'COMISSAOPARCELA.CD_FUNCIONARIO')
    Left = 96
    Top = 176
    ParamData = <
      item
        Name = 'DT_INICIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT_FIM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QComissaoCD_COMISSAOPARCELA: TFDAutoIncField
      FieldName = 'CD_COMISSAOPARCELA'
      Origin = 'CD_COMISSAOPARCELA'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QComissaoNR_PARCELA: TIntegerField
      FieldName = 'NR_PARCELA'
      Origin = 'NR_PARCELA'
      Required = True
    end
    object QComissaoPC_COMISSAO: TFMTBCDField
      FieldName = 'PC_COMISSAO'
      Origin = 'PC_COMISSAO'
      Required = True
      Precision = 20
      Size = 6
    end
    object QComissaoVL_COMISSAO: TFMTBCDField
      FieldName = 'VL_COMISSAO'
      Origin = 'VL_COMISSAO'
      Required = True
      Precision = 20
      Size = 6
    end
    object QComissaoCD_CRM: TIntegerField
      FieldName = 'CD_CRM'
      Origin = 'CD_CRM'
      Required = True
    end
    object QComissaoCD_FAIXACOMISSAO: TIntegerField
      FieldName = 'CD_FAIXACOMISSAO'
      Origin = 'CD_FAIXACOMISSAO'
      Required = True
    end
    object QComissaoCD_FUNCIONARIO: TIntegerField
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
      Required = True
    end
    object QComissaoCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
      Required = True
    end
    object QComissaoTP_PARCELA: TStringField
      FieldName = 'TP_PARCELA'
      Origin = 'TP_PARCELA'
      Required = True
      Size = 1
    end
    object QComissaoDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
    end
    object QComissaoNR_MESPAGAMENTO: TIntegerField
      FieldName = 'NR_MESPAGAMENTO'
      Origin = 'NR_MESPAGAMENTO'
      Required = True
    end
    object QComissaoNR_ANOPAGAMENTO: TIntegerField
      FieldName = 'NR_ANOPAGAMENTO'
      Origin = 'NR_ANOPAGAMENTO'
      Required = True
    end
    object QComissaoNM_FUNCIONARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_FUNCIONARIO'
      Origin = 'NM_FUNCIONARIO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QComissaoDT_PAGAMENTO: TIntegerField
      FieldName = 'DT_PAGAMENTO'
      Origin = 'DT_PAGAMENTO'
      Required = True
    end
  end
  object TComissao: TJvMemoryData
    FieldDefs = <
      item
        Name = 'PC_COMISSAO'
        DataType = ftFMTBcd
        Precision = 20
        Size = 6
      end
      item
        Name = 'VL_COMISSAO'
        DataType = ftFMTBcd
        Precision = 20
        Size = 6
      end
      item
        Name = 'CD_FUNCIONARIO'
        DataType = ftInteger
      end
      item
        Name = 'TP_PARCELA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NR_MESPAGAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'NR_ANOPAGAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'NM_FUNCIONARIO'
        DataType = ftString
        Size = 50
      end>
    Left = 248
    Top = 184
    object TComissaoVL_COMISSAO: TFMTBCDField
      FieldName = 'VL_COMISSAO'
      Origin = 'VL_COMISSAO'
      DisplayFormat = '#,0.00'
      Precision = 20
      Size = 6
    end
    object TComissaoCD_FUNCIONARIO: TIntegerField
      FieldName = 'CD_FUNCIONARIO'
      Origin = 'CD_FUNCIONARIO'
    end
    object TComissaoNR_MESPAGAMENTO: TIntegerField
      FieldName = 'NR_MESPAGAMENTO'
      Origin = 'NR_MESPAGAMENTO'
    end
    object TComissaoNR_ANOPAGAMENTO: TIntegerField
      FieldName = 'NR_ANOPAGAMENTO'
      Origin = 'NR_ANOPAGAMENTO'
    end
    object TComissaoNM_FUNCIONARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_FUNCIONARIO'
      Origin = 'NM_FUNCIONARIO'
      ProviderFlags = []
      Size = 50
    end
    object TComissaoDT_PAGAMENTO: TIntegerField
      FieldName = 'DT_PAGAMENTO'
    end
  end
  object SComissao: TfrxDBDataset
    UserName = 'SComissao'
    CloseDataSource = False
    DataSet = TComissao
    BCDToCurrency = False
    Left = 320
    Top = 184
  end
end
