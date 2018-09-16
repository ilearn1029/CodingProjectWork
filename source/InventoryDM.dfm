object dmInventory: TdmInventory
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 363
  Width = 393
  object dbInventory: TFDConnection
    ConnectionName = 'InventoryDB'
    Params.Strings = (
      'User_Name=sysdba'
      'Password=xyzzy'
      'DriverID=fb')
    Left = 40
    Top = 40
  end
  object qryStationaryStocks: TFDQuery
    Connection = dbInventory
    Left = 160
    Top = 40
  end
  object qryItems: TFDQuery
    Connection = dbInventory
    Left = 248
    Top = 40
  end
end
