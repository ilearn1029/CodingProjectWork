unit ItemsFRM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  ItemController, System.Actions, Vcl.ActnList, VirtualTrees, Vcl.StdCtrls,
  Vcl.ExtCtrls, System.UITypes;

type
  TfrmItems = class(TForm)
    pnlActions: TPanel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnClose: TButton;
    ItemsTree: TVirtualStringTree;
    ActionList: TActionList;
    FilterAction: TAction;
    ResetFilterAction: TAction;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    CancelAction: TAction;
    PrintAction: TAction;
    DesignAction: TAction;
    FindPatientAction: TAction;
    ClearPatientAction: TAction;
    PreviewAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure ItemsTreeDblClick(Sender: TObject);
    procedure ItemsTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure ItemsTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
  private
    { Private declarations }
    FItemController: TItemController;
    FIsLookUp: boolean;
    procedure ItemControllerListChanged(ASender: TObject);
    function ShowAddNewItem: boolean;
    function GetSelectedItem: TItem;
  public
    { Public declarations }
    property SelectedItem: TItem read GetSelectedItem;
    property IsLookUp: boolean read FIsLookUp write FIsLookUp;

  end;

implementation

uses
  ItemDetailsFRM;

{$R *.dfm}

procedure TfrmItems.FormCreate(Sender: TObject);
begin
  FItemController := TItemController.Create;
  FItemController.OnListChanged := ItemControllerListChanged;
  ItemsTree.NodeDataSize := SizeOf(TItem);
  FItemController.LoadItems;
end;

procedure TfrmItems.FormDestroy(Sender: TObject);
begin
  FItemController.Free;
end;

procedure TfrmItems.FormShow(Sender: TObject);
begin
  if ItemsTree.CanFocus then
    ItemsTree.SetFocus;

  pnlActions.Visible := not IsLookUp;

end;

procedure TfrmItems.btnAddClick(Sender: TObject);
begin
  if ShowAddNewItem then
    FItemController.LoadItems;
end;

procedure TfrmItems.btnEditClick(Sender: TObject);
var
  LItemDetailsFRM: TfrmItemDetails;
  LItem: TItem;
begin
  if not Assigned(ItemsTree.FocusedNode) then
    Exit;

  LItem := ItemsTree.FocusedNode.GetData<TItem>;

  LItemDetailsFRM := TfrmItemDetails.Create(nil);
  try
    LItemDetailsFRM.Item := LItem;
    if LItemDetailsFRM.ShowModal = mrOK then
    begin
      FItemController.EditItem(LItem);
      FItemController.LoadItems;
    end;
  finally
    LItemDetailsFRM.Free;
  end;
end;

procedure TfrmItems.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmItems.btnDeleteClick(Sender: TObject);
var
  LNode: PVirtualNode;
  LItem: TItem;
begin
  LNode := ItemsTree.FocusedNode;
  if Assigned(LNode) then
  begin
    LItem := LNode.GetData<TItem>;
    if MessageDlg('Are you sure to delete the Item for ItemId ' +
      IntToStr(LItem.ItemId) + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
    begin
      FItemController.DeleteItem(LItem);
    end;
  end;

end;

procedure TfrmItems.ItemsTreeDblClick(Sender: TObject);
begin
  if IsLookUp then
    ModalResult := mrOk
  else
    btnEditClick(Sender);
end;

procedure TfrmItems.ItemsTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  LItem: TItem;
begin
  LItem := Node.GetData<TItem>;
  case Column of
    0:
      CellText := IntToStr(LItem.ItemId);
    1:
      CellText := LItem.ItemName;
    2:
      CellText := LItem.ItemDescription;
  end;
end;

procedure TfrmItems.ItemsTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  Node.SetData<TItem>(FItemController.ItemList[Node.Index]);
end;

function TfrmItems.ShowAddNewItem: boolean;
var
  LItemDetailsFRM: TfrmItemDetails;
  LItem: TItem;
begin
  result := false;
  LItemDetailsFRM := TfrmItemDetails.Create(nil);
  LItemDetailsFRM.ItemMode := smNew;
  try
    LItem := TItem.Create;
    LItemDetailsFRM.Item := LItem;
    if LItemDetailsFRM.ShowModal = mrOK then
    begin
      // LItem := TItem.Create;
      // LItem.ItemId := StrToInt(LItemDetailsFRM.edtItemId.Text);
      // LItem.ItemName := LItemDetailsFRM.edtItemName.Text;
      // LItem.ItemDescription := LItemDetailsFRM.edtItemId.Text;
      FItemController.AddItem(LItem);
      result := True;
    end;

  finally
    LItemDetailsFRM.Free;
  end;
end;


procedure TfrmItems.ItemControllerListChanged(ASender: TObject);
begin
  ItemsTree.RootNodeCount := FItemController.ItemList.Count;
  ItemsTree.ReinitNode(nil, True);
end;

function TfrmItems.GetSelectedItem: TItem;
var
  LNode: PVirtualNode;
begin
  result := nil;
  LNode := ItemsTree.FocusedNode;
  if Assigned(LNode) then
  begin
    result := LNode.GetData<TItem>;
  end;
end;


end.

