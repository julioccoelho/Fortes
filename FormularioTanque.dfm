object FormTanque: TFormTanque
  Left = 0
  Top = 0
  Caption = 'Cadastros de Tanques'
  ClientHeight = 242
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 10
    Width = 36
    Height = 13
    Caption = 'Tanque'
  end
  object edtNome: TEdit
    Left = 8
    Top = 29
    Width = 153
    Height = 21
    Enabled = False
    MaxLength = 50
    TabOrder = 0
  end
  object btnConfirma: TButton
    Left = 78
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Confirma'
    Enabled = False
    TabOrder = 2
    OnClick = btnConfirmaClick
  end
  object btnSair: TButton
    Left = 167
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 3
    OnClick = btnSairClick
  end
  object grdPrincipal: TDBGrid
    Left = 8
    Top = 63
    Width = 313
    Height = 120
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = grdPrincipalCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Tanque'
        Width = 193
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeTipo'
        Title.Caption = 'Combust'#237'vel'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Visible = False
      end>
  end
  object rgpTipo: TRadioGroup
    Left = 167
    Top = 21
    Width = 154
    Height = 36
    Columns = 2
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Gasolina'
      'Diesel')
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 264
    Top = 208
    object Incluir1: TMenuItem
      Caption = 'Incluir'
      OnClick = Incluir1Click
    end
    object Alterar1: TMenuItem
      Caption = 'Alterar'
      OnClick = Alterar1Click
    end
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
  end
end
