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
    function Test: string;
  end;

var
  DM: TDataModule1;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

// see http://docwiki.embarcadero.com/RADStudio/XE8/en/Tutorial:_Connecting_to_a_SQLite_Database_from_a_VCL_Application
procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  Connection.Params.Add('Database=.\Snippets.db');
  Connection.Connected := true;
end;

function TDataModule1.Test: string;
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  Query.SQL.Text := 'select * from Snippets';
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
  result := sl.Text;

end;

end.
