object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Gerenciamento de Tanques de Combust'#237'veis '
  ClientHeight = 397
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 24
    Top = 24
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object anque1: TMenuItem
        Caption = 'Tanque'
        OnClick = anque1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Bomba1: TMenuItem
        Caption = 'Bomba'
        OnClick = Bomba1Click
      end
    end
    object Abastecimento1: TMenuItem
      Caption = 'Abastecimento'
      OnClick = Abastecimento1Click
    end
    object Relatrio1: TMenuItem
      Caption = 'Relat'#243'rio'
      OnClick = Relatrio1Click
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
