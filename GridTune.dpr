program GridTune;

uses
  Vcl.Forms,
  MmainForm in 'MmainForm.pas' {Form3},
  GridTuneDlg in 'GridTuneDlg.pas' {GridTuneDialog},
  GrigTuneButton in 'GrigTuneButton.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TGridTuneDialog, GridTuneDialog);
  Application.Run;
end.
