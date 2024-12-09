CREATE TABLE "USER" (
    Id UUID DEFAULT gen_random_uuid(),
    Nama VARCHAR,
    JenisKelamin CHAR(1),
    NoHP VARCHAR,
    Pwd VARCHAR,
    TglLahir DATE,
    Alamat VARCHAR,
    SaldoMyPay DECIMAL,
    PRIMARY KEY (Id)
);

CREATE TABLE PELANGGAN (
    Id UUID UNIQUE,
    "Level" VARCHAR,
    FOREIGN KEY (Id) REFERENCES "USER"(Id)
);

CREATE TABLE PEKERJA (
    Id UUID UNIQUE,
    NamaBank VARCHAR,
    NomorRekening VARCHAR,
    NPWP VARCHAR,
    LinkFoto VARCHAR,
    Rating FLOAT,
    JmlPsananSelesai INT,
    FOREIGN KEY (Id) REFERENCES "USER"(Id)
);

CREATE TABLE KATEGORI_TR_MYPAY (
    Id UUID DEFAULT gen_random_uuid(),
    Nama VARCHAR,
    PRIMARY KEY (Id)
);

CREATE TABLE TR_MYPAY (
    Id UUID DEFAULT gen_random_uuid(),
    UserId UUID,
    Tgl DATE,
    Nominal DECIMAL,
    KategoriId UUID,
    PRIMARY KEY (Id),
    FOREIGN KEY (UserId) REFERENCES "USER"(Id),
    FOREIGN KEY (KategoriId) REFERENCES KATEGORI_TR_MYPAY(Id)
);

CREATE TABLE KATEGORI_JASA (
    Id UUID DEFAULT gen_random_uuid(),
    NamaKategori VARCHAR,
    PRIMARY KEY (Id)
);

CREATE TABLE PEKERJA_KATEGORI_JASA (
    PekerjaId UUID,
    KategoriJasaId UUID,
    FOREIGN KEY (PekerjaId) REFERENCES PEKERJA(Id),
    FOREIGN KEY (KategoriJasaId) REFERENCES KATEGORI_JASA(Id)
);

CREATE TABLE SUBKATEGORI_JASA (
    Id UUID DEFAULT gen_random_uuid(),
    NamaSubkategori VARCHAR,
    Deskripsi TEXT,
    KategoriJasaId UUID,
    PRIMARY KEY (Id),
    FOREIGN KEY (KategoriJasaId) REFERENCES KATEGORI_JASA(Id)
);

CREATE TABLE SESI_LAYANAN (
    SubkategoriId UUID,
    Sesi INT,
    Harga DECIMAL,
    PRIMARY KEY (SubkategoriId, Sesi),
    FOREIGN KEY (SubkategoriId) REFERENCES SUBKATEGORI_JASA(Id)
);

CREATE TABLE DISKON (
    Kode VARCHAR(50),
    Potongan DECIMAL NOT NULL CHECK (Potongan > 0),
    MinTrPemesanan INT NOT NULL CHECK (MinTrPemesanan > 0),
    PRIMARY KEY (Kode)
);

CREATE TABLE VOUCHER (
    Kode VARCHAR(50),
    JmlHariBerlaku INT NOT NULL CHECK (JmlHariBerlaku > 0),
    KuotaPenggunaan INT,
    Harga DECIMAL NOT NULL CHECK (Harga > 0),
    PRIMARY KEY (Kode),
    FOREIGN KEY (Kode) REFERENCES DISKON(Kode)
);

CREATE TABLE PROMO (
    Kode VARCHAR,
    TglAkhirBerlaku DATE NOT NULL,
    PRIMARY KEY (Kode),
    FOREIGN KEY (Kode) REFERENCES DISKON(Kode)
);

CREATE TABLE METODE_BAYAR (
    Id UUID DEFAULT gen_random_uuid(),
    Nama VARCHAR NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE TR_PEMBELIAN_VOUCHER (
    Id UUID DEFAULT gen_random_uuid(),
    TglAwal DATE NOT NULL,
    TglAkhir DATE NOT NULL,
    TelahDigunakan INT NOT NULL CHECK (TelahDigunakan > 0),
    IdPelanggan UUID,
    IdVoucher VARCHAR,
    IdMetodeBayar UUID,
    PRIMARY KEY (Id),
    FOREIGN KEY (IdPelanggan) REFERENCES PELANGGAN(Id),
    FOREIGN KEY (IdVoucher) REFERENCES VOUCHER(Kode),
    FOREIGN KEY (IdMetodeBayar) REFERENCES METODE_BAYAR(Id)
);

CREATE TABLE TR_PEMESANAN_JASA (
    Id UUID DEFAULT gen_random_uuid(), 
    TglPemesanan DATE NOT NULL,
    TglPekerjaan DATE NOT NULL,
    WaktuPekerjaan TIMESTAMP NOT NULL,
    TotalBiaya DECIMAL NOT NULL CHECK (TotalBiaya > 0),
    IdPelanggan UUID,
    IdPekerja UUID,
    IdKategoriJasa UUID,
    Sesi INT,
    IdDiskon VARCHAR(50),
    IdMetodeBayar UUID,
    PRIMARY KEY (Id),
    FOREIGN KEY (IdPelanggan) REFERENCES PELANGGAN(Id),
    FOREIGN KEY (IdPekerja) REFERENCES PEKERJA(Id),
    FOREIGN KEY (IdKategoriJasa, Sesi) REFERENCES SESI_LAYANAN(SubkategoriId, Sesi),
    FOREIGN KEY (IdDiskon) REFERENCES DISKON(Kode),
    FOREIGN KEY (IdMetodeBayar) REFERENCES METODE_BAYAR(Id)
);

CREATE TABLE STATUS_PESANAN (
    Id UUID DEFAULT gen_random_uuid(),
    "Status" VARCHAR(50) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE TR_PEMESANAN_STATUS (
    IdTrPemesanan UUID,
    IdStatus UUID,
    TglWaktu TIMESTAMP NOT NULL,
    PRIMARY KEY (IdTrPemesanan, IdStatus),
    FOREIGN KEY (IdTrPemesanan) REFERENCES TR_PEMESANAN_JASA(Id),
    FOREIGN KEY (IdStatus) REFERENCES STATUS_PESANAN(Id)
);

CREATE TABLE TESTIMONI (
    IdTrPemesanan UUID,
    Tgl DATE,
    Teks TEXT,
    Rating INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY (IdTrPemesanan),
    FOREIGN KEY (IdTrPemesanan) REFERENCES TR_PEMESANAN_JASA(Id)
);

-- drop schema TK1 cascade;
-- create schema TK1;
-- set search_path to TK1;