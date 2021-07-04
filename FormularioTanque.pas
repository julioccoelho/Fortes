unit FormularioTanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Menus;

type
  TFormTanque = class(TForm)
    edtNome: TEdit;
    btnConfirma: TButton;
    btnSair: TButton;
    grdPrincipal: TDBGrid;
    rgpTipo: TRadioGroup;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdPrincipalCellClick(Column: TColumn);
    procedure Incluir1Click(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    varOperacao : String;
    procedure HabilitaCampos (pHabilita : Boolean);
    procedure AtualizaCampos;
  public
    { Public declarations }

  end;

var
  FormTanque: TFormTanque;

implementation

{$R *.dfm}

uses ClasseTanque;

procedure TFormTanque.FormShow(Sender: TObject);
var tanqueLista : TTanque;
begin
  grdPrincipal.DataSource := tanqueLista.Lista;
end;

procedure TFormTanque.Incluir1Click(Sender: TObject);
begin
  edtNome.Clear;
  HabilitaCampos(True);
  varOperacao := 'I';
end;

procedure TFormTanque.Alterar1Click(Sender: TObject);
begin
  AtualizaCampos;
  HabilitaCampos(True);
  varOperacao := 'A';
end;

procedure TFormTanque.Excluir1Click(Sender: TObject);
var tanque : TTanque;
begin
  if tanque.PodeExcluir(grdPrincipal.DataSource.DataSet.FieldByName('Codigo').AsString) then
  begin
    if (Application.MessageBox(PChar('Confirma a exclusão do tanque?'),'Confirmação',MB_YESNO + MB_ICONQUESTION) = IDYES) then
    begin
      grdPrincipal.DataSource.DataSet.Delete;
    end;
  end
  else
    Application.MessageBox(PChar('Este tanque não pode ser excluído, pois está em uso numa bomba.'),'Atenção',MB_OK + MB_ICONINFORMATION);
end;

procedure TFormTanque.btnConfirmaClick(Sender: TObject);
var tanque : TTanque;
    Tipo : String;
begin
  if Trim(edtNome.Text) = '' then
    Application.MessageBox(PChar('O nome do tanque precisa ser informado.'),'Atenção',MB_OK + MB_ICONINFORMATION)
  else
  begin
    if varOperacao = 'I' then
    begin
      if (Application.MessageBox(PChar('Confirma a inclusão do tanque?'),'Confirmação',MB_YESNO + MB_ICONQUESTION) = IDYES) then
      begin

        if rgpTipo.ItemIndex = 0 then
          Tipo := 'G'
        else
          Tipo := 'D';

        if tanque.Inclui (edtNome.Text, Tipo) then
        begin
          Application.MessageBox(PChar('Inclusão realizada com sucesso.'),'Atenção',MB_OK + MB_ICONINFORMATION);
          grdPrincipal.DataSource := tanque.Lista;
          edtNome.Clear;
          HabilitaCampos(False);
        end
        else
          Application.MessageBox(PChar('Erro na inclusão.'),'Atenção',MB_OK + MB_ICONINFORMATION);
      end;
    end
    else
    begin
      if (Application.MessageBox(PChar('Confirma a alteração do tanque?'),'Confirmação',MB_YESNO + MB_ICONQUESTION) = IDYES) then
      begin
        
        if rgpTipo.ItemIndex = 0 then
          Tipo := 'G'
        else
          Tipo := 'D';

        if tanque.Altera (grdPrincipal.DataSource.DataSet.FieldByName('Codigo').AsString, edtNome.Text, Tipo) then
        begin
          Application.MessageBox(PChar('Alteração realizada com sucesso.'),'Atenção',MB_OK + MB_ICONINFORMATION);
          grdPrincipal.DataSource := tanque.Lista;
          edtNome.Clear;
          HabilitaCampos(False);
        end
        else
          Application.MessageBox(PChar('Erro na alteração.'),'Atenção',MB_OK + MB_ICONINFORMATION);
      end;
    end;
  end;
end;

procedure TFormTanque.HabilitaCampos(pHabilita: Boolean);
begin
  edtNome.Enabled := pHabilita;
  rgpTipo.Enabled := pHabilita;
  btnConfirma.Enabled := pHabilita;
end;

procedure TFormTanque.grdPrincipalCellClick(Column: TColumn);
begin
  AtualizaCampos;
end;

procedure TFormTanque.AtualizaCampos;
begin
  edtNome.Text := grdPrincipal.DataSource.DataSet.FieldByName('Nome').AsString;

  if grdPrincipal.DataSource.DataSet.FieldByName('Tipo').AsString = 'G' then
    rgpTipo.ItemIndex := 0
  else
    rgpTipo.ItemIndex := 1;
end;

procedure TFormTanque.btnSairClick(Sender: TObject);
begin
  FormTanque.Close;
end;

procedure TFormTanque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormTanque.FormDestroy(Sender: TObject);
begin
  FormTanque := Nil;
end;

end.
