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
        'SE_ID) AS STOCK_REAL'
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
end
