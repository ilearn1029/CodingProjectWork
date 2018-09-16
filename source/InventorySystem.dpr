program InventorySystem;

uses
  Vcl.Forms,
  InventoryMainFRM in 'InventoryMainFRM.pas' {frmMainInventory},
  InventoryDM in 'InventoryDM.pas' {dmInventory: TDataModule},
  StationaryStocksFRM in 'StationaryStocksFRM.pas' {frmStationaryStocks},
  ItemsFRM in 'ItemsFRM.pas' {frmItems},
  AboutFRM in 'AboutFRM.pas' {AboutBox},
  StockDetailsFRM in 'StockDetailsFRM.pas' {frmStockDetails},
  StockController in 'StockController.pas',
  ItemController in 'ItemController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmInventory, dmInventory);
  Application.CreateForm(TfrmMainInventory, frmMainInventory);
  Application.Run;
end.
