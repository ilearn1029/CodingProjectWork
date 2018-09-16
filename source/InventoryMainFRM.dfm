object frmMainInventory: TfrmMainInventory
  Left = 0
  Top = 0
  Caption = 'Main Inventory'
  ClientHeight = 417
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 706
    Height = 25
    Align = alTop
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Inventory Management System       '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMoneyGreen
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object MainMenu1: TMainMenu
    Left = 264
    Top = 112
    object Stocks1: TMenuItem
      Caption = 'Inventory'
      object btnStocks: TMenuItem
        Caption = 'Stocks'
        OnClick = btnStocksClick
      end
      object btnItems: TMenuItem
        Caption = 'Items'
        OnClick = btnItemsClick
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object HelpInv: TMenuItem
        Caption = 'Help Inventory System'
      end
      object About1: TMenuItem
        Caption = 'About'
        OnClick = About2Click
      end
    end
  end
end
