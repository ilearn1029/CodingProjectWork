program InventorySystem;

uses
  Vcl.Forms,
  InventoryDM in 'InventoryDM.pas' {dmInventory: TDataModule},
  InventoryMainFRM in 'InventoryMainFRM.pas' {frmMainInventory},
  AboutFRM in 'AboutFRM.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmInventory, dmInventory);
  Application.CreateForm(TfrmMainInventory, frmMainInventory);
  Application.Run;
end.
