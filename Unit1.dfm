object Form1: TForm1
  Left = 230
  Top = 160
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Primfaktoren'
  ClientHeight = 646
  ClientWidth = 894
  Color = clBtnFace
  Constraints.MinHeight = 605
  Constraints.MinWidth = 902
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    894
    646)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 399
    Height = 16
    Caption = 
      'Gib hier eine Zahl ein um Sie in die Primfaktoren zerlegen zu la' +
      'ssen.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 519
    Top = 42
    Width = 6
    Height = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 584
    Top = 560
    Width = 122
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Gefundene Faktoren'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 584
    Top = 576
    Width = 95
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'H'#246'chster Faktor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label111: TLabel
    Left = 720
    Top = 576
    Width = 3
    Height = 16
    Anchors = [akTop, akRight]
    Caption = ' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label3: TLabel
    Left = 584
    Top = 464
    Width = 114
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Aktuelle pot. Faktor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label120: TLabel
    Left = 720
    Top = 464
    Width = 3
    Height = 16
    Anchors = [akTop, akRight]
    Caption = ' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label4: TLabel
    Left = 584
    Top = 496
    Width = 57
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Rest Zahl'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label130: TLabel
    Left = 719
    Top = 495
    Width = 3
    Height = 16
    Anchors = [akTop, akRight]
    Caption = ' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    WordWrap = True
  end
  object Label6: TLabel
    Left = 584
    Top = 528
    Width = 75
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Wurzel(Zahl)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label132: TLabel
    Left = 720
    Top = 528
    Width = 3
    Height = 16
    Anchors = [akTop, akRight]
    Caption = ' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label8: TLabel
    Left = 584
    Top = 608
    Width = 77
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Schritte pro s'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label140: TLabel
    Left = 720
    Top = 608
    Width = 3
    Height = 16
    Anchors = [akTop, akRight]
    Caption = ' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label9: TLabel
    Left = 607
    Top = 440
    Width = 187
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Wenn Fermat Pseudo Primzahl dann rot'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label110: TLabel
    Left = 720
    Top = 560
    Width = 3
    Height = 16
    Anchors = [akTop, akRight]
    Caption = ' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label10: TLabel
    Left = 584
    Top = 624
    Width = 104
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Ben'#246'tigte Schritte'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label150: TLabel
    Left = 720
    Top = 624
    Width = 3
    Height = 16
    Anchors = [akTop, akRight]
    Caption = ' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object LNowProbierverfahren: TLabel
    Left = 632
    Top = 32
    Width = 100
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Probierverfahren'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LNowPollard: TLabel
    Left = 632
    Top = 56
    Width = 129
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Pollard-Rho-Methode'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 8
    Top = 40
    Width = 385
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '0'
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 400
    Top = 32
    Width = 105
    Height = 41
    Caption = 'Start'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
    OnKeyDown = FormKeyDown
  end
  object JvOutlookBar1: TJvOutlookBar
    Left = 615
    Top = 160
    Width = 210
    Height = 265
    Pages = <
      item
        Buttons = <
          item
            Caption = 'Eine sehr gro'#223'e'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain0Button0
          end
          item
            Caption = '20 x  5 Stellig'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain0Button5
          end
          item
            Caption = '20 x  10 Stellig'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain0Button2
          end
          item
            Caption = '20 x  15 Stellig'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain0Button3
          end
          item
            Caption = '100 Stellig - Extra viele Faktoren'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain0Button4
          end>
        ButtonSize = olbsLarge
        Caption = 'Zufallszahlen'
        DownFont.Charset = DEFAULT_CHARSET
        DownFont.Color = clWindowText
        DownFont.Height = -11
        DownFont.Name = 'MS Sans Serif'
        DownFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        TopButtonIndex = 0
      end
      item
        Buttons = <
          item
            Caption = 'Primzahlbereich auflisten'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain1Button0
          end
          item
            Caption = 'zuf'#228'llige Primzahlen finden'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain1Button1
          end
          item
            Caption = 'Primorial bilden'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBar1Pages1Buttons2Click
          end>
        ButtonSize = olbsLarge
        Caption = 'Primzahlen'
        DownFont.Charset = DEFAULT_CHARSET
        DownFont.Color = clWindowText
        DownFont.Height = -11
        DownFont.Name = 'MS Sans Serif'
        DownFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        TopButtonIndex = 0
      end
      item
        Buttons = <
          item
            Caption = 'GGT  (Gr'#246#223'ter gemeinsamer Teiler)'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain2Button0
          end
          item
            Caption = 'KGV  (kleinstes gemeinsames Vielfaches)'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain2Button1
          end
          item
            Caption = 'Liste perfekte Zahlen auf'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain2Button2
          end
          item
            Caption = 'Fibbonacci-Zahlen'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain2Button3
          end
          item
            Caption = 'Goldener Schnitt'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain2Button4
          end
          item
            Caption = 'Fakult'#228't berechnen'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain2Button5
          end
          item
            Caption = 'Fakult'#228't zerlegen lassen'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBar1Pages2Buttons6Click
          end
          item
            Caption = 'Fakulat'#228'ten zerlegen lassen'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain2Button6
          end>
        ButtonSize = olbsLarge
        Caption = 'Mathematisches'
        DownFont.Charset = DEFAULT_CHARSET
        DownFont.Color = clWindowText
        DownFont.Height = -11
        DownFont.Name = 'MS Sans Serif'
        DownFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        TopButtonIndex = 0
      end
      item
        Buttons = <
          item
            Caption = 'L'#252'gende Pseudo Primzahlen aufsp'#252'ren'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain3Button0
          end
          item
            Caption = 'Startwerte bei der Pollard-Rho Methode'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain3Button1
          end
          item
            Caption = 'Fermat + Euler  <--->  GGT'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain3Button2
          end
          item
            Caption = 'Fermat  <--->  Euler'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain3Button3
          end
          item
            Caption = 'Primfaktorzerlegung  mit und ohne Primarray'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain3Button4
          end>
        ButtonSize = olbsLarge
        Caption = 'Untersuchungen'
        DownFont.Charset = DEFAULT_CHARSET
        DownFont.Color = clWindowText
        DownFont.Height = -11
        DownFont.Name = 'MS Sans Serif'
        DownFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        TopButtonIndex = 0
      end
      item
        Buttons = <
          item
            Caption = 'Eine Quadratische Formel testen'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain4Button0
          end
          item
            Caption = 'Zuf'#228'llige quadratische Formeln testen'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain4Button1
          end
          item
            Caption = 'Alle quadratische Formeln durchtesten'
            ImageIndex = 0
            Tag = 0
            AutoToggle = False
            OnClick = JvOutlookBarMain4Button2
          end>
        ButtonSize = olbsLarge
        Caption = 'Quadratische Primzahlformeln'
        DownFont.Charset = DEFAULT_CHARSET
        DownFont.Color = clWindowText
        DownFont.Height = -11
        DownFont.Name = 'MS Sans Serif'
        DownFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        TopButtonIndex = 0
      end>
    ActivePageIndex = 4
    Anchors = [akTop, akRight]
    TabOrder = 2
  end
  object CheckDetail: TCheckBox
    Left = 626
    Top = 112
    Width = 161
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Detailierte Ausgabe'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = CheckDetailClick
    OnKeyDown = FormKeyDown
  end
  object JvImgBtn1: TJvImgBtn
    Left = 816
    Top = 8
    Width = 75
    Height = 75
    Anchors = [akTop, akRight]
    Caption = 'Info'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = JvImgBtn1Click
    OnKeyDown = FormKeyDown
    Color = clLime
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -32
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object StringGrid1: TStringGrid
    Left = 1
    Top = 79
    Width = 577
    Height = 562
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 4
    DefaultRowHeight = 19
    FixedCols = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
    ParentFont = False
    TabOrder = 5
    OnKeyDown = FormKeyDown
    OnMouseUp = StringGrid1MouseUp
    ColWidths = (
      303
      242
      64
      64)
  end
  object CheckPrimeArray: TCheckBox
    Left = 626
    Top = 88
    Width = 161
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Primearray benutzen'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 6
    OnClick = CheckPrimeArrayClick
    OnKeyDown = FormKeyDown
  end
  object BVorausberechnung: TButton
    Left = 776
    Top = 88
    Width = 97
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Vorausberechnung'
    TabOrder = 7
    OnClick = BVorausberechnungClick
    OnKeyDown = FormKeyDown
  end
  object PopupMenu1: TPopupMenu
    Left = 248
    Top = 424
    object abelleinDateispeichern1: TMenuItem
      Caption = 'Tabelle in Datei speichern'
      ShortCut = 16467
      OnClick = abelleinDateispeichern1Click
    end
    object N1: TMenuItem
      Caption = ' '
    end
    object NormaleSpaltenbreite1: TMenuItem
      Caption = 'Normale Spaltenbreite'
      OnClick = NormaleSpaltenbreite1Click
    end
    object GleichgroeSpaltenbreite1: TMenuItem
      Caption = 'Gleich gro'#223'e Spaltenbreite'
      OnClick = GleichgroeSpaltenbreite1Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'csv|*.csv|Alle Dateien|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Speichern der Tabelle in eine Txt Datei'
    OnCanClose = SaveDialog1CanClose
    Left = 288
    Top = 424
  end
end
