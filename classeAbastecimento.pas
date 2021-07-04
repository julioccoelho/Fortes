unit classeAbastecimento;

interface

uses

Windows, Controls, Forms, ComCtrls, DateUtils ,DataModulePrincipal,
System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB,
FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
FireDAC.DApt, FireDAC.Comp.DataSet, Dialogs, DBXCommon;

type

TAbastecimento = class

private

public

function Lista (DataInicio, DataFim : String) : TDataSource;
function IncluirAbastecimento (CodigoBomba, Data : String; Quantidade, Valor, ValorFinal : Currency) : Boolean;
function TruncVal(Value: Double; Casas: Integer): Double;

end;

implementation

{TAbasteciento}


function TAbastecimento.Lista (DataInicio, DataFim : String) : TDataSource;
var sql : String;
    ds : TDataSource;
    qry : TFDQuery;
begin
  sql := 'SELECT a.Codigo, a.CodigoBomba, CAST(a.Data AS VARCHAR) AS Data, a.Quantidade, a.Valor, a.ValorFinal, ';
  sql := sql + 'b.Nome AS NomeBomba, t.Nome AS NomeTanque ';
  sql := sql + 'FROM Abastecimento a ';
  sql := sql + 'INNER JOIN Bomba b ON b.Codigo = a.CodigoBomba ';
  sql := sql + 'INNER JOIN Tanque t ON t.Codigo = b.CodigoTanque ';
  sql := sql + 'WHERE a.Data BETWEEN :DataInicio AND :DataFim ';
  sql := sql + 'ORDER BY a.Data ';

  ds := TDataSource.Create(Nil);
  qry := TFDQuery.Create(Nil);

  qry.Connection := dmPrincipal.conBD;

  qry.SQL.Add(sql);

  qry.Params.Add('DataInicio', ftString, ptInput);
  qry.Params.ParamByName('DataInicio').Value := DataInicio;

  qry.Params.Add('Quantidade', ftCurrency, ptInput);
  qry.Params.ParamByName('DataFim').Value := DataFim;


  ds.DataSet := qry;

  qry.Open();

  Result := ds;
end;

function TAbastecimento.IncluirAbastecimento (CodigoBomba, Data : String; Quantidade, Valor, ValorFinal : Currency) : Boolean;
var sql : String;
    qry : TFDQuery;
begin
  sql := 'INSERT INTO Abastecimento (CodigoBomba, Data, Quantidade, Valor, ValorFinal) ' +
         'VALUES (:CodigoBomba, :Data, :Quantidade, :Valor, :ValorFinal) ';

  qry := TFDQuery.Create(Nil);
  qry.Connection := dmPrincipal.conBD;
  qry.SQL.Add(sql);

  qry.Params.Add('CodigoBomba', ftString, ptInput);
  qry.Params.ParamByName('CodigoBomba').Value := CodigoBomba;

  qry.Params.Add('Quantidade', ftCurrency, ptInput);
  qry.Params.ParamByName('Quantidade').Value := Quantidade;

  qry.Params.Add('Valor', ftCurrency, ptInput);
  qry.Params.ParamByName('Valor').Value := Valor;

  qry.Params.Add('ValorFinal', ftCurrency, ptInput);
  qry.Params.ParamByName('ValorFinal').Value := ValorFinal;

  qry.Params.Add('Data', ftString, ptInput);
  qry.Params.ParamByName('Data').Value := Data;

  try
    begin
      qry.ExecSQL;
      Result := True;
  end;
  except
    Result := False;
  end;

  qry.Close;
  qry.Destroy;
end;

function TAbastecimento.TruncVal(Value: Double; Casas: Integer): Double;
var sPot: String;
    iPot: Integer;
    x: Integer;
begin
  sPot := '1';

  for x := 1 to Casas do sPot := sPot + '0';
  begin
    iPot := StrToInt(sPot);
  end;

  Result := StrToInt(IntToStr(Trunc(Value * iPot))) / iPot;
end;

end.
