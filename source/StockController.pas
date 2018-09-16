unit StockController;

interface

uses
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  System.Generics.Collections,
  System.SysUtils,
  InventoryDM;

type
  TStock = class
  private
    FStockId: Integer;
    FItemId: Integer;
    FQuantity: Integer;
    FUnitPrice: Double;
    FUpdated_Date: TDatetime;
    FItemName: String;
    FItemDescription: string;
    FComments: string;
  public
    property StockId: Integer read FStockId write FStockId;
    property ItemId: Integer read FItemId write FItemId;
    property ItemName: String read FItemName write FItemName;
    property ItemDescription: string read FItemDescription write FItemDescription;
    property Updated_Date: TDatetime read FUpdated_Date write FUpdated_Date;
    property Quantity: Integer read FQuantity write FQuantity;
    property UnitPrice: Double read FUnitPrice write FUnitPrice;
    property Comments: string read FComments write FComments;
  end;

  TStockList = class (TObjectList<TStock>)
  end;

  TStockController = class
  private
    FStockList: TStockList;
    FStockQry: TFDQuery;
    FOnListChanged: TNotifyEvent;
    function GetStocksSQL: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadStocks;
    procedure BuildStocksQuery;
    procedure DoListChanged;
    procedure AddStock(const AStock: TStock);
    procedure DeleteStock(const AStock: TStock);
    procedure EditStock(const AStock: TStock);
    property StockList: TStockList read FStockList write FStockList;
    property OnListChanged: TNotifyEvent read FOnListChanged write FOnListChanged;
  end;

implementation

{ TStockList }

procedure TStockController.AddStock(const AStock: TStock);
var
  LInsertQry: TFDQuery;
begin
  LInsertQry := GetNewInventoryQuery;
  try
    LInsertQry.SQL.Text := 'insert into stationary_stocks  '
    + #13#10 + '(stock_id, item_id, available_item_count, last_updated_date, stock_comments, unit_price)'
    + #13#10 + 'values'
    + #13#10 + '(:stock_id, :item_id, :available_item_count, :last_updated_date, :stock_comments, :unit_price)';
    LInsertQry.Prepare;
    LInsertQry.ParamByName('stock_id').AsInteger := NextInventorySequenceValue('GEN_STOCK_ID');
    LInsertQry.ParamByName('item_id').AsInteger := AStock.ItemId;
    LInsertQry.ParamByName('available_item_count').AsInteger :=  AStock.Quantity;
    LInsertQry.ParamByName('last_updated_date').AsDateTime := AStock.Updated_Date;
    LInsertQry.ParamByName('unit_price').AsFloat := AStock.UnitPrice;
    LInsertQry.ParamByName('stock_comments').AsString := AStock.Comments;
    LInsertQry.ExecSQL;
    FStockList.Add(AStock);
    DoListChanged;
  finally
    LInsertQry.Free;
  end;
end;

procedure TStockController.DeleteStock(const AStock: TStock);
var
  LDeleteQry: TFDQuery;
begin
  LDeleteQry := GetNewInventoryQuery;
  try
    LDeleteQry.SQL.Text := 'delete from stationary_stocks where stock_id = :stock_id';
    LDeleteQry.Prepare;
    LDeleteQry.ParamByName('stock_id').AsInteger := AStock.StockId;
    LDeleteQry.ExecSQL;
    FStockList.Remove(AStock);
    DoListChanged;
  finally
    LDeleteQry.Free;
  end;
end;

procedure TStockController.BuildStocksQuery;
begin
  FStockQry.SQL.Text := GetStocksSQL;
end;

constructor TStockController.Create;
begin
  FStockList := TStockList.Create;
  FStockQry := GetNewInventoryQuery;

  BuildStocksQuery;
end;



destructor TStockController.Destroy;
begin
  FStockList.Free;
  FStockQry.Free;
  inherited;
end;

procedure TStockController.DoListChanged;
begin
  if Assigned(FOnListChanged) then
    FOnListChanged(self);
end;

procedure TStockController.EditStock(const AStock: TStock);
var
  LUpdateQry: TFDQuery;
begin
  LUpdateQry := GetNewInventoryQuery;
  try
    LUpdateQry.SQL.Text := 'update stationary_stocks  '
        + #13#10 + 'set'
        + #13#10 + #9 + 'available_item_count =:available_item_count,'
        + #13#10 + #9 + 'last_updated_date =:last_updated_date,'
        + #13#10 + #9 + 'unit_price =:unit_price,'
        + #13#10 + #9 + 'stock_comments =:stock_comments'
        + #13#10 + 'where'
        + #13#10 + #9 + '1=1'
        + #13#10 + #9 + 'and stock_id =:stock_id';
    LUpdateQry.Prepare;
    LUpdateQry.ParamByName('stock_id').AsInteger := AStock.StockId;
    LUpdateQry.ParamByName('available_item_count').AsInteger := AStock.Quantity;
    LUpdateQry.ParamByName('last_updated_date').Value := AStock.Updated_Date;
    LUpdateQry.ParamByName('unit_price').Value := AStock.UnitPrice;
    LUpdateQry.ParamByName('stock_comments').AsString := AStock.Comments;
    LUpdateQry.ExecSQL;
    DoListChanged;
  finally
    LUpdateQry.Free;
  end;
end;

function TStockController.GetStocksSQL: string;
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

procedure TStockController.LoadStocks;
var
  LStock: TStock;
begin
  FStockList.Clear;
  FStockQry.Open;

  FStockQry.First;
  while not FStockQry.Eof do
  begin
    LStock := TStock.Create;
    LStock.StockId := FStockQry.FieldByName('stock_id').AsInteger;
    LStock.ItemId := FStockQry.FieldByName('item_id').AsInteger;
    LStock.ItemName := FStockQry.FieldByName('item_name').AsString;
    LStock.ItemDescription := FStockQry.FieldByName('item_description').AsString;
    LStock.Quantity := FStockQry.FieldByName('available_item_count').AsInteger;
    LStock.UnitPrice := FStockQry.FieldByName('unit_price').AsFloat;
    LStock.Updated_Date := FStockQry.FieldByName('last_updated_date').AsDateTime;
    LStock.Comments := FStockQry.FieldByName('stock_comments').AsString;
    FStockList.Add(LStock);
    FStockQry.Next;
  end;
  FStockQry.Close;
  DoListChanged;
end;

end.
