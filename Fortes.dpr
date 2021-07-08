program Fortes;

uses
  Vcl.Forms,
  classeTanque in 'classeTanque.pas',
  FormularioPrincipal in 'FormularioPrincipal.pas' {FormPrincipal},
  FormularioTanque in 'FormularioTanque.pas' {FormTanque},
  FormularioBomba in 'FormularioBomba.pas' {FormBomba},
  DataModulePrincipal in 'DataModulePrincipal.pas' {dmPrincipal: TDataModule},
  classeBomba in 'classeBomba.pas',
  classeAbastecimento in 'classeAbastecimento.pas',
  FormularioAbastece in 'FormularioAbastece.pas' {FormAbastece},
  FormularioRelAbastecimento in 'FormularioRelAbastecimento.pas' {FormRelAbastecimento},
  classeTecnologia in 'classeTecnologia.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
