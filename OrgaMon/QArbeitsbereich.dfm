object FormQArbeitsbereich: TFormQArbeitsbereich
  Left = 21
  Top = 170
  Caption = 'Arbeitsbereich'
  ClientHeight = 428
  ClientWidth = 1011
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 120
  TextHeight = 17
  object Label1: TLabel
    Left = 10
    Top = 251
    Width = 28
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Info'
  end
  object Panel1: TPanel
    Left = 0
    Top = 10
    Width = 1006
    Height = 54
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 0
    object IB_NavigationBar1: TIB_NavigationBar
      Left = 10
      Top = 10
      Width = 156
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DataSource = IB_DataSource1
      ReceiveFocus = False
      CustomGlyphsSupplied = []
    end
    object IB_UpdateBar1: TIB_UpdateBar
      Left = 178
      Top = 10
      Width = 222
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      DataSource = IB_DataSource1
      ReceiveFocus = False
      CustomGlyphsSupplied = []
      VisibleButtons = [ubEdit, ubInsert, ubDelete, ubPost, ubCancel, ubRefreshAll]
    end
  end
  object IB_Grid1: TIB_Grid
    Left = 0
    Top = 73
    Width = 1006
    Height = 169
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    CustomGlyphsSupplied = []
    DataSource = IB_DataSource1
    TabOrder = 1
    DefaultRowHeight = 22
  end
  object IB_Memo1: TIB_Memo
    Left = 0
    Top = 272
    Width = 1006
    Height = 137
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataField = 'INFO'
    DataSource = IB_DataSource1
    TabOrder = 2
    AutoSize = False
  end
  object IB_Query1: TIB_Query
    ColumnAttributes.Strings = (
      'RID=NOTREQUIRED')
    DatabaseName = '192.168.115.91:test.fdb'
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'SELECT * FROM'
      'ARBEITSBEREICH'
      'FOR UPDATE')
    ColorScheme = True
    Hints.Strings = (
      'EDIT=Datensatz '#228'ndern'
      'POST=Abschicken'
      'CANCEL=Abbruch'
      'CANCELSEARCH=Suche abbrechen'
      'POSTEDIT=Abschicken'
      'POSTINSERT=Abschicken'
      'POSTDELETE=Abschicken'
      'FIRST=Erster Datensatz'
      'PRIOR=vorheriger Datensatz'
      'NEXT=n'#228'chster Datensatz'
      'LAST=Letzter Datensatz'
      'SEARCH=Suchen'
      'COUNT=Anzahl der Datens'#228'tze'
      'INSERT=Datensatz einf'#252'gen'
      'DELETE=Datensatz l'#246'schen'
      'REFRESH=Aktualisieren'
      'REFRESHKEYS=Aktualisieren'
      'REFRESHROWS=Aktualisieren'
      'POSTSEARCH=Abschicken'
      'CANCELEDIT='#196'nderung abbrechen'
      'CANCELINSERT=Einf'#252'gen abbrechen'
      'CANCELDELETE=L'#246'schen abbrechen')
    KeyLinks.Strings = (
      'ARBEITSBEREICH.RID')
    RequestLive = True
    Left = 576
    Top = 16
  end
  object IB_DataSource1: TIB_DataSource
    Dataset = IB_Query1
    Left = 608
    Top = 16
  end
end
