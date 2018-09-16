unit InventoryController;

interface

uses
  InventoryDM,
  FireDAC.Comp.Client,
  System.Generics.Collections;

type
  TInventoryController = class
  private
    FStocks: TStockList;
    FItems: TItemList;
    FInventoryDM: TdmInventory;
    function GetStocksQuery: TFDQuery;
    function GetStationaryStocksSQL: string;
    function GetItemsQuery: TFDQuery;
    function GetItemsSQL: string;

  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure AddStock(AStock: TStock);
    procedure AddItem(AItem: TItem);
    procedure DeleteStock(AStockId: Integer);
    procedure DeleteItem(AItemId: Integer);
    procedure ModifyStock(AStock: TStock);
    procedure ModifyItem(AItem: TItem);
    procedure LoadStocks;
    procedure LoadItems;
    property Stocks: TStockList read FStocks write FStocks;
    property Items: TItemList read FItems write FItems;
    property InventoryDM: TdmInventory read FInventoryDM write FInventoryDM;
  end;

implementation

uses
  ItemsFRM,
  StationaryStocksFRM,
  StockDetailsFRM;

{ TInventoryController }

procedure TInventoryController.AddItem(AItem: TItem);
begin

end;

procedure TInventoryController.AddStock(AStock: TStock);
begin
  FStocks.Items.
  AddStock(AStock);

end;

constructor TInventoryController.Create;
begin
  FStocks := TStockList.Create;
  FItems := TItemList.Create;
  FInventoryDM := TdmInventory.Create(nil);
  FInventoryDM.;
end;

procedure TInventoryController.DeleteItem(AItemId: Integer);
begin

end;

procedure TInventoryController.DeleteStock(AStockId: Integer);
begin

end;

destructor TInventoryController.Destroy;
begin
  FStocks.Free;
  FItems.Free;
  FInventoryDM.dbInventory.Close;
  FInventoryDM.Free;

  inherited;
end;

procedure TInventoryController.LoadItems;
var
  LItemsFrm: TfrmItems;
begin
  LItemsFrm := TfrmItems.Create(nil);
  LItemsFrm.ItemsDataSource.DataSet := GetItemsQuery;
  try
    LItemsFrm.ShowModal;
  finally
    LItemsfrm.free;
  end;
end;

procedure TInventoryController.LoadStocks;
var
  LStocksFrm: TfrmStationaryStocks;
  LStocksQry: TFDQuery;
  LIndex: Integer;
  AStock: TStock;
begin
  LStocksFrm := TfrmStationaryStocks.Create(nil);
  LStocksQry := GetStocksQuery;
  FStocks.Clear;
  LStocksQry.First;

  while not LStocksQry.Eof do
  begin
    AStock := TStock.Create;
    AStock.StockId := LStocksQry.FieldByName('stock_id').AsInteger;
    AStock.ItemId := LStocksQry.FieldByName('item_id').AsInteger;
    AStock.Quantity := LStocksQry.FieldByName('available_item_count').AsInteger;
    AStock.UnitPrice := LStocksQry.FieldByName('unit_price').AsFloat;
    AStock.Updated_Date := LStocksQry.FieldByName('last_updated_date').AsDateTime;
    FStocks.AddStock(AStock);
    LStocksQry.Next;
  end;

  LStocksQry.First;
  //LStocksFrm.StocksDatasource.DataSet := LStocksQry;
  LStocksFrm.InventoryController := self;
  try
    LStocksFrm.ShowModal;
  finally
    LStocksFrm.Free;
  end;
end;

function TInventoryController.GetStocksQuery: TFDQuery;
begin
  FInventoryDM.qryStationaryStocks.sql.Text := GetStationaryStocksSQL;
  FInventoryDM.qryStationaryStocks.open;
  result := FInventoryDM.qryStationaryStocks;
end;


procedure TInventoryController.ModifyItem(AItem: TItem);
begin

end;

procedure TInventoryController.ModifyStock(AStock: TStock);
begin

end;

{ TItemList }

procedure TItemList.AddItem(const AItem: TItem);
begin

end;

procedure TItemList.DeleteItem(const AName: string);
begin

end;

{ TStockList }

procedure TStockList.AddStock(const AStock: TStock);
begin

end;

procedure TStockList.DeleteItem(const AStockId);
begin

end;

function TInventoryController.GetItemsQuery: TFDQuery;
begin
  FInventoryDM.qryItems.sql.Text := GetItemsSQL;
  FInventoryDM.qryItems.open;
  result := FInventoryDM.qryItems;
end;

function TInventoryController.GetItemsSQL: string;
begin
  result := 'select'
            + #13#10 + #9 + 'ii.item_id,'
            + #13#10 + #9 + 'ii.item_name,'
            + #13#10 + #9 + 'ii.item_description'
            + #13#10 + 'from'
            + #13#10 + #9 + 'inventory_items ii'
            + #13#10 + 'where'
            + #13#10 + #9 + '1=1';
end;

function TInventoryController.GetStationaryStocksSQL: string;
begin
  result := 'select'
            + #13#10 + #9 + 'ss.stock_id,'
            + #13#10 + #9 + 'ss.item_id,'
            + #13#10 + #9 + 'ss.available_item_count,'
            + #13#10 + #9 + 'ss.last_updated_date,'
            + #13#10 + #9 + 'ss.stock_comments,'
            + #13#10 + #9 + 'ss.unit_price,'
            + #13#10 + #9 + 'ii.item_name,'
            + #13#10 + #9 + 'ii.item_description'
            + #13#10 + 'from'
            + #13#10 + #9 + 'stationary_stocks ss'
            + #13#10 + #9 + 'left join inventory_items ii on ss.item_id = ii.item_id'
            + #13#10 + 'where'
            + #13#10 + #9 + '1=1'
end;



end.
