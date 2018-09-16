object frmStockDetails: TfrmStockDetails
  Left = 0
  Top = 0
  Caption = 'Stock Details'
  ClientHeight = 251
  ClientWidth = 583
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
  object Label2: TLabel
    Left = 367
    Top = 10
    Width = 42
    Height = 13
    Caption = 'Quantity'
  end
  object Label3: TLabel
    Left = 364
    Top = 37
    Width = 45
    Height = 13
    Caption = 'Unit Price'
  end
  object Label4: TLabel
    Left = 364
    Top = 75
    Width = 66
    Height = 13
    Caption = 'Modified Date'
  end
  object Label5: TLabel
    Left = 16
    Top = 14
    Width = 35
    Height = 13
    Caption = 'Item Id'
  end
  object Label6: TLabel
    Left = 16
    Top = 117
    Width = 79
    Height = 13
    Caption = 'Stock Comments'
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
    Width = 121
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 0
  end
  object edtQuantity: TEdit
    Left = 440
    Top = 8
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object edtPrice: TEdit
    Left = 440
    Top = 38
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 2
  end
  object btnOK: TButton
    Left = 187
    Top = 209
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 291
    Top = 209
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object dtModifiedDate: TDateTimePicker
    Left = 440
    Top = 71
    Width = 121
    Height = 21
    Date = 43359.685044351850000000
    Time = 43359.685044351850000000
    Enabled = False
    TabOrder = 5
  end
  object edtItemId: TEdit
    Left = 98
    Top = 8
    Width = 121
    Height = 21
    Enabled = False
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 6
  end
  object mmStockComments: TMemo
    Left = 16
    Top = 136
    Width = 545
    Height = 58
    Lines.Strings = (
      '')
    TabOrder = 7
  end
  object edtItemDescription: TEdit
    Left = 98
    Top = 68
    Width = 220
    Height = 21
    Enabled = False
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 8
  end
  object btnItemsSearch: TBitBtn
    Left = 225
    Top = 8
    Width = 19
    Height = 19
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF484847595757FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B4A
      4A61605F565555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF4B4A4A6D6B6A5A5959FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B4A4A7675745A59
      59FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF4B4A4A7B7A7A616060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFA7A7A6D6D5CDE0DFD8D6D5CDA1A1A09695956D6B6A616060FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECDC7FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFC8C7C2A1A1A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B5B2
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A6FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFD6D5CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFD1D0C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDACC
      F2F1E1F2F1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D6C9FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFD6D5CDF1F0DEF2F1E1F1F0DEF0EFDCF0EFDCF0
      EFDCEFEDDAD1CFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAB9B3
      EFEDDAF2F1E1F2F1E1F5F4E8F2F1E1F2F1E1E8E6D2AFAFABFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAB9B3EEEDE0FAF9F3FAF9F3F8F7EFEF
      EDDAB6B5B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFA6A6A2BAB9B3BCBCB7B6B5B2A7A7A6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 9
    OnClick = btnItemsSearchClick
  end
end
