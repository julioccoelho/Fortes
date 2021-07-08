unit FormularioRelAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet, Vcl.StdCtrls, DateUtils,
  Vcl.Mask, ClasseTecnologia;

type
  TFormRelAbastecimento = class(TForm)
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    FDQuery1: TFDQuery;
    btnExibir: TButton;
    edtDataInicio: TMaskEdit;
    edtDataFim: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnSair: TButton;
    procedure btnExibirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelAbastecimento: TFormRelAbastecimento;

implementation

{$R *.dfm}

procedure TFormRelAbastecimento.FormShow(Sender: TObject);
var conn : TConexao;
begin
  conn := TConexao.Create;

  FDQuery1.Connection := conn.ObterConexao;

  edtDataInicio.Text := DateToStr(StartofTheMonth(date));
  edtDataFim.Text := DateToStr(EndofTheMonth(date));
end;

procedure TFormRelAbastecimento.btnExibirClick(Sender: TObject);
begin
  FDQuery1.Close;
  FDQuery1.Params.ParamByName('DataInicio').AsString := edtDataInicio.Text;
  FDQuery1.Params.ParamByName('DataFim').AsString := edtDataFim.Text;
  FDQuery1.Open();
  frxReport1.ShowReport;
end;

procedure TFormRelAbastecimento.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
