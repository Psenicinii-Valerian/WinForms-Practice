object FRECEPTIE: TFRECEPTIE
  Left = 0
  Top = 0
  Caption = 'FRECEPTIE'
  ClientHeight = 512
  ClientWidth = 903
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 903
    Height = 49
    Align = alTop
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 903
    Height = 463
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 901
      Height = 461
      ActivePage = FACTURA
      Align = alClient
      TabOrder = 0
      object FACTURA: TTabSheet
        Caption = 'FACTURA'
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 893
          Height = 49
          Align = alTop
          TabOrder = 0
          object B_IDENTIFICA: TSpeedButton
            Left = 755
            Top = 9
            Width = 131
            Height = 30
            Caption = 'CREAZA FACTURA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = B_IDENTIFICAClick
          end
          object SpeedButton19: TSpeedButton
            Left = 718
            Top = 12
            Width = 31
            Height = 26
            Caption = '...'
            OnClick = SpeedButton19Click
          end
          object NR_F: TEdit
            Left = 10
            Top = 13
            Width = 116
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            TextHint = 'SERIA-NR FACTURA'
          end
          object DATA_F: TDateTimePicker
            Left = 134
            Top = 13
            Width = 113
            Height = 24
            Date = 44883.832934479160000000
            Time = 44883.832934479160000000
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 1
          end
          object EMITENT_F: TEdit
            Left = 253
            Top = 13
            Width = 459
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            TextHint = 'EMITENT'
            OnKeyPress = EMITENT_FKeyPress
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 49
          Width = 257
          Height = 384
          Align = alLeft
          TabOrder = 1
          object PageControl4: TPageControl
            Left = 1
            Top = 1
            Width = 255
            Height = 382
            ActivePage = MAIN_F
            Align = alClient
            TabHeight = 1
            TabOrder = 0
            TabPosition = tpBottom
            object MAIN_F: TTabSheet
              object BINREG_F: TSpeedButton
                Left = 56
                Top = 32
                Width = 121
                Height = 41
                Caption = 'INREGISTREAZA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = BINREG_FClick
              end
              object BANULEAZA_F: TSpeedButton
                Left = 56
                Top = 126
                Width = 121
                Height = 41
                Caption = 'ELIMINA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = BANULEAZA_FClick
              end
              object BURM_F: TSpeedButton
                Left = 6
                Top = 247
                Width = 238
                Height = 41
                Caption = 'URMATOAREA FACTURA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = BURM_FClick
              end
              object SpeedButton14: TSpeedButton
                Left = 56
                Top = 79
                Width = 121
                Height = 41
                Caption = 'EDITEAZA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = SpeedButton14Click
              end
            end
            object INREG_F: TTabSheet
              ImageIndex = 1
              object SpeedButton10: TSpeedButton
                Left = 212
                Top = 5
                Width = 35
                Height = 27
                Caption = '...'
                OnClick = SpeedButton10Click
              end
              object SpeedButton11: TSpeedButton
                Left = 211
                Top = 38
                Width = 35
                Height = 27
                Caption = '...'
                OnClick = SpeedButton11Click
              end
              object SpeedButton20: TSpeedButton
                Left = 48
                Top = 168
                Width = 137
                Height = 41
                Caption = 'INREGISTREAZA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = SpeedButton20Click
              end
              object SpeedButton21: TSpeedButton
                Left = 48
                Top = 262
                Width = 137
                Height = 41
                Caption = 'ANULEAZA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = SpeedButton21Click
              end
              object SpeedButton28: TSpeedButton
                Left = 48
                Top = 215
                Width = 137
                Height = 41
                Caption = 'EDITEAZA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = SpeedButton28Click
              end
              object PRODUS_F: TEdit
                Left = 1
                Top = 8
                Width = 205
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                TextHint = 'PRODUS'
                OnKeyPress = EMITENT_FKeyPress
              end
              object UM_F: TEdit
                Left = 0
                Top = 38
                Width = 205
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                TextHint = 'UNITATEA DE MASURA'
                OnKeyPress = EMITENT_FKeyPress
              end
              object COST_F: TEdit
                Left = 0
                Top = 68
                Width = 113
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                TextHint = 'COST'
              end
              object TVA_F: TEdit
                Left = 134
                Top = 71
                Width = 113
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                TextHint = 'TVA'
              end
              object CANTITATE_F: TEdit
                Left = 0
                Top = 104
                Width = 113
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
                TextHint = 'CANTITATE'
              end
              object PRET_F: TEdit
                Left = 134
                Top = 104
                Width = 113
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 5
                TextHint = 'PRET VANZARE'
              end
            end
            object EDIT_F: TTabSheet
              ImageIndex = 2
              object SpeedButton9: TSpeedButton
                Left = 212
                Top = 13
                Width = 35
                Height = 27
                Caption = '...'
                OnClick = SpeedButton10Click
              end
              object SpeedButton13: TSpeedButton
                Left = 212
                Top = 47
                Width = 35
                Height = 26
                Caption = '...'
                OnClick = SpeedButton11Click
              end
              object SpeedButton22: TSpeedButton
                Left = 3
                Top = 168
                Width = 113
                Height = 41
                Caption = 'EDITEAZA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = SpeedButton22Click
              end
              object SpeedButton23: TSpeedButton
                Left = 136
                Top = 168
                Width = 110
                Height = 41
                Caption = 'ANULEAZA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = SpeedButton23Click
              end
              object PRODUS_FF: TEdit
                Left = 3
                Top = 16
                Width = 209
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                TextHint = 'PRODUS'
              end
              object UM_FF: TEdit
                Left = 3
                Top = 46
                Width = 209
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                TextHint = 'UNITATEA DE MASURA'
              end
              object COST_FF: TEdit
                Left = 3
                Top = 82
                Width = 113
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                TextHint = 'COST'
              end
              object TVA_FF: TEdit
                Left = 134
                Top = 79
                Width = 112
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                TextHint = 'TVA'
              end
              object CANTITATE_FF: TEdit
                Left = 3
                Top = 112
                Width = 113
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
                TextHint = 'CANTITATE'
              end
              object PRET_FF: TEdit
                Left = 134
                Top = 112
                Width = 112
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 5
                TextHint = 'PRET VANZARE'
              end
            end
            object GOL_F: TTabSheet
              ImageIndex = 3
            end
          end
        end
        object Panel9: TPanel
          Left = 257
          Top = 49
          Width = 636
          Height = 384
          Align = alClient
          TabOrder = 2
          object DBGrid4: TDBGrid
            Left = 1
            Top = 1
            Width = 634
            Height = 382
            Align = alClient
            DataSource = DM.DSReceptie
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
                FieldName = 'COD_PRODUS'
                Title.Alignment = taCenter
                Title.Caption = 'COD'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DENUMIRE'
                Title.Alignment = taCenter
                Title.Caption = 'PRODUS'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 143
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ABREVIERE'
                Title.Alignment = taCenter
                Title.Caption = 'UM'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STOCK1'
                Title.Alignment = taCenter
                Title.Caption = 'STOC'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRET_INTRARE'
                Title.Alignment = taCenter
                Title.Caption = 'PRET UN.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SUMA'
                Title.Alignment = taCenter
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 57
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TVA'
                Title.Alignment = taCenter
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 38
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DENUMIRE_1'
                Title.Alignment = taCenter
                Title.Caption = 'EMITENT'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 407
                Visible = True
              end>
          end
        end
      end
      object PRODUS: TTabSheet
        Caption = 'PRODUS'
        ImageIndex = 1
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 257
          Height = 433
          Align = alLeft
          TabOrder = 0
          object PageControl3: TPageControl
            Left = 1
            Top = 1
            Width = 255
            Height = 431
            ActivePage = MAIN_P
            Align = alClient
            TabOrder = 0
            object MAIN_P: TTabSheet
              Caption = 'MAIN'
              object SpeedButton1: TSpeedButton
                Left = 48
                Top = 96
                Width = 137
                Height = 41
                Caption = 'SELECTEAZA'
                OnClick = SpeedButton1Click
              end
              object SpeedButton2: TSpeedButton
                Left = 48
                Top = 143
                Width = 137
                Height = 41
                Caption = 'ANULEAZA'
                OnClick = SpeedButton2Click
              end
              object SpeedButton6: TSpeedButton
                Left = 48
                Top = 264
                Width = 137
                Height = 41
                Caption = 'INREGISTREAZA'
              end
              object SpeedButton7: TSpeedButton
                Left = 48
                Top = 311
                Width = 137
                Height = 41
                Caption = 'EDITEAZA'
              end
              object SpeedButton8: TSpeedButton
                Left = 48
                Top = 358
                Width = 137
                Height = 41
                Caption = 'ELIMINA'
              end
              object GroupBox1: TGroupBox
                Left = 5
                Top = 3
                Width = 241
                Height = 85
                Caption = 'IDENTIFICARE PRODUS'
                TabOrder = 0
                object RB1: TRadioButton
                  Left = 13
                  Top = 24
                  Width = 86
                  Height = 17
                  Caption = 'DENUMIRE'
                  Checked = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  TabStop = True
                  OnClick = RB1Click
                end
                object RB2: TRadioButton
                  Left = 141
                  Top = 24
                  Width = 49
                  Height = 17
                  Caption = 'COD'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                  OnClick = RB2Click
                end
                object EPROD: TEdit
                  Left = 13
                  Top = 47
                  Width = 216
                  Height = 24
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                  TextHint = 'DENUMIRE'
                  OnChange = EPRODChange
                end
              end
            end
            object INS_P: TTabSheet
              Caption = 'INREGISTRARE'
              ImageIndex = 1
            end
            object EDIT_P: TTabSheet
              Caption = 'EDITARE'
              ImageIndex = 2
            end
          end
        end
        object Panel6: TPanel
          Left = 257
          Top = 0
          Width = 636
          Height = 433
          Align = alClient
          TabOrder = 1
          object DBGrid2: TDBGrid
            Left = 1
            Top = 1
            Width = 634
            Height = 431
            Align = alClient
            DataSource = DM.DSProdus
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'COD_PRODUS'
                Title.Alignment = taCenter
                Title.Caption = 'COD'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 113
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DENUMIRE'
                Title.Alignment = taCenter
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 139
                Visible = True
              end
              item
                Expanded = False
                Title.Alignment = taCenter
                Width = 374
                Visible = True
              end>
          end
        end
      end
      object UM: TTabSheet
        Caption = 'UM'
        ImageIndex = 2
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 257
          Height = 433
          Align = alLeft
          TabOrder = 0
          object PageControl2: TPageControl
            Left = 1
            Top = 1
            Width = 255
            Height = 431
            ActivePage = MAIN_UM
            Align = alClient
            TabOrder = 0
            object MAIN_UM: TTabSheet
              Caption = 'MAIN'
              object BSELECTEAZA_UM: TSpeedButton
                Left = 48
                Top = 32
                Width = 137
                Height = 41
                Caption = 'SELECTEAZA'
                OnClick = BSELECTEAZA_UMClick
              end
              object BANULEAZA_UM: TSpeedButton
                Left = 48
                Top = 79
                Width = 137
                Height = 41
                Caption = 'ANULEAZA'
              end
              object SpeedButton3: TSpeedButton
                Left = 48
                Top = 208
                Width = 137
                Height = 41
                Caption = 'INREGISTREAZA'
              end
              object SpeedButton4: TSpeedButton
                Left = 48
                Top = 255
                Width = 137
                Height = 41
                Caption = 'EDITEAZA'
              end
              object SpeedButton5: TSpeedButton
                Left = 48
                Top = 302
                Width = 137
                Height = 41
                Caption = 'ELIMINA'
              end
            end
            object INS_UM: TTabSheet
              Caption = 'INREGISTRARE'
              ImageIndex = 1
            end
            object EDIT_UM: TTabSheet
              Caption = 'EDITARE'
              ImageIndex = 2
            end
          end
        end
        object Panel4: TPanel
          Left = 257
          Top = 0
          Width = 636
          Height = 433
          Align = alClient
          TabOrder = 1
          object DBGrid1: TDBGrid
            Left = 1
            Top = 1
            Width = 634
            Height = 431
            Align = alClient
            DataSource = DM.DSUm
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NUME'
                Title.Alignment = taCenter
                Title.Caption = 'DENUMIRE'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 113
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ABREVIERE'
                Title.Alignment = taCenter
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 113
                Visible = True
              end
              item
                Expanded = False
                Title.Alignment = taCenter
                Width = 374
                Visible = True
              end>
          end
        end
      end
      object EMITENT: TTabSheet
        Caption = 'EMITENT'
        ImageIndex = 3
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 257
          Height = 433
          Align = alLeft
          TabOrder = 0
          object PageControl5: TPageControl
            Left = 1
            Top = 1
            Width = 255
            Height = 431
            ActivePage = TabSheet3
            Align = alClient
            TabOrder = 0
            object TabSheet1: TTabSheet
              Caption = 'MAIN'
              object SpeedButton12: TSpeedButton
                Left = 48
                Top = 32
                Width = 137
                Height = 41
                Caption = 'SELECTEAZA'
                OnClick = SpeedButton12Click
              end
              object SpeedButton15: TSpeedButton
                Left = 48
                Top = 79
                Width = 137
                Height = 41
                Caption = 'ANULEAZA'
                OnClick = SpeedButton15Click
              end
              object SpeedButton16: TSpeedButton
                Left = 48
                Top = 208
                Width = 137
                Height = 41
                Caption = 'INREGISTREAZA'
                OnClick = SpeedButton16Click
              end
              object SpeedButton17: TSpeedButton
                Left = 48
                Top = 255
                Width = 137
                Height = 41
                Caption = 'EDITEAZA'
                OnClick = SpeedButton17Click
              end
              object SpeedButton18: TSpeedButton
                Left = 48
                Top = 302
                Width = 137
                Height = 41
                Caption = 'ELIMINA'
                OnClick = SpeedButton18Click
              end
            end
            object TabSheet2: TTabSheet
              Caption = 'INREGISTRARE'
              ImageIndex = 1
              object SpeedButton24: TSpeedButton
                Left = 16
                Top = 296
                Width = 97
                Height = 41
                Caption = 'INREGISTREAZA'
                OnClick = SpeedButton24Click
              end
              object SpeedButton25: TSpeedButton
                Left = 126
                Top = 296
                Width = 99
                Height = 41
                Caption = 'ANULEAZA'
                OnClick = SpeedButton25Click
              end
              object Edit1: TEdit
                Left = 16
                Top = 40
                Width = 209
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                TextHint = 'DENUMIRE'
              end
              object Edit2: TEdit
                Left = 16
                Top = 94
                Width = 209
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                TextHint = 'IDNO'
              end
              object Edit3: TEdit
                Left = 16
                Top = 142
                Width = 209
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                TextHint = 'ADRESA'
              end
            end
            object TabSheet3: TTabSheet
              Caption = 'EDITARE'
              ImageIndex = 2
              object SpeedButton26: TSpeedButton
                Left = 16
                Top = 296
                Width = 97
                Height = 41
                Caption = 'EDITEAZA'
                OnClick = SpeedButton26Click
              end
              object SpeedButton27: TSpeedButton
                Left = 134
                Top = 296
                Width = 99
                Height = 41
                Caption = 'ANULEAZA'
                OnClick = SpeedButton27Click
              end
              object Edit4: TEdit
                Left = 16
                Top = 40
                Width = 209
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                TextHint = 'DENUMIRE'
              end
              object Edit5: TEdit
                Left = 16
                Top = 94
                Width = 209
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                TextHint = 'IDNO'
              end
              object Edit6: TEdit
                Left = 16
                Top = 142
                Width = 209
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                TextHint = 'ADRESA'
              end
            end
          end
        end
        object Panel11: TPanel
          Left = 257
          Top = 0
          Width = 636
          Height = 433
          Align = alClient
          TabOrder = 1
          object DBGrid3: TDBGrid
            Left = 1
            Top = 1
            Width = 634
            Height = 431
            Align = alClient
            DataSource = DM.DSEmitent
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'DENUMIRE'
                Title.Alignment = taCenter
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 318
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IDNO'
                Title.Alignment = taCenter
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 93
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ADRESA'
                Title.Alignment = taCenter
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 565
                Visible = True
              end>
          end
        end
      end
    end
  end
end
