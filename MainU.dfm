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
    ButtonWidth = 44
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
    ExplicitWidth = 948
    object btnNew: TToolButton
      AlignWithMargins = True
      Left = 0
      Top = 0
      Caption = 'New'
      ImageIndex = 0
      Style = tbsTextButton
      OnClick = btnNewClick
    end
  end
  object ListView1: TListView
    Left = 0
    Top = 33
    Width = 250
    Height = 692
    Align = alLeft
    BorderWidth = 10
    Columns = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ViewStyle = vsReport
    OnSelectItem = ListView1SelectItem
    ExplicitLeft = -3
    ExplicitTop = 35
    ExplicitHeight = 696
  end
  object SynEdit1: TSynEdit
    Left = 253
    Top = 33
    Width = 773
    Height = 692
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Consolas'
    Font.Pitch = fpFixed
    Font.Style = []
    TabOrder = 2
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Highlighter = SynDWSSyn1
    Lines.Strings = (
      'function TDataModule1.Test: string;'
      'var'
      '  sl: TStringList;'
      'begin'
      '    sl:=TStringList.Create;'
      '    Query.SQL.Text:='#39'select * from Snippets'#39';'
      
        'procedure TfrmMain.ListView1SelectItem(Sender: TObject; Item: TL' +
        'istItem;'
      '  Selected: Boolean);'
      'begin'
      
        '  {This event is called multiple times when moving from one item' +
        ' to the next'
      
        '  to have it fire only when the selected item has actually chang' +
        'ed:'
      '  if Item <> fSelItem then'
      '    showmessage('#39'selected'#39');'
      
        '   and remember the selected item (fSelItem is a class level var' +
        'iable)'
      '  fSelItem := Item;}'
      ''
      '  //or do it this way:'
      '  if Selected=true then'
      '  showmessage('#39'selected'#39');'
      
        '  {The OnSelectItem event tells you the item being changed and w' +
        'hether it is being'
      
        '  selected or unselected. So it makes sense to get two event tri' +
        'ggers, one for the'
      
        '  old item that is being unselected, and one for the new item th' +
        'at is becoming selected.}')
    FontSmoothing = fsmNone
    ExplicitTop = 29
    ExplicitWidth = 695
    ExplicitHeight = 696
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
