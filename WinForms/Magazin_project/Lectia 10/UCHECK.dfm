object FCheck: TFCheck
  Left = 0
  Top = 0
  Caption = 'FCheck'
  ClientHeight = 483
  ClientWidth = 879
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 879
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 24
      Top = 18
      Width = 49
      Height = 13
      Caption = 'De la data'
    end
    object Label3: TLabel
      Left = 248
      Top = 21
      Width = 60
      Height = 13
      Caption = 'Pana la data'
    end
    object SpeedButton1: TSpeedButton
      Left = 612
      Top = 29
      Width = 89
      Height = 36
      Caption = 'Cautare'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 720
      Top = 29
      Width = 89
      Height = 36
      Caption = 'Raport'
      OnClick = SpeedButton2Click
    end
    object DateTimePicker1: TDateTimePicker
      Left = 24
      Top = 40
      Width = 186
      Height = 21
      Date = 44911.795946134260000000
      Time = 44911.795946134260000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 248
      Top = 40
      Width = 186
      Height = 21
      Date = 44911.795946134260000000
      Time = 44911.795946134260000000
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 879
    Height = 369
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 877
      Height = 367
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 6
      object TabSheet1: TTabSheet
        Caption = 'TOTALIZAT'
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 869
          Height = 339
          Align = alClient
          DataSource = DM.DSCheck
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = DBGrid2DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'NR_CEC'
              Title.Alignment = taCenter
              Title.Caption = 'Nr'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_CEC'
              Title.Alignment = taCenter
              Title.Caption = 'Data check'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 156
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMA'
              Title.Alignment = taCenter
              Title.Caption = 'Suma cec'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 160
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DISCOUNT'
              Title.Alignment = taCenter
              Title.Caption = 'Suma reducere'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 163
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TOTAL'
              Title.Alignment = taCenter
              Title.Caption = 'Suma total'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 125
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CLIENT'
              Title.Alignment = taCenter
              Title.Caption = 'Client'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 169
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'DETALIZAT'
        ImageIndex = 1
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 869
          Height = 339
          Align = alClient
          DataSource = DM.DSVanzare
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              Title.Alignment = taCenter
              Title.Caption = 'Nr'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'COD_PRODUS'
              Title.Alignment = taCenter
              Title.Caption = 'Cod Produs'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 99
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DENUMIRE'
              Title.Alignment = taCenter
              Title.Caption = 'Produs'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 249
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CANTITATEA'
              Title.Alignment = taCenter
              Title.Caption = 'Cant.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 46
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PRET_VANZ'
              Title.Alignment = taCenter
              Title.Caption = 'Cost'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 74
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SUMA'
              Title.Alignment = taCenter
              Title.Caption = 'Suma'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 76
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PROCENT'
              Title.Alignment = taCenter
              Title.Caption = 'Discount'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 71
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SUMA_DISC'
              Title.Alignment = taCenter
              Title.Caption = 'Suma Disc.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 86
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SUMA_TOTAL'
              Title.Alignment = taCenter
              Title.Caption = 'Suma total'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 90
              Visible = True
            end>
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 442
    Width = 879
    Height = 41
    Align = alBottom
    Caption = 'Panel3'
    TabOrder = 2
  end
end
