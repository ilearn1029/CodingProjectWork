unit ItemController;

interface

uses
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  System.Generics.Collections,
  System.SysUtils,
  InventoryDM;

type
  TItem = class
  private
    FItemId: integer;
    FItemName: string;
    FItemDescription: string;
  published
    property ItemId: integer read FItemId write FItemId;
    property ItemName: string read FItemName write FItemName;
    property ItemDescription: string read FItemDescription write FItemDescription;
  end;

  TItemList = class (TObjectList<TItem>)
  end;

  TItemController = class
  private
    FItemList: TItemList;
    FItemQry: TFDQuery;
    FOnListChanged: TNotifyEvent;
    function GetItemsSQL: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadItems;
    procedure BuildItemsQuery;
    procedure DoListChanged;
    procedure AddItem(const AItem: TItem);
    procedure DeleteItem(const AItem: TItem);
    procedure EditItem(const AItem: TItem);
    property ItemList: TItemList read FItemList write FItemList;
    property OnListChanged: TNotifyEvent read FOnListChanged write FOnListChanged;
  end;

implementation

{ TItemList }

procedure TItemController.AddItem(const AItem: TItem);
var
  LInsertQry: TFDQuery;
begin
  LInsertQry := GetNewInventoryQuery;
  try
    LInsertQry.SQL.Text := 'insert into Inventory_Items  '
    + #13#10 + '(Item_id, item_name, item_description)'
    + #13#10 + 'values'
    + #13#10 + '(:item_id, :item_name, :item_description)';
    LInsertQry.Prepare;
    LInsertQry.ParamByName('Item_id').AsInteger := NextInventorySequenceValue('GEN_Item_ID');
    LInsertQry.ParamByName('Item_name').AsString := AItem.ItemName;
    LInsertQry.ParamByName('Item_description').AsString := AItem.ItemDescription;
    LInsertQry.ExecSQL;
    FItemList.Add(AItem);
    DoListChanged;
  finally
    LInsertQry.Free;
  end;
end;

procedure TItemController.DeleteItem(const AItem: TItem);
var
  LDeleteQry: TFDQuery;
begin
  LDeleteQry := GetNewInventoryQuery;
  try
    LDeleteQry.SQL.Text := 'delete from Inventory_Items where Item_id = :Item_id';
    LDeleteQry.Prepare;
    LDeleteQry.ParamByName('Item_id').AsInteger := AItem.ItemId;
    LDeleteQry.ExecSQL;
    FItemList.Remove(AItem);
    DoListChanged;
  finally
    LDeleteQry.Free;
  end;
end;

procedure TItemController.BuildItemsQuery;
begin
  FItemQry.SQL.Text := GetItemsSQL;
end;

constructor TItemController.Create;
begin
  FItemList := TItemList.Create;
  FItemQry := GetNewInventoryQuery;

  BuildItemsQuery;
end;

destructor TItemController.Destroy;
begin
  FItemList.Free;
  FItemQry.Free;
  inherited;
end;

procedure TItemController.DoListChanged;
begin
  if Assigned(FOnListChanged) then
    FOnListChanged(self);
end;

procedure TItemController.EditItem(const AItem: TItem);
var
  LUpdateQry: TFDQuery;
begin
  LUpdateQry := GetNewInventoryQuery;
  try
    LUpdateQry.SQL.Text := 'update Inventory_Items  '
        + #13#10 + 'set'
        + #13#10 + #9 + 'item_name =:item_name,'
        + #13#10 + #9 + 'item_description =:item_description'
        + #13#10 + 'where'
        + #13#10 + #9 + '1=1'
        + #13#10 + #9 + 'and Item_id =:Item_id';
    LUpdateQry.Prepare;
    LUpdateQry.ParamByName('item_id').AsInteger := AItem.ItemId;
    LUpdateQry.ParamByName('item_name').AsString := AItem.ItemName;
    LUpdateQry.ParamByName('item_description').AsString := AItem.ItemDescription;
    LUpdateQry.ExecSQL;
    DoListChanged;
  finally
    LUpdateQry.Free;
  end;
end;

function TItemController.GetItemsSQL: string;
begin
  result := 'select'
            + #13#10 + #9 + 'ii.Item_id,'
            + #13#10 + #9 + 'ii.item_name,'
            + #13#10 + #9 + 'ii.item_description'
            + #13#10 + 'from'
            + #13#10 + #9 + 'inventory_items ii'
            + #13#10 + 'where'
            + #13#10 + #9 + '1=1'
end;

procedure TItemController.LoadItems;
var
  LItem: TItem;
begin
  FItemList.Clear;
  FItemQry.Open;

  FItemQry.First;
  while not FItemQry.Eof do
  begin
    LItem := TItem.Create;
    LItem.ItemId := FItemQry.FieldByName('Item_id').AsInteger;
    LItem.ItemName := FItemQry.FieldByName('item_name').AsString;
    LItem.ItemDescription := FItemQry.FieldByName('item_description').AsString;
    FItemList.Add(LItem);
    FItemQry.Next;
  end;
  FItemQry.Close;
  DoListChanged;
end;


end.
