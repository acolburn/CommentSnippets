unit Snippet;

interface

type TSnippet=class
  private
    FTitle: string;
    FCode: string;
    FTags: string; //formatted as TStringList.CommaText
  published
  property Title: string read FTitle write FTitle;
  property Code: string read FCode write FCode;
  property Tags: string read FTags write FTags;
end;

implementation

end.
