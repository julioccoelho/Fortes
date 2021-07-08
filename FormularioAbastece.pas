unit FormularioAbastece;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls, DateUtils;

type
  TFormAbastece = class(TForm)
    cboBomba: TDBLookupComboBox;
    edtData: TEdit;
    btnConfirma: TButton;
    btnSair: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    grdPrincipal: TDBGrid;
    edtValor: TMaskEdit;
    edtQtde: TMaskEdit;
    edtTotal: TEdit;
    Label6: TLabel;
    edtDataInicio: TMaskEdit;
    Label7: TLabel;
    edtDataFim: TMaskEdit;
    btnExibir: TButton;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure cboBombaClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure edtQtdeExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnExibirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbastece: TFormAbastece;

implementation

uses ClasseBomba, ClasseAbastecimento;

{$R *.dfm}

procedure TFormAbastece.FormShow(Sender: TObject);
var bomba : TBomba;
    abastecimento : TAbastecimento;
begin
  edtData.Text := DateToStr(Date());
  edtDataInicio.Text := DateToStr(StartofTheMonth(date));
  edtDataFim.Text := DateToStr(EndofTheMonth(date));

  bomba := TBomba.Create;
  abastecimento := TAbastecimento.Create;

  try
    begin
      cboBomba.ListSource := bomba.Bombas;
      abastecimento.DataInicio := edtDataInicio.Text;
      abastecimento.DataFim := edtDataFim.Text;
      grdPrincipal.DataSource := abastecimento.Lista;
    end;
  finally
    begin
      bomba.Free;
      abastecimento.Free;
    end;
  end;
end;

procedure TFormAbastece.cboBombaClick(Sender: TObject);
var bomba : TBomba;
begin
  bomba := Tbomba.Create;
  bomba.Codigo := cboBomba.KeyValue;
  try
    edtValor.Text := bomba.ValorLitro;
  finally
    bomba.Free;
  end;
end;

procedure TFormAbastece.edtQtdeExit(Sender: TObject);
var valor, quantidade, valorFinal : Currency;
    abastecimento : TAbastecimento;
begin
  abastecimento := TAbastecimento.Create;

  valor := StrToCurr(edtValor.Text);
  quantidade := StrToCurr(edtQtde.Text);
  valorFinal := valor * quantidade;
  valorFinal := ValorFinal * 1.13;
   try
    abastecimento.ValorFinal := ValorFinal;
    abastecimento.Casas := 3;
    valorFinal := abastecimento.TruncVal;
  finally
    abastecimento.Free;
  end;
  edtTotal.Text := CurrToStr(valorFinal);

end;

procedure TFormAbastece.btnConfirmaClick(Sender: TObject);
var Abastece : TAbastecimento;
begin
  Abastece := TAbastecimento.Create;
  try
  begin
    Abastece.DataInicio := edtDataInicio.Text;
    Abastece.DataFim := edtDataFim.Text;

    Abastece.CodigoBomba := cboBomba.KeyValue;
    Abastece.Data := edtData.Text;

    Abastece.Quantidade := StrToFloat(edtQtde.Text);
    Abastece.Valor := StrToFloat(edtValor.Text);

    Abastece.ValorTotal := StrToFloat(edtTotal.Text);

    if Abastece.IncluirAbastecimento then
    begin
      Application.MessageBox(PChar('Inclusão realizada com sucesso.'),'Atenção',MB_OK + MB_ICONINFORMATION);
      grdPrincipal.DataSource.DataSet.Refresh;
    end
    else
      Application.MessageBox(PChar('Erro na inclusão.'),'Atenção',MB_OK + MB_ICONINFORMATION);

  end
  finally
    Abastece.Free;
  end;

end;

procedure TFormAbastece.btnExibirClick(Sender: TObject);
var abastecimento : TAbastecimento;
begin
  abastecimento := TAbastecimento.Create;
  abastecimento.DataInicio := edtDataInicio.Text;
  abastecimento.DataFim := edtDataFim.Text;

  try
    grdPrincipal.DataSource := abastecimento.Lista;
  finally
    abastecimento.Free;
  end;
end;

procedure TFormAbastece.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;


end.
