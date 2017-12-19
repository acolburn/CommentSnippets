program CodeSnippets;

uses
  Vcl.Forms,
  MainU in 'MainU.pas' {frmMain},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  Snippet in 'Snippet.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDataModule1, records);
  Application.Run;
end.
