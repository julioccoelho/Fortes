unit classeConexao;

interface

uses Classes, Dialogs, DBXCommon, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client;

 type
  TConexao = class
    private
      conn: TFDConnection;

    public
      constructor Create;
      destructor Destroy; override;
      function getConexao: TFDConnection;
  end;

implementation

{ TConexao }

constructor TConexao.Create;
begin
  conn := TFDConnection.Create(nil);

  ///begin
    conn.ConnectionName := 'conDB';
    conn.DriverName := 'SQLite';
    conn.Params.Database := 'C:\Desenvolvimento\FortesSelecao\Fortes.db';
    conn.LoginPrompt := False;

    try
      begin
        if not (conn.Connected) then
          conn.Open;
      end;
    except
      on e : TDBXError do
         begin
           ShowMessage('Não foi possível efetuar a conexão. Erro: ' +
              e.Message);
           conn := nil;
         end;
    end;
  //end;
end;

destructor TConexao.Destroy;
 begin
   conn.Free;
   inherited;
 end;

function TConexao.getConexao;
begin
  Result := conn;
end;

end.
