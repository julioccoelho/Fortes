object FormBomba: TFormBomba
  Left = 0
  Top = 0
  Caption = 'Cadastro de Bombas'
  ClientHeight = 241
  ClientWidth = 411
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
    Top = 5
    Width = 36
    Height = 13
    Caption = 'Tanque'
  end
  object Label2: TLabel
    Left = 159
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Bomba'
  end
  object Label3: TLabel
    Left = 327
    Top = 8
    Width = 75
    Height = 13
    Caption = 'Vr. Combust'#237'vel'
  end
  object cboTanque: TDBLookupComboBox
    Left = 8
    Top = 24
    Width = 145
    Height = 21
    Enabled = False
    KeyField = 'Codigo'
    ListField = 'Nome'
    TabOrder = 0
  end
  object edtNome: TEdit
    Left = 159
    Top = 24
    Width = 162
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object edtValor: TMaskEdit
    Left = 327
    Top = 24
    Width = 72
    Height = 21
    Enabled = False
    EditMask = '9,999;1;_'
    MaxLength = 5
    TabOrder = 3
    Text = ' ,   '
  end
  object btnConfirma: TButton
    Left = 118
    Top = 201
    Width = 75
    Height = 25
    Caption = 'Confirma'
    Enabled = False
    TabOrder = 4
    OnClick = btnConfirmaClick
  end
  object btnSair: TButton
    Left = 199
    Top = 201
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 5
    OnClick = btnSairClick
  end
  object grdPrincipal: TDBGrid
    Left = 9
    Top = 63
    Width = 394
    Height = 120
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 6
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
        FieldName = 'NomeTanque'
        Title.Caption = 'Tanque'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Bomba'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Title.Caption = 'Vr. Combust'#237'vel'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodigoTanque'
        Visible = False
      end>
  end
  object edtTanque: TEdit
    Left = 9
    Top = 24
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 344
    Top = 194
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
