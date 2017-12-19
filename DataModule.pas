unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Data.DbxSqlite, Generics.Collections, Snippet;

type
  TEditMode = (edit, new);

  TDataModule1 = class(TDataModule)
    Connection: TSQLConnection;
    Query: TSQLQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    FSelTitle: string;
    FEditMode: TEditMode;
    FIndex: integer;
    FRecordList: TList<TSnippet>;
  public
    property SelTitle: string read FSelTitle write FSelTitle;
    property EditMode: TEditMode read FEditMode write FEditMode;
    property Index: integer read FIndex write FIndex;
    property recordList: TList<TSnippet> read FRecordList write FRecordList;
    function GetTitles: string;
    procedure UpdateRecordList;
    function GetCode(aIndex: integer): string;
    function GetCodeAndTitle(aIndex: integer): string;
    procedure Add(aTitle: string; aCode: string);
    procedure Delete(aIndex: integer);
    procedure Update(aIndex: integer; aTitle: string; aCode: string);
  end;

var
  records: TDataModule1;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

procedure TDataModule1.Add(aTitle: string; aCode: string);
begin
  Query.Active:=false;
  Query.SQL.Text :=
    'insert into Snippets (title, code) values (:aTitle, :aCode)';
  Query.ParamByName('aTitle').AsString := aTitle;
  Query.ParamByName('aCode').AsString := aCode;
  Query.ExecSQL();
end;

// see http://docwiki.embarcadero.com/RADStudio/XE8/en/Tutorial:_Connecting_to_a_SQLite_Database_from_a_VCL_Application
procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  Connection.Params.Add('Database=.\Snippets.db');
  Connection.Connected := true;

  recordList:=TList<TSnippet>.Create;
end;

procedure TDataModule1.Delete(aIndex: integer);
begin
  Query.Active:=false;
  Query.SQL.Text := 'delete from Snippets where id=:aIndex';
  Query.ParamByName('aIndex').AsInteger := aIndex;
  Query.ExecSQL();
end;

function TDataModule1.GetCode(aIndex: integer): string;
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    Query.Active:=false;
    Query.SQL.Text := 'select code from Snippets where id=:aIndex';
    Query.ParamByName('aIndex').AsInteger := aIndex;
    Query.Active := true;
    // sl.Add(aTitle);
    // sl.Add('');
    sl.Add(Query.FieldByName('code').AsString);
    result := sl.Text;
  finally
    sl.Free;
  end;
end;

function TDataModule1.GetCodeAndTitle(aIndex: integer): string;
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    Query.Active:=false;
    Query.SQL.Text := 'select code from Snippets where id=:aIndex';
    Query.ParamByName('aIndex').AsInteger := aIndex;
    Query.Active := true;
    // sl.Add(aTitle);
    // sl.Add('');
    sl.Add(Query.FieldByName('code').AsString);
    result := sl.Text;
  finally
    sl.Free;
  end;
end;

procedure TDataModule1.UpdateRecordList;
var
  aSnippet: TSnippet;
begin
    Query.Active:=false;
    Query.SQL.Text := 'select * from Snippets';
    Query.Active := true;
    if not Query.IsEmpty then
    begin
      Query.First;
      FRecordList.Clear;
      while not Query.Eof do
      begin
        aSnippet := TSnippet.Create;
        aSnippet.id := Query.FieldByName('id').AsInteger;
        aSnippet.title := Query.FieldByName('title').AsString;
        aSnippet.code := Query.FieldByName('code').AsString;
        aSnippet.tags := Query.FieldByName('tags').AsString;
        FRecordList.Add(aSnippet);
        //aSnippet.Free;
        Query.Next;
      end;
    end;

end;

function TDataModule1.GetTitles: string;
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  Query.Active:=false;
  Query.SQL.Text := 'select title from Snippets';
  Query.Active := true;
  if not Query.IsEmpty then
  begin
    Query.First;
    while not Query.Eof do
    begin
      sl.Add(Query.FieldByName('title').AsString);
      Query.Next;
    end;
  end;
  result := sl.CommaText;

end;

procedure TDataModule1.Update(aIndex: integer; aTitle, aCode: string);
begin
  // // title field unchanged
  // if (FSelTitle = aTitle) then
  // Query.SQL.Text := 'update Snippets set code=:aCode where title=:oldTitle'
  // // title field changed
  // else if (FSelTitle <> newTitle) then
  // begin
  // Query.SQL.Text :=
  // 'update Snippets set code=:aCode, title=:newTitle where title=:oldTitle';
  // Query.ParamByName('newTitle').AsString := newTitle;
  // end;
  // Query.ParamByName('aCode').AsString := aCode;
  // Query.ParamByName('oldTitle').AsString := FSelTitle;

  Query.Active:=false;
  Query.SQL.Text :=
    'update Snippets set code=:aCode, title=:aTitle where index=:aIndex';
  Query.ParamByName('aCode').AsString := aCode;
  Query.ParamByName('aTitle').AsString := aTitle;
  Query.ParamByName('aIndex').AsInteger := aIndex;

  Query.ExecSQL();
end;

end.
