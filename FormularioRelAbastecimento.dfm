object FormRelAbastecimento: TFormRelAbastecimento
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Abastecimento'
  ClientHeight = 75
  ClientWidth = 362
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
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 51
    Height = 13
    Caption = 'Data In'#237'cio'
  end
  object Label2: TLabel
    Left = 96
    Top = 16
    Width = 42
    Height = 13
    Caption = 'Data Fim'
  end
  object btnExibir: TButton
    Left = 191
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Exibir'
    TabOrder = 2
    OnClick = btnExibirClick
  end
  object edtDataInicio: TMaskEdit
    Left = 8
    Top = 32
    Width = 81
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object edtDataFim: TMaskEdit
    Left = 96
    Top = 32
    Width = 81
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object btnSair: TButton
    Left = 272
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 3
    OnClick = btnSairClick
  end
  object frxReport1: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44380.672652928240000000
    ReportOptions.LastChange = 44380.698688946760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 56
    Top = 88
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 11.338590000000000000
          Width = 699.213050000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Abastecimento')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 39.133890000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 120.944960000000000000
          Top = 39.133890000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tanque')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 298.582870000000000000
          Top = 39.133890000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bomba')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 627.401980000000000000
          Top = 39.133890000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 5.559060000000000000
          Top = 32.795300000000000000
          Width = 706.772110000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 64.252010000000000000
          Width = 706.772110000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'Data'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."Data"]')
        end
        object Memo3: TfrxMemoView
          Left = 120.944960000000000000
          Top = 3.779530000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'NomeTanque'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."NomeTanque"]')
        end
        object Memo4: TfrxMemoView
          Left = 298.582870000000000000
          Top = 3.779530000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = 'NomeBomba'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."NomeBomba"]')
        end
        object Memo5: TfrxMemoView
          Left = 532.913730000000000000
          Top = 3.779530000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'Total'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."Total"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 275.905690000000000000
          Top = 12.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
        object SysMemo1: TfrxSysMemoView
          Left = 529.134200000000000000
          Top = 12.779530000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."Total">,MasterData1)]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 706.772110000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 423.307360000000000000
          Top = 11.338590000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Total:')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = FDQuery1
    BCDToCurrency = False
    Left = 136
    Top = 88
  end
  object FDQuery1: TFDQuery
    Connection = dmPrincipal.conBD
    SQL.Strings = (
      'SELECT CAST(a.Data AS VARCHAR) AS Data'
      '     , t.Nome AS NomeTanque'
      '     , b.Nome AS NomeBomba'
      '     , ROUND(SUM(a.ValorFinal), 3) AS Total'
      ''
      'FROM Abastecimento a'
      'INNER JOIN Bomba b ON b.Codigo = a.CodigoBomba'
      'INNER JOIN Tanque t ON t.Codigo = b.CodigoTanque'
      ''
      'WHERE a.Data BETWEEN :DataInicio AND :DataFim'
      ''
      'GROUP BY a.Data'
      '        , t.Nome'
      '        , b.Nome')
    Left = 216
    Top = 88
    ParamData = <
      item
        Name = 'DATAINICIO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATAFIM'
        DataType = ftString
        ParamType = ptInput
      end>
  end
end
