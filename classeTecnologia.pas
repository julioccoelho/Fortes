unit classeTecnologia;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client;

type TConexao = Class

private

Fdb : String;
FdriverID : String;
FNome : String;
FloginPrompt : Boolean;
FconBD : TFDConnection;

public

constructor Create;

function ObterConexao : TFDConnection;

property db : String read Fdb write Fdb ;
property driverID : String read FdriverID write FdriverID;
property Nome : String read FNome write FNome;
property loginPrompt : Boolean read FloginPrompt write FloginPrompt;
property conBD : TFDConnection read FconBD write FconBD;


End;

implementation

{ TConexao }

constructor TConexao.Create;
begin
  conBD := TFDConnection.Create(Nil);
  conBD.Name := 'conDB';
  conBD.LoginPrompt := False;
  conBD.Params.Database :=  'C:\Desenvolvimento\FortesSelecao\Fortes.db';
  conBD.Params.DriverID := 'SQLite';

  try
    begin
      if not conBD.Connected then
        conBD.Open();
    end
    except
    begin
      conBD := nil;
      raise Exception.Create('Erro ao conectar');
    end;
  end;
end;

function TConexao.ObterConexao: TFDConnection;
begin
  Result := Self.conBD;
end;

end.
