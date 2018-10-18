program GridTune;

uses
  Vcl.Forms,
  MmainForm in 'MmainForm.pas' {testForm},
  GridTuneDlg in 'GridTuneDlg.pas' {GridTuneDialog},
  GrigTuneButton in 'GrigTuneButton.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TtestForm, testForm);
  Application.CreateForm(TGridTuneDialog, GridTuneDialog);
  Application.Run;
end.
