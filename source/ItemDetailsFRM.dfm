object frmItemDetails: TfrmItemDetails
  Left = 0
  Top = 0
  Caption = 'Item Details'
  ClientHeight = 164
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 44
    Width = 52
    Height = 13
    Caption = 'Item Name'
  end
  object Label5: TLabel
    Left = 16
    Top = 14
    Width = 35
    Height = 13
    Caption = 'Item Id'
  end
  object Label7: TLabel
    Left = 16
    Top = 74
    Width = 78
    Height = 13
    Caption = 'Item Description'
  end
  object edtItemName: TEdit
    Left = 98
    Top = 38
    Width = 263
    Height = 21
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 75
    Top = 113
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 179
    Top = 113
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object edtItemId: TEdit
    Left = 98
    Top = 8
    Width = 121
    Height = 21
    Enabled = False
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 3
  end
  object edtItemDescription: TEdit
    Left = 98
    Top = 68
    Width = 263
    Height = 21
    TabOrder = 4
  end
end
