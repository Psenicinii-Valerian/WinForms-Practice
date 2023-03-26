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
  object Qclient: TFDQuery
    Connection = Baza
    SQL.Strings = (
      'SELECT NUME + '#39' '#39' + PRENUME AS CLIENT, * FROM CLIENT'
      'ORDER BY NUME')
    Left = 384
    Top = 256
  end
  object FDQuery2: TFDQuery
    Connection = Baza
    Left = 384
    Top = 312
  end
  object DSQclient: TDataSource
    DataSet = Qclient
    Left = 456
    Top = 256
  end
  object DataSource2: TDataSource
    Left = 456
    Top = 312
  end
  object Client_ins: TFDQuery
    Connection = Baza
    SQL.Strings = (
      
        'INSERT INTO CLIENT(NUME, PRENUME, DATA_NASTERII, IDNP, TELEFON, ' +
        'ADRESA)'
      
        'VALUES(:NUME, :PRENUME, :DATA_NASTERII, :IDNP, :TELEFON, :ADRESA' +
        ')')
    Left = 552
    Top = 72
    ParamData = <
      item
        Name = 'NUME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PRENUME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_NASTERII'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDNP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TELEFON'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ADRESA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object Client_upd: TFDQuery
    Connection = Baza
    SQL.Strings = (
      
        'UPDATE CLIENT SET NUME=:NUME, PRENUME=:PRENUME, DATA_NASTERII=:D' +
        'ATA_NASTERII, '
      #9#9#9#9'  IDNP=:IDNP, TELEFON=:TELEFON, ADRESA=:ADRESA'
      #9'WHERE CLIENT_ID = :CLIENT_ID')
    Left = 608
    Top = 72
    ParamData = <
      item
        Name = 'NUME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PRENUME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_NASTERII'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDNP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TELEFON'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ADRESA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CLIENT_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object Client_del: TFDQuery
    Connection = Baza
    SQL.Strings = (
      'DELETE CLIENT'
      #9'WHERE CLIENT_ID = :CLIENT_ID')
    Left = 664
    Top = 72
    ParamData = <
      item
        Name = 'CLIENT_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
