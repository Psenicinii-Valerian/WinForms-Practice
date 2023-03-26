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
    Connection = Baza
    SQL.Strings = (
      
        'SELECT *,(SELECT STOCK FROM STOCK SK WHERE SK.PRODUSE_ID=P.PRODU' +
        'SE_ID) AS STOCK_REAL, PRET_INTRARE*STOCK1 AS SUMA,'
      
        'CL.NUME+'#39' '#39'+CL.PRENUME AS CLIENT, O.NUME+ '#39' '#39' + O.PRENUME AS OPE' +
        'RATOR'
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
      'WHERE CEC.CEC_ID = :CEC_ID')
    Left = 152
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
end
