unit FormularioBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TFormBomba = class(TForm)
    cboTanque: TDBLookupComboBox;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtValor: TMaskEdit;
    btnConfirma: TButton;
    btnSair: TButton;
    grdPrincipal: TDBGrid;
    edtTanque: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure Incluir1Click(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure grdPrincipalCellClick(Column: TColumn);
    procedure Excluir1Click(Sender: TObject);
  private
    { Private declarations }
    varOperacao : String;
    procedure HabilitaCampos (pHabilita : Boolean);
    procedure AtualizaCampos;
    procedure Incluir;
    procedure Alterar;
  public
    { Public declarations }
  end;

var
  FormBomba: TFormBomba;

implementation

uses ClasseTanque, ClasseBomba;

{$R *.dfm}

procedure TFormBomba.FormShow(Sender: TObject);
var bomba : TBomba;
    tanque : TTanque;
begin
  bomba := TBomba.Create;
  tanque := TTanque.Create;
  try
    begin
      cboTanque.ListSource := tanque.Tanques;
      grdPrincipal.DataSource := bomba.Lista;
    end
  finally
    begin
      bomba.Free;
      tanque.Free;
    end;
  end;
end;

procedure TFormBomba.Incluir1Click(Sender: TObject);
begin
  edtNome.Clear;
  edtValor.Clear;
  cboTanque.Visible := True;
  edtTanque.Visible := False;
  HabilitaCampos(True);
  varOperacao := 'I';
end;

procedure TFormBomba.Alterar1Click(Sender: TObject);
begin
  AtualizaCampos;
  cboTanque.Visible := False;
  edtTanque.Visible := True;
  HabilitaCampos(True);
  varOperacao := 'A';
end;

procedure TFormBomba.btnConfirmaClick(Sender: TObject);
begin
  if varOperacao = 'I' then
  begin
    if (Application.MessageBox(PChar('Confirma a inclusão da bomba?'),'Confirmação',MB_YESNO + MB_ICONQUESTION) = IDYES) then
    begin
      Incluir;
    end;
  end
  else
  begin
    if (Application.MessageBox(PChar('Confirma a alteração da bomba?'),'Confirmação',MB_YESNO + MB_ICONQUESTION) = IDYES) then
    begin
      Alterar;
    end;
  end;
end;

procedure TFormBomba.Incluir;
var bombainc : TBomba;
begin
  bombainc := TBomba.Create;
  try
  begin
    bombainc.CodigoTanque := cboTanque.KeyValue;
    bombainc.Nome := edtNome.Text;
    bombainc.Valor := edtValor.Text;

    if bombainc.IncluirBomba  then
    begin
      Application.MessageBox(PChar('Inclusão realizada com sucesso.'),'Atenção',MB_OK + MB_ICONINFORMATION);
      grdPrincipal.DataSource.DataSet.Refresh;
      edtNome.Clear;
      edtValor.Clear;
      HabilitaCampos(False);
    end
    else
      Application.MessageBox(PChar('Erro na inclusão.'),'Atenção',MB_OK + MB_ICONINFORMATION);

  end
  finally
    bombainc.Free;
  end;

end;

procedure TFormBomba.Alterar;
var bombaalt : TBomba;
begin
  bombaalt := TBomba.Create;
  try
  begin
    bombaalt.Codigo := grdPrincipal.DataSource.DataSet.FieldByName('Codigo').AsString;
    bombaalt.Nome := edtNome.Text;
    bombaalt.Valor := edtValor.Text;

    if bombaalt.AlterarBomba then
    begin
      Application.MessageBox(PChar('Alteração realizada com sucesso.'),'Atenção',MB_OK + MB_ICONINFORMATION);
      edtValor.Clear;
      edtNome.Clear;
      HabilitaCampos(False);
      grdPrincipal.DataSource.DataSet.Refresh;
    end
    else
      Application.MessageBox(PChar('Erro na alteração.'),'Atenção',MB_OK + MB_ICONINFORMATION);

  end
  finally
    bombaalt.Free;
  end;

end;

procedure TFormBomba.HabilitaCampos(pHabilita: Boolean);
begin
  edtNome.Enabled := pHabilita;
  edtValor.Enabled := pHabilita;
  cboTanque.Enabled := pHabilita;
  btnConfirma.Enabled := pHabilita;
end;

procedure TFormBomba.AtualizaCampos;
begin
  edtNome.Text  := grdPrincipal.DataSource.DataSet.FieldByName('Nome').AsString;
  edtValor.Text := grdPrincipal.DataSource.DataSet.FieldByName('Valor').AsString;
  edtTanque.Text := grdPrincipal.DataSource.DataSet.FieldByName('NomeTanque').Value;
end;

procedure TFormBomba.grdPrincipalCellClick(Column: TColumn);
begin
  AtualizaCampos;
end;

procedure TFormBomba.btnSairClick(Sender: TObject);
begin
  FormBomba.Close;
end;

procedure TFormBomba.Excluir1Click(Sender: TObject);
var bomba : TBomba;
begin
  bomba := TBomba.Create;
  try
  begin
    bomba.Codigo := grdPrincipal.DataSource.DataSet.FieldByName('Codigo').AsString;

    if bomba.PodeExcluir then
    begin
      if (Application.MessageBox(PChar('Confirma a exclusão da bomba?'),'Confirmação',MB_YESNO + MB_ICONQUESTION) = IDYES) then
      begin
        if bomba.ExcluirBomba then
        begin
          Application.MessageBox(PChar('Exclusão realizada com sucesso.'),'Atenção',MB_OK + MB_ICONINFORMATION);
          grdPrincipal.DataSource.DataSet.Refresh;
        end
        else
          Application.MessageBox(PChar('Erro na exclusão.'),'Atenção',MB_OK + MB_ICONINFORMATION);
      end;
    end
    else
      Application.MessageBox(PChar('Esta bomba não pode ser excluída, pois já existe abastecimento.'),'Atenção',MB_OK + MB_ICONINFORMATION);

  end
  finally
    bomba.Free;
  end;

end;

procedure TFormBomba.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormBomba.FormDestroy(Sender: TObject);
begin
  FormBomba := Nil;
end;

end.
