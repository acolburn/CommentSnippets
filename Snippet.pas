unit Snippet;

interface
type
TSnippet=class (TObject)
  private
  FIndex: integer;
  FTitle: string;
  FCode: string;
  FTags: string;
  public
  property id: integer read FIndex write FIndex;
  property title: string read FTitle write FTitle;
  property code: string read FCode write FCode;
  property tags: string read FTags write FTags;
end;

implementation

end.
