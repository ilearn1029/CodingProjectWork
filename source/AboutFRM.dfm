object AboutBox: TAboutBox
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'About This Application'
  ClientHeight = 129
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblApplicationName: TLabel
    Left = 45
    Top = 24
    Width = 93
    Height = 13
    Caption = 'Inventory Manager'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblVersion: TLabel
    Left = 45
    Top = 46
    Width = 74
    Height = 13
    Caption = 'Version 1.0.0.0'
  end
  object lblCopyRight: TLabel
    Left = 45
    Top = 65
    Width = 188
    Height = 13
    Caption = 'Copyright '#169' 2018.  All rights reserved.'
  end
  object Button1: TButton
    Left = 112
    Top = 91
    Width = 74
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
end
