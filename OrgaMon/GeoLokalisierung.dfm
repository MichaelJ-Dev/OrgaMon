object FormGeoLokalisierung: TFormGeoLokalisierung
  Left = 329
  Top = 32
  Caption = 'Lokalisierung via HTTP'
  ClientHeight = 588
  ClientWidth = 847
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Courier New'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    847
    588)
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 10
    Top = 569
    Width = 35
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akBottom]
    Caption = 'X;Y :'
    ExplicitTop = 615
  end
  object Label2: TLabel
    Left = 31
    Top = 38
    Width = 42
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Alignment = taRightJustify
    Caption = 'Stra'#223'e'
  end
  object Label7: TLabel
    Left = 24
    Top = 64
    Width = 49
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Alignment = taRightJustify
    Caption = 'PLZ Ort'
  end
  object Label3: TLabel
    Left = 17
    Top = 118
    Width = 56
    Height = 14
    Alignment = taRightJustify
    Caption = 'Ortsteil'
  end
  object Image2: TImage
    Left = 789
    Top = 14
    Width = 54
    Height = 22
    Cursor = crHandPoint
    Anchors = [akTop, akRight]
    AutoSize = True
    Picture.Data = {
      07544269746D61704E0E0000424D4E0E00000000000036000000280000003600
      0000160000000100180000000000180E0000C40E0000C40E0000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF0000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FFFFFF0000FFFFFF000000ECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECEC000000FFFFFF0000FFFFFF000000ECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECEC000000FFFFFF0000FFFFFF000000ECECECECECECECEC
      ECECECECECECECECECECDFDFDFB1B1B10902040802030802030A0204BEBEBEE6
      E6E6ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECEC000000FFFFFF0000FFFFFF000000ECECECEC
      ECECECECECECECECECECECB2B2B2050402110C06613E1A8B582D7B4C23482A11
      0D0803070503CDCDCDECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECEC000000FFFFFF0000FFFFFF000000
      ECECECECECECECECECECECECAFAFAF0F0B05734A25BA7D37C5813DD09671C596
      71AF6D328A51213B210F0E0905CDCDCDECECECECECECECECECECECECECECECEC
      ECEC000000ECECECECECECECECECECECECECECEC000000ECECECECECEC000000
      ECECECECECEC000000ECECECECECEC000000ECECECECECECECECEC0000000000
      00000000ECECECECECECECECECECECECECECECECECEC000000FFFFFF0000FFFF
      FF000000ECECECECECECECECECD3D3D30605047C5C34D79451DA8C47D08C5CDA
      B6A6DAAB9BBB773DB06D329E5D263B210F070503E6E6E6ECECECECECECECECEC
      ECECECECECEC000000ECECECECECECECECECECECECECECEC000000ECECECECEC
      EC000000ECECECECECEC000000ECECECECECEC000000ECECECECECEC000000EC
      ECECECECECECECEC000000ECECECECECECECECECECECECECECEC000000FFFFFF
      0000FFFFFF000000ECECECECECECECECEC9191911A140DD8A261DAA15CDA9652
      D08C5CD08C71D08C5CBB7732B07732B06D328A51210D0803BEBEBEECECECECEC
      ECECECECECECECECECEC000000ECECECECECECECECECECECECECECEC000000EC
      ECECECECEC000000ECECECECECEC000000ECECECECECEC000000ECECECECECEC
      000000ECECECECECECECECECECECECECECECECECECECECECECECECECECEC0000
      00FFFFFF0000FFFFFF000000ECECECECECECE5E5E5060402957D57E5B67CE5AB
      67DAA15CD09667DAB6B0E5B691C58147BB7732B07732AF6D32482A11090204EC
      ECECECECECECECECECECECECECEC000000ECECECECECECECECECECECECECECEC
      000000ECECECECECEC000000ECECECECECEC000000ECECECECECEC000000ECEC
      ECECECEC000000000000000000000000000000ECECECECECECECECECECECECEC
      ECEC000000FFFFFF0000FFFFFF000000ECECECECECECCDCDCD040302D0B17EE5
      C086E5B67CE5AB67DAA171DAC0A6EFD5D0DAA171C5813DBB7732B077327B4C23
      050102E5E5E5ECECECECECECECECECECECEC000000ECECECECECECECECECECEC
      ECECECEC000000ECECECECECEC000000ECECECECECEC000000ECECECECECEC00
      0000ECECECECECEC000000ECECECECECECECECEC000000ECECECECECECECECEC
      ECECECECECEC000000FFFFFF0000FFFFFF000000ECECECECECECC7C7C7040304
      D8B78CEFCB91E5C086E5B67CDAAB67DAA171E5C0B0EFCBC5DA8C67C5813DBB77
      32825825050102E2E2E2ECECECECECECECECECECECEC00000000000000000000
      0000000000000000000000ECECECECECEC000000ECECECECECEC000000ECECEC
      ECECEC000000ECECECECECEC000000ECECECECECECECECEC000000ECECECECEC
      ECECECECECECECECECEC000000FFFFFF0000FFFFFF000000ECECECECECECE0E0
      E0050305AE9B80EFCB9BE5B691E5B686E5B691DAAB67DAA171EFD5DADAA191D0
      8147C5813D613E1A080203ECECECECECECECECECECECECECECEC000000ECECEC
      ECECECECECECECECECECECEC000000ECECECECECEC000000ECECECECECEC0000
      00ECECEC000000000000000000ECECECECECEC000000000000000000ECECECEC
      ECECECECECECECECECECECECECEC000000FFFFFF0000FFFFFF000000ECECECEC
      ECECECECEC7D7D7D231E1CE9D0ACEFCB9BEFCBB0EFE0E5EFCBB0E5C0B0FAEAEF
      E5B691DA8C47BA7D37110C06ADADADECECECECECECECECECECECECECECEC0000
      00ECECECECECECECECECECECECECECEC000000ECECECECECECECECECECECECEC
      ECEC000000ECECECECECEC000000ECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECEC000000FFFFFF0000FFFFFF000000
      ECECECECECECECECECC4C4C4070405B19F85EFD5B0EFD5B0EFD5C5EFE0E5EFE0
      E5EFCBB0E5AB67D79451734A25050402DFDFDFECECECECECECECECECECECECEC
      ECEC000000ECECECECECECECECECECECECECECEC000000ECECECECECECECECEC
      ECECECECECEC000000ECECECECECEC000000ECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECEC000000FFFFFF0000FFFF
      FF000000ECECECECECECECECECEBEBEB8C8C8C110E0DB7A489EBD2ADEFD5B0EF
      CB9BEFCB9BE5B686DCA463805F360F0B05B2B2B2ECECECECECECECECECECECEC
      ECECECECECEC000000ECECECECECECECECECECECECECECEC000000ECECECECEC
      EC000000ECECECECECEC000000ECECECECECECECECEC000000000000ECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECEC000000FFFFFF
      0000FFFFFF000000ECECECECECECECECECECECECE9E9E98C8C8C080505241F1D
      B4A085E2C092DDBC86977E581C150E070604AFAFAFECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC0000
      00FFFFFF0000FFFFFF000000ECECECECECECECECECECECECECECECEBEBEBC4C4
      C47D7D7D050405050405050402060402919191D3D3D3ECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECEC000000FFFFFF0000FFFFFF000000ECECECECECECECECECECECECECECECEC
      ECECECECECECECECE0E0E0C7C7C7CDCDCDE5E5E5ECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECEC000000FFFFFF0000FFFFFF000000ECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECEC000000FFFFFF0000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FFFFFF0000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
    OnClick = Image2Click
  end
  object Label4: TLabel
    Left = 17
    Top = 14
    Width = 56
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Alignment = taRightJustify
    Caption = 'Anbieter'
  end
  object Label5: TLabel
    Left = 59
    Top = 145
    Width = 14
    Height = 14
    Caption = 'q='
  end
  object Label6: TLabel
    Left = 80
    Top = 14
    Width = 91
    Height = 14
    Caption = 'OpenStreetMap'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 8
    Top = 185
    Width = 840
    Height = 360
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object StaticText1: TStaticText
    Left = 48
    Top = 568
    Width = 137
    Height = 18
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = '0;0'
    TabOrder = 1
  end
  object StaticText2: TStaticText
    Left = 192
    Top = 568
    Width = 169
    Height = 18
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = '0 ms'
    TabOrder = 2
  end
  object Button4: TButton
    Left = 639
    Top = 552
    Width = 204
    Height = 35
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akRight, akBottom]
    Caption = 'Position ermitteln'
    Default = True
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button1: TButton
    Left = 639
    Top = 153
    Width = 204
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akTop, akRight]
    Caption = 'Abstandstest'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 80
    Top = 59
    Width = 337
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 5
    Text = '76698 Ubstadt-Weiher'
  end
  object Edit4: TEdit
    Left = 80
    Top = 35
    Width = 337
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 6
    Text = 'Stettfelder Str. 44'
  end
  object Button3: TButton
    Left = 639
    Top = 87
    Width = 204
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akTop, akRight]
    Caption = 'Geodaten pflegen'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button5: TButton
    Left = 639
    Top = 120
    Width = 204
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akTop, akRight]
    Caption = 'setze PLZ diverse Strassen zur'#252'ck'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = Button5Click
  end
  object CheckBox2: TCheckBox
    Left = 431
    Top = 66
    Width = 181
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Onlineabfrage erzwingen'
    Checked = True
    State = cbChecked
    TabOrder = 9
  end
  object CheckBox1: TCheckBox
    Left = 431
    Top = 48
    Width = 105
    Height = 17
    Caption = 'Diagnose'
    TabOrder = 10
    OnClick = CheckBox1Click
  end
  object Edit1: TEdit
    Left = 80
    Top = 114
    Width = 337
    Height = 22
    TabOrder = 11
    Text = 'Ubstadt'
  end
  object Button2: TButton
    Left = 639
    Top = 58
    Width = 204
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Karten-Cache auf 1 GB k'#252'rzen'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -10
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = Button2Click
  end
  object CheckBox3: TCheckBox
    Left = 80
    Top = 88
    Width = 337
    Height = 17
    Caption = 'die PLZ bei der Anfrage NICHT mit '#252'bermitteln'
    TabOrder = 13
  end
  object Edit3: TEdit
    Left = 80
    Top = 142
    Width = 553
    Height = 22
    Hint = 'Benutzdefinierte Abfrage, freier Text'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
end
