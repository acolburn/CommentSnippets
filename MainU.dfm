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
  OnShow = FormShow
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
  end
  object ListView1: TListView
    Left = 0
    Top = 29
    Width = 250
    Height = 696
    Align = alLeft
    Columns = <>
    TabOrder = 1
  end
  object SynEdit1: TSynEdit
    Left = 253
    Top = 29
    Width = 695
    Height = 696
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
      '    Query.Active:=true;'
      '  if not Query.IsEmpty then'
      '  begin'
      '    Query.First;'
      '    while not Query.Eof do'
      '    begin'
      '      sl.Add(Query.FieldByName('#39'title'#39').AsString);'
      '      Query.Next;'
      '    end;'
      '  end;'
      '  result:=sl.Text;'
      ''
      'end;')
    FontSmoothing = fsmNone
  end
  object SynDWSSyn1: TSynDWSSyn
    DefaultFilter = 'DWScript Files (*.dws;*.pas;*.inc)|*.dws;*.pas;*.inc'
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 8
    Top = 8
  end
end
