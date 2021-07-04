unit classeConexaoFD;

interface

uses Classes, Dialogs, DBXCommon, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client;

function ObterConexaoFD : TFDConnection;

implementation

function ObterConexaoFD : TFDConnection;
var con : TFDConnection;
begin
  if Assigned(con) then
  begin
    con := TFDConnection.Create(Nil);
    con.ConnectionName := 'conDBFD';
    con.DriverName := 'SQLite';
    con.Params.Database := 'C:\Desenvolvimento\FortesSelecao\Fortes.db';
    con.LoginPrompt := False;
    con.Open;
  end;
  Result := con;
end;

end.
