unit ItemsFRM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  ItemController;

type
  TfrmItems = class(TForm)
    DBGrid1: TDBGrid;
    ItemsDatasource: TDataSource;
  private
    { Private declarations }
    FItemController: TItemController;
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

end.

