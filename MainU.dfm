object frmMain: TfrmMain
  Left = 411
  Top = 156
  Caption = 'Code Snippets'
  ClientHeight = 725
  ClientWidth = 948
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 250
    Top = 29
    Height = 696
    ExplicitLeft = 480
    ExplicitTop = 336
    ExplicitHeight = 100
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 948
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 0
    ExplicitLeft = 408
    ExplicitTop = 368
    ExplicitWidth = 150
  end
  object ListView1: TListView
    Left = 0
    Top = 29
    Width = 250
    Height = 696
    Align = alLeft
    Columns = <>
    TabOrder = 1
    ExplicitLeft = 360
    ExplicitTop = 304
    ExplicitHeight = 150
  end
  object SynEdit1: TSynEdit
    Left = 253
    Top = 29
    Width = 695
    Height = 696
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 2
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Lines.Strings = (
      'SynEdit1')
    FontSmoothing = fsmNone
    ExplicitLeft = 384
    ExplicitTop = 304
    ExplicitWidth = 200
    ExplicitHeight = 150
  end
end
