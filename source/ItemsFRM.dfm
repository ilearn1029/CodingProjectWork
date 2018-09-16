object frmItems: TfrmItems
  Left = 0
  Top = 0
  Caption = 'Items'
  ClientHeight = 225
  ClientWidth = 583
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
  object pnlActions: TPanel
    Left = 0
    Top = 179
    Width = 583
    Height = 46
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 180
    object btnAdd: TButton
      Left = 65
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Add &New'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnEdit: TButton
      Left = 162
      Top = 12
      Width = 75
      Height = 25
      Caption = '&Edit'
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TButton
      Left = 265
      Top = 12
      Width = 75
      Height = 25
      Caption = '&Delete'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object btnClose: TButton
      Left = 363
      Top = 12
      Width = 75
      Height = 25
      Caption = '&Close'
      TabOrder = 3
      OnClick = btnCloseClick
    end
  end
  object ItemsTree: TVirtualStringTree
    Left = 0
    Top = 0
    Width = 583
    Height = 179
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
    OnDblClick = ItemsTreeDblClick
    OnGetText = ItemsTreeGetText
    OnInitNode = ItemsTreeInitNode
    ExplicitHeight = 193
    Columns = <
      item
        Alignment = taCenter
        Position = 0
        Width = 70
        WideText = 'Item ID'
      end
      item
        Position = 1
        Width = 200
        WideText = 'Item Name'
      end
      item
        Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable]
        Position = 2
        Width = 300
        WideText = 'Item Description'
      end>
  end
  object ActionList: TActionList
    Left = 417
    Top = 96
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
