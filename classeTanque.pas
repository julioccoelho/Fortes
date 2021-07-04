unit classeTanque;

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

TTanque = class

private

public

function Inclui (Nome, Tipo : String) : Boolean;
function Altera (Codigo, Nome, Tipo : String) : Boolean;
function PodeExcluir (CodigoTanque : String): Boolean;
function Lista : TDataSource;
function Tanques : TDataSource;

end;

implementation

{ TTanque }

function TTanque.Inclui (Nome, Tipo : String) : Boolean;
var sql : String;
    qry : TFDQuery;
begin
  sql := 'INSERT INTO Tanque ( Nome, Tipo ) ' +
         ' VALUES ( :Nome, :Tipo )';

  qry := TFDQuery.Create(Nil);
  qry.Connection := dmPrincipal.conBD;
  qry.SQL.Add(sql);

  qry.Params.Add('Nome', ftString, ptInput);
  qry.Params.ParamByName('Nome').Value   := Nome;

  qry.Params.Add('Tipo', ftString, ptInput);
  qry.Params.ParamByName('Tipo').Value   := Tipo;

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

function TTanque.Altera (Codigo, Nome, Tipo : String) : Boolean;
var sql : String;
    qry : TFDQuery;
begin
  sql := 'UPDATE Tanque ' +
         '   SET Nome   = :Nome '   +
         '     , Tipo   = :Tipo '   +
         ' WHERE Codigo = :Codigo ';

  qry := TFDQuery.Create(Nil);
  qry.Connection := dmPrincipal.conBD;
  qry.SQL.Add(sql);

  qry.Params.Add('Nome', ftString, ptInput);
  qry.Params.ParamByName('Nome').Value   := Nome;

  qry.Params.Add('Tipo', ftString, ptInput);
  qry.Params.ParamByName('Tipo').Value   := Tipo;

  qry.Params.Add('Codigo', ftString, ptInput);
  qry.Params.ParamByName('Codigo').Value := Codigo;

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

function TTanque.PodeExcluir (CodigoTanque : String): Boolean;
var sql : String;
    qry : TFDQuery;
begin
  sql := 'SELECT COUNT(*) AS Qtde FROM Bomba WHERE CodigoTanque = :CodigoTanque';

  qry := TFDQuery.Create(Nil);
  qry.Connection := dmPrincipal.conBD;
  qry.SQL.Add(sql);

  qry.Params.Add('CodigoTanque', ftString, ptInput);
  qry.Params.ParamByName('CodigoTanque').Value := CodigoTanque;

  qry.Open();

  if qry.FieldByName('Qtde').AsInteger > 0 then
    Result := False
   else
    Result := True;
end;

function TTanque.Lista : TDataSource;
var sql : String;
    ds : TDataSource;
    qry : TFDQuery;
begin
  sql := 'SELECT Codigo, Nome, Tipo, ';
  sql := sql + 'CASE TIPO WHEN ''G'' THEN ''Gasolina'' ';
  sql := sql + 'WHEN ''D'' THEN ''Diesel'' ';
  sql := sql + 'ELSE ''Não Informado'' END NomeTipo ';
  sql := sql + 'FROM Tanque ';
  sql := sql + 'ORDER BY Nome ';

  ds := TDataSource.Create(Nil);

  qry := TFDQuery.Create(Nil);
  qry.Connection := dmPrincipal.conBD;

  qry.SQL.Add(sql);

  ds.DataSet := qry;

  qry.Open();

  Result := ds;
end;

function TTanque.Tanques : TDataSource;
var sql : String;
    ds : TDataSource;
    qry : TFDQuery;
begin
  sql := 'SELECT Codigo, Nome ';
  sql := sql + 'FROM Tanque ';
  sql := sql + 'ORDER BY Nome ';

  ds := TDataSource.Create(Nil);

  qry := TFDQuery.Create(Nil);
  qry.Connection := dmPrincipal.conBD;

  qry.SQL.Add(sql);

  ds.DataSet := qry;

  qry.Open();

  Result := ds;

end;

end.
