unit ItemDetailsFRM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,  System.UITypes,
  ItemController;

type
  TItemMode = (smEdit, smNew);

type
  TfrmItemDetails = class(TForm)
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edtItemName: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    edtItemId: TEdit;
    edtItemDescription: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FItem: TItem;
    FItemMode: TItemMode;
    procedure LoadItemDetails;
    function PerformValidations: boolean;
    procedure CopyItemDetails;
    { Private declarations }

  public
    { Public declarations }
    property Item: TItem read FItem write FItem;
    property ItemMode: TItemMode read FItemMode write FItemMode;
  end;

implementation

{$R *.dfm}

procedure TfrmItemDetails.btnOKClick(Sender: TObject);
begin
  if PerformValidations then
  begin
    CopyItemDetails;
    ModalResult := mrOk;
  end;

end;

function TfrmItemDetails.PerformValidations: boolean;
begin
  result := true;
  if trim(edtItemName.Text) = '' then
  begin
    MessageDlg('Please enter a valid Item Name.', mtError, [mbOK], 0);
    result := false;
  end;

end;

procedure TfrmItemDetails.CopyItemDetails;
begin
  FItem.ItemName := edtItemName.Text;
  FItem.ItemDescription := edtItemDescription.Text;
end;

procedure TfrmItemDetails.FormShow(Sender: TObject);
begin
  LoadItemDetails;
end;

procedure TfrmItemDetails.LoadItemDetails;
begin
  if ItemMode = smEdit then
  begin
    edtItemId.Text := IntToStr(FItem.ItemId);
    edtItemName.Text := FItem.ItemName;
    edtItemDescription.Text := FItem.ItemDescription;
  end;
end;

end.
