unit classeBomba;

interface

uses

Windows, Controls, Forms, ComCtrls, DataModulePrincipal,
System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB,
FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
FireDAC.DApt, FireDAC.Comp.DataSet, Dialogs, DBXCommon;

type

TBomba = class

private
FCodigo : String;
FCodigoTanque : String;
FNome : String;
FValor : String;

public

function IncluirBomba : Boolean;
function AlterarBomba : Boolean;
function PodeExcluir : Boolean;
function ExcluirBomba : Boolean;

function Lista : TDataSource;
function Bombas : TDataSource;
function ValorLitro : String;

property Codigo : String read FCodigo write FCodigo;
property CodigoTanque : String read FCodigoTanque write FCodigoTanque;
property Nome : String read FNome write FNome;
property Valor : String read FValor write FValor;

end;

implementation

{TBomba}


function TBomba.IncluirBomba : Boolean;
var sql : String;
    qry : TFDQuery;
begin
  sql := 'INSERT INTO Bomba ( CodigoTanque, Nome, Valor ) ' +
         ' VALUES ( :CodigoTanque, :Nome, :Valor )';

  qry := TFDQuery.Create(Nil);
  qry.Connection := dmPrincipal.conBD;
  qry.SQL.Add(sql);

  qry.Params.Add('CodigoTanque', ftString, ptInput);
  qry.Params.ParamByName('CodigoTanque').Value := Self.CodigoTanque;

  qry.Params.Add('Nome', ftString, ptInput);
  qry.Params.ParamByName('Nome').Value := Self.Nome;

  qry.Params.Add('Valor', ftCurrency, ptInput);
  qry.Params.ParamByName('Valor').Value := StringReplace(Self.Valor, ',', '.', [rfReplaceAll]);

  try
    begin
      qry.ExecSQL;
      Result := True;
  end;
  except
    Result := False;
  end;

  qry.Destroy;
end;

function TBomba.AlterarBomba : Boolean;
var sql : String;
    qry : TFDQuery;
begin
  sql := 'UPDATE Bomba ' +
         '   SET Nome   = :Nome '   +
         '     , Valor  = :Valor ' +
         ' WHERE Codigo = :Codigo ';

  qry := TFDQuery.Create(Nil);
  qry.Connection := dmPrincipal.conBD;
  qry.SQL.Add(sql);

  qry.Params.Add('Nome', ftString, ptInput);
  qry.Params.ParamByName('Nome').Value := Self.Nome;

  qry.Params.Add('Valor', ftCurrency, ptInput);
  qry.Params.ParamByName('Valor').Value := StringReplace(Self.Valor, ',', '.', [rfReplaceAll]);

  qry.Params.Add('Codigo', ftString, ptInput);
  qry.Params.ParamByName('Codigo').Value := Self.Codigo;

  try
    begin
      qry.ExecSQL;
      Result := True;
  end;
  except
    Result := False;
  end;

  qry.Destroy;
end;

function TBomba.PodeExcluir : Boolean;
var sql : String;
    qry : TFDQuery;
begin
  sql := 'SELECT COUNT(*) AS Qtde FROM Abastecimento WHERE CodigoBomba = :CodigoBomba';

  qry := TFDQuery.Create(Nil);
  qry.Connection := dmPrincipal.conBD;
  qry.SQL.Add(sql);

  qry.Params.Add('CodigoBomba', ftString, ptInput);
  qry.Params.ParamByName('CodigoBomba').Value := Self.Codigo;

  qry.Open();

  if qry.FieldByName('Qtde').AsInteger > 0 then
    Result := False
   else
    Result := True;
end;

function TBomba.ExcluirBomba : Boolean;
var sql : String;
    qry : TFDQuery;
begin
  sql := 'DELETE FROM Bomba ' +
         ' WHERE Codigo = :Codigo ';

  qry := TFDQuery.Create(Nil);
  qry.Connection := dmPrincipal.conBD;
  qry.SQL.Add(sql);

  qry.Params.Add('Codigo', ftString, ptInput);
  qry.Params.ParamByName('Codigo').Value := Self.Codigo;

  try
    begin
      qry.ExecSQL;
      Result := True;
  end;
  except
    Result := False;
  end;

  qry.Destroy;
end;

function TBomba.Lista : TDataSource;
var sql : String;
    ds : TDataSource;
    qry : TFDQuery;
begin
  sql := 'SELECT b.Codigo, b.CodigoTanque, b.Nome, b.Valor, t.Nome AS NomeTanque ';
  sql := sql + 'FROM Bomba b INNER JOIN Tanque t ON t.Codigo = b.CodigoTanque ';
  sql := sql + 'ORDER BY NomeTanque, b.Nome ';

  ds := TDataSource.Create(Nil);

  qry := TFDQuery.Create(Nil);
  qry.Connection := dmPrincipal.conBD;

  qry.SQL.Add(sql);

  ds.DataSet := qry;

  qry.Open();

  Result := ds;
end;

function TBomba.Bombas : TDataSource;
var sql : String;
    ds : TDataSource;
    qry : TFDQuery;
begin
  sql := 'SELECT b.Codigo, b.Nome ';
  sql := sql + 'FROM Bomba b INNER JOIN Tanque t ON t.Codigo = b.CodigoTanque ' ;
  sql := sql + 'ORDER BY t.Tipo, b.Nome ';

  ds := TDataSource.Create(Nil);

  qry := TFDQuery.Create(Nil);
  qry.Connection := dmPrincipal.conBD;

  qry.SQL.Add(sql);

  ds.DataSet := qry;

  qry.Open();

  Result := ds;

end;

function TBomba.ValorLitro : String;
var sql : String;
    qry : TFDQuery;
begin
  sql := 'SELECT Valor FROM Bomba WHERE Codigo = :Codigo';

  qry := TFDQuery.Create(Nil);
  qry.Connection := dmPrincipal.conBD;
  qry.SQL.Add(sql);

  qry.Params.Add('Codigo', ftString, ptInput);
  qry.Params.ParamByName('Codigo').Value := Self.Codigo;

  qry.Open();

  if qry.RecordCount > 0 then
    Result := qry.FieldByName('Valor').AsString
  else
    Result := '0';

  qry.Destroy;
end;

end.
