object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 398
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnFactorial: TButton
    Left = 40
    Top = 32
    Width = 105
    Height = 25
    Caption = 'Factorial Method'
    TabOrder = 0
    OnClick = btnFactorialClick
  end
  object redOut: TRichEdit
    Left = 40
    Top = 80
    Width = 273
    Height = 217
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object btnArray: TButton
    Left = 168
    Top = 32
    Width = 89
    Height = 25
    Caption = 'Array Method'
    TabOrder = 2
    OnClick = btnArrayClick
  end
  object Button1: TButton
    Left = 263
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
end
