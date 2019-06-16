unit InputData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    pnlkaryawansupplier: TPanel;
    pnl41: TPanel;
    pnl_addKar: TPanel;
    pnl_addKar1: TPanel;
    pnl_headInputData: TPanel;
    lbl43: TLabel;
    scrlbx4: TScrollBox;
    grp1: TGroupBox;
    lbl40: TLabel;
    lbl38: TLabel;
    lbl41: TLabel;
    cbb_kotaKar: TComboBox;
    cbb_kecKar: TComboBox;
    mmo_alamat_lengkapKar: TMemo;
    grp2: TGroupBox;
    lbl45: TLabel;
    lbl44: TLabel;
    lbl42: TLabel;
    lbl17: TLabel;
    edt_namaKar: TEdit;
    edt_usernameKar: TEdit;
    edt_passKar: TEdit;
    edt_kontakKar: TEdit;
    pnl_addsupplier: TPanel;
    pnl12: TPanel;
    pnl_addSup: TPanel;
    pnl_addSup1: TPanel;
    pnl22: TPanel;
    lbl37: TLabel;
    scrlbx5: TScrollBox;
    grp3: TGroupBox;
    lbl39: TLabel;
    lbl46: TLabel;
    lbl47: TLabel;
    cbb_kotaSup: TComboBox;
    cbb_kecSup: TComboBox;
    mmo_alamatlengkapSup: TMemo;
    grp4: TGroupBox;
    lbl49: TLabel;
    lbl50: TLabel;
    lbl51: TLabel;
    edt_namaSup: TEdit;
    edt_kontakSup: TEdit;
    edt_sertifikatSup: TEdit;
    pnlPelanggan: TPanel;
    pnl30: TPanel;
    pnl39: TPanel;
    pnl38: TPanel;
    pnl29: TPanel;
    lbl24: TLabel;
    scrlbx1: TScrollBox;
    grp5: TGroupBox;
    lbl21: TLabel;
    lbl23: TLabel;
    lbl20: TLabel;
    lbl22: TLabel;
    lbl25: TLabel;
    lbl27: TLabel;
    lbl1: TLabel;
    mmo_alamatPel: TMemo;
    cbb6_kecPel: TComboBox;
    cbb5_kotaPel: TComboBox;
    edt_kontakPel: TEdit;
    cbb3: TComboBox;
    cbb2_tipepelanggan: TComboBox;
    pnl_updateBarang: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    pnl21: TPanel;
    btn_updateHIT: TPanel;
    grp6: TGroupBox;
    edt_updateStok: TEdit;
    Label2: TLabel;
    edt_updateHarga: TEdit;
    lbl8: TLabel;
    lbl28: TLabel;
    edt_updateNama: TEdit;
    edt_updateIDBarang: TEdit;
    lbl5: TLabel;
    lbl26: TLabel;
    cbb_updateSup: TComboBox;
    pnl_insertBarang: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    Panel4: TPanel;
    btn_insertHIT: TPanel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edt_InsertStok: TEdit;
    edt_insertHargaBarang: TEdit;
    edt_InsertNama: TEdit;
    edt_insertIDBarang: TEdit;
    cbb_insertSupplier: TComboBox;
    btn_insertGenerate: TPanel;
    img17: TImage;
    Label10: TLabel;
    procedure pnl_addSup1Click(Sender: TObject);
    procedure pnl_addSupClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnl_addSup1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pnl_addSupMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure scrlbx5MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure pnl_addKar1Click(Sender: TObject);
    procedure pnl_addKarClick(Sender: TObject);
    procedure pnl_addKar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pnl_addKarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pnl38Click(Sender: TObject);
    procedure pnl38MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pnl39MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pnl39Click(Sender: TObject);
    procedure scrlbx4MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure cbb3Select(Sender: TObject);
    procedure scrlbx1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure btn_updateHITClick(Sender: TObject);
    procedure cbb_updateSupSelect(Sender: TObject);
    procedure cbb_insertSupplierSelect(Sender: TObject);
    procedure btn_insertGenerateClick(Sender: TObject);
    procedure btn_insertHITClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    temp_namapelanggan : String;
    temp_idpelanggan : String;
  end;

var
  Form2: TForm2;

implementation
uses DataModule, DB, ErrorEX, ShellAPI, Home;

{$R *.dfm}

procedure TForm2.pnl_addSup1Click(Sender: TObject);
var
  a:String;
begin
  a:= mmo_alamatlengkapSup.Text +', '+ cbb_kecSup.Text +', '+ cbb_kotaSup.Text;
  if (edt_namaSup.Text = '') or (edt_kontakSup.Text = '') or (cbb_kotaSup.Text = '') or (cbb_kecSup.Text = '') or (mmo_alamatlengkapSup.Text = '') then
  begin
    MessageDlg('Isi semua data dengan benar ! ',mtError,[mbOK],0);
    Form2.pnl_addsupplier.Show;
    Form2.Show;
  end
  else
  begin
    with DM.qr4_suppliers do
      begin
        Active := False;
        SQL.Clear;
        SQL.Text:='select * from suppliers';
        DM.con1.ExecuteDirect('insert into suppliers (nama, alamat, kontak, no_sertifikat) values("'+edt_namaSup.Text+'","'+a+'","'+edt_kontakSup.Text+'","'+edt_sertifikatSup.Text+'")');
        Form1.smdbgrd_jual.RefreshData;
        edt_namaSup.Clear;
        edt_kontakSup.Clear;
        cbb_kotaSup.Clear;
        cbb_kecSup.Clear;
        mmo_alamatlengkapSup.Clear;
        Active := True;
      end;
    MessageDlg('Supplier Baru Telah Ditambahkan '+sLineBreak+'Restart Applikasi ... ',mtInformation,[mbOK],0);
    Form1.RestartThisApp;
  end;
 end;

procedure TForm2.pnl_addSupClick(Sender: TObject);
begin
Form2.Hide;
Form1.Enabled := True;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form1.Enabled := True;
Form1.cbb2.Text := '';
  cbb3.Text := '';
  edt_kontakPel.Text := '';
  cbb5_kotaPel.Text := '';
  cbb6_kecPel.Text := '';
  mmo_alamatPel.Text := '';
  Form1.updateCust := not Form1.updateCust;
end;

procedure TForm2.pnl_addSup1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
if (X >= 0) and (Y >= 0) and (X < pnl_addSup1.Width) and (Y < pnl_addSup1.Height) then
    begin
      if GetCapture <> pnl_addSup1.Handle then
      begin
        SetCapture(pnl_addSup1.Handle);
        pnl_addSup1.Color := $00496D12;
      end;
    end
  else
    begin
      ReleaseCapture;
      pnl_addSup1.Color := $006DA51C;
    end;
end;

procedure TForm2.pnl_addSupMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   if (X >= 0) and (Y >= 0) and (X < pnl_addSup.Width) and (Y < pnl_addSup.Height) then
    begin
      if GetCapture <> pnl_addSup.Handle then
      begin
        SetCapture(pnl_addSup.Handle);
        pnl_addSup.Color := $002B0FAA;
      end;
    end
  else
    begin
      ReleaseCapture;
      pnl_addSup.Color := $005332ED;
    end;
end;

procedure TForm2.scrlbx5MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  LTopLeft, LTopRight, LBottomLeft, LBottomRight: Integer;
  LPoint: TPoint;
begin
  inherited;

  // First you have to get the position of the control on screen
  // as MousePos coordinates are based on the screen positions.
  LPoint := scrlbx5.ClientToScreen(Point(0,0));
  LTopLeft := LPoint.X;
  LTopRight := LTopLeft + scrlbx5.Width;
  LBottomLeft := LPoint.Y;
  LBottomRight := LBottomLeft + scrlbx5.Width;

  if (MousePos.X >= LTopLeft) and
    (MousePos.X <= LTopRight) and
    (MousePos.Y >= LBottomLeft)and
    (MousePos.Y <= LBottomRight) then
  begin
    // If the mouse is inside the scrollbox coordinates,
    // scroll it by setting .VertScrollBar.Position.
    scrlbx5.VertScrollBar.Position :=
      scrlbx5.VertScrollBar.Position - WheelDelta;
    Handled := True;
  end;
end;


procedure TForm2.pnl_addKar1Click(Sender: TObject);
var
  a:String;
begin
  a:= mmo_alamat_lengkapKar.Text +', '+ cbb_kecKar.Text +', '+ cbb_kotaKar.Text;
    if (edt_namaKar.Text = '') or (edt_kontakKar.Text = '') or (edt_passKar.Text = '') or (edt_usernameKar.Text = '') or (cbb_kotaKar.Text = '') or (cbb_kecKar.Text = '') or (mmo_alamat_lengkapKar.Text = '')  then
  begin
   MessageDlg('Isi data karyawan dengan benar !',mtError,[mbOK],0);
   Form2.pnlkaryawansupplier.Show;
   Form2.Show;

  end
  else
  begin
  with DM.qr1_login do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text:='select * from employees';
    DM.con1.ExecuteDirect('insert into employees (nama, username, password, kontak, alamat) values("'+edt_namaKar.Text+'","'+edt_usernameKar.Text+'","'+edt_passKar.Text+'","'+edt_kontakKar.Text+'","'+a+'")');
    Form1.smdbgrd_jual.RefreshData;
    edt_namaKar.Clear;
    edt_passKar.Clear;
    edt_usernameKar.Clear;
    edt_kontakKar.Clear;
    cbb_kotaKar.Clear;
    cbb_kecKar.Clear;
    mmo_alamat_lengkapKar.Clear;
    Active := True;
  end;
  MessageDlg('Karyawan telah Ditambahkan. '+sLineBreak+'Restart Applikasi ...',mtInformation,[mbOK],0);
  Form1.RestartThisApp;
  end;
 end;

procedure TForm2.pnl_addKarClick(Sender: TObject);
begin
  Form2.Hide;
  Form1.Enabled:= True;
end;

procedure TForm2.pnl_addKar1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
if (X >= 0) and (Y >= 0) and (X < pnl_addKar1.Width) and (Y < pnl_addKar1.Height) then
    begin
      if GetCapture <> pnl_addKar1.Handle then
      begin
        SetCapture(pnl_addKar1.Handle);
        pnl_addKar1.Color := $00496D12;
      end;
    end
  else
    begin
      ReleaseCapture;
      pnl_addKar1.Color := $006DA51C;
    end;
end;

procedure TForm2.pnl_addKarMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   if (X >= 0) and (Y >= 0) and (X < pnl_addKar.Width) and (Y < pnl_addKar.Height) then
    begin
      if GetCapture <> pnl_addKar.Handle then
      begin
        SetCapture(pnl_addKar.Handle);
        pnl_addKar.Color := $002B0FAA;
      end;
    end
  else
    begin
      ReleaseCapture;
      pnl_addKar.Color := $005332ED;
    end;
end;

procedure TForm2.pnl38Click(Sender: TObject);
var
  p:integer;

begin

  if Form1.updateCust = True then
  begin
    with DM.qr_updateCust do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text := 'SELECT * FROM customers';
      Active := True;
      DM.con1.ExecuteDirect('UPDATE customers SET nama = "'+cbb3.Text+'", type = "'+cbb2_tipepelanggan.Text+'", kontak = "'+edt_kontakPel.Text+'", kota = "'+cbb5_kotaPel.Text+'", kecamatan = "'+cbb6_kecPel.Text+'", alamat_lengkap ="'+mmo_alamatPel.Text+'" WHERE id = "'+Form1.select_idUpdateCus+'"');
      DM.qr5_customers.Active := False;
      DM.qr5_customers.Active := True;
    end;
    MessageDlg('Data pelanggan telah di update !',mtInformation,[mbOK],0);
    Form2.pnlPelanggan.Hide;
    Form2.Hide;
    Form1.Enabled := True;
    Form1.updateCust := not Form1.updateCust;
  end
  else
  begin

    if (cbb2_tipepelanggan.Text = '') or (cbb3.Text = '') or (cbb5_kotaPel.Text = '') or (cbb6_kecPel.Text = '') or (edt_kontakPel.Text = '') or (mmo_alamatPel.Text = '') then
    begin
      MessageDlg('Masukan data pelanggan dengan benar !',mtError,[mbOK],0);
    end

    else
    begin
      with DM.qr5_customers do
      begin
        Active := False;
        SQL.Clear;
        SQL.Text:='select * from customers';
        Active := True;
        DM.con1.ExecuteDirect('insert into customers (nama, kontak, kota, kecamatan, alamat_lengkap, type) values("'+cbb3.Text+'","'+edt_kontakPel.Text+'","'+cbb5_kotaPel.Text+'","'+cbb6_kecPel.Text+'","'+mmo_alamatPel.Text+'","'+cbb2_tipepelanggan.Text+'")');

      end;

      with DM.qr5_customers do
      begin
        Active := False;
        SQL.Clear;
        SQL.Text := 'SELECT id from customers where nama = "'+cbb3.Text+'"';
        Active := True;

        for p:=1 to DM.qr5_customers.RecordCount do
        begin
         Form1.id_pelanggan := DM.qr5_customers['id'];
        end;
      end;

      Form1.cbb2.Text := cbb3.Text;
       Form1.cbb_namaPelanggan.Text := cbb3.Text;
       cbb2_tipepelanggan.Clear;
      //  cbb3.Clear;
        cbb5_kotaPel.Clear;
        cbb6_kecPel.Clear;
        edt_kontakPel.Clear;
        mmo_alamatPel.Clear;
      MessageDlg('Data Pelanggan Telah Masuk',mtInformation,[mbOK],0);
      Form2.Hide;
      Form1.Enabled := True;
      Form1.PelangganSudahAda;
      Form1.cbb_namaPelanggan.Text := cbb3.Text;
    end;
    cbb3.Clear;
  end;
  
end;

procedure TForm2.pnl38MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
      if (X >= 0) and (Y >= 0) and (X < pnl38.Width) and (Y < pnl38.Height) then
    begin
      if GetCapture <> pnl38.Handle then
      begin
        SetCapture(pnl38.Handle);
        pnl38.Color := $00496D12;
      end;
    end
  else
    begin
      ReleaseCapture;
      pnl38.Color := $006DA51C;
    end;
end;

procedure TForm2.pnl39MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if (X >= 0) and (Y >= 0) and (X < pnl39.Width) and (Y < pnl39.Height) then
    begin
      if GetCapture <> pnl39.Handle then
      begin
        SetCapture(pnl39.Handle);
        pnl39.Color := $002B0FAA;
      end;
    end
  else
    begin
      ReleaseCapture;
      pnl39.Color := $005332ED;
    end;
end;

procedure TForm2.pnl39Click(Sender: TObject);
begin
  Form2.Hide;
  Form1.Enabled := True;
  Form1.cbb2.Text := '';
  cbb3.Text := '';
  edt_kontakPel.Text := '';
  cbb5_kotaPel.Text := '';
  cbb6_kecPel.Text := '';
  mmo_alamatPel.Text := '';
  Form1.updateCust := not Form1.updateCust;
end;

procedure TForm2.scrlbx4MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  LTopLeft, LTopRight, LBottomLeft, LBottomRight: Integer;
  LPoint: TPoint;
begin
  inherited;
  LPoint := scrlbx4.ClientToScreen(Point(0,0));
  LTopLeft := LPoint.X;
  LTopRight := LTopLeft + scrlbx4.Width;
  LBottomLeft := LPoint.Y;
  LBottomRight := LBottomLeft + scrlbx4.Width;

  if (MousePos.X >= LTopLeft) and
    (MousePos.X <= LTopRight) and
    (MousePos.Y >= LBottomLeft)and
    (MousePos.Y <= LBottomRight) then
  begin
    // If the mouse is inside the scrollbox coordinates,
    // scroll it by setting .VertScrollBar.Position.
    scrlbx4.VertScrollBar.Position :=
      scrlbx4.VertScrollBar.Position - WheelDelta;
    Handled := True;
  end;
end;

procedure TForm2.cbb3Select(Sender: TObject);
//var j:Integer;
begin
  temp_namapelanggan := cbb3.Text;
with DM.qr5_customers do
    begin
      Active := False;
      SQL.Clear;
      //SQL.Add('SELECT * FROM customers WHERE nama = "'++'"');

      SQL.Text:= 'SELECT * FROM customers where nama = "'+temp_namapelanggan+'" ';
      //Open;
      //First;
      Active := True;
      //edt_kontakPel.Clear;
      //j := 1;
      while not Eof do
      begin
        //if cbb3.Text = Form1.itempelanggan[j] then
        if cbb3.Text = temp_namapelanggan then
        begin
          edt_kontakPel.Text := FieldByName('kontak').AsString;
          cbb5_kotaPel.Text :=  FieldByName('kota').AsString;
          cbb6_kecPel.Text := FieldByName('kecamatan').AsString;
          mmo_alamatPel.Text := FieldByName('alamat_lengkap').AsString;
        end;

        if cbb3.Text = '' then
        begin
          edt_kontakPel.Clear;
          cbb5_kotaPel.Clear;
          cbb6_kecPel.Clear;
          mmo_alamatPel.Clear;
        end;
        Next;
        //j := j + 1;
      end;
      Close;
    end;
end;

procedure TForm2.scrlbx1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  LTopLeft, LTopRight, LBottomLeft, LBottomRight: Integer;
  LPoint: TPoint;
begin
  inherited;
  LPoint := scrlbx1.ClientToScreen(Point(0,0));
  LTopLeft := LPoint.X;
  LTopRight := LTopLeft + scrlbx1.Width;
  LBottomLeft := LPoint.Y;
  LBottomRight := LBottomLeft + scrlbx1.Width;

  if (MousePos.X >= LTopLeft) and
    (MousePos.X <= LTopRight) and
    (MousePos.Y >= LBottomLeft)and
    (MousePos.Y <= LBottomRight) then
  begin
    // If the mouse is inside the scrollbox coordinates,
    // scroll it by setting .VertScrollBar.Position.
    scrlbx1.VertScrollBar.Position :=
      scrlbx1.VertScrollBar.Position - WheelDelta;
    Handled := True;
  end;
  end;
procedure TForm2.btn_updateHITClick(Sender: TObject);
begin
  if (edt_updateStok.Text = '') or (edt_updateHarga.Text = '') or (edt_updateIDBarang.Text = '') or (edt_updateNama.Text = '') then
  begin
    MessageDlg('Isi semua data dengan benar ! ',mtError,[mbOK],0);
  end
  else
  begin
    with DM.update_stok do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text := 'SELECT * FROM goods';
      DM.con1.ExecuteDirect('UPDATE goods SET stok = "'+edt_updateStok.Text+'", harga = "'+edt_updateHarga.Text+'", nama = "'+edt_updateNama.Text+'", id_supplier = "'+Form1.tempidsup[1]+'" where id = "'+Form1.select_Grid_idProduct+'"');
      Active := True;
    end;
    MessageDlg('Data telah di update ...',mtConfirmation,[mbOK],0);
    DM.qr2_barang.Active := False;
    DM.qr2_barang.SQL.Clear;
    DM.qr2_barang.SQL.Text := 'select * from goods order by id_supplier';
    DM.qr2_barang.Active := True;
    Form2.Hide;

    with DM.qr4_suppliers do
      begin
        Active := False;
        SQL.Clear;
        SQL.Text := 'SELECT * FROM suppliers';
        Active := True;
      end;
    cbb_updateSup.Text := '';
    edt_updateStok.Text := '';
    edt_updateHarga.Text := '';
    edt_updateNama.Text := '';
    edt_updateIDBarang.Text := '';
    
    Form1.Enabled := True;
  end;
end;

procedure TForm2.cbb_updateSupSelect(Sender: TObject);
var
  i:Integer;
begin
      with DM.qr4_suppliers do
      begin
        Active := False;
        SQL.Clear;
        SQL.Text := 'SELECT * FROM suppliers WHERE nama = "'+cbb_updateSup.Text+'"';
        Active := True;
        for i := 1 to DM.qr4_suppliers.RecordCount do
        begin
          Form1.tempidsup[i] := DM.qr4_suppliers['id'];
        end;
      end;

      with DM.qr4_suppliers do
      begin
        Active := False;
        SQL.Clear;
        SQL.Text := 'SELECT * FROM suppliers';
        Active := True;
      end;
end;

procedure TForm2.cbb_insertSupplierSelect(Sender: TObject);
var
  i :integer;
begin
    with DM.qr4_suppliers do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM suppliers where nama = "'+cbb_insertSupplier.Text+'"';
    Active := True;
    for i := 1 to DM.qr4_suppliers.RecordCount do
    begin
      Form1.tempidsup[i] := DM.qr4_suppliers['id'];
    end;
  end;
end;

procedure TForm2.btn_insertGenerateClick(Sender: TObject);
var
  j,lastIDProduk,p :integer;
  a,id_supplier: String;
  jenis_sup,l,b:string;
  k,c:integer;

  harbarcurr:Currency;
begin

  if cbb_insertSupplier.Text = '' then
  begin
    MessageDlg('Masukan Supplier Terlebih Dahulu !',mtWarning,[mbOK],0);
  end
  else
  begin
  with DM.qr4_suppliers do  // MENDAPATKAN ID_SUPPLIER
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM suppliers where nama = "'+cbb_insertSupplier.Text+'"';
    Active := True;
  end;

  for p:=1 to DM.qr4_suppliers.RecordCount do  // MENDAPATKAN ID SUPPLIER
  begin
    id_supplier := DM.qr4_suppliers['id'];
  end;

      jenis_sup := id_supplier+ '%';

      with DM.cek_produkid_beli do
      begin
        Active := False;
        SQL.Clear;
        SQL.Text := 'SELECT * FROM goods WHERE id LIKE "'+jenis_sup+'"';
        Active := True;
        j := 1;
        while j <= DM.cek_produkid_beli.RecordCount do
        begin
          a := DM.cek_produkid_beli['id'];
          DM.cek_produkid_beli.Next;
          j := j + 1;
        end;
      end;

      if a = '' then
      begin
        a := '0';
      end;
      lastIDProduk := StrToInt(a) + 1;

      //pnl36.Caption := IntToStr(lastIDProduk);
      edt_insertIDBarang.Text := IntToStr(lastIDProduk);
  end;
  end;

procedure TForm2.btn_insertHITClick(Sender: TObject);
var
  id_supplier:String;
  p:integer;
begin

  if (cbb_insertSupplier.Text = '') or (edt_insertIDBarang.Text = '') or (edt_InsertStok.Text = '') or (edt_insertHargaBarang.Text = '') or (edt_InsertStok.Text = '') then
  begin
    MessageDlg('Masukan data dengan benar !',mtWarning,[mbOK],0);
  end
  else
  begin
     with DM.qr4_suppliers do  // MENDAPATKAN ID_SUPPLIER
      begin
        Active := False;
        SQL.Clear;
        SQL.Text := 'SELECT * FROM suppliers where nama = "'+cbb_insertSupplier.Text+'"';
        Active := True;
      end;

      for p:=1 to DM.qr4_suppliers.RecordCount do  // MENDAPATKAN ID SUPPLIER
      begin
        id_supplier := DM.qr4_suppliers['id'];
      end;

      with DM.cek_produkid_beli do
      begin
        Active := False;
        SQL.Clear;
        SQL.Text := 'SELECT * FROM goods';
        DM.con1.ExecuteDirect('INSERT INTO goods (id, id_supplier, nama, harga, stok) VALUES("'+edt_insertIDBarang.Text+'","'+id_supplier+'","'+edt_InsertNama.Text+'","'+edt_insertHargaBarang.Text+'","'+edt_InsertStok.Text+'")');
        Active := True;
      end;

      MessageDlg('Data berhasil ditambahkan. ',mtInformation,[mbOK],0);

      with DM.qr4_suppliers do
      begin
        Active := False;
        SQL.Clear;
        SQL.Text := 'SELECT * FROM suppliers';
        Active := True;
      end;

      DM.qr2_barang.Active := False;
      DM.qr2_barang.SQL.Clear;
      DM.qr2_barang.SQL.Text := 'select * from goods order by id_supplier';
      DM.qr2_barang.Active := True;

      cbb_insertSupplier.Text := '';
      edt_InsertStok.Text := '';
      edt_insertIDBarang.Text := '';
      edt_InsertNama.Text := '';
      edt_insertHargaBarang.Text := '';
      Form1.Enabled := True;
  end;

end;

end.
