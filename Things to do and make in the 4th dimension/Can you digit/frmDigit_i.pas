unit frmDigit_i;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Math;

type
  TForm1 = class(TForm)
    btnFactorial: TButton;
    redOut: TRichEdit;
    btnArray: TButton;
    Button1: TButton;
    procedure btnFactorialClick(Sender: TObject);
    procedure btnArrayClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    arrNumber : array[1..9] of string;

    arrNum : array[1..9] of string;
    arrNot : array of string;
  public
    { Public declarations }
  end;
const
  //array method
  arrEven : array[1..4] of string = ('2','4','6','8');
  arrOdd : array[1..4] of string = ('1','3','7','9');
var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnArrayClick(Sender: TObject);
var
  k, iRand, iLength : integer;
  bFound, bCorrect : boolean;
  sNum : string;
begin
  iLength := StrToInt(InputBox('Length','Enter','9'));
  bFound := false;

  while not bFound do
  begin
    sNum := '';

    repeat
      iRand := RandomRange(1,10);
      if pos(IntToStr(iRand),sNum) = 0 then
        sNum := sNum+IntToStr(iRand);
    until (Length(sNum) = iLength);//build sNum

    k := 0;
    bCorrect := true;

    while (k < iLength) and (bCorrect) do
    begin
      Inc(k);
      if StrToInt(copy(sNum,1,k)) mod k <> 0 then
        bCorrect := false;
    end;//while bCorrect

    if bCorrect then
      bFound := true;
  end;//while not bFound
  //final answer
  redOut.Lines.Add('Polydivisible ' + IntToStr(iLength)+' digits: '+sNum);
end;

procedure TForm1.btnFactorialClick(Sender: TObject);
var
  k, iEnd, j, f : integer;
  bFound, bCorrect : boolean;
  sK : string;
begin
  k := 123456789-1;
  bFound := false;//Correct Answer = 381654729
  iEnd := 987654321;

  while (k < iEnd) and (not bFound) do
  begin
    Inc(k);
    sK := IntToStr(k);
    for j := 1 to 9 do
      arrNumber[j] := sK[j];
    j := 0;
    bCorrect := true;

    while (j < 9) and (bCorrect) do //ensure all unique characters
    begin
      Inc(j);
      f := j;
      while (f<8) and (bCorrect) do
      begin
        Inc(f);
        if arrNumber[f] = arrNumber[j] then
          bCorrect := false;
      end; //while f
    end;//while j

    //change bCorrect to false
    //original code

    if (pos('0',sK) <> 0) and (bCorrect) then
    begin
      bCorrect := false
    end
    else
      if (pos('0',sK) = 0) and (bCorrect) then
        bCorrect := false;

    f := 1;

    while (f < 8) and (bCorrect) do
    begin
      Inc(f);
      if StrToInt(copy(sK,1,f)) mod f <> 0 then
        bCorrect := false;
    end; //while mod

    if bCorrect then
    begin
      bFound := true;
      bCorrect := false
    end;

    if bCorrect then
    begin
      //logical rules
      if ((sK[5] = '5') and (pos('0',sK) = 0)) and (sK[6] In ['2','6']) then
      begin
        j := 0;
        bCorrect := true;
        while (j < 8) and (bCorrect) do
        begin
          Inc(j,2);
          if StrToInt(sK[j]) mod 2 <> 0 then
            bCorrect := false;
        end;//while check even positions have even values

        if bCorrect then
        begin
          redOut.Lines.Add(sK);
        end;
      end;//if Pos5 = '5'
    end;//if bCorrect
  end;//while k

  if bFound then
    redOut.Lines.Add(sK);
  ShowMessage('Done');
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  k, iLength, iRand : integer;
  bFound, bCorrect : boolean;
  sNum : string;
begin
  iLength := StrToInt(InputBox('Length','Enter','9'));
  bFound := false;

  while not bFound do
  begin
    sNum := '';

    repeat
      iRand := RandomRange(0,10);
      sNum := sNum+IntToStr(iRand);//can't have unique characters if > 9 characters
    until (Length(sNum) = iLength);//build sNum

    k := 0;
    bCorrect := true;

    while (k < iLength) and (bCorrect) do
    begin
      Inc(k);
      if StrToInt64(copy(sNum,1,k)) mod k <> 0 then
        bCorrect := false;
    end;//while bCorrect

    if bCorrect then
      bFound := true;
  end;//while not bFound
  //final answer
  redOut.Lines.Add('Polydivisible ' + IntToStr(iLength)+' digits: '+sNum);
end;

end.
