unit MainU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SynEdit, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ToolWin, DataModule, SynEditHighlighter, SynHighlighterDWS;

type
  TfrmMain = class(TForm)
    ToolBar1: TToolBar;
    ListView1: TListView;
    Splitter1: TSplitter;
    SynEdit1: TSynEdit;
    SynDWSSyn1: TSynDWSSyn;
    btnNew: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
    fSelItem: TListItem;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormShow(Sender: TObject);
var
  sl: TStringList;
  Item: TListItem;
  col: TListColumn;
  I: Integer;
begin
  col := ListView1.Columns.Add;
  col.Caption := 'Title';
  // col:=ListView1.Columns.Add;
  // col.Caption:='Index';

  ListView1.Items.BeginUpdate;
  sl := TStringList.Create;
  try
    sl.CommaText := DM.Test;
    for I := 0 to sl.Count - 1 do
    begin
      Item := ListView1.Items.Add;
      Item.Caption := sl[I];
      Item.SubItems.Add(inttostr(I));
    end;
  finally
    sl.Free;
  end;
  ListView1.Items.EndUpdate;

end;

procedure TfrmMain.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  // this event is called multiple times when moving from one item to the next
  // to have it fire only when the selected item has actually changed:
  if Item <> fSelItem then
    showmessage('selected');

  // remember the selected item (fSelItem is a class level variable)
  fSelItem := Item;
end;

end.
