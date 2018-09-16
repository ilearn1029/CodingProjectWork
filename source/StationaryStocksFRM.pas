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
    btnAdd: TButton;
    btnDelete: TButton;
    btnEdit: TButton;
    Button3: TButton;
    StocksDatasource: TDataSource;
    DBGrid1: TDBGrid;
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
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure StocksTreeDblClick(Sender: TObject);
    procedure StocksTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure StocksTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    FStockController: TStockController;
    procedure InitialiseControls;
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

procedure TfrmStationaryStocks.btnAddClick(Sender: TObject);
begin
  if ShowAddNewStock then
    FStockController.LoadStocks;
end;

function TfrmStationaryStocks.ShowAddNewStock: boolean;
var
  LStockDetailsFRM: TfrmStockDetails;
  LStock: TStock;
begin
  result := false;
  LStockDetailsFRM := TfrmStockDetails.Create(nil);
  try
    if LStockDetailsFRM.ShowModal = mrOk then
    begin
      LStock := TStock.Create;
      LStock.ItemId := StrToInt(LStockDetailsFRM.edtItemNo.Text);
      LStock.Updated_Date := now;
      LStock.Quantity := StrToInt(LStockDetailsFRM.edtQuantity.Text);
      LStock.UnitPrice := StrToFloat(LStockDetailsFRM.edtPrice.Text);
      FStockController.AddStock(LStock);
      result := true;
    end;

  finally
    LStockDetailsFRM.Free;
  end;
end;


procedure TfrmStationaryStocks.InitialiseControls;
begin
//  FromDatePicker.Date := FController.SelectedFromDate;
//  ToDatePicker.Date := FController.SelectedToDate - 1;
//  FController.HospitalLookup.PopulateStrings(HospitalCombo.Items);
//  FController.DoctorLookup.PopulateStrings(DoctorCombo.Items);
//  HospitalCombo.ItemIndex := 0;
//  DoctorCombo.ItemIndex := 0;
end;

procedure TfrmStationaryStocks.StockControllerListChanged(ASender: TObject);
begin
  StocksTree.RootNodeCount := FStockController.StockList.Count;
  StocksTree.ReinitNode(nil, True);
end;

procedure TfrmStationaryStocks.StocksTreeDblClick(Sender: TObject);
begin
{}
end;

procedure TfrmStationaryStocks.StocksTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  LStock: TStock;
begin
  LStock := Node.GetData<TStock>;
  case Column of
    0: CellText := IntToStr(LStock.StockId);
    1: CellText := LStock.ItemName;
    2: CellText := IntToStr(LStock.Quantity);
    3: CellText := FloatToStr(LStock.UnitPrice);
  end;

end;

procedure TfrmStationaryStocks.StocksTreeInitNode(Sender: TBaseVirtualTree;
  ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  Node.SetData<TStock>(FStockController.StockList[Node.Index]);
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
    if MessageDlg('Are you sure to delete the Stock for StockId ' + IntToStr(LStock.StockId) + '?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      FStockController.DeleteStock(LStock);
    end;
  end;
end;

procedure TfrmStationaryStocks.btnEditClick(Sender: TObject);
var
  LStockDetailsFRM: TfrmStockDetails;
  LStockID: Integer;
begin
  if not Assigned(StocksTree.FocusedNode) then
    Exit;

  LStockID := StocksTree.FocusedNode.GetData<TStock>.StockId;

  LStockDetailsFRM := TfrmStockDetails.Create(nil);
  try
    //LStockDetailsFRM.Controller.LoadProcedure(LID);
    if LStockDetailsFRM.ShowModal = mrOK then
      FStockController.LoadStocks;
  finally
    LStockDetailsFRM.Free;
  end;
end;

procedure TfrmStationaryStocks.FormCreate(Sender: TObject);
begin
  FStockController := TStockController.Create;
  FStockController.OnListChanged := StockControllerListChanged;
  InitialiseControls;
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

end.
