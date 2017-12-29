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
    //FSelTitle: string;
    FEditMode: TEditMode;
    FSelID: integer;
    FRecordList: TList<TSnippet>;
  public
    property EditMode: TEditMode read FEditMode write FEditMode;
    property SelectedID: integer read FSelID write FSelID;
    property recordList: TList<TSnippet> read FRecordList write FRecordList;
    function GetTitles: string;
    procedure UpdateRecordList;
    function GetCode: string;
    procedure Add(aTitle: string; aCode: string);
    procedure DeleteSelectedRecord;
    procedure Update(anId: integer; aTitle: string; aCode: string);
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
  //tells you ID of new record:
  Query.Active:=false;
  Query.SQL.Text:='select last_insert_rowid()';
  Query.Active:=true;
  FSelID:=Query.Fields[0].AsInteger;
end;

// see http://docwiki.embarcadero.com/RADStudio/XE8/en/Tutorial:_Connecting_to_a_SQLite_Database_from_a_VCL_Application
procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  Connection.Params.Add('Database=.\Snippets.db');
  Connection.Connected := true;

  recordList:=TList<TSnippet>.Create;
end;

procedure TDataModule1.DeleteSelectedRecord;
begin
  Query.Active:=false;
  Query.SQL.Text := 'delete from Snippets where id=:aIndex';
  Query.ParamByName('aIndex').AsInteger := FSelID;
  Query.ExecSQL();
end;

function TDataModule1.GetCode: string;
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    Query.Active:=false;
    Query.SQL.Text := 'select code from Snippets where id=:aIndex';
    Query.ParamByName('aIndex').AsInteger := FSelID;
    Query.Active := true;
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

procedure TDataModule1.Update(anId: integer; aTitle, aCode: string);
begin
  Query.Active:=false;
  Query.SQL.Text :=
    'update Snippets set code=:aCode, title=:aTitle where id=:anId';
  Query.ParamByName('aCode').AsString := aCode;
  Query.ParamByName('aTitle').AsString := aTitle;
  Query.ParamByName('anId').AsInteger := anId;

  Query.ExecSQL();
end;

end.
