unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Data.DbxSqlite;

type
  TDataModule1 = class(TDataModule)
    Connection: TSQLConnection;
    Query: TSQLQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetTitles: string;
    function GetTitleAndCode (aTitle:string):string;
    procedure Add (aTitle:string; aCode:string);
    procedure Delete (aTitle:string);
  end;

var
  DM: TDataModule1;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

// see http://docwiki.embarcadero.com/RADStudio/XE8/en/Tutorial:_Connecting_to_a_SQLite_Database_from_a_VCL_Application
procedure TDataModule1.Add(aTitle, aCode: string);
begin
  Query.SQL.Text:='insert into Snippets (title, code) values (:aTitle, :aCode)';
  Query.ParamByName('aTitle').AsString := aTitle;
  Query.ParamByName('aCode').AsString := aCode;
  Query.ExecSQL();
end;

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

function TDataModule1.GetTitleAndCode(aTitle: string): string;
var
  sl:TStringList;
begin
  sl:=TStringList.Create;
  try
  Query.SQL.Text:= 'select code from Snippets where title=:aTitle';
  Query.ParamByName('aTitle').AsString := aTitle;
  Query.Active:=true;
  //sl.Add(aTitle);
  //sl.Add('');
  sl.Add(Query.FieldByName('code').AsString);
  result:=sl.Text;
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

end.
