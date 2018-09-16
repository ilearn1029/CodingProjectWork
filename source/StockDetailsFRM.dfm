object frmStockDetails: TfrmStockDetails
  Left = 0
  Top = 0
  Caption = 'Stock Details'
  ClientHeight = 218
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 35
    Height = 13
    Caption = 'Item Id'
  end
  object Label2: TLabel
    Left = 48
    Top = 59
    Width = 42
    Height = 13
    Caption = 'Quantity'
  end
  object Label3: TLabel
    Left = 48
    Top = 99
    Width = 45
    Height = 13
    Caption = 'Unit Price'
  end
  object edtItemNo: TEdit
    Left = 96
    Top = 21
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object edtQuantity: TEdit
    Left = 96
    Top = 56
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object edtPrice: TEdit
    Left = 96
    Top = 96
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 2
  end
  object btnOK: TButton
    Left = 96
    Top = 152
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 200
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
end
