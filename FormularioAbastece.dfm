object FormAbastece: TFormAbastece
  Left = 0
  Top = 0
  Caption = 'FormAbastece'
  ClientHeight = 381
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 104
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Bomba'
  end
  object Label3: TLabel
    Left = 256
    Top = 5
    Width = 38
    Height = 13
    Caption = 'Vr. Litro'
  end
  object Label4: TLabel
    Left = 336
    Top = 5
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object Label1: TLabel
    Left = 416
    Top = 5
    Width = 75
    Height = 13
    Caption = 'Vr. Tot. c/ 13%'
  end
  object Label5: TLabel
    Left = 8
    Top = 5
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label6: TLabel
    Left = 9
    Top = 128
    Width = 51
    Height = 13
    Caption = 'Data In'#237'cio'
  end
  object Label7: TLabel
    Left = 97
    Top = 128
    Width = 42
    Height = 13
    Caption = 'Data Fim'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 105
    Width = 535
    Height = 9
  end
  object cboBomba: TDBLookupComboBox
    Left = 104
    Top = 24
    Width = 145
    Height = 21
    KeyField = 'Codigo'
    ListField = 'Nome'
    TabOrder = 1
    OnClick = cboBombaClick
  end
  object edtData: TEdit
    Left = 8
    Top = 24
    Width = 89
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object btnConfirma: TButton
    Left = 160
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Confirma'
    TabOrder = 5
    OnClick = btnConfirmaClick
  end
  object btnSair: TButton
    Left = 255
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 6
    OnClick = btnSairClick
  end
  object grdPrincipal: TDBGrid
    Left = 8
    Top = 184
    Width = 530
    Height = 186
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data'
        Title.Caption = 'Abastecimento'
        Width = 74
        Visible = True
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
        FieldName = 'NomeBomba'
        Title.Caption = 'Bomba'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorFinal'
        Title.Caption = 'Vr. c/ 13%'
        Width = 98
        Visible = True
      end>
  end
  object edtValor: TMaskEdit
    Left = 256
    Top = 24
    Width = 72
    Height = 21
    Enabled = False
    EditMask = '9,999;1;_'
    MaxLength = 5
    TabOrder = 2
    Text = ' ,   '
  end
  object edtQtde: TMaskEdit
    Left = 334
    Top = 24
    Width = 68
    Height = 21
    EditMask = '999,99;1;_'
    MaxLength = 6
    TabOrder = 3
    Text = '   ,  '
    OnExit = edtQtdeExit
  end
  object edtTotal: TEdit
    Left = 416
    Top = 24
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object edtDataInicio: TMaskEdit
    Left = 9
    Top = 144
    Width = 80
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 8
    Text = '  /  /    '
  end
  object edtDataFim: TMaskEdit
    Left = 97
    Top = 144
    Width = 81
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 9
    Text = '  /  /    '
  end
  object btnExibir: TButton
    Left = 192
    Top = 142
    Width = 75
    Height = 25
    Caption = 'Exibir'
    TabOrder = 10
    OnClick = btnExibirClick
  end
end
