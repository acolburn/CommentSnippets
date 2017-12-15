unit MainU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SynEdit, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ToolWin, DataModule, SynEditHighlighter, SynHighlighterDWS, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList;

type
  TfrmMain = class(TForm)
    ToolBar1: TToolBar;
    ListView1: TListView;
    Splitter1: TSplitter;
    SynEdit1: TSynEdit;
    SynDWSSyn1: TSynDWSSyn;
    btnNew: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtTitle: TEdit;
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
begin
  records.Delete(edtTitle.Text);
  SynEdit1.Clear;
  edtTitle.Clear;
  UpdateDisplay;
end;

procedure TfrmMain.btnNewClick(Sender: TObject);
begin
  records.EditMode := new;
  SynEdit1.Clear;
  edtTitle.Clear;
  ListView1.Selected := nil;
  // item:=ListView1.Items.Add;
  // as soon as user hits return then? ...
  // item.Caption:=SynEdit1.Lines[0]; //first row in memo
  // add a new record to db
  // use a timer (triggered within SynEdit on change?) to periodically update the new record
end;

procedure TfrmMain.btnSaveClick(Sender: TObject);
var
  aTitle, aCode: string;
begin
  aTitle := edtTitle.Text;
  aCode := SynEdit1.Text;
  if records.EditMode = new then
  begin
    records.Add(aTitle, aCode);
    records.EditMode := edit;
  end
  else
    records.Update(aTitle, aCode);

  UpdateDisplay;
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
    // display title
    edtTitle.Text := Item.Caption;
    SynEdit1.Text := records.GetCode(Item.Caption);
    // tell DM selected item has changed
    records.SelTitle := Item.Caption;
  end;

end;

procedure TfrmMain.UpdateDisplay;
var
  sl: TStringList;
  Item: TListItem;
  I: Integer;
begin
  ListView1.Items.BeginUpdate;
  ListView1.Clear;
  sl := TStringList.Create;
  try
    sl.CommaText := records.GetTitles;
    for I := 0 to sl.Count - 1 do
    begin
      Item := ListView1.Items.Add;
      Item.Caption := sl[I];
    end;
  finally
    sl.Free;
  end;
  ListView1.Items.EndUpdate;
end;

end.
