unit StockDetailsFRM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmStockDetails = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtItemNo: TEdit;
    edtQuantity: TEdit;
    edtPrice: TEdit;
    Label3: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmStockDetails: TfrmStockDetails;

implementation

{$R *.dfm}

end.
