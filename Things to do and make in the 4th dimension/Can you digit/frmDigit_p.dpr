program frmDigit_p;

uses
  Forms,
  frmDigit_i in 'frmDigit_i.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
