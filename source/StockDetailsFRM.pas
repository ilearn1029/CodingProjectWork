unit StockDetailsFRM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  System.UITypes,
  StockController, ItemController;

type
  TStockMode = (smEdit, smNew);

type
  TfrmStockDetails = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtItemName: TEdit;
    edtQuantity: TEdit;
    edtPrice: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    dtModifiedDate: TDateTimePicker;
    edtItemId: TEdit;
    mmStockComments: TMemo;
    edtItemDescription: TEdit;
    btnItemsSearch: TBitBtn;
    procedure btnItemsSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FStock: TStock;
    FStockMode: TStockMode;
    procedure LoadStockDetails;
    function PerformValidations: boolean;
    procedure CopyStockDetails;
    procedure PopulateItemFromLookUp(AItem: TItem);
    { Private declarations }

  public
    { Public declarations }
    property Stock: TStock read FStock write FStock;
    property StockMode: TStockMode read FStockMode write FStockMode;
  end;

implementation

uses
  ItemsFRM;

{$R *.dfm}

procedure TfrmStockDetails.btnItemsSearchClick(Sender: TObject);
var
  LItemsFrm: TfrmItems;
begin
  LItemsFrm := TfrmItems.Create(nil);
  LItemsFrm.IsLookUp := true;
  try
    LItemsFrm.ShowModal;
    PopulateItemFromLookUp(LItemsFrm.SelectedItem);
  finally
    LItemsFrm.Free;
  end;
end;

procedure TfrmStockDetails.PopulateItemFromLookUp(AItem: TItem);
begin
  if AItem <> nil then
  begin
    edtItemId.Text := IntToStr(AItem.ItemId);
    edtItemName.Text := AItem.ItemName;
    edtItemDescription.Text := AItem.ItemDescription;
  end;
end;

procedure TfrmStockDetails.btnOKClick(Sender: TObject);
begin
  if PerformValidations then
  begin
    CopyStockDetails;
    ModalResult := mrOk;
  end;

end;

function TfrmStockDetails.PerformValidations: boolean;
begin
  result := true;
  if trim(edtItemId.Text) = '' then
  begin
    MessageDlg('Please select a valid Item from Lookup.', mtError, [mbOK], 0);
    result := false;
  end;

end;

procedure TfrmStockDetails.CopyStockDetails;
begin
  FStock.ItemId := StrToInt(edtItemId.Text);
  FStock.ItemName := edtItemName.Text;
  FStock.ItemDescription := edtItemDescription.Text;
  FStock.Updated_Date := dtModifiedDate.DateTime;
  FStock.Quantity := StrToInt(edtQuantity.Text);
  FStock.UnitPrice := StrToFloat(edtPrice.Text);
  FStock.Comments := mmStockComments.Text;
end;

procedure TfrmStockDetails.FormShow(Sender: TObject);
begin
  LoadStockDetails;
end;

procedure TfrmStockDetails.LoadStockDetails;
begin
  if StockMode = smEdit then
  begin
    edtItemId.Text := IntToStr(FStock.ItemId);
    edtItemName.Text := FStock.ItemName;
    edtItemDescription.Text := FStock.ItemDescription;
    dtModifiedDate.DateTime := FStock.Updated_Date;
    edtQuantity.Text := IntToStr(FStock.Quantity);
    edtPrice.Text := FloatToStr(FStock.UnitPrice);
    mmStockComments.Text := FStock.Comments;
  end;
end;

end.
