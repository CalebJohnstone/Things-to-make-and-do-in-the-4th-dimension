unit frmNumberTypes_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Math;

type
  TfrmNumberTypes = class(TForm)
    redOut: TRichEdit;
    btnTriangleSqr: TButton;
    btnHappification: TButton;
    btnPerfect: TButton;
    btnKeith: TButton;
    procedure btnTriangleSqrClick(Sender: TObject);
    procedure btnHappificationClick(Sender: TObject);
    procedure btnPerfectClick(Sender: TObject);
    procedure btnKeithClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNumberTypes: TfrmNumberTypes;

implementation

{$R *.dfm}

procedure TfrmNumberTypes.btnHappificationClick(Sender: TObject);
var
  k, j, iSum, iLength, iNum : Integer;
  bDone : Boolean;
begin
  redOut.Lines.Clear;
  redOut.Lines.Add('Number'+#9+'Sum');
  redOut.Lines.Add('');

  for k := 10 to 99 do
  begin
    iSum := Sqr(k div 10)+Sqr(k mod 10);
    redOut.Lines.Add(IntToStr(k)+#9+IntToStr(iSum));
  end;
  redOut.Lines.Add('Finished');

  //enter own number and show sequence
  {k := StrToInt(InputBox('Own number','Enter below','145'));
  bDone := False;
  redOut.Lines.Clear;

  iNum := 0;
  while (iNum < 101) do
  begin
    Inc(iNum);
    k := iNum;
    while (k > 1) do
    begin
      redOut.Lines.Add(IntToStr(k));
      iSum := 0;
      iLength := Length(IntToStr(k));
      for j := 1 to iLength do
      begin
        Inc(iSum, Sqr(StrToInt(IntToStr(k)[j])));
      end;
      k := iSum;
    end;
  end;//big while

  }
end;

procedure TfrmNumberTypes.btnKeithClick(Sender: TObject);
var
  k, iSum, j, iKeep, iLoop, iKeith, iMaxLoop : Integer;
  arrKeithStore : array[1..4] of Integer;
  sLine, sOut, sLine1 : string;
  tFile : textfile;
begin
  //normal Keith numbers
  iKeith := 0;
  iMaxLoop := 0;
  AssignFile(tFile, 'KeithNumbers.txt');
  Rewrite(tFile);
  redOut.Lines.Clear;

  
  for k := 10 to 10000 do
  begin
    //742
    iSum := 0;
    for j := 1 to Length(IntToStr(k)) do
    begin
      Inc(iSum, StrToInt(IntToStr(k)[j]));
      arrKeithStore[j] := StrToInt(IntToStr(k)[j]);
    end;
    
    sLine1 := IntToStr(k)+#13;
    
    for j := 1 to Length(IntToStr(k))-1 do
      sLine1 := sLine1+IntToStr(arrKeithStore[j])+' + ';
    sLine1 := sLine1+IntToStr(arrKeithStore[j])+' = '+IntToStr(iSum);
    
    //iSum = 13
    iLoop := 0;
    sLine := '';
    
    while (iSum <> k) and (iLoop < 10) do
    begin
      Inc(iLoop);
      iKeep := iSum;
      Dec(iSum, arrKeithStore[1]);
      for j := 1 to Length(IntToStr(k))-1 do
        arrKeithStore[j] := arrKeithStore[j+1];
      arrKeithStore[j] := iKeep;
      //iSum = 6 and iKeep = 13
      Inc(iSum, iKeep);
      //iSum = 19
      
      for j := 1 to Length(IntToStr(k))-1 do
        sLine := sLine+IntToStr(arrKeithStore[j])+' + ';
      sLine := sLine+IntToStr(arrKeithStore[j])+' = '+IntToStr(iSum)+#13;
      if iSum <> k then
        for j := 1 to iLoop+1 do
          sLine := sLine+'       ';
    end;
    
    if iSum = k then
    begin
      Inc(iKeith);
      sOut := sOut+sLine1+#13+'        '+sLine+' Steps: '+IntToStr(iLoop+1)+#13+#13+'';
      if iLoop+1 > iMaxLoop then
        iMaxLoop := iLoop+1;
    end;

  end;
  redOut.Lines.Add('Max steps: '+IntToStr(iMaxLoop));
  redOut.Lines.Add('');
  redOut.Lines.Add(sOut);

  Write(tFile, redOut.Lines.Text);
  CloseFile(tFile);
end;

procedure TfrmNumberTypes.btnPerfectClick(Sender: TObject);
var
  k, iSum, j : Integer;
begin
  redOut.Lines.Clear;
  redOut.Lines.Add('Number'+#9+'Sum');
  redOut.Lines.Add('');

  for k := 1 to 10000 do
  begin
    iSum := 0;
    for j := 1 to k div 2 do
      if k mod j = 0 then
        Inc(iSum, j);
    if k = iSum then
      redOut.Lines.Add(IntToStr(k)+#9+IntToStr(iSum));
  end;
end;

procedure TfrmNumberTypes.btnTriangleSqrClick(Sender: TObject);
var
  iUpper, k, j, iTriangle : Integer;
  bFound : Boolean;
begin
  iUpper := StrToInt(InputBox('Upper boundary','Enter','100'));

  for k := 1 to iUpper do
  begin
    iTriangle := 0;
    j := 0;
    bFound := false;

    while (j <= iUpper) and not(bFound) do
    begin
      Inc(j);
      Inc(iTriangle, j);
      if iTriangle = Sqr(k) then
        bFound := True;
    end;
    if bFound then
      redOut.Lines.Add('Square : '+IntToStr(k)+' and Triangle : '+IntToStr(j));
  end;

end;

end.
