unit FormularioPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    anque1: TMenuItem;
    Bomba1: TMenuItem;
    N2: TMenuItem;
    Abastecimento1: TMenuItem;
    Sair1: TMenuItem;
    Relatrio1: TMenuItem;
    procedure anque1Click(Sender: TObject);
    procedure Bomba1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Abastecimento1Click(Sender: TObject);
    procedure Relatrio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses FormularioTanque,
     FormularioBomba,
     FormularioAbastece,
     FormularioRelAbastecimento;

{$R *.dfm}

procedure TFormPrincipal.anque1Click(Sender: TObject);
begin
  FormTanque := TFormTanque.Create(Self);
  FormTanque.ShowModal;
  FormTanque.Destroy;
end;

procedure TFormPrincipal.Bomba1Click(Sender: TObject);
begin
  FormBomba := TFormBomba.Create(Self);
  FormBomba.ShowModal;
  FormBomba.Destroy;
end;

procedure TFormPrincipal.Abastecimento1Click(Sender: TObject);
begin
  FormAbastece := TFormAbastece.Create(Self);
  FormAbastece.ShowModal;
  FormAbastece.Destroy;
end;

procedure TFormPrincipal.Relatrio1Click(Sender: TObject);
begin
  FormRelAbastecimento := TFormRelAbastecimento.Create(Self);
  FormRelAbastecimento.ShowModal;
  FormRelAbastecimento.Destroy;
end;

procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormPrincipal.FormDestroy(Sender: TObject);
begin
  FormPrincipal := Nil;
end;

procedure TFormPrincipal.Sair1Click(Sender: TObject);
begin
  Self.Close;
end;

end.
