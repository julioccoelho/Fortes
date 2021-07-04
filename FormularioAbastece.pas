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

procedure TFormAbastece.btnConfirmaClick(Sender: TObject);
var Abastece : TAbastecimento;
begin
  if (Trim(cboBomba.Text) = '')  or (edtQtde.Text = '   ,  ') or (Trim(edtTotal.Text) = '') then
  begin
    Application.MessageBox(PChar('Todos os campos são obrigatório.'),'Atenção',MB_OK + MB_ICONINFORMATION);
  end
  else
  begin
    if Abastece.IncluirAbastecimento(cboBomba.KeyValue, edtData.Text, StrToFloat(edtQtde.Text), StrToFloat(edtValor.Text), StrToFloat(edtTotal.Text)) then
    begin
      Application.MessageBox(PChar('Inclusão realizada com sucesso.'),'Atenção',MB_OK + MB_ICONINFORMATION);
      grdPrincipal.DataSource := Abastece.Lista (edtDataInicio.Text, edtDataFim.Text);
    end
    else
      Application.MessageBox(PChar('Erro na inclusão.'),'Atenção',MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TFormAbastece.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormAbastece.cboBombaClick(Sender: TObject);
var bomba : TBomba;
begin
  edtValor.Text := bomba.ValorLitro(cboBomba.KeyValue);
end;

procedure TFormAbastece.edtQtdeExit(Sender: TObject);
var valor, quantidade, valorFinal : Currency;
    abastecimento : TAbastecimento;
begin
  if (Trim(edtQtde.Text) <> '') and (Trim(edtValor.Text) <> '') then
  begin
    valor := StrToCurr(edtValor.Text);
    quantidade := StrToCurr(edtQtde.Text);
    valorFinal := valor * quantidade;
    valorFinal := ValorFinal * 1.13;
    valorFinal := abastecimento.TruncVal(valorFinal,3);
    edtTotal.Text := CurrToStr(valorFinal);
  end;
end;

procedure TFormAbastece.FormShow(Sender: TObject);
var bomba : TBomba;
    abastecimento : TAbastecimento;
begin
  edtData.Text := DateToStr(Date());
  edtDataInicio.Text := DateToStr(StartofTheMonth(date));
  edtDataFim.Text := DateToStr(EndofTheMonth(date));
  cboBomba.ListSource := bomba.Bombas;
  grdPrincipal.DataSource := abastecimento.Lista (edtDataInicio.Text, edtDataFim.Text);
end;

procedure TFormAbastece.btnExibirClick(Sender: TObject);
var abastecimento : TAbastecimento;
begin
  grdPrincipal.DataSource := abastecimento.Lista (edtDataInicio.Text, edtDataFim.Text);
end;

end.
