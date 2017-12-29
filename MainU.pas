unit MainU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SynEdit, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ToolWin, DataModule, SynEditHighlighter, SynHighlighterDWS, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Generics.Collections, Snippet;

type
  TfrmMain = class(TForm)
    ToolBar1: TToolBar;
    ListView1: TListView;
    Splitter1: TSplitter;
    SynEdit1: TSynEdit;
    SynDWSSyn1: TSynDWSSyn;
    btnNew: TToolButton;
    Panel1: TPanel;
    btnSave: TToolButton;
    btnDelete: TToolButton;
    ImageList1: TImageList;
    procedure FormShow(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateDisplay;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnDeleteClick(Sender: TObject);
var
  anId: integer;
begin
  if ListView1.Selected.Data <> nil then
  begin
    anId := TSnippet(ListView1.Selected.Data).id;
    records.Delete(anId);
    SynEdit1.Clear;
    UpdateDisplay;
  end;
end;

procedure TfrmMain.btnNewClick(Sender: TObject);
begin
  records.EditMode := new;
  SynEdit1.Clear;
  ListView1.Selected := nil;
end;

procedure TfrmMain.btnSaveClick(Sender: TObject);
var
  aTitle, aCode: string;
  anId: integer;
  memo_x, memo_y: integer;
  Item: TListItem;
begin
  aTitle := SynEdit1.Lines[0];
  aCode := SynEdit1.Text;
  // save current memo caret position
  memo_x := SynEdit1.CaretX;
  memo_y := SynEdit1.CaretY;
  if records.EditMode = new then
  begin
    // don't include id; this is a new record
    records.Add(aTitle, aCode);
    records.EditMode := edit;
  end
  else if (ListView1.Selected <> nil) and (ListView1.Selected.Data <> nil) then
  begin
    anId := TSnippet(ListView1.Selected.Data).id;
    records.Update(anId, aTitle, aCode);
  end;
  UpdateDisplay;
  // Update SynEdit caret position
  SynEdit1.CaretX := memo_x;
  SynEdit1.CaretY := memo_y;

end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  UpdateDisplay;
  records.EditMode := edit;
end;

procedure TfrmMain.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  SynEdit1.Lines.Clear;

  // Selected=true when the new item is selected
  if Selected = true then
  begin
    SynEdit1.Text := records.GetCode(TSnippet(Item.Data).id);
  end;

end;

procedure TfrmMain.UpdateDisplay;
var
  Item: TListItem;
  selectedItem: TListItem;
  aRecord: TSnippet;
begin
  records.UpdateRecordList;
  ListView1.Items.BeginUpdate;
  // no ListView item selected at this point, e.g., after adding new record
  // if nothing's selected, autosave isn't going to work; in a few
  // seconds this method will be triggered again, with nothing selected
  if ListView1.Selected = nil then
  begin
    for Item in ListView1.Items do
      if TSnippet(Item.Data).id = records.SelectedID then
        ListView1.Selected := Item;
  end;
  if ListView1.Selected <> nil then
    selectedItem := ListView1.Selected // keep track of what was selected
  else
    selectedItem := nil;
  ListView1.Clear;
  for aRecord in records.recordList do
  begin
    Item := ListView1.Items.Add;
    Item.Data := aRecord;
    Item.Caption := aRecord.title;
  end;
  if selectedItem <> nil then
    ListView1.Selected := selectedItem; // otherwise nothing will be selected
  ListView1.Items.EndUpdate;
end;

end.
