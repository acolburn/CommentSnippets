object frmMain: TfrmMain
  Left = 411
  Top = 156
  Caption = 'Code Snippets'
  ClientHeight = 725
  ClientWidth = 1026
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 250
    Top = 27
    Height = 698
    ExplicitLeft = 480
    ExplicitTop = 336
    ExplicitHeight = 100
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1026
    Height = 27
    AutoSize = True
    ButtonHeight = 25
    ButtonWidth = 71
    Caption = 'ToolBar1'
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Images = ImageList1
    List = True
    ParentFont = False
    ShowCaptions = True
    TabOrder = 0
    object btnNew: TToolButton
      AlignWithMargins = True
      Left = 0
      Top = 0
      AutoSize = True
      Caption = 'New'
      ImageIndex = 2
      OnClick = btnNewClick
    end
    object btnSave: TToolButton
      Left = 62
      Top = 0
      AutoSize = True
      Caption = 'Save'
      ImageIndex = 1
      OnClick = btnSaveClick
    end
    object btnDelete: TToolButton
      Left = 126
      Top = 0
      AutoSize = True
      Caption = 'Delete'
      ImageIndex = 0
      OnClick = btnDeleteClick
    end
  end
  object ListView1: TListView
    Left = 0
    Top = 27
    Width = 250
    Height = 698
    Align = alLeft
    BorderWidth = 10
    Columns = <
      item
        AutoSize = True
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLines = True
    ParentFont = False
    ShowColumnHeaders = False
    TabOrder = 1
    ViewStyle = vsReport
    OnSelectItem = ListView1SelectItem
  end
  object Panel1: TPanel
    Left = 253
    Top = 27
    Width = 773
    Height = 698
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 2
    object SynEdit1: TSynEdit
      Left = 1
      Top = 1
      Width = 771
      Height = 696
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Consolas'
      Font.Pitch = fpFixed
      Font.Style = []
      TabOrder = 0
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Highlighter = SynDWSSyn1
      FontSmoothing = fsmNone
    end
  end
  object SynDWSSyn1: TSynDWSSyn
    DefaultFilter = 'DWScript Files (*.dws;*.pas;*.inc)|*.dws;*.pas;*.inc'
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 552
    Top = 432
  end
  object ImageList1: TImageList
    Left = 504
    Top = 368
    Bitmap = {
      494C0101030008004C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000090502700C3845800D38B6800E18F7000DC8D6C00DA8B
      6D00D78A6E00CD8B6C00AB6D4400A65F2E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000090C1B001C275F003047A300334DB4002E47B30028439E0015255A00050A
      1900000000000000000000000000000000004E2C1600894A2300AE5F2E00BA66
      3000B4632E00B4622E00C6835500EFCEBA00DDFFFF0087EEC700A2F4D700A2F6
      D7008CEEC700E0FFFF00DDA28500AB6A3E000000000000000000000000000000
      000009140B001E46240032783A0033833D003081390028712F00163F19000511
      0700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000171D
      41003C4DB3003C52CC00757AE8008F92EE008F92EE007178E400334DC1002743
      A5000D183B00000000000000000000000000A45B2C00EBE5DE00F5EADD00F6EA
      DE00F6EADC00F6EADC00C37F5100EFB69A00EAF3E80051BF84006FC9980071C9
      990054BF8400E4F4E900DD9C7B00AA693A000000000000000000000000001832
      1D003E874B00419950007DC28F0096D0A60096CFA60078BE8900368D42002874
      2F000D2910000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000191D43004655
      C2005C65E000A1A6F5007E86EF005B63E900595DE7007D84EE009EA0F400515D
      D7002947AF000D183B000000000000000000B86D3600F4EADE00FDBF6800FBBE
      6500FCBE6400FCBE6400C4815400EAB69700F3F3EA00EDF1E600EFF1E600EFF0
      E600EDF1E500F3F5ED00D59C7900B070440000000000000000001A3420004A95
      590064B47800A8DBB50087CC980066BC7D0064BA7C0086CB9800A5D9B40058AA
      6B002A7B32000D29100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B0D1C004B57BA00616B
      E300A1ACF500545FEC00505CEA004D59E9004E59E6004C56E6005056E6009EA2
      F4005460D6002642A500050A180000000000BB743A00F7EDE300FDC26E00FFD7
      9E00FFD69B00FFD79800C98B6100E6B59200E2A78100E1A78100DEA37D00DCA1
      7B00DB9F7900D99E7700D49A7300BB7E5700000000000C160E004D925C006AB9
      7D00A8DBB20060BC77005CBA730059B8700059B56F0058B56F005BB77400A5D9
      B3005AAA6C0028752F0005110600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002B2F69004B56DB00A2AB
      F6005664F0005266EE004D59E9004D59E9004D59E9004D59E9004C58E600525A
      E6009FA3F5003450C40015255B0000000000BE783E00F7F0E600F8B45500F7B5
      5400F8B45300F8B25300CA8D6500EAB89900DDA57E00DDA68000DBA37C00D9A0
      7A00D9A07900D89F7800D89E7800BF845D00000000002E54370053AB6800AADD
      B40064C179005FBE710060BC7700FFFFFF00FFFFFF0059B8700058B56E005CB7
      7400A6DAB400388F430016401A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004F54B900818CEE007E91
      F7005D73F3004D59E9004D59E9004D59E9004D59E9004D59E9004D59E9004F5B
      E9007B83F000757BE2002840A00000000000C5824500F8F2EB00FEE7D600FDE7
      D600FDE7D600FDE6D500C8885D00EFBFA100FDFCFA00FEFCFB00FEFDFD00FEFD
      FC00FDFBFA00FDFCFB00DDA88500C17F530000000000539464008ACC980089D3
      96006BC67A0063C1700055AB6500FFFFFF00FFFFFF0059B8700059B870005BB9
      720085CC97007BBE8D0029723100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005C60D200A1ABF7007086
      F8006882F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D59
      E9005C66EA00969CF100304DB50000000000C0804500F9F3EC00FEE8D600FDE7
      D600FDE7D600FDE7D500C7865B00EFC09E00FFFFFF00CC936E00FFFFFF00FFFF
      FF00FFFBF700FFF8F100E4AF8C00C78A61000000000061A97600A9DDB3007DCF
      8A0075CC8100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0059B8
      700067BE7D009CD4AB0032833B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006065D300AFB9F9007F93
      FA007085F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D59
      E9005E6AEE00969DF100344CB70000000000C0844700F9F4ED00FEE8D800FEE8
      D700FEE7D600FDE5D300CC8D6500F3CDB000FFFFFF00E3C7B300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EABFA100C98960000000000065AC7A00B6E2BE008BD5
      97007AC98600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0059B8
      700069C17E009DD4AA0036864000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000585BBF00A5AFF5009DAB
      FA00778CF000545FEC00545FEC00545FEC00545FEC00545FEC00545FEC006377
      F200818EF400787FE9003247A50000000000C0844800F9F4EF00FEE7D700FDE7
      D500FDE6D400FCE6D200D4976E00D49E7B00D0987100D6A48200CD8E6800CD90
      6900D09A7500D1997300C88B620025130700000000005E9B7100ACDDB600A6DF
      AF0081CB8C007CC986006EBD7900FFFFFF00FFFFFF005BAC6A0060BC77005CBA
      73008BD1990080C59200347A3D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000034346F007D83EA00CDD4
      FC008B9DFA007E93F700758AEE006C84F6006C84F6006C84F6006C84F6006379
      F300A4AFF8003E4FD0001F2A600000000000C0854900F9F4F000FCE6D300FDE7
      D300FCE4D100FBE3CD00FAE0C800F8DCC200F5D6BB00F3D4B500F1D2B300F8F4
      F000BE7E440000000000000000000000000000000000375B430085C79700D2EE
      D70095D9A0008AD394007FC88900FFFFFF00FFFFFF0079CD85006BC37C006FC7
      7E00ACDFB500459E570020482600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000E0E1E005F5EC900A3A7
      F300D4DBFD00879AFA007F91F0007A8EF1007F94F8007E92F900768CF800A8B6
      F800636EE3003E4EB300090B1A0000000000C0854900F9F5F100FCE3CF00FCE4
      CF00FCE3CD00FAE1CA00F9DDC400F6D9BC00F4E9DF00F7F2EC00FBF7F300F5EF
      E900BF7C4400000000000000000000000000000000000F19120065A57900AADA
      B700D8F1DC0092D89D0088CD930084CC8E008BD496008AD4950083D28E00AFE0
      B7006BB97D0041894D0009140B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000023234A006564
      D600AAADF200D8DCFD00AEBAFA0091A3FA008B9DFA009CA9FB00BAC7FC00707B
      E9004957C300171D42000000000000000000BF844900F9F5F100FCE3CD00FBE3
      CD00FBE2CB00F9E0C800F8DCC200F5D6BA00FDFBF800FCE6CD00FAE5C900E2B6
      84007C4F2B000000000000000000000000000000000000000000253D2D006BB0
      8100AFDCBB00DCF2E000B6E4BD009BDBA50096D9A000A5DFAF00C0E8C50079C2
      8A004D975B0019321E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002323
      4A006060C9008E93ED00BEC3F800CCD3F900C4CBF900AAB4F4006670E2004B55
      BD001A1E4300000000000000000000000000B57D4500F7F3EF00FAE0C700FBE2
      C900FBE0C800F9DFC500F8DBC100F4D6B800FFFBF800F6D8B400E1B07D00D38D
      600005030200000000000000000000000000000000000000000000000000253D
      2D0066A67A0094CEA400C3E6CB00CFEBD400C9E9CE00AFDDB8006DB97F004F95
      5F001B3421000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000F0F1F0034346E00595BBE005E5FD2005C5FD0005055BA002D3169000C0D
      1D000000000000000000000000000000000096663800E5E0DA00F5F1EB00F8F3
      ED00F8F3ED00F8F3ED00F8F2EC00F7F2EC00F2E6D700E2B27D00D28E61000503
      0200000000000000000000000000000000000000000000000000000000000000
      0000101A1300375B43005E9C710065AB7A0062A97600559566002F5438000D17
      0F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000492F1A0093663800BB834A00C88C
      4F00C2884D00C2894D00C3884D00C1874D00A4723E006F432200040201000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = btnSaveClick
    Left = 408
    Top = 392
  end
end
