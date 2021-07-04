object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object conBD: TFDConnection
    Params.Strings = (
      'Database=C:\Desenvolvimento\FortesSelecao\Fortes.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 80
    Top = 32
  end
end
