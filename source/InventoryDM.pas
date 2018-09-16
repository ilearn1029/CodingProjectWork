unit InventoryDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  System.IniFiles, Vcl.Dialogs, System.UITypes;

type
  TdmInventory = class(TDataModule)
    dbInventory: TFDConnection;
    qryStationaryStocks: TFDQuery;
    qryItems: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    FConnectionSuccessful: boolean;
    function GetDatabaseFromPath(const ADBPath: string): string;
    function GetServerFromPath(const AFirebirdDatabasePath: string): string;
    { Private declarations }
  public
    { Public declarations }
    procedure SetupConnection(const AIni: TIniFile);
    procedure Connect;
    function InitialiseDatabaseConnection: boolean;
    property ConnectionSuccessful: boolean read FConnectionSuccessful write FConnectionSuccessful;
  end;

var
  dmInventory: TdmInventory;
  function GetNewInventoryQuery: TFDQuery;
  function NextInventorySequenceValue(const ASequenceName: string): integer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmInventory.SetupConnection(const AIni: TIniFile);
var
  LDBConnection: TFDConnection;
  LFBDatabasePath: string;
  LServerName: string;
  LDatabasePath: string;
  LPos: integer;
begin
  LDBConnection := dbInventory;
  LDBConnection.Connected := False;
  LDBConnection.Params.Values['USER NAME'] := 'SYSDBA';
  LDBConnection.Params.Values['PASSWORD'] := 'xyzzy';

  LFBDatabasePath := AIni.ReadString('Server', 'DatabaseName', '');
  LDatabasePath := GetDatabaseFromPath(LFBDatabasePath);

  LServerName := UpperCase(AIni.ReadString('Server', 'ServerName', GetServerFromPath(LFBDatabasePath)));
  LFBDatabasePath := LServerName + ':' + LDatabasePath;

  LPos := pos('/', LServerName);
  if LPos > 0 then
    LServerName := Copy(LServerName, 1, LPos - 1);

  LDBConnection.Params.Values['SERVER'] := LServerName;
  LDBConnection.Params.Values['DATABASE'] := LDatabasePath;
end;

procedure TdmInventory.Connect;
begin
  dbInventory.Open;
end;

function TdmInventory.GetServerFromPath(const AFirebirdDatabasePath: string): string;
var
  LPos: integer;
begin
  result := '';
  LPos := Pos(':', AFirebirdDatabasePath);
  if LPos > 1 then
    result := Copy(AFirebirdDatabasePath, 1, LPos - 1);
end;

procedure TdmInventory.DataModuleCreate(Sender: TObject);
begin
  try
    FConnectionSuccessful := InitialiseDatabaseConnection;
  except
    on E: exception do
      MessageDlg('Error connecting to Database. ' + #13#10 + E.Message,
        mtError, [mbOK], 0);
  end;
end;

function TdmInventory.GetDatabaseFromPath(const ADBPath: string): string;
var
  LPos: integer;
begin
  result := ADBPath;
  LPos := Pos(':', ADBPath);
  if LPos > 1 then
    result := Copy(ADBPath, LPos + 1, MAXINT);
end;

function TdmInventory.InitialiseDatabaseConnection: boolean;
var
  LIniFile : TIniFile;
begin
  result := false;
  LIniFile := TIniFile.Create('.\InventorySystem.ini');
  try
    SetupConnection(LIniFile);
    connect;
    result := true;
  finally
    LIniFile.Free;
  end;
end;

function GetNewInventoryQuery: TFDQuery;
begin
  result := TFDQuery.Create(nil);
  result.Connection := dmInventory.dbInventory;
end;

function NextInventorySequenceValue(const ASequenceName: string): integer;
var
  LQry: TFDQuery;
begin
  LQry := GetNewInventoryQuery;
  try
    LQry.SQL.Text := 'SELECT NEXT VALUE FOR ' + ASequenceName + ' as new_id from RDB$DATABASE';
    LQry.Open;
    result := LQry.FieldByName('new_id').AsInteger;
  finally
    LQry.Free;
  end;
end;


end.
