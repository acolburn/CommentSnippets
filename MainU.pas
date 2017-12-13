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
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnNewClick(Sender: TObject);
var
  item: TListItem;
begin
  SynEdit1.Clear;
  item:=ListView1.Items.Add;
  //as soon as user hits return then? ...
  item.Caption:=SynEdit1.Lines[0]; //first row in memo
  //add a new record to db
  //use a timer (triggered within SynEdit on change?) to periodically update the new record
  //UPDATE Snippets SET code=:code WHERE title=:title
end;

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
    sl.CommaText := DM.GetTitles;
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
  SynEdit1.Lines.Clear;
  {This event is called multiple times when moving from one item to the next
  to have it fire only when the selected item has actually changed:
  if Item <> fSelItem then
    showmessage('selected');
   and remember the selected item (fSelItem is a class level variable)
  fSelItem := Item;}

  //or do it this way:
  if Selected=true then
  begin
  SynEdit1.Text:=DM.GetTitleAndCode(Item.Caption);
  end;
  {The OnSelectItem event tells you the item being changed and whether it is being
  selected or unselected. So it makes sense to get two event triggers, one for the
  old item that is being unselected, and one for the new item that is becoming selected.}
end;

end.
