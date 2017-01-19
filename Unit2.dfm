object Form2: TForm2
  Left = 308
  Top = 191
  AutoSize = True
  Caption = 'Form2'
  ClientHeight = 505
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object TabSheetControl: TPageControl
    Left = 0
    Top = 0
    Width = 705
    Height = 505
    ActivePage = Information
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Information: TTabSheet
      Caption = 'Information'
      object Memo1: TMemo
        Left = 0
        Top = 4
        Width = 697
        Height = 469
        BorderStyle = bsNone
        Color = clBtnFace
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Dies ist ein Freewareprogramm.'
          'Unver'#228'nderte Ver'#246'ffentlichungen sind erw'#252'nscht.'
          ''
          
            'Dieses Programm habe ich aus Freude an Primzahlen und ihren Bere' +
            'chnungsm'#246'glichkeiten '
          'geschrieben.'
          ''
          'Dieses Programm benutzt DEC von Hagen Reddmann.'
          
            'DEC ist eine Biblothek um mit riesigen Zahlen rechnen zu k'#246'nnen.' +
            '  (uvm.)'
          'Ich richte einen riesigen Dank an Hagen Reddmann!!!'
          ''
          'Diese Komponenten/Units benutze ich in meinem Programm:'
          '- Jedi Komponenten'
          '- Indy Komponenten'
          '- DEC'
          'Einen riesigen Dank den Autoren'
          ''
          
            'Au'#223'erdem habe ich die Informationen, wie man bestimmte Berechnun' +
            'gen durchf'#252'hren muss von '
          'Wikipedia.   Also auch Vielen Dank an Wikipedia.'
          
            'Fermatscher Primzahl Test:    http://de.wikipedia.org/wiki/Ferma' +
            'tscher_Primzahltest'
          
            'Eulerscher Primzahl Test:     http://de.wikipedia.org/wiki/Euler' +
            'sche_Pseudoprimzahl'
          ''
          'Kontakt:'
          'roth-a@gmx.de'
          'Homepage: www.roth.22o.de')
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Links: TTabSheet
      Caption = 'Links'
      ImageIndex = 1
      object Homepage: TLabel
        Left = 152
        Top = 144
        Width = 374
        Height = 36
        Cursor = crHandPoint
        Caption = 'Meine Homepage besuchen'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -32
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        OnClick = HomepageClick
      end
      object Label1: TLabel
        Left = 256
        Top = 16
        Width = 162
        Height = 76
        Caption = 'Links'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -67
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        WordWrap = True
      end
      object EmailKontakt: TLabel
        Left = 176
        Top = 224
        Width = 350
        Height = 36
        Cursor = crHandPoint
        Caption = 'Email an Alexander Roth'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -32
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        OnClick = EmailKontaktClick
      end
      object Label2: TLabel
        Left = 216
        Top = 336
        Width = 225
        Height = 45
        Caption = 'andere Links'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -40
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
      object Label3: TLabel
        Left = 224
        Top = 392
        Width = 227
        Height = 36
        Cursor = crHandPoint
        Caption = 'Delphipraxis.net'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -32
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        OnClick = Label3Click
      end
    end
    object TabLIzenz: TTabSheet
      Caption = 'Lizenzbedingungen'
      ImageIndex = 2
      object Memo2: TMemo
        Left = 0
        Top = 32
        Width = 697
        Height = 185
        Alignment = taCenter
        BorderStyle = bsNone
        Color = clBtnFace
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'Dies ist ein Freeware-Programm.'
          ''
          'Ver'#246'ffentlichungen und unver'#228'nderte Vervielf'#228'ltigungen '
          'sind ausdr'#252'cklich erw'#252'nscht.'
          ''
          'Alle Rechte sind dem Programmierer Alexander Roth vorbehalten.'
          'F'#252'r Sch'#228'den wird nicht gehaftet.'
          'Jegliche Ver'#228'nderung des Programms ist untersagt.'
          'Genaue Lizenzdetails finden Sie in dem unten aufgef'#252'hrten Feld.'
          ''
          'Viel Spass mit dem Programm.')
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object Memo3: TMemo
        Left = 0
        Top = 224
        Width = 697
        Height = 249
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Primfaktoren - Endbenutzer-Lizenzvereinbarungen'
          ''
          
            'Lesen Sie diese Lizenzvereinbarungen sorgf'#228'ltig, bevor Sie das P' +
            'rogramm Primfaktoren '
          
            'installieren oder in anderer Form darauf zugreifen. Sie m'#252'ssen d' +
            'ieser Lizenz zustimmen, wenn Sie '
          'Primfaktoren verwenden wollen.'
          ''
          '1. Lizenzstatus, Inhaberschaft'
          
            'Primfaktoren geht nicht in Ihren Besitz '#252'ber, sondern wird lizen' +
            'ziert. Primfaktoren ist durch das '
          
            'Urheberrecht gesch'#252'tzt. Das Eigentum und alle geistigen Schutzre' +
            'chte an Primfaktoren sowie der '
          
            'm'#246'glicherweise enthaltenen Dokumentation und aller ihrer Bestand' +
            'teile verbleiben bei dem '
          
            'Hersteller Alexander Roth. Der Lizenznehmer erkennt diese Eigent' +
            'ums- und Schutzrechte an.'
          ''
          '2. Lizenzeinr'#228'umung'
          
            'Der Hersteller gew'#228'hrt Ihnen unter der Voraussetzung, dass Sie a' +
            'lle Punkte dieser Vereinbarung '
          
            'einhalten, das Recht, Primfaktoren f'#252'r ausschlie'#223'lich private un' +
            'd nicht gewerbliche Zwecke frei zu '
          
            'nutzen. Dieses Recht umfasst die folgende Rechte und Einschr'#228'nku' +
            'ngen:* Installation, '
          
            'Verwendung. Sie sind berechtigt, Primfaktoren auf einer beliebig' +
            'en Anzahl Ihrer Computer zu '
          
            'installieren und zu verwenden.* Weitergabe, Vertrieb. Eine Weite' +
            'rgabe von Primfaktoren an Dritte '
          
            'ist zul'#228'ssig, sofern sie unter Ber'#252'cksichtigung dieser Lizenzver' +
            'einbarungen verl'#228'uft und '
          
            'Primfaktoren in unver'#228'ndertem Zustand weitergegeben wird. Primfa' +
            'ktoren darf nicht gegen '
          
            'Geb'#252'hren jeglicher Art vertrieben werden, au'#223'er zum Selbstkosten' +
            'preis. Primfaktoren darf nicht '
          
            'vermietet werden. Die Ver'#246'ffentlichung von Primfaktoren in einem' +
            ' anderen Medium als dem '
          
            'Internet bedarf der Genehmigung des Herstellers.* Zur'#252'ckentwickl' +
            'ung. Primfaktoren darf keiner '
          
            'Form von Zur'#252'ckentwicklung (Reverse Engineering), Dekompilierung' +
            ' oder Disassemblierung '
          
            'unterzogen werden.* K'#252'ndigung. Diese Lizenz gilt auf unbestimmte' +
            ' Zeit und ist so lange g'#252'ltig bis '
          
            'sie widerrufen wird. Sie k'#246'nnen die Lizenz jederzeit beendigen, ' +
            'indem Sie alle Kopien von '
          
            'Primfaktoren vernichten. Diese Lizenz endet unverz'#252'glich, ohne d' +
            'ass es einer expliziten '
          
            'K'#252'ndigung des Herstellers bedarf, wenn Sie gegen diese Lizenzver' +
            'einbarungen versto'#223'en. Bei '
          
            'Beendigung der Lizenz sind Sie verpflichtet alle Kopien von Prim' +
            'faktoren zu vernichten.'
          ''
          
            '* Versionen. Diese Lizenz gilt f'#252'r alle Versionen (auch die vorh' +
            'erigen) des Programms '
          'Primfaktoren. '
          ''
          '3. Gew'#228'hrleistungsausschluss'
          
            'Der Hersteller erhebt keine Lizenzgeb'#252'hr f'#252'r diese Version von P' +
            'rimfaktoren. Daher wird Ihnen '
          
            'Primfaktoren ohne jede Gew'#228'hrleistung zur Verf'#252'gung gestellt. Ke' +
            'ine Gew'#228'hrleistung wird '
          
            'insbesondere f'#252'r die Sach- und Rechtsm'#228'ngelfreiheit von Primfakt' +
            'oren '#252'bernommen. Sie '
          
            'benutzen Primfaktoren in Hinsicht auf Qualit'#228't und Funktion auf ' +
            'eigene Gefahr. Sollten Ihnen durch '
          
            'Primfaktoren nachweislich Sch'#228'den irgendwelcher Art entstehen, t' +
            'r'#228'gt der Lizenzgeber keine '
          
            'etwaigen Kosten. Primfaktoren ist auf Virenfreiheit '#252'berpr'#252'ft wo' +
            'rden. Dennoch '#252'bernimmt der '
          
            'Hersteller keine Gew'#228'hrleistung f'#252'r die Freiheit von Viren. Sie ' +
            'sind deshalb aufgefordert, '
          
            'Primfaktoren selbst auf Virenfreiheit zu '#252'berpr'#252'fen, bzw. Primfa' +
            'ktoren auf eigene Gefahr zu nutzen. '
          
            'Dieser Ausschluss der Gew'#228'hrleistung stellt einen wesentlichen T' +
            'eil der Lizenzvereinbarungen '
          
            'dar. Wenn Sie sich mit diesem Gew'#228'hrleistungsausschluss nicht ei' +
            'nverstanden erkl'#228'ren, ist Ihnen '
          'die Nutzung von Primfaktoren untersagt.')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object TabUpdate: TTabSheet
      Caption = 'Updates'
      ImageIndex = 3
      object LInternetState: TLabel
        Left = 24
        Top = 112
        Width = 649
        Height = 41
        AutoSize = False
        Caption = 'Bitte checke ob ein Update vorhanden ist'
        WordWrap = True
      end
      object LHomepage: TLabel
        Left = 24
        Top = 200
        Width = 221
        Height = 36
        Cursor = crHandPoint
        Caption = 'www.roth.us.ms'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -32
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        Visible = False
        OnClick = HomepageClick
      end
      object Label4: TLabel
        Left = 16
        Top = 376
        Width = 649
        Height = 65
        AutoSize = False
        Caption = 
          'Du hast einen Fehler entdeckt?  Es w'#228're sehr freundlich, wenn du' +
          ' mir eine kurze E-Mail schreiben w'#252'rdest in der mir das Problem ' +
          'beschreibst. Ich versuche dann diesen Fehler so schnell wie m'#246'gl' +
          'ich zu beheben.'
        WordWrap = True
      end
      object Label5: TLabel
        Left = 248
        Top = 408
        Width = 103
        Height = 19
        Cursor = crHandPoint
        Caption = 'roth-a@gmx.de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        OnClick = EmailKontaktClick
      end
      object BCheckUpdate: TButton
        Left = 16
        Top = 48
        Width = 273
        Height = 33
        Caption = 'Pr'#252'fen ob Update vorhanden'
        TabOrder = 0
        OnClick = BCheckUpdateClick
      end
    end
  end
end
