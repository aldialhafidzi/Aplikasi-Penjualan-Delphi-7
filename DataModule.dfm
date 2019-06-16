object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 142
  Top = 239
  Height = 418
  Width = 870
  object con1: TZConnection
    Protocol = 'mysql'
    HostName = 'localhost'
    Port = 3306
    Database = 'alatkesehatan'
    User = 'root'
    Connected = True
    Left = 24
    Top = 8
  end
  object qr1_login: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from employees')
    Params = <>
    Left = 80
    Top = 8
  end
  object qr2_barang: TZQuery
    Connection = con1
    OnCalcFields = qr2_barangCalcFields
    Active = True
    SQL.Strings = (
      'select * from goods order by id_supplier;')
    Params = <>
    Left = 80
    Top = 56
    object intgrfldqr2_barangid: TIntegerField
      Alignment = taCenter
      FieldName = 'id'
      Required = True
    end
    object strngfldqr2_barangnama: TStringField
      Alignment = taCenter
      FieldName = 'nama'
      Size = 30
    end
    object intgrfldqr2_barangstok: TIntegerField
      Alignment = taCenter
      FieldName = 'stok'
    end
    object intgrfldqr2_barangharga: TIntegerField
      Alignment = taCenter
      FieldName = 'harga'
    end
    object intgrfldqr2_barangid_supplier: TIntegerField
      Alignment = taCenter
      FieldName = 'id_supplier'
    end
    object strngfldqr2_barangnama_supplier: TStringField
      Alignment = taCenter
      FieldKind = fkLookup
      FieldName = 'nama_supplier'
      LookupDataSet = qr4_suppliers
      LookupKeyFields = 'id'
      LookupResultField = 'nama'
      KeyFields = 'id_supplier'
      Size = 25
      Lookup = True
    end
    object strngfldqr2_barangstatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'status'
      Size = 8
      Calculated = True
    end
    object qr2_barangrc_hargaproduk: TStringField
      FieldKind = fkCalculated
      FieldName = 'rc_hargaproduk'
      Calculated = True
    end
  end
  object ds1: TDataSource
    DataSet = qr1_login
    Left = 152
    Top = 16
  end
  object ds2: TDataSource
    DataSet = qr2_barang
    Left = 152
    Top = 64
  end
  object filter_gudang: TSMDBFilterDialog
    Caption = 'Filter setup dialog'
    Dataset = qr2_barang
    FilterMode = fmFilterDataset
    WildCard = '%'
    Left = 208
    Top = 16
  end
  object find_gudang: TSMDBFindDialog
    Caption = 'Record search'
    ShowDialog = True
    DataSource = ds2
    FindOption = []
    FindMode = fmBeginPart
    FindScore = fsFromFirst
    SayResult = False
    Left = 208
    Top = 64
  end
  object qr3_transaction: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from transaction')
    Params = <>
    Left = 80
    Top = 104
  end
  object ds3: TDataSource
    DataSet = qr3_transaction
    Left = 152
    Top = 112
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = ds_invoice
    Left = 448
    Top = 65
  end
  object frxReport1: TfrxReport
    Version = '4.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43188.524099409700000000
    ReportOptions.LastChange = 43213.224576909720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 376
    Top = 65
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
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 40.000000000000000000
      RightMargin = 20.000000000000000000
      TopMargin = 40.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 173.858380000000000000
        Top = 18.897650000000000000
        Width = 895.748610000000000000
        object Memo1: TfrxMemoView
          Width = 895.748610000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Century Gothic'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'INVOICE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 30.236240000000000000
          Width = 895.748610000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 260.787570000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = []
          Memo.UTF8 = (
            'PT ALAT KESEHATAN BANDUNG'
            'Jl. GUNUNG PUNTANG Km. 27 No. 30')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 147.401670000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'No. Invoice')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 151.181200000000000000
          Top = 147.401670000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ':')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 491.338900000000000000
          Top = 37.795300000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = []
          Memo.UTF8 = (
            'Date')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 623.622450000000000000
          Top = 37.795300000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ':')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 491.338900000000000000
          Top = 60.472480000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = []
          Memo.UTF8 = (
            'Customer ID')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 623.622450000000000000
          Top = 60.472480000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ':')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 491.338900000000000000
          Top = 83.149660000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = []
          Memo.UTF8 = (
            'Customer Name')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 623.622450000000000000
          Top = 83.149660000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ':')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 491.338900000000000000
          Top = 105.826840000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = []
          Memo.UTF8 = (
            'Address')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 623.622450000000000000
          Top = 105.826840000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ':')
          ParentFont = False
        end
        object frxDBDataset1id_pelanggan: TfrxMemoView
          Left = 634.961040000000000000
          Top = 60.472480000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'id_pelanggan'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."id_pelanggan"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1tanggal: TfrxMemoView
          Left = 634.961040000000000000
          Top = 37.795300000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tanggal'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."tanggal"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1nama_1: TfrxMemoView
          Left = 634.961040000000000000
          Top = 83.149660000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama_1'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."nama_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1alamat_lengkap: TfrxMemoView
          Left = 634.961040000000000000
          Top = 105.826840000000000000
          Width = 260.787570000000000000
          Height = 41.574830000000000000
          ShowHint = False
          DataField = 'alamat_lengkap'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."alamat_lengkap"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 491.338900000000000000
          Top = 143.622140000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Kota')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 623.622450000000000000
          Top = 143.622140000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ':')
          ParentFont = False
        end
        object frxDBDataset1kota: TfrxMemoView
          Left = 634.961040000000000000
          Top = 143.622140000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'kota'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."kota"]')
          ParentFont = False
        end
        object frxDBDataset1no_invoice: TfrxMemoView
          Left = 162.519790000000000000
          Top = 147.401670000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'no_invoice'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."no_invoice"]')
          ParentFont = False
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        Height = 26.456710000000000000
        Top = 215.433210000000000000
        Width = 895.748610000000000000
        object Memo13: TfrxMemoView
          Width = 75.590600000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'No.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 75.590600000000000000
          Width = 128.504020000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'Product ID')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 204.094620000000000000
          Width = 287.244280000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'Product Name')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 491.338900000000000000
          Width = 41.574830000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'Qty')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 532.913730000000000000
          Width = 188.976500000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'Price')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 721.890230000000000000
          Width = 173.858380000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'Subtotal')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 302.362400000000000000
        Width = 895.748610000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo19: TfrxMemoView
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1id_produk: TfrxMemoView
          Left = 75.590600000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'id_produk'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."id_produk"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1nama: TfrxMemoView
          Left = 204.094620000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."nama"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1qty: TfrxMemoView
          Left = 491.338900000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'qty'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."qty"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1harga: TfrxMemoView
          Left = 532.913730000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."harga"]')
          ParentFont = False
        end
        object frxDBDataset1subtotal: TfrxMemoView
          Left = 721.890230000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."subtotal"]')
          ParentFont = False
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        Height = 30.236240000000000000
        Top = 381.732530000000000000
        Width = 895.748610000000000000
        object Memo20: TfrxMemoView
          Left = 623.622450000000000000
          Top = 11.338590000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'Total')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1total: TfrxMemoView
          Left = 721.890230000000000000
          Top = 11.338590000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."total"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 151.181200000000000000
        Top = 434.645950000000000000
        Width = 895.748610000000000000
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Top = 68.031540000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Employee Name')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 154.960730000000000000
          Top = 68.031540000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Century Gothic'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ':')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 623.622450000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'PPN 10%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 623.622450000000000000
          Top = 18.897650000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'Grand Total')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 120.944960000000000000
          Width = 895.748610000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo25: TfrxMemoView
          Left = 49.133890000000000000
          Top = 124.724490000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 3.779530000000000000
          Top = 124.724490000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Page :')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1nama_2: TfrxMemoView
          Left = 166.299320000000000000
          Top = 68.031540000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama_2'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."nama_2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1ppn: TfrxMemoView
          Left = 721.890230000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."ppn"]')
          ParentFont = False
        end
        object frxDBDataset1grandtotal: TfrxMemoView
          Left = 721.890230000000000000
          Top = 18.897650000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."grandtotal"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 623.622450000000000000
          Top = 49.133890000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'Pay')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 623.622450000000000000
          Top = 68.031540000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'Change')
          ParentFont = False
        end
        object frxDBDataset1pay: TfrxMemoView
          Left = 721.890230000000000000
          Top = 49.133890000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."pay"]')
          ParentFont = False
        end
        object frxDBDataset1change: TfrxMemoView
          Left = 721.890230000000000000
          Top = 68.031540000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."change"]')
          ParentFont = False
        end
      end
    end
  end
  object qr4_suppliers: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from suppliers')
    Params = <>
    Left = 80
    Top = 152
  end
  object ds4: TDataSource
    DataSet = qr4_suppliers
    Left = 152
    Top = 160
  end
  object qr5_customers: TZQuery
    Connection = con1
    OnCalcFields = qr5_customersCalcFields
    Active = True
    SQL.Strings = (
      'select * from customers;')
    Params = <>
    Left = 80
    Top = 208
    object qr5_customersid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qr5_customerskontak: TStringField
      FieldName = 'kontak'
      Size = 12
    end
    object qr5_customersnama: TStringField
      FieldName = 'nama'
      Size = 30
    end
    object qr5_customerstype: TStringField
      FieldName = 'type'
    end
    object qr5_customerskota: TStringField
      DisplayWidth = 50
      FieldName = 'kota'
      Size = 50
    end
    object qr5_customerskecamatan: TStringField
      FieldName = 'kecamatan'
    end
    object qr5_customersalamat_lengkap: TStringField
      FieldName = 'alamat_lengkap'
      Size = 50
    end
    object qr5_customersrc_alamat_lengkap: TStringField
      DisplayWidth = 80
      FieldKind = fkCalculated
      FieldName = 'rc_alamat_lengkap'
      Size = 80
      Calculated = True
    end
  end
  object ds5: TDataSource
    DataSet = qr5_customers
    Left = 152
    Top = 216
  end
  object qr6_detai_transaction: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from detail_transaction')
    Params = <>
    Left = 80
    Top = 264
    object qr6_detai_transactionid_transaction: TIntegerField
      FieldName = 'id_transaction'
    end
    object qr6_detai_transactionid_produk: TIntegerField
      FieldName = 'id_produk'
    end
    object qr6_detai_transactionqty: TIntegerField
      FieldName = 'qty'
    end
    object qr6_detai_transactiongrand_total: TIntegerField
      FieldName = 'grand_total'
      ReadOnly = True
    end
  end
  object ds6: TDataSource
    DataSet = qr6_detai_transaction
    Left = 152
    Top = 272
  end
  object update_stok: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from goods;')
    Params = <>
    Left = 296
    Top = 16
  end
  object search_produk: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from goods')
    Params = <>
    Left = 376
    Top = 16
  end
  object cek_produkid_beli: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from goods')
    Params = <>
    Left = 296
    Top = 64
  end
  object transaksi_report: TZQuery
    Connection = con1
    OnCalcFields = transaksi_reportCalcFields
    SQL.Strings = (
      
        'SELECT transaction.id, detail_transaction.id_produk,  goods.nama' +
        ', goods.harga, detail_transaction.qty, transaction.id_pelanggan,' +
        ' customers.nama, customers.alamat_lengkap, customers.kota, emplo' +
        'yees.nama, transaction.tanggal FROM ((((transaction INNER JOIN d' +
        'etail_transaction ON transaction.id = detail_transaction.id_tran' +
        'saction) INNER JOIN goods ON detail_transaction.id_produk = good' +
        's.id) INNER JOIN customers ON transaction.id_pelanggan = custome' +
        'rs.id) INNER JOIN employees ON transaction.id_karyawan = employe' +
        'es.id) WHERE transaction. id ='#39'21'#39)
    Params = <>
    Left = 536
    Top = 64
    object intgrfld_reportid: TIntegerField
      DisplayWidth = 12
      FieldName = 'id'
      ReadOnly = True
    end
    object intgrfld_reportid_produk: TIntegerField
      DisplayWidth = 12
      FieldName = 'id_produk'
      ReadOnly = True
    end
    object strngfld_reportnama: TStringField
      DisplayWidth = 15
      FieldName = 'nama'
      ReadOnly = True
      Size = 30
    end
    object intgrfld_reportqty: TIntegerField
      DisplayWidth = 12
      FieldName = 'qty'
      ReadOnly = True
    end
    object strngfld_reportnama_1: TStringField
      DisplayWidth = 15
      FieldName = 'nama_1'
      ReadOnly = True
      Size = 30
    end
    object strngfld_reportnama_2: TStringField
      DisplayWidth = 14
      FieldName = 'nama_2'
      ReadOnly = True
      Size = 30
    end
    object dtfld_reporttanggal: TDateField
      DisplayWidth = 12
      FieldName = 'tanggal'
      ReadOnly = True
    end
    object intgrfld_reportid_pelanggan: TIntegerField
      DisplayWidth = 13
      FieldName = 'id_pelanggan'
      ReadOnly = True
    end
    object intgrfld_reportharga: TIntegerField
      DisplayWidth = 12
      FieldName = 'harga'
      ReadOnly = True
    end
    object intgrfld_reportsubtotal: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'subtotal'
      Calculated = True
    end
    object intgrfld_reporttotal: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'total'
      Calculated = True
    end
    object intgrfld_reportppn: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ppn'
      Calculated = True
    end
    object intgrfld_reportgrandtotal: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'grandtotal'
      Calculated = True
    end
    object intgrfld_reportpay: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'pay'
      Calculated = True
    end
    object intgrfld_reportchange: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'change'
      Calculated = True
    end
    object strngfld_reportalamat_lengkap: TStringField
      FieldName = 'alamat_lengkap'
      ReadOnly = True
      Size = 50
    end
    object strngfld_reportkota: TStringField
      FieldName = 'kota'
      ReadOnly = True
    end
    object strngfld_reportno_invoice: TStringField
      FieldKind = fkCalculated
      FieldName = 'no_invoice'
      Calculated = True
    end
  end
  object ds_invoice: TDataSource
    DataSet = transaksi_report
    Left = 608
    Top = 64
  end
  object qr7_stat_jual: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'SELECT * FROM transaction where tanggal < '#39'2018-02-01'#39';')
    Params = <>
    Left = 448
    Top = 248
  end
  object qrInvoice: TZQuery
    Connection = con1
    SQL.Strings = (
      'select * from transaction')
    Params = <>
    Left = 448
    Top = 200
  end
  object qr_historypenjualan: TZQuery
    Connection = con1
    OnCalcFields = qr_historypenjualanCalcFields
    Active = True
    SQL.Strings = (
      'SELECT * FROM transaction')
    Params = <>
    Left = 544
    Top = 200
    object qr_historypenjualanid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qr_historypenjualanid_karyawan: TIntegerField
      FieldName = 'id_karyawan'
    end
    object qr_historypenjualanid_pelanggan: TIntegerField
      FieldName = 'id_pelanggan'
    end
    object qr_historypenjualantanggal: TDateField
      FieldName = 'tanggal'
    end
    object qr_historypenjualanrf_namapelangan: TStringField
      FieldKind = fkLookup
      FieldName = 'rf_namapelangan'
      LookupDataSet = qr5_customers
      LookupKeyFields = 'id'
      LookupResultField = 'nama'
      KeyFields = 'id_pelanggan'
      Size = 30
      Lookup = True
    end
    object qr_historypenjualanrf_typepelanggan: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'rf_typepelanggan'
      LookupDataSet = qr5_customers
      LookupKeyFields = 'id'
      LookupResultField = 'type'
      KeyFields = 'id_pelanggan'
      Size = 30
      Lookup = True
    end
    object qr_historypenjualanrf_namakaryawan: TStringField
      FieldKind = fkLookup
      FieldName = 'rf_namakaryawan'
      LookupDataSet = qr1_login
      LookupKeyFields = 'id'
      LookupResultField = 'nama'
      KeyFields = 'id_karyawan'
      Lookup = True
    end
    object qr_historypenjualanrc_invoice: TStringField
      FieldKind = fkCalculated
      FieldName = 'rc_invoice'
      Size = 10
      Calculated = True
    end
  end
  object ds_history: TDataSource
    DataSet = qr_historypenjualan
    Left = 544
    Top = 248
  end
  object ds7: TDataSource
    DataSet = transaksi_report
    Left = 384
    Top = 168
  end
  object qr_updatehistory: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'SELECT * FROM transaction')
    Params = <>
    Left = 640
    Top = 200
    object IntegerField1: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'id_karyawan'
    end
    object IntegerField3: TIntegerField
      FieldName = 'id_pelanggan'
    end
    object DateField1: TDateField
      FieldName = 'tanggal'
    end
    object StringField1: TStringField
      FieldKind = fkLookup
      FieldName = 'rf_namapelangan'
      LookupDataSet = qr5_customers
      LookupKeyFields = 'id'
      LookupResultField = 'nama'
      KeyFields = 'id_pelanggan'
      Size = 30
      Lookup = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'grand_total'
      ReadOnly = True
    end
    object StringField2: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'rf_typepelanggan'
      LookupDataSet = qr5_customers
      LookupKeyFields = 'id'
      LookupResultField = 'type'
      KeyFields = 'id_pelanggan'
      Size = 30
      Lookup = True
    end
    object StringField3: TStringField
      FieldKind = fkLookup
      FieldName = 'rf_namakaryawan'
      LookupDataSet = qr1_login
      LookupKeyFields = 'id'
      LookupResultField = 'nama'
      KeyFields = 'id_karyawan'
      Lookup = True
    end
  end
  object qr_updateCust: TZQuery
    Connection = con1
    SQL.Strings = (
      'select * from customers;')
    Params = <>
    Left = 240
    Top = 216
    object IntegerField5: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'kontak'
      Size = 12
    end
    object StringField5: TStringField
      FieldName = 'nama'
      Size = 30
    end
    object StringField6: TStringField
      FieldName = 'type'
    end
    object StringField7: TStringField
      FieldName = 'kota'
    end
    object StringField8: TStringField
      FieldName = 'kecamatan'
    end
    object StringField9: TStringField
      FieldName = 'alamat_lengkap'
      Size = 50
    end
    object StringField10: TStringField
      FieldKind = fkCalculated
      FieldName = 'rc_alamat_lengkap'
      Size = 50
      Calculated = True
    end
  end
  object search_history: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'SELECT *'
      'FROM (transaction'
      'INNER JOIN customers ON transaction.id_pelanggan = customers.id)'
      'WHERE tanggal like'#39'2018-04-18%'#39' or kontak like'#39'089%'#39';')
    Params = <>
    Left = 304
    Top = 120
  end
  object hist_penjualan: TZQuery
    Connection = con1
    OnCalcFields = hist_penjualanCalcFields
    Active = True
    SQL.Strings = (
      
        'SELECT *, transaction.id as ID, transaction.invoice, customers.t' +
        'ype, customers.nama as Nama_Cust, transaction.tanggal as Tanggal' +
        ',employees.nama as Karyawan ,sum( (goods.harga * detail_transact' +
        'ion.qty) * 0.1 +  goods.harga * detail_transaction.qty)  as Gran' +
        'dtotal'
      'FROM ((((transaction'
      
        'INNER JOIN detail_transaction ON transaction.id = detail_transac' +
        'tion.id_transaction)'
      'INNER JOIN goods ON detail_transaction.id_produk = goods.id)'
      'INNER JOIN customers ON transaction.id_pelanggan = customers.id)'
      'INNER JOIN employees ON transaction.id_karyawan = employees.id)'
      'GROUP BY transaction.id'
      'ORDER BY transaction.id')
    Params = <>
    Left = 544
    Top = 136
    object hist_penjualanID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object hist_penjualanNama_Cust: TStringField
      FieldName = 'Nama_Cust'
      ReadOnly = True
      Size = 30
    end
    object hist_penjualanTanggal: TDateField
      FieldName = 'Tanggal'
      ReadOnly = True
    end
    object hist_penjualanKaryawan: TStringField
      FieldName = 'Karyawan'
      ReadOnly = True
      Size = 30
    end
    object hist_penjualanrc_invoice: TStringField
      FieldKind = fkCalculated
      FieldName = 'rc_invoice'
      Size = 10
      Calculated = True
    end
    object hist_penjualanrc_grandtotal: TStringField
      FieldKind = fkCalculated
      FieldName = 'rc_grandtotal'
      Calculated = True
    end
    object hist_penjualantype: TStringField
      FieldName = 'type'
      ReadOnly = True
    end
    object hist_penjualanGrandtotal: TFloatField
      FieldName = 'Grandtotal'
      ReadOnly = True
    end
  end
  object ds_hist: TDataSource
    DataSet = hist_penjualan
    Left = 608
    Top = 136
  end
  object qr_cekPelangganTerbaik: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      
        'SELECT id_pelanggan, customers.nama as Nama, count(id_pelanggan)' +
        ' as JumlahTransaksi'
      'FROM transaction'
      'INNER JOIN customers ON customers.id = transaction.id_pelanggan'
      'GROUP BY id_pelanggan ORDER BY JumlahTransaksi desc'
      'LIMIT 10')
    Params = <>
    Left = 240
    Top = 280
    object qr_cekPelangganTerbaikid_pelanggan: TIntegerField
      FieldName = 'id_pelanggan'
    end
    object qr_cekPelangganTerbaikNama: TStringField
      FieldName = 'Nama'
      Size = 30
    end
    object qr_cekPelangganTerbaikJumlahTransaksi: TLargeintField
      FieldName = 'JumlahTransaksi'
      ReadOnly = True
    end
  end
  object ds_pelTerbaik: TDataSource
    DataSet = qr_cekPelangganTerbaik
    Left = 304
    Top = 280
  end
  object cek_produkTerbaik: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'SELECT id_produk, goods.nama, count(id_produk) as Jumlah '
      'FROM detail_transaction'
      'INNER JOIN goods ON detail_transaction.id_produk = goods.id'
      'GROUP BY id_produk'
      'ORDER BY Jumlah desc'
      'LIMIT 10')
    Params = <>
    Left = 392
    Top = 304
    object cek_produkTerbaikid_produk: TIntegerField
      FieldName = 'id_produk'
    end
    object cek_produkTerbaiknama: TStringField
      FieldName = 'nama'
      Size = 30
    end
    object cek_produkTerbaikJumlah: TLargeintField
      FieldName = 'Jumlah'
      ReadOnly = True
    end
  end
  object ds_produkTerbaik: TDataSource
    DataSet = cek_produkTerbaik
    Left = 456
    Top = 304
  end
  object cek_jmlTran: TZQuery
    Connection = con1
    OnCalcFields = cek_jmlTranCalcFields
    Active = True
    SQL.Strings = (
      'SELECT count(MONTH(tanggal)) as JumlahTransaksi'
      'FROM transaction'
      'GROUP BY MONTH(tanggal)'
      'LIMIT 12')
    Params = <>
    Left = 616
    Top = 320
    object cek_jmlTranJumlahTransaksi: TLargeintField
      FieldName = 'JumlahTransaksi'
      ReadOnly = True
    end
    object cek_jmlTranbulan: TStringField
      FieldKind = fkCalculated
      FieldName = 'bulan'
      Calculated = True
    end
  end
  object ds_cekJmlTran: TDataSource
    DataSet = cek_jmlTran
    Left = 688
    Top = 320
  end
end
