About Project: Inventory Management 
-----------------------------------
Inventory Management is a simple tool that can be used to track the Inventory Items and Stocks.
Both Items and Stocks have Add, Edit, Delete functions
Addition of Stocks has a lookup for Items and mandatory validations on Save. Cancel function allows exit of screen without any change.
For all the Stock Price changes, audit is maintained and displayed accordingly.

Deployment
--------------
Run the installer "InventorySystemSetup.exe". This will install Inventory Management Application, its dependent files and Firebird 2.5 database. Default installtion location is Program Files.
Following are the details
InventorySystem.exe - Main executable (Application)
INVENTORYDB - Firebird Database for data persistence
InventorySystem.ini - configration file
fbclient.dll- Firebird dll

Source Code
------------
Tools: Delphi 10.2 
Components - FireDAC (other delphi native), VirtualTreeView
Installer tool: InnoSetup 5 Installer
Database: Firebird 2.5 
Architecture/framework: View-Controller(Model embedded)

System Testing
--------------
Manual testing has been performed for all the functions on Main Form, Stocks and Items

Database schema
---------------
Tables - 
INVENTORY_ITEMS - Persists all the Items in the application. 
STATIONARY_STOCKS - Persists all the Stocks in the application. 
PRICING_AUDIT - Keeps a record of all the Price changes to Stocks. 
Generator have been used to generate the sequence number for the primary key fields.
Database.sql file lists all the DDL SQLs.














