program GridTune;

uses
  Vcl.Forms,
  MmainForm in 'MmainForm.pas' {testForm},
  GridTuneDlg in 'GridTuneDlg.pas' {GridTuneDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TtestForm, testForm);
  Application.Run;
end.
