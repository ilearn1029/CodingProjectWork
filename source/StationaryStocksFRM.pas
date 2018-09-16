unit StationaryStocksFRM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  StockController, VirtualTrees, System.Actions, Vcl.ActnList;

type
  TfrmStationaryStocks = class(TForm)
    Panel1: TPanel;
    StocksTree: TVirtualStringTree;
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
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure StocksTreeInitNode(Sender: TBaseVirtualTree;
      ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
    procedure StocksTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure StocksTreeDblClick(Sender: TObject);
  private
    FStockController: TStockController;
    procedure StockControllerListChanged(ASender: TObject);
    function ShowAddNewStock: boolean;
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

uses
  StockDetailsFRM;

{$R *.dfm}

procedure TfrmStationaryStocks.FormCreate(Sender: TObject);
begin
  FStockController := TStockController.Create;
  FStockController.OnListChanged := StockControllerListChanged;
  StocksTree.NodeDataSize := SizeOf(TStock);
  FStockController.LoadStocks;
end;

procedure TfrmStationaryStocks.FormDestroy(Sender: TObject);
begin
  FStockController.Free;
end;

procedure TfrmStationaryStocks.FormShow(Sender: TObject);
begin
  if StocksTree.CanFocus then
    StocksTree.SetFocus;
end;

procedure TfrmStationaryStocks.btnAddClick(Sender: TObject);
begin
  if ShowAddNewStock then
    FStockController.LoadStocks;
end;

procedure TfrmStationaryStocks.btnEditClick(Sender: TObject);
var
  LStockDetailsFRM: TfrmStockDetails;
  LStock: TStock;
begin
  if not Assigned(StocksTree.FocusedNode) then
    Exit;

  LStock := StocksTree.FocusedNode.GetData<TStock>;

  LStockDetailsFRM := TfrmStockDetails.Create(nil);
  try
    LStockDetailsFRM.Stock := LStock;
    if LStockDetailsFRM.ShowModal = mrOK then
    begin
      FStockController.EditStock(LStock);
      FStockController.LoadStocks;
    end;
  finally
    LStockDetailsFRM.Free;
  end;
end;

procedure TfrmStationaryStocks.btnDeleteClick(Sender: TObject);
var
  LNode: PVirtualNode;
  LStock: TStock;
begin
  LNode := StocksTree.FocusedNode;
  if Assigned(LNode) then
  begin
    LStock := LNode.GetData<TStock>;
    if MessageDlg('Are you sure to delete the Stock for StockId ' +
      IntToStr(LStock.StockId) + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
    begin
      FStockController.DeleteStock(LStock);
    end;
  end;
end;

procedure TfrmStationaryStocks.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmStationaryStocks.StocksTreeInitNode(Sender: TBaseVirtualTree;
  ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  Node.SetData<TStock>(FStockController.StockList[Node.Index]);
end;

procedure TfrmStationaryStocks.StocksTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  LStock: TStock;
begin
  LStock := Node.GetData<TStock>;
  case Column of
    0:
      CellText := IntToStr(LStock.StockId);
    1:
      CellText := LStock.ItemName;
    2:
      CellText := IntToStr(LStock.Quantity);
    3:
      CellText := FloatToStr(LStock.UnitPrice);
  end;

end;

procedure TfrmStationaryStocks.StocksTreeDblClick(Sender: TObject);
begin
  btnEditClick(Sender);
end;

procedure TfrmStationaryStocks.StockControllerListChanged(ASender: TObject);
begin
  StocksTree.RootNodeCount := FStockController.StockList.Count;
  StocksTree.ReinitNode(nil, True);
end;

function TfrmStationaryStocks.ShowAddNewStock: boolean;
var
  LStockDetailsFRM: TfrmStockDetails;
  LStock: TStock;
begin
  result := false;
  LStockDetailsFRM := TfrmStockDetails.Create(nil);
  LStockDetailsFRM.StockMode := smNew;
  try
    LStock := TStock.Create;
    LStockDetailsFRM.Stock := LStock;
    if LStockDetailsFRM.ShowModal = mrOK then
    begin
      // LStock := TStock.Create;
      // LStock.ItemId := StrToInt(LStockDetailsFRM.edtItemId.Text);
      // LStock.ItemName := LStockDetailsFRM.edtItemName.Text;
      // LStock.ItemDescription := LStockDetailsFRM.edtItemId.Text;
      // LStock.Updated_Date := now;
      // LStock.Quantity := StrToInt(LStockDetailsFRM.edtQuantity.Text);
      // LStock.UnitPrice := StrToFloat(LStockDetailsFRM.edtPrice.Text);
      // LStock.Comments := LStockDetailsFRM.mmStockComments.Text;
      FStockController.AddStock(LStock);
      result := True;
    end;

  finally
    LStockDetailsFRM.Free;
  end;
end;

end.
