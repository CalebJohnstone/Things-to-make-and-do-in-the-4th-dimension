program frmNumberTypes_p;

uses
  Forms,
  frmNumberTypes_u in 'frmNumberTypes_u.pas' {frmNumberTypes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmNumberTypes, frmNumberTypes);
  Application.Run;
end.
