object DM: TDM
  OldCreateOrder = False
  Height = 525
  Width = 890
  object Baza: TFDConnection
    Params.Strings = (
      'DataSource=Clinica'
      'DriverID=ODBC')
    Connected = True
    LoginPrompt = False
    Left = 312
    Top = 128
  end
  object Qfirma: TFDQuery
    Connection = Baza
    SQL.Strings = (
      'Select * from FILIALA')
    Left = 384
    Top = 128
  end
  object DSQfirma: TDataSource
    DataSet = Qfirma
    Left = 456
    Top = 128
  end
  object Qmedic: TFDQuery
    Connection = Baza
    SQL.Strings = (
      
        'SELECT NUME+'#39' '#39'+PRENUME AS MEDIC,*'#10'FROM MEDIC M INNER JOIN MEDIC' +
        '_FILIALA MF ON MF.MEDIC_ID=M.MEDIC_ID'#10'             INNER JOIN FI' +
        'LIALA F ON F.FILIALA_ID=MF.FILIALA_ID')
    Left = 384
    Top = 192
  end
  object DSQmedic: TDataSource
    DataSet = Qmedic
    Left = 456
    Top = 192
  end
end
