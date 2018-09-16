unit ItemController;

interface

uses
  System.Generics.Collections;

type
  TItem = class
  private
    FItemId: integer;
    FItemName: string;
    FItemDescription: string;
  published
    property ItemId: integer read FItemId write FItemId;
    property ItemName: string read FItemName write FItemName;
    property ItemDescription: string read FItemDescription write FItemDescription;
  end;

  TItemList = class (TObjectList<TItem>)
  public
    procedure AddItem(const AItem: TItem);
    procedure DeleteItem(const AName: string);
  end;

  TItemController = class

  end;

implementation

{ TItemList }

procedure TItemList.AddItem(const AItem: TItem);
begin

end;

procedure TItemList.DeleteItem(const AName: string);
begin

end;

end.
