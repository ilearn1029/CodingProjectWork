unit InventoryMainFRM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,InventoryDM, Vcl.StdCtrls, System.IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Menus;

type
  TfrmMainInventory = class(TForm)
    MainMenu1: TMainMenu;
    Stocks1: TMenuItem;
    Help1: TMenuItem;
    btnStocks: TMenuItem;
    btnItems: TMenuItem;
    Label1: TLabel;
    HelpInv: TMenuItem;
    About1: TMenuItem;
    Exit1: TMenuItem;
    procedure btnStocksClick(Sender: TObject);
    procedure btnItemsClick(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure About2Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainInventory: TfrmMainInventory;

implementation


{$R *.dfm}

uses
  StationaryStocksFRM,
  ItemsFRM,
  AboutFRM;

procedure TfrmMainInventory.Help1Click(Sender: TObject);
begin
{}
end;

procedure TfrmMainInventory.About2Click(Sender: TObject);
var
  LAboutFrm: TAboutBox;
begin
  LAboutFrm := TAboutBox.Create(nil);
  try
    LAboutFrm.ShowModal;
  finally
    LAboutFrm.Free;
  end;
end;

procedure TfrmMainInventory.btnItemsClick(Sender: TObject);
var
  LItemsFrm: TfrmItems;
begin
  LItemsFrm := TfrmItems.Create(nil);
  try
    LItemsFrm.ShowModal;
  finally
    LItemsFrm.Free;
  end;
end;

procedure TfrmMainInventory.btnStocksClick(Sender: TObject);
var
  LStocksFrm: TfrmStationaryStocks;
begin
  LStocksFrm := TfrmStationaryStocks.Create(nil);
  try
    LStocksFrm.ShowModal;
  finally
    LStocksFrm.Free;
  end;
end;


procedure TfrmMainInventory.Exit1Click(Sender: TObject);
begin
  close;
end;

end.
