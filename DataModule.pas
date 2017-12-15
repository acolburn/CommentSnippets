unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Data.DbxSqlite;

type
  TEditMode = (edit, new);

  TDataModule1 = class(TDataModule)
    Connection: TSQLConnection;
    Query: TSQLQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    FSelTitle: string;
    FEditMode: TEditMode;
  public
    property SelTitle: string read FSelTitle write FSelTitle;
    property EditMode: TEditMode read FEditMode write FEditMode;
    function GetTitles: string;
    function GetCode(aTitle: string): string;
    procedure Add(aTitle: string; aCode: string);
    procedure Delete(aTitle: string);
    procedure Update(newTitle: string; aCode: string);
  end;

var
  records: TDataModule1;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

procedure TDataModule1.Add(aTitle, aCode: string);
begin
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
end;

procedure TDataModule1.Delete(aTitle: string);
begin
  Query.SQL.Text := 'delete from Snippets where title=:aTitle';
  Query.ParamByName('aTitle').AsString := aTitle;
  Query.ExecSQL();
end;

function TDataModule1.GetCode(aTitle: string): string;
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    Query.SQL.Text := 'select code from Snippets where title=:aTitle';
    Query.ParamByName('aTitle').AsString := aTitle;
    Query.Active := true;
    // sl.Add(aTitle);
    // sl.Add('');
    sl.Add(Query.FieldByName('code').AsString);
    result := sl.Text;
  finally
    sl.Free;
  end;
end;

function TDataModule1.GetTitles: string;
var
  sl: TStringList;
begin
  sl := TStringList.Create;
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

procedure TDataModule1.Update(newTitle, aCode: string);
begin
  // title field unchanged
  if (FSelTitle = newTitle) then
    Query.SQL.Text := 'update Snippets set code=:aCode where title=:oldTitle'
    // title field changed
  else if (FSelTitle <> newTitle) then
  begin
    Query.SQL.Text :=
      'update Snippets set code=:aCode, title=:newTitle where title=:oldTitle';
    Query.ParamByName('newTitle').AsString := newTitle;
  end;
  Query.ParamByName('aCode').AsString := aCode;
  Query.ParamByName('oldTitle').AsString := FSelTitle;

  Query.ExecSQL();
end;

end.
