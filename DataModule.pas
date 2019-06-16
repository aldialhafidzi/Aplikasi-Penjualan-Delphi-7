unit DataModule;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZConnection, SMDBFind, SMDBFltr, frxClass, frxDBSet;

type
  TDM = class(TDataModule)
    con1: TZConnection;
    qr1_login: TZQuery;
    qr2_barang: TZQuery;
    ds1: TDataSource;
    ds2: TDataSource;
    filter_gudang: TSMDBFilterDialog;
    find_gudang: TSMDBFindDialog;
    qr3_transaction: TZQuery;
    ds3: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    qr4_suppliers: TZQuery;
    ds4: TDataSource;
    qr5_customers: TZQuery;
    ds5: TDataSource;
    qr6_detai_transaction: TZQuery;
    ds6: TDataSource;
    update_stok: TZQuery;
    intgrfldqr2_barangid: TIntegerField;
    strngfldqr2_barangnama: TStringField;
    intgrfldqr2_barangstok: TIntegerField;
    intgrfldqr2_barangharga: TIntegerField;
    intgrfldqr2_barangid_supplier: TIntegerField;
    strngfldqr2_barangnama_supplier: TStringField;
    strngfldqr2_barangstatus: TStringField;
    search_produk: TZQuery;
    cek_produkid_beli: TZQuery;
    transaksi_report: TZQuery;
    ds_invoice: TDataSource;
    intgrfld_reportid: TIntegerField;
    intgrfld_reportid_produk: TIntegerField;
    strngfld_reportnama: TStringField;
    intgrfld_reportqty: TIntegerField;
    strngfld_reportnama_1: TStringField;
    strngfld_reportnama_2: TStringField;
    dtfld_reporttanggal: TDateField;
    intgrfld_reportid_pelanggan: TIntegerField;
    intgrfld_reportharga: TIntegerField;
    intgrfld_reportsubtotal: TIntegerField;
    intgrfld_reporttotal: TIntegerField;
    intgrfld_reportppn: TIntegerField;
    intgrfld_reportgrandtotal: TIntegerField;
    intgrfld_reportpay: TIntegerField;
    intgrfld_reportchange: TIntegerField;
    strngfld_reportalamat_lengkap: TStringField;
    strngfld_reportkota: TStringField;
    strngfld_reportno_invoice: TStringField;
    qr7_stat_jual: TZQuery;
    qrInvoice: TZQuery;
    qr_historypenjualan: TZQuery;
    ds_history: TDataSource;
    qr_historypenjualanid: TIntegerField;
    qr_historypenjualanid_karyawan: TIntegerField;
    qr_historypenjualanid_pelanggan: TIntegerField;
    qr_historypenjualantanggal: TDateField;
    qr_historypenjualanrf_namapelangan: TStringField;
    qr_historypenjualanrf_typepelanggan: TStringField;
    ds7: TDataSource;
    qr6_detai_transactionid_transaction: TIntegerField;
    qr6_detai_transactionid_produk: TIntegerField;
    qr6_detai_transactionqty: TIntegerField;
    qr6_detai_transactiongrand_total: TIntegerField;
    qr_historypenjualanrf_namakaryawan: TStringField;
    qr_updatehistory: TZQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    DateField1: TDateField;
    StringField1: TStringField;
    IntegerField4: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    qr_historypenjualanrc_invoice: TStringField;
    qr5_customersid: TIntegerField;
    qr5_customerskontak: TStringField;
    qr5_customersnama: TStringField;
    qr5_customerstype: TStringField;
    qr5_customersalamat_lengkap: TStringField;
    qr5_customerskota: TStringField;
    qr5_customerskecamatan: TStringField;
    qr5_customersrc_alamat_lengkap: TStringField;
    qr_updateCust: TZQuery;
    IntegerField5: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    search_history: TZQuery;
    hist_penjualan: TZQuery;
    ds_hist: TDataSource;
    hist_penjualanID: TIntegerField;
    hist_penjualanTanggal: TDateField;
    hist_penjualanKaryawan: TStringField;
    hist_penjualanrc_invoice: TStringField;
    hist_penjualanrc_grandtotal: TStringField;
    hist_penjualantype: TStringField;
    hist_penjualanGrandtotal: TFloatField;
    hist_penjualanNama_Cust: TStringField;
    qr2_barangrc_hargaproduk: TStringField;
    qr_cekPelangganTerbaik: TZQuery;
    ds_pelTerbaik: TDataSource;
    qr_cekPelangganTerbaikid_pelanggan: TIntegerField;
    qr_cekPelangganTerbaikNama: TStringField;
    qr_cekPelangganTerbaikJumlahTransaksi: TLargeintField;
    cek_produkTerbaik: TZQuery;
    ds_produkTerbaik: TDataSource;
    cek_produkTerbaikid_produk: TIntegerField;
    cek_produkTerbaiknama: TStringField;
    cek_produkTerbaikJumlah: TLargeintField;
    cek_jmlTran: TZQuery;
    ds_cekJmlTran: TDataSource;
    cek_jmlTranJumlahTransaksi: TLargeintField;
    cek_jmlTranbulan: TStringField;
    procedure qr2_barangCalcFields(DataSet: TDataSet);
    procedure transaksi_reportCalcFields(DataSet: TDataSet);
    procedure qr_historypenjualanCalcFields(DataSet: TDataSet);
    procedure qr5_customersCalcFields(DataSet: TDataSet);
    procedure hist_penjualanCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure cek_jmlTranCalcFields(DataSet: TDataSet);
  private
    //FOnRefreshData: TNotifyEvent;
    { Private declarations }
  public
    { Public declarations }
    k,l,m : integer;
  end;

var
  DM: TDM;

implementation
uses Home;

{$R *.dfm}

procedure TDM.qr2_barangCalcFields(DataSet: TDataSet);
var
  price_curr : Currency;
  e : String;
begin
   if DM.intgrfldqr2_barangstok.AsString = '' then Exit;
   if DM.intgrfldqr2_barangstok.AsInteger > 0 then
   begin
     DM.strngfldqr2_barangstatus.Value := 'Tersedia';
   end
   else
     DM.strngfldqr2_barangstatus.Value := 'Kosong';

   if intgrfldqr2_barangharga.AsInteger = 0 then
   begin
     qr2_barangrc_hargaproduk.Value := 'Belum Diisi';
   end
   else
   begin
    price_curr := StrToCurr(intgrfldqr2_barangharga.AsString);
    e := ' Rp. '+FormatCurr(',0', price_curr)+'';
    qr2_barangrc_hargaproduk.Value := e;
   end;
end;

procedure TDM.transaksi_reportCalcFields(DataSet: TDataSet);
begin
  DM.intgrfld_reportsubtotal.Value := DM.intgrfld_reportqty.AsInteger * DM.intgrfld_reportharga.AsInteger;
  DM.intgrfld_reporttotal.Value := Form1.total_belum_ppn;
  DM.intgrfld_reportppn.Value := (Form1.total_belum_ppn * 10) div 100;
  DM.intgrfld_reportgrandtotal.Value := Form1.total_belum_ppn + DM.intgrfld_reportppn.AsInteger;
  DM.intgrfld_reportpay.Value := Form1.BayarJual_public;
  DM.intgrfld_reportchange.Value := DM.intgrfld_reportpay.AsInteger - DM.intgrfld_reportgrandtotal.AsInteger;
  DM.strngfld_reportno_invoice.Value := 'P101'+IntToStr(DM.intgrfld_reportid.AsInteger);
end;

procedure TDM.qr_historypenjualanCalcFields(DataSet: TDataSet);
begin
  qr_historypenjualanrc_invoice.Value := 'P101'+ qr_historypenjualanid.AsString;
end;

procedure TDM.qr5_customersCalcFields(DataSet: TDataSet);
begin
  if (qr5_customersalamat_lengkap.AsString = '-') or (qr5_customerskota.AsString = '-') or (qr5_customerskecamatan.AsString = '-') then
  begin
    qr5_customersrc_alamat_lengkap.Value := '-';
  end
  else
  begin
      qr5_customersrc_alamat_lengkap.Value := qr5_customersalamat_lengkap.AsString +', Kec. '+ qr5_customerskecamatan.AsString +', '+ qr5_customerskota.AsString;
  end;
end;

procedure TDM.hist_penjualanCalcFields(DataSet: TDataSet);
var
  g_total : Currency;
  e : String;
begin
  g_total := StrToCurr(hist_penjualanGrandtotal.AsString);
  e := ' Rp. '+FormatCurr(',0', g_total)+'';
  hist_penjualanrc_invoice.Value := 'P101'+ hist_penjualanID.AsString;
  hist_penjualanrc_grandtotal.Value := e;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  k := 0;
  l := 0;
  m := 0;
end;

procedure TDM.cek_jmlTranCalcFields(DataSet: TDataSet);
begin
  m := m + 1;
 if cek_jmlTranJumlahTransaksi.AsString <> '' then
 begin
   if m = 1 then
   begin
     cek_jmlTranbulan.Value := 'Januari';
   end
   else if m = 2 then
   begin
     cek_jmlTranbulan.Value := 'Februari';
   end
   else if m = 3 then
   begin
     cek_jmlTranbulan.Value := 'Maret';
   end
   else if m = 4 then
   begin
     cek_jmlTranbulan.Value := 'April';
   end
   else if m = 5 then
   begin
     cek_jmlTranbulan.Value := 'Mei';
   end
   else if m = 6 then
   begin
     cek_jmlTranbulan.Value := 'Juni';
   end
   else if m = 7 then
   begin
     cek_jmlTranbulan.Value := 'Juli';
   end
   else if m = 8 then
   begin
     cek_jmlTranbulan.Value := 'Agustus';
   end
   else if m = 9 then
   begin
     cek_jmlTranbulan.Value := 'September';
   end
   else if m = 10 then
   begin
     cek_jmlTranbulan.Value := 'Oktober';
   end
   else if m = 11 then
   begin
     cek_jmlTranbulan.Value := 'November';
   end
   else if m = 12 then
   begin
     cek_jmlTranbulan.Value := 'Desember';
   end;
 end;
end;

end.
