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
    Top = 33
    Height = 692
    ExplicitLeft = 480
    ExplicitTop = 336
    ExplicitHeight = 100
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1026
    Height = 33
    AutoSize = True
    ButtonHeight = 31
    ButtonWidth = 90
    Caption = 'ToolBar1'
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ShowCaptions = True
    TabOrder = 0
    object btnNew: TToolButton
      AlignWithMargins = True
      Left = 0
      Top = 0
      Caption = 'New'
      ImageIndex = 0
      Style = tbsTextButton
      OnClick = btnNewClick
    end
    object btnSaveNew: TToolButton
      Left = 90
      Top = 0
      Caption = 'Save New'
      ImageIndex = 1
      OnClick = btnSaveNewClick
    end
  end
  object ListView1: TListView
    Left = 0
    Top = 33
    Width = 250
    Height = 692
    Align = alLeft
    BorderWidth = 10
    Columns = <
      item
        AutoSize = True
        Caption = 'TITLE'
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ViewStyle = vsReport
    OnSelectItem = ListView1SelectItem
  end
  object Panel1: TPanel
    Left = 253
    Top = 33
    Width = 773
    Height = 692
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 2
    object SynEdit1: TSynEdit
      Left = -13
      Top = 43
      Width = 773
      Height = 629
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
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 771
      Height = 41
      Align = alTop
      TabOrder = 1
      DesignSize = (
        771
        41)
      object Label1: TLabel
        Left = 14
        Top = 12
        Width = 37
        Height = 19
        Caption = 'Title:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtTitle: TEdit
        Left = 60
        Top = 9
        Width = 671
        Height = 27
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
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
end
