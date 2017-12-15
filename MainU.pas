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
  DM.Delete(edtTitle.Text);
  SynEdit1.Clear;
  edtTitle.Clear;
  UpdateDisplay;
end;

procedure TfrmMain.btnNewClick(Sender: TObject);
begin
  DM.EditMode:=new;
  SynEdit1.Clear;
  edtTitle.Clear;
  ListView1.Selected:=nil;
  //item:=ListView1.Items.Add;
  //as soon as user hits return then? ...
  //item.Caption:=SynEdit1.Lines[0]; //first row in memo
  //add a new record to db
  //use a timer (triggered within SynEdit on change?) to periodically update the new record
  //UPDATE Snippets SET code=:code WHERE title=:title
end;

procedure TfrmMain.btnSaveClick(Sender: TObject);
var
  aTitle, aCode: string;
begin
  aTitle:=edtTitle.Text;
  aCode:=SynEdit1.Text;
  if DM.EditMode=new then
   begin
  DM.Add(aTitle,aCode);
  DM.EditMode:=edit;
   end
   else
   DM.Update(aTitle,aCode);

  UpdateDisplay;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  UpdateDisplay;
  DM.EditMode:=edit;
end;

  {The OnSelectItem event tells you the item being changed and whether it is being
  selected or unselected. So it is triggered when the
  old item is being unselected, AND AGAIN for the new item that is becoming selected.}
procedure TfrmMain.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  SynEdit1.Lines.Clear;

  //Selected=false when the old item is being unselected
//  if Selected=false then
//  begin
//    DM.SelTitle:=Item.Caption;
//  end;


  //Selected=true when the new item is being selected
  if Selected=true then
  begin
  //display title
  edtTitle.Text:=Item.Caption;
  SynEdit1.Text:=DM.GetCode(Item.Caption);
  DM.SelTitle:=Item.Caption;
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
    sl.CommaText := DM.GetTitles;
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
