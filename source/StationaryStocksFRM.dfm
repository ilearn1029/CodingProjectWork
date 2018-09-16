object frmStationaryStocks: TfrmStationaryStocks
  Left = 0
  Top = 0
  Caption = 'frmStationaryStocks'
  ClientHeight = 626
  ClientWidth = 808
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 408
    Width = 808
    Height = 218
    Align = alBottom
    TabOrder = 0
    object btnAdd: TButton
      Left = 110
      Top = 177
      Width = 75
      Height = 25
      Caption = 'Add &New'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnDelete: TButton
      Left = 319
      Top = 177
      Width = 75
      Height = 25
      Caption = '&Delete'
      TabOrder = 1
      OnClick = btnDeleteClick
    end
    object btnEdit: TButton
      Left = 208
      Top = 177
      Width = 75
      Height = 25
      Caption = '&Edit'
      TabOrder = 2
      OnClick = btnEditClick
    end
    object Button3: TButton
      Left = 417
      Top = 177
      Width = 75
      Height = 25
      Caption = '&Cancel'
      TabOrder = 3
    end
    object DBGrid1: TDBGrid
      Left = 48
      Top = 16
      Width = 521
      Height = 120
      DataSource = StocksDatasource
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object StocksTree: TVirtualStringTree
    Left = 0
    Top = 0
    Width = 808
    Height = 408
    Align = alClient
    Header.AutoSizeIndex = -1
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.MainColumn = 1
    Header.Options = [hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible, hoAutoSpring]
    TabOrder = 1
    TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowVertGridLines, toThemeAware, toUseBlendedImages, toFullVertGridLines, toUseBlendedSelection, toUseExplorerTheme]
    TreeOptions.SelectionOptions = [toFullRowSelect]
    OnDblClick = StocksTreeDblClick
    OnGetText = StocksTreeGetText
    OnInitNode = StocksTreeInitNode
    Columns = <
      item
        Position = 0
        WideText = 'Stock ID'
      end
      item
        Position = 1
        WideText = 'Item Name'
      end
      item
        Position = 2
        WideText = 'Quantity'
      end
      item
        Position = 3
        WideText = 'Unit Price'
      end>
  end
  object StocksDatasource: TDataSource
    Left = 648
    Top = 448
  end
  object ActionList: TActionList
    Left = 417
    Top = 264
    object FilterAction: TAction
      Caption = 'Filter'
    end
    object ResetFilterAction: TAction
      Caption = 'Reset Filter'
    end
    object AddAction: TAction
      Caption = 'Add'
    end
    object EditAction: TAction
      Caption = 'Edit'
    end
    object DeleteAction: TAction
      Caption = 'Delete'
    end
    object CancelAction: TAction
      Caption = 'Cancel'
    end
    object PrintAction: TAction
      Caption = 'Print'
    end
    object DesignAction: TAction
      Caption = 'Design'
      Visible = False
    end
    object FindPatientAction: TAction
      Caption = 'Find Patient'
      ShortCut = 115
    end
    object ClearPatientAction: TAction
      Caption = 'Clear'
    end
    object PreviewAction: TAction
      Caption = 'Preview'
    end
  end
end
