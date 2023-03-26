object DM: TDM
  OldCreateOrder = False
  Height = 532
  Width = 818
  object Baza: TFDConnection
    Params.Strings = (
      'Server=VALERIAN'
      'Database=MAGAZIN'
      'OSAuthent=Yes'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 48
  end
  object QEmitent: TFDQuery
    Connection = Baza
    SQL.Strings = (
      'SELECT * FROM EMITENT')
    Left = 152
    Top = 48
  end
  object QUm: TFDQuery
    Connection = Baza
    SQL.Strings = (
      'SELECT * FROM UNIT_MASURA')
    Left = 152
    Top = 112
  end
  object QProdus: TFDQuery
    Connection = Baza
    SQL.Strings = (
      'SELECT * FROM PRODUSE')
    Left = 152
    Top = 176
  end
  object QReceptie: TFDQuery
    Connection = Baza
    SQL.Strings = (
      
        'SELECT *,(SELECT STOCK FROM STOCK SK WHERE SK.PRODUSE_ID=P.PRODU' +
        'SE_ID) AS STOCK_REAL, PRET_INTRARE*STOCK1 AS SUMA'
      ''
      ''
      ''
      
        'FROM RECEPTIE R INNER JOIN FIRMA_OPERATOR F ON R.FIRMA_OPERATOR_' +
        'ID=F.FIRMA_OPERATOR_ID'
      
        '                         INNER JOIN OPERATOR O ON O.OPERATOR_ID=' +
        'F.OPERATOR_ID'
      
        '                         INNER JOIN PRODUSE P ON P.PRODUSE_ID=R.' +
        'PRODUSE_ID'
      
        '                         INNER JOIN UNIT_MASURA UM ON UM.UNIT_MA' +
        'SURA_ID=R.UNIT_MASURA_ID'
      
        '                         INNER JOIN FACTURA_REC FK ON FK.FACTURA' +
        '_REC_ID=R.FACTURA_REC_ID'
      
        '                         INNER JOIN EMITENT E ON E.EMITENT_ID=FK' +
        '.EMITENT_ID'
      'WHERE FK.FACTURA_REC_ID=:FACTURA_REC_ID')
    Left = 152
    Top = 240
    ParamData = <
      item
        Name = 'FACTURA_REC_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QLiber: TFDQuery
    Connection = Baza
    Left = 72
    Top = 112
  end
  object DSEmitent: TDataSource
    DataSet = QEmitent
    Left = 232
    Top = 48
  end
  object DSUm: TDataSource
    DataSet = QUm
    Left = 232
    Top = 112
  end
  object DSProdus: TDataSource
    DataSet = QProdus
    Left = 232
    Top = 176
  end
  object DSReceptie: TDataSource
    DataSet = QReceptie
    Left = 232
    Top = 240
  end
  object QIdentificare: TFDQuery
    Connection = Baza
    Left = 304
    Top = 48
  end
  object QVanzare: TFDQuery
    Active = True
    Connection = Baza
    SQL.Strings = (
      
        'SELECT D.VALOAREA AS PROCENT, *,(SELECT STOCK FROM STOCK SK WHER' +
        'E SK.PRODUSE_ID=P.PRODUSE_ID) AS STOCK_REAL, PRET_INTRARE*STOCK1' +
        ' AS SUMA,'
      
        'CL.NUME+'#39' '#39'+CL.PRENUME AS CLIENT, O.NUME+ '#39' '#39' + O.PRENUME AS OPE' +
        'RATOR, IIF(VALOAREA<>0, '#39'DISCOUNT '#39' + CAST(VALOAREA AS VARCHAR(5' +
        '))+'#39'%'#39', '#39#39') AS DISCOUNT_TEXT, IIF(VALOAREA<>0, CAST(SUMA_DISC AS' +
        ' VARCHAR(20)), '#39#39') AS DISCOUNT_CIFRA,'
      
        'CAST(DATA_CEC AS DATE) AS DATA_C, CAST(DATA_CEC AS TIME) AS ORA_' +
        'C'
      ''
      
        'FROM RECEPTIE R  INNER JOIN PRODUSE P ON P.PRODUSE_ID=R.PRODUSE_' +
        'ID'
      
        '                 INNER JOIN UNIT_MASURA UM ON UM.UNIT_MASURA_ID=' +
        'R.UNIT_MASURA_ID'
      
        '                 INNER JOIN FACTURA_REC FK ON FK.FACTURA_REC_ID=' +
        'R.FACTURA_REC_ID'
      
        '                 INNER JOIN EMITENT E ON E.EMITENT_ID=FK.EMITENT' +
        '_ID'
      
        '                 INNER JOIN VANZARE V ON V.RECEPTIE_ID = R.RECEP' +
        'TIE_ID'
      '                 INNER JOIN CEC ON CEC.CEC_ID = V.CEC_ID'
      
        '                 INNER JOIN CLIENT CL ON CL.CLIENT_ID = CEC.CLIE' +
        'NT_ID'
      
        '                 INNER JOIN DISCOUNT D ON D.DISCOUNT_ID = CL.DIS' +
        'COUNT_ID'
      
        '                 INNER JOIN FIRMA_OPERATOR F ON CEC.FIRMA_OPERAT' +
        'OR_ID = F.FIRMA_OPERATOR_ID'
      
        '                 INNER JOIN OPERATOR O ON O.OPERATOR_ID = F.OPER' +
        'ATOR_ID'
      '                 INNER JOIN FIRMA FF ON FF.FIRMA_ID = F.FIRMA_ID'
      'WHERE CEC.CEC_ID = :CEC_ID')
    Left = 153
    Top = 304
    ParamData = <
      item
        Name = 'CEC_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object DSVanzare: TDataSource
    DataSet = QVanzare
    Left = 232
    Top = 304
  end
  object PCheck: TFDStoredProc
    Connection = Baza
    StoredProcName = 'MAGAZIN.dbo.CEK'
    Left = 304
    Top = 112
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
      end
      item
        Position = 2
        Name = '@OPER'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = '@CLIENT'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object QCheck: TFDQuery
    Connection = Baza
    SQL.Strings = (
      
        'SELECT C.NUME + '#39' '#39' + C.PRENUME AS CLIENT, SUM(SUMA) AS SUMA, SU' +
        'M(SUMA_DISC) AS DISCOUNT, '
      #9'SUM(SUMA_TOTAL) AS TOTAL, NR_CEC, DATA_CEC, cec.cec_id'
      ''
      'FROM CEC INNER JOIN VANZARE V ON V.CEC_ID = CEC.CEC_ID'
      #9#9' INNER JOIN CLIENT C ON C.CLIENT_ID = CEC.CLIENT_ID'
      '   WHERE CAST(DATA_CEC AS DATE) BETWEEN :D1 AND :D2'
      'GROUP BY C.NUME + '#39' '#39' + C.PRENUME, NR_CEC, DATA_CEC, cec.cec_id')
    Left = 152
    Top = 368
    ParamData = <
      item
        Name = 'D1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'D2'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object DSCheck: TDataSource
    DataSet = QCheck
    Left = 232
    Top = 368
  end
  object frxReport1: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44911.836913402800000000
    ReportOptions.LastChange = 44911.848094918980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 304
    Top = 176
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 279.685220000000000000
          Top = 7.559060000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Check-urile eliberate')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 75.590600000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 102.047310000000000000
          Top = 18.897650000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nr.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 136.063080000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nr. check')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 200.315090000000000000
          Top = 18.897650000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data check')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 272.126160000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Suma check')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 351.496290000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Suma discount')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 445.984540000000000000
          Top = 18.897650000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Suma total')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 517.795610000000000000
          Top = 18.897650000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Client')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo9: TfrxMemoView
          Left = 102.047310000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 136.063080000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'NR_CEC'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."NR_CEC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 200.315090000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'DATA_CEC'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."DATA_CEC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 272.126160000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'SUMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."SUMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 351.496290000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'DISCOUNT'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."DISCOUNT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 445.984540000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'TOTAL'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."TOTAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 517.795610000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'CLIENT'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."CLIENT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = QCheck
    BCDToCurrency = False
    Left = 384
    Top = 176
  end
  object frxReport2: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44911.836913402800000000
    ReportOptions.LastChange = 44911.861253460650000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 304
    Top = 240
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 287.244280000000000000
          Top = 7.559060000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Produsele cumparate')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 75.590600000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 37.795300000000000000
          Top = 18.897650000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nr.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 71.811070000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Cod Produs')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 147.401670000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Produs')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 234.330860000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Cantitate')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 298.582870000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Cost')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 362.834880000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Suma')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 419.527830000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Discount')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 495.118430000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Suma Discount')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 589.606680000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Suma total')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        Stretched = True
        object Memo9: TfrxMemoView
          Left = 37.795300000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 71.811070000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'COD_PRODUS'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."COD_PRODUS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 147.401670000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'DENUMIRE'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."DENUMIRE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 234.330860000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'CANTITATEA'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."CANTITATEA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 298.582870000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'PRET_INTRARE'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."PRET_INTRARE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 362.834880000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'SUMA'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."SUMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 419.527830000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'PROCENT'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."PROCENT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 495.118430000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'SUMA_DISC'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."SUMA_DISC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 589.606680000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'SUMA_TOTAL'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."SUMA_TOTAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = QVanzare
    BCDToCurrency = False
    Left = 384
    Top = 240
  end
  object frxCheck: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44914.795061863400000000
    ReportOptions.LastChange = 44914.799142245400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxCheckGetValue
    Left = 304
    Top = 304
    Datasets = <
      item
        DataSet = DBCheck
        DataSetName = 'frxDBDataset3'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'TOTAL'
        Value = Null
      end
      item
        Name = 'TVA'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      PaperWidth = 60.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 1.000000000000000000
      RightMargin = 3.000000000000000000
      TopMargin = 1.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 211.653680000000000000
        object frxDBDataset3NUME_4: TfrxMemoView
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          DataField = 'NUME_4'
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset3."NUME_4"]')
          ParentFont = False
        end
        object frxDBDataset3ADRESA: TfrxMemoView
          Top = 22.677180000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          DataField = 'ADRESA'
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset3."ADRESA"]')
          ParentFont = False
        end
        object frxDBDataset3COD_FISCAL: TfrxMemoView
          Top = 41.574830000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          DataField = 'COD_FISCAL'
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset3."COD_FISCAL"]')
          ParentFont = False
        end
        object frxDBDataset3NUME_3: TfrxMemoView
          Top = 64.252010000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haCenter
          Memo.UTF8W = (
            'OPERATOR:')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 83.149660000000000000
          Top = 64.252010000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."NUME_3"]  [frxDBDataset3."PRENUME_1"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 71.811070000000000000
        ParentFont = False
        Top = 166.299320000000000000
        Width = 211.653680000000000000
        DataSet = DBCheck
        DataSetName = 'frxDBDataset3'
        RowCount = 0
        object frxDBDataset3DENUMIRE: TfrxMemoView
          Top = 15.118120000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataField = 'DENUMIRE'
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8W = (
            '[frxDBDataset3."DENUMIRE"]')
          ParentFont = False
        end
        object frxDBDataset3PRET_VANZ: TfrxMemoView
          Left = 143.622140000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."CANTITATEA"] X [frxDBDataset3."PRET_VANZ"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object frxDBDataset3SUMA: TfrxMemoView
          Left = 151.181200000000000000
          Top = 15.118120000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."SUMA"] A')
          ParentFont = False
        end
        object frxDBDataset3DISCOUNT_TEXT: TfrxMemoView
          Top = 34.015770000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset3."DISCOUNT_TEXT"]')
          ParentFont = False
        end
        object frxDBDataset3DISCOUNT_CIFRA: TfrxMemoView
          Left = 151.181200000000000000
          Top = 34.015770000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'DISCOUNT_CIFRA'
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."DISCOUNT_CIFRA"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 52.913420000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'TOTAL')
          ParentFont = False
        end
        object frxDBDataset3SUMA_TOTAL: TfrxMemoView
          Left = 151.181200000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'SUMA_TOTAL'
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."SUMA_TOTAL"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 102.047310000000000000
        Top = 298.582870000000000000
        Width = 211.653680000000000000
        object Line1: TfrxLineView
          Top = 1.779530000000000000
          Width = 211.653680000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Top = 20.897650000000000000
          Width = 211.653680000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'A =0.08%')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 177.637910000000000000
          Top = 3.779530000000000000
          Width = 34.015770000000000000
          Height = 15.118120000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TVA]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Top = 22.677180000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'TOTAL')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 56.692950000000000000
          Top = 22.677180000000000000
          Width = 154.960730000000000000
          Height = 15.118120000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[TOTAL]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 55.692950000000000000
          Top = 41.574830000000000000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VA MULTUMIM !!!')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Top = 56.692950000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'DATA: ')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 41.574830000000000000
          Top = 56.692950000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset3."DATA_C"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 128.504020000000000000
          Top = 56.692950000000000000
          Width = 34.015770000000000000
          Height = 15.118120000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'ORA: ')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 162.519790000000000000
          Top = 56.692950000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."ORA_C"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Top = 71.811070000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'BON FISCAL')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 79.370130000000000000
          Top = 71.811070000000000000
          Width = 132.283550000000000000
          Height = 15.118120000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."NR_CEC"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Top = 86.929190000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '4534312373')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 113.385900000000000000
          Top = 86.929190000000000000
          Width = 98.267780000000000000
          Height = 15.118120000000000000
          DataSet = DBCheck
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '00004534312373')
          ParentFont = False
        end
      end
    end
  end
  object DBCheck: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    DataSet = QVanzare
    BCDToCurrency = False
    Left = 384
    Top = 304
  end
  object QAutentificare: TFDQuery
    Connection = Baza
    SQL.Strings = (
      
        'SELECT *, O.NUME + '#39' '#39' + O.PRENUME AS OPERATOR FROM FIRMA F INNE' +
        'R JOIN FIRMA_OPERATOR FO ON F.FIRMA_ID = FO.FIRMA_ID'
      #9#9#9#9#9'  INNER JOIN OPERATOR O ON O.OPERATOR_ID = FO.OPERATOR_ID'
      
        #9#9#9#9#9'  WHERE O.USERNAME = :USERNAME AND O.PASS =:PASS AND F.NUME' +
        ' = :FIRMA')
    Left = 152
    Top = 432
    ParamData = <
      item
        Name = 'USERNAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PASS'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FIRMA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
