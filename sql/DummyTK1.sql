insert into "USER" (Id, Nama, JenisKelamin, NoHP, Pwd, TglLahir, Alamat, SaldoMyPay) 
values ('a516adcb-4c7a-4a0d-812d-ef5cce868cf8', 'Mariquilla Leaman', 'F', '7661986736', 'zD5#t#7Pt+~!', '2024-03-04', '220 Anniversary Trail', 9.12),
       ('b98af9fa-3a1d-4012-82fa-dd77fc59b8e0', 'Tess Pinkard', 'F', '9357885454', 'qN0$Vx?Tki@WoW', '2024-09-11', '49 Eggendart Pass', 9.68),
       ('d1850551-620e-4c16-b2f8-7fe07ffb84f4', 'Aguie Glader', 'F', '9322607639', 'tI1\\qfwLBON?UG', '2024-07-20', '434 Onsgard Avenue', 9.04),
       ('7b96634b-8697-4262-8b1c-610fd7f421e1', 'Bryn Douthwaite', 'F', '2488572163', 'cQ7)@1Z523!ba', '2023-11-22', '6121 Jay Point', 2.10),
       ('560004c4-2382-45a2-9eac-1b45838267ac', 'Noam Burgise', 'M', '9992377581', 'rT6+N\\d/Rp|(cg', '2024-03-29', '5 Evergreen Road', 7.88),
       ('8825e674-2718-4ff2-b5bf-b37d027d97ad', 'Ced Craighill', 'F', '2369706271', 'sU4,TJSwsYfl_', '2023-12-18', '48 Mcbride Park', 3.64),
       ('94fabc30-c6e4-41c5-9a9e-e4159668a55a', 'Hester Grain', 'M', '1145874475', 'dF9*XujNeK1', '2023-10-23', '23 Browning Crossing', 2.00),
       ('5b8fd24a-0fca-4a4f-9aa4-82fd1f90a362', 'Cesya Danielut', 'M', '4816960016', 'iZ7*i`|&e/ka', '2024-07-26', '59 Stone Corner Point', 5.23),
       ('3bda41a4-55ee-46d8-a50b-1bab17c940fb', 'Lindsey Arons', 'F', '4124334721', 'tY2}|B"~kcG9~yyi', '2024-09-07', '569 Sauthoff Alley', 6.37),
       ('8de701f6-6ca1-4b1d-8576-4798e282b2c2', 'Rayshell Wycherley', 'M', '1475720153', 'qY7"7MhmT{u7+', '2024-01-13', '45276 Di Loreto Hill', 2.56);

insert into PELANGGAN (Id, "Level") values 
('8825e674-2718-4ff2-b5bf-b37d027d97ad', 'Basic'),
('94fabc30-c6e4-41c5-9a9e-e4159668a55a', 'Basic'),
('5b8fd24a-0fca-4a4f-9aa4-82fd1f90a362', 'Silver'),
('3bda41a4-55ee-46d8-a50b-1bab17c940fb', 'Gold'),
('8de701f6-6ca1-4b1d-8576-4798e282b2c2', 'Basic');

insert into PEKERJA (Id, NamaBank, NomorRekening, NPWP, LinkFoto, Rating, JmlPsananSelesai) values ('a516adcb-4c7a-4a0d-812d-ef5cce868cf8', 'Marks-Sawayn', '6756578456', '38-853-1180', 'http://dummyimage.com/193x100.png/cc0000/ffffff', 1.0, 2);
insert into PEKERJA (Id, NamaBank, NomorRekening, NPWP, LinkFoto, Rating, JmlPsananSelesai) values ('b98af9fa-3a1d-4012-82fa-dd77fc59b8e0', 'Luettgen, Grant and Connelly', '3419584881', '07-641-3759', 'http://dummyimage.com/129x100.png/5fa2dd/ffffff', 2.0, 98);
insert into PEKERJA (Id, NamaBank, NomorRekening, NPWP, LinkFoto, Rating, JmlPsananSelesai) values ('d1850551-620e-4c16-b2f8-7fe07ffb84f4', 'Hayes Group', '0736195750', '32-075-8080', 'http://dummyimage.com/175x100.png/cc0000/ffffff', 3.0, 61);
insert into PEKERJA (Id, NamaBank, NomorRekening, NPWP, LinkFoto, Rating, JmlPsananSelesai) values ('7b96634b-8697-4262-8b1c-610fd7f421e1', 'Pacocha, Conn and Hauck', '1976364205', '24-678-4794', 'http://dummyimage.com/191x100.png/cc0000/ffffff', 4.0, 96);
insert into PEKERJA (Id, NamaBank, NomorRekening, NPWP, LinkFoto, Rating, JmlPsananSelesai) values ('560004c4-2382-45a2-9eac-1b45838267ac', 'Langworth Inc', '0546319092', '76-919-1484', 'http://dummyimage.com/164x100.png/dddddd/000000', 5.0, 13);

insert into KATEGORI_JASA (Id, NamaKategori) values ('d0b6c82d-a77e-4e74-a3af-d3fbe00c8ae6', 'home cleaning');
insert into KATEGORI_JASA (Id, NamaKategori) values ('ae04812b-67e3-455c-b6f9-29aa8ce0dff6', 'deep cleaning');
insert into KATEGORI_JASA (Id, NamaKategori) values ('c666b181-555c-4e0b-b950-27573cef82ec', 'service AC');
insert into KATEGORI_JASA (Id, NamaKategori) values ('2e81547b-6f18-4ba8-a511-f5607cf90e33', 'massage');
insert into KATEGORI_JASA (Id, NamaKategori) values ('40602757-03ce-4ffe-a7f3-2a0c8621e5ce', 'hair care');

insert into PEKERJA_KATEGORI_JASA (PekerjaId, KategoriJasaId) values ('a516adcb-4c7a-4a0d-812d-ef5cce868cf8', 'd0b6c82d-a77e-4e74-a3af-d3fbe00c8ae6');
insert into PEKERJA_KATEGORI_JASA (PekerjaId, KategoriJasaId) values ('a516adcb-4c7a-4a0d-812d-ef5cce868cf8', 'ae04812b-67e3-455c-b6f9-29aa8ce0dff6');
insert into PEKERJA_KATEGORI_JASA (PekerjaId, KategoriJasaId) values ('a516adcb-4c7a-4a0d-812d-ef5cce868cf8', 'c666b181-555c-4e0b-b950-27573cef82ec');
insert into PEKERJA_KATEGORI_JASA (PekerjaId, KategoriJasaId) values ('b98af9fa-3a1d-4012-82fa-dd77fc59b8e0', 'd0b6c82d-a77e-4e74-a3af-d3fbe00c8ae6');
insert into PEKERJA_KATEGORI_JASA (PekerjaId, KategoriJasaId) values ('d1850551-620e-4c16-b2f8-7fe07ffb84f4', 'd0b6c82d-a77e-4e74-a3af-d3fbe00c8ae6');
insert into PEKERJA_KATEGORI_JASA (PekerjaId, KategoriJasaId) values ('d1850551-620e-4c16-b2f8-7fe07ffb84f4', 'c666b181-555c-4e0b-b950-27573cef82ec');
insert into PEKERJA_KATEGORI_JASA (PekerjaId, KategoriJasaId) values ('b98af9fa-3a1d-4012-82fa-dd77fc59b8e0', '2e81547b-6f18-4ba8-a511-f5607cf90e33');
insert into PEKERJA_KATEGORI_JASA (PekerjaId, KategoriJasaId) values ('b98af9fa-3a1d-4012-82fa-dd77fc59b8e0', 'd0b6c82d-a77e-4e74-a3af-d3fbe00c8ae6');
insert into PEKERJA_KATEGORI_JASA (PekerjaId, KategoriJasaId) values ('d1850551-620e-4c16-b2f8-7fe07ffb84f4', 'ae04812b-67e3-455c-b6f9-29aa8ce0dff6');
insert into PEKERJA_KATEGORI_JASA (PekerjaId, KategoriJasaId) values ('7b96634b-8697-4262-8b1c-610fd7f421e1', 'd0b6c82d-a77e-4e74-a3af-d3fbe00c8ae6');

insert into SUBKATEGORI_JASA (Id, NamaSubkategori, Deskripsi, KategoriJasaId) values ('0a4c7b29-3017-423f-9640-a3b602feffdd', 'daily cleaning', 'membersihkan hunian secara umum seperti menyapu, mengepel, mengelap', 'd0b6c82d-a77e-4e74-a3af-d3fbe00c8ae6');
insert into SUBKATEGORI_JASA (Id, NamaSubkategori, Deskripsi, KategoriJasaId) values ('e75a72eb-f3f8-4806-a0a1-fe7dfdd2b257', 'setrika', 'menyetrika dan melipat pakaian menggunakan peralatan pribadi pelanggan', 'd0b6c82d-a77e-4e74-a3af-d3fbe00c8ae6');
insert into SUBKATEGORI_JASA (Id, NamaSubkategori, Deskripsi, KategoriJasaId) values ('37d1a2a1-43bd-4a5e-8508-22e734ccde64', 'cucisofa', 'pencucian sofa dan bantal dari noda dan kotoran', 'ae04812b-67e3-455c-b6f9-29aa8ce0dff6');
insert into SUBKATEGORI_JASA (Id, NamaSubkategori, Deskripsi, KategoriJasaId) values ('3502aa41-9120-41ee-9d41-0d19413438eb', 'daily cleaning', 'membersihkan hunian secara umum seperti menyapu, mengepel, mengelap', 'd0b6c82d-a77e-4e74-a3af-d3fbe00c8ae6');
insert into SUBKATEGORI_JASA (Id, NamaSubkategori, Deskripsi, KategoriJasaId) values ('181b26d2-ea54-471b-a0c4-8a4f33820d38', 'setrika', 'menyetrika dan melipat pakaian menggunakan peralatan pribadi pelanggan', 'd0b6c82d-a77e-4e74-a3af-d3fbe00c8ae6');
insert into SUBKATEGORI_JASA (Id, NamaSubkategori, Deskripsi, KategoriJasaId) values ('5199a644-0ed8-4ab2-aa49-d0992c59604e', 'cucisofa', 'pencucian sofa dan bantal dari noda dan kotoran', 'ae04812b-67e3-455c-b6f9-29aa8ce0dff6');
insert into SUBKATEGORI_JASA (Id, NamaSubkategori, Deskripsi, KategoriJasaId) values ('84e7dbae-b8ec-4cac-b3a9-44d47c30e056', 'daily cleaning', 'membersihkan hunian secara umum seperti menyapu, mengepel, mengelap', 'd0b6c82d-a77e-4e74-a3af-d3fbe00c8ae6');
insert into SUBKATEGORI_JASA (Id, NamaSubkategori, Deskripsi, KategoriJasaId) values ('d1baa128-d531-4b0e-be5a-8d3e50250995', 'cucisofa', 'pencucian sofa dan bantal dari noda dan kotoran', 'ae04812b-67e3-455c-b6f9-29aa8ce0dff6');
insert into SUBKATEGORI_JASA (Id, NamaSubkategori, Deskripsi, KategoriJasaId) values ('90d8578e-f5a3-423f-b1b3-bec95ba6eab8', 'daily cleaning', 'membersihkan hunian secara umum seperti menyapu, mengepel, mengelap', 'd0b6c82d-a77e-4e74-a3af-d3fbe00c8ae6');
insert into SUBKATEGORI_JASA (Id, NamaSubkategori, Deskripsi, KategoriJasaId) values ('fc51e651-24e7-4305-a6ea-f0e542139e29', 'setrika', 'menyetrika dan melipat pakaian menggunakan peralatan pribadi pelanggan', 'd0b6c82d-a77e-4e74-a3af-d3fbe00c8ae6');

insert into SESI_LAYANAN (SubkategoriId, Sesi, Harga) values ('0a4c7b29-3017-423f-9640-a3b602feffdd', 1, 257978.68);
insert into SESI_LAYANAN (SubkategoriId, Sesi, Harga) values ('e75a72eb-f3f8-4806-a0a1-fe7dfdd2b257', 2, 308381.59);
insert into SESI_LAYANAN (SubkategoriId, Sesi, Harga) values ('37d1a2a1-43bd-4a5e-8508-22e734ccde64', 3, 306309.36);
insert into SESI_LAYANAN (SubkategoriId, Sesi, Harga) values ('3502aa41-9120-41ee-9d41-0d19413438eb', 4, 412774.29);
insert into SESI_LAYANAN (SubkategoriId, Sesi, Harga) values ('181b26d2-ea54-471b-a0c4-8a4f33820d38', 5, 91186.74);
insert into SESI_LAYANAN (SubkategoriId, Sesi, Harga) values ('5199a644-0ed8-4ab2-aa49-d0992c59604e', 6, 53700.18);
insert into SESI_LAYANAN (SubkategoriId, Sesi, Harga) values ('84e7dbae-b8ec-4cac-b3a9-44d47c30e056', 7, 332314.93);
insert into SESI_LAYANAN (SubkategoriId, Sesi, Harga) values ('d1baa128-d531-4b0e-be5a-8d3e50250995', 8, 470682.29);
insert into SESI_LAYANAN (SubkategoriId, Sesi, Harga) values ('90d8578e-f5a3-423f-b1b3-bec95ba6eab8', 9, 140997.89);
insert into SESI_LAYANAN (SubkategoriId, Sesi, Harga) values ('fc51e651-24e7-4305-a6ea-f0e542139e29', 10, 238926.49);

insert into KATEGORI_TR_MYPAY (Id, Nama) values ('1760e82d-bb9b-4f7d-aa7a-d8cb3467c70a', 'topup MyPay');
insert into KATEGORI_TR_MYPAY (Id, Nama) values ('421051d9-7306-4e08-9bd2-8cf67c630337', 'membayar transaksi jasa');
insert into KATEGORI_TR_MYPAY (Id, Nama) values ('d4aa112d-3981-4bdb-81dd-de18f88550ed', 'transfer MyPay ke pengguna lain');
insert into KATEGORI_TR_MYPAY (Id, Nama) values ('07c0a8f0-6d59-4ff4-bd5f-2cbf344aa9df', 'menerima honor transaksi jasa');
insert into KATEGORI_TR_MYPAY (Id, Nama) values ('4aab452e-4fda-45ee-bfaf-c50cee85252e', 'withdrawal MyPay ke rekening bank');

insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('17881b5e-b733-4ace-9ca3-2d174e385a08', 'a516adcb-4c7a-4a0d-812d-ef5cce868cf8', '2024-06-07', '31.51', '1760e82d-bb9b-4f7d-aa7a-d8cb3467c70a');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('233d67f9-5b8b-421f-a038-b26d83013d0c', 'a516adcb-4c7a-4a0d-812d-ef5cce868cf8', '2023-12-26', '35.43', '1760e82d-bb9b-4f7d-aa7a-d8cb3467c70a');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('c86b2356-b53d-430c-90e2-66c5f01473ec', 'b98af9fa-3a1d-4012-82fa-dd77fc59b8e0', '2024-06-29', '14.23', '1760e82d-bb9b-4f7d-aa7a-d8cb3467c70a');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('d46d3e62-16d7-4e13-8bcc-e025a625d6fb', 'b98af9fa-3a1d-4012-82fa-dd77fc59b8e0', '2024-04-16', '12.20', '1760e82d-bb9b-4f7d-aa7a-d8cb3467c70a');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('8855dbc6-a791-4ab4-ae89-de510d8d0923', 'b98af9fa-3a1d-4012-82fa-dd77fc59b8e0', '2024-06-03', '45.82', '1760e82d-bb9b-4f7d-aa7a-d8cb3467c70a');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('c00167ee-2fb7-4bde-bedb-dbb34f07f1d0', 'a516adcb-4c7a-4a0d-812d-ef5cce868cf8', '2024-07-01', '38.35', '421051d9-7306-4e08-9bd2-8cf67c630337');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('cad06c3d-7f85-40f9-84ee-1314181d7300', 'a516adcb-4c7a-4a0d-812d-ef5cce868cf8', '2024-08-09', '20.93', '421051d9-7306-4e08-9bd2-8cf67c630337');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('29c3f985-526e-487a-b451-929db041f0b2', 'a516adcb-4c7a-4a0d-812d-ef5cce868cf8', '2024-04-23', '23.39', '421051d9-7306-4e08-9bd2-8cf67c630337');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('8ec2eafb-179d-40c9-95c7-f1e1346159b1', 'b98af9fa-3a1d-4012-82fa-dd77fc59b8e0', '2024-04-25', '15.60', '421051d9-7306-4e08-9bd2-8cf67c630337');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('dce2c35a-7150-4d22-aae6-af774718b8d8', 'b98af9fa-3a1d-4012-82fa-dd77fc59b8e0', '2024-01-02', '30.85', '421051d9-7306-4e08-9bd2-8cf67c630337');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('8d55685f-0470-4f61-a503-43098d2f069c', 'd1850551-620e-4c16-b2f8-7fe07ffb84f4', '2024-07-20', '30.76', 'd4aa112d-3981-4bdb-81dd-de18f88550ed');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('1416cbd5-bd72-4e35-9709-b5972438d771', 'd1850551-620e-4c16-b2f8-7fe07ffb84f4', '2024-08-28', '14.44', 'd4aa112d-3981-4bdb-81dd-de18f88550ed');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('4837856e-ca40-4ef5-81a1-aa6fcfa6cc8d', '7b96634b-8697-4262-8b1c-610fd7f421e1', '2024-07-10', '9.87', 'd4aa112d-3981-4bdb-81dd-de18f88550ed');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('4c1a7ca8-3718-4b3f-ae75-508ce34470db', '7b96634b-8697-4262-8b1c-610fd7f421e1', '2024-05-06', '8.87', 'd4aa112d-3981-4bdb-81dd-de18f88550ed');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('fc861ed2-862c-4e19-8041-9418d5d6ceaa', '560004c4-2382-45a2-9eac-1b45838267ac', '2023-11-06', '29.17', 'd4aa112d-3981-4bdb-81dd-de18f88550ed');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('dd8ada68-bcb9-40d3-acca-51fc4a37af9c', '560004c4-2382-45a2-9eac-1b45838267ac', '2024-06-30', '25.83', '07c0a8f0-6d59-4ff4-bd5f-2cbf344aa9df');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('b4586ab6-8113-4cc9-9c4d-11cfaa79e697', '8825e674-2718-4ff2-b5bf-b37d027d97ad', '2024-04-22', '13.94', '07c0a8f0-6d59-4ff4-bd5f-2cbf344aa9df');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('3eaf3ab2-f7a8-4fd1-be61-dc7d324b6a3b', '8825e674-2718-4ff2-b5bf-b37d027d97ad', '2024-02-08', '30.03','07c0a8f0-6d59-4ff4-bd5f-2cbf344aa9df');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('c651ebb5-3e6a-410f-ad4b-c8b42803ccf9', '94fabc30-c6e4-41c5-9a9e-e4159668a55a', '2023-12-22', '3.05', '07c0a8f0-6d59-4ff4-bd5f-2cbf344aa9df');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('f2014e04-4db1-4927-bf5e-95784d3832d5', '94fabc30-c6e4-41c5-9a9e-e4159668a55a', '2024-06-12', '35.26', '07c0a8f0-6d59-4ff4-bd5f-2cbf344aa9df');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('a9277951-cae1-46ab-9335-c0258b345f32', '5b8fd24a-0fca-4a4f-9aa4-82fd1f90a362', '2024-07-21', '39.64', '4aab452e-4fda-45ee-bfaf-c50cee85252e');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('190304fa-2074-43b5-a6a6-e0d0b4b9f477', '5b8fd24a-0fca-4a4f-9aa4-82fd1f90a362', '2023-12-20', '49.25', '4aab452e-4fda-45ee-bfaf-c50cee85252e');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('ab6479d5-83d1-4d35-840d-0abbdf5fa8fe', '3bda41a4-55ee-46d8-a50b-1bab17c940fb', '2024-05-08', '45.09', '4aab452e-4fda-45ee-bfaf-c50cee85252e');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('8dccd8f5-b4bb-41ad-a0ef-a44cead87fe2', '8de701f6-6ca1-4b1d-8576-4798e282b2c2', '2024-02-17', '6.45', '4aab452e-4fda-45ee-bfaf-c50cee85252e');
insert into TR_MYPAY (Id, UserId, Tgl, Nominal, KategoriId) values ('3f4b004b-8087-4e35-aaf3-19c2124241fc', '3bda41a4-55ee-46d8-a50b-1bab17c940fb', '2024-01-30', '3.69', '4aab452e-4fda-45ee-bfaf-c50cee85252e');

insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('DTTX', '5.21', '32292');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('KOLV', '1.48', '36339');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('MPDA', '9.68', '62564');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('LPVR', '6.04', '80989');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('PAGN', '7.64', '37853');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('PFKA', '1.19', '16496');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('YDRH', '3.99', '31413');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('SEPT', '9.44', '76036');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('LIBC', '9.07', '50374');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('LIQS', '1.83', '857');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('PASK', '7.58', '78063');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('RJOW', '1.05', '20019');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('BGIL', '5.61', '37394');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('PHTO', '5.39', '72746');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('KGSP', '8.50', '78943');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('UKBB', '2.93', '50164');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('2W6', '1.66', '58292');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('KNGZ', '5.48', '79500');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('MA53', '4.20', '33548');
insert into DISKON (Kode, Potongan, MinTrPemesanan) values ('EGPA', '8.03', '8810');

insert into VOUCHER (Kode, JmlHariBerlaku, KuotaPenggunaan, Harga) values ('DTTX', 1, 1, '7560.28');
insert into VOUCHER (Kode, JmlHariBerlaku, KuotaPenggunaan, Harga) values ('KOLV', 2, 2, '4257.85');
insert into VOUCHER (Kode, JmlHariBerlaku, KuotaPenggunaan, Harga) values ('MPDA', 3, 3, '9305.33');
insert into VOUCHER (Kode, JmlHariBerlaku, KuotaPenggunaan, Harga) values ('LPVR', 4, 4, '9303.93');
insert into VOUCHER (Kode, JmlHariBerlaku, KuotaPenggunaan, Harga) values ('PAGN', 5, 5, '4819.98');
insert into VOUCHER (Kode, JmlHariBerlaku, KuotaPenggunaan, Harga) values ('PFKA', 6, 6, '9454.45');
insert into VOUCHER (Kode, JmlHariBerlaku, KuotaPenggunaan, Harga) values ('YDRH', 7, 7, '668.20');
insert into VOUCHER (Kode, JmlHariBerlaku, KuotaPenggunaan, Harga) values ('SEPT', 8, 8, '7818.61');
insert into VOUCHER (Kode, JmlHariBerlaku, KuotaPenggunaan, Harga) values ('LIBC', 9, 9, '2085.49');
insert into VOUCHER (Kode, JmlHariBerlaku, KuotaPenggunaan, Harga) values ('LIQS', 10, 10, '8243.26');

insert into PROMO (Kode, TglAkhirBerlaku) values ('PASK', '2023-10-09');
insert into PROMO (Kode, TglAkhirBerlaku) values ('RJOW', '2024-04-02');
insert into PROMO (Kode, TglAkhirBerlaku) values ('BGIL', '2024-09-12');
insert into PROMO (Kode, TglAkhirBerlaku) values ('PHTO', '2024-02-21');
insert into PROMO (Kode, TglAkhirBerlaku) values ('KGSP', '2024-01-02');
insert into PROMO (Kode, TglAkhirBerlaku) values ('UKBB', '2024-09-01');
insert into PROMO (Kode, TglAkhirBerlaku) values ('2W6', '2023-10-31');
insert into PROMO (Kode, TglAkhirBerlaku) values ('KNGZ', '2024-01-24');
insert into PROMO (Kode, TglAkhirBerlaku) values ('MA53', '2023-12-23');
insert into PROMO (Kode, TglAkhirBerlaku) values ('EGPA', '2024-06-26');

insert into METODE_BAYAR (Id, Nama) values ('823d701d-50e5-4041-ab9f-c0a51a5cdbd0', 'MyPay');
insert into METODE_BAYAR (Id, Nama) values ('5cd59786-8bad-4a31-ba4d-216fc6051c14', 'GoPay');
insert into METODE_BAYAR (Id, Nama) values ('31f2eeec-bfc7-4c6f-bebd-37f3c8931abc', 'OVO');
insert into METODE_BAYAR (Id, Nama) values ('563828f7-75b4-427f-b268-d2ae482ab088', 'Virtual Account BCA');
insert into METODE_BAYAR (Id, Nama) values ('de422fd5-7794-4713-9eee-6a52417ea791', 'Virtual Account BNI');
insert into METODE_BAYAR (Id, Nama) values ('05afe3b9-ad15-4d76-885a-821a625860cb', 'Virtual Account Mandiri');

insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('545c3497-13a8-4777-9af0-60bfffe3d10f', '2024-05-13', '2024-01-10', 1, '8825e674-2718-4ff2-b5bf-b37d027d97ad', 'DTTX', '823d701d-50e5-4041-ab9f-c0a51a5cdbd0');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('64effb74-d7a8-4240-9df8-e3e175bdcad2', '2024-09-29', '2024-03-06', 2, '8825e674-2718-4ff2-b5bf-b37d027d97ad', 'DTTX', '823d701d-50e5-4041-ab9f-c0a51a5cdbd0');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('e7a33971-5d20-46d9-aecd-3e7a06fa0bf4', '2024-04-22', '2024-03-04', 3, '94fabc30-c6e4-41c5-9a9e-e4159668a55a', 'KOLV', '823d701d-50e5-4041-ab9f-c0a51a5cdbd0');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('df621eda-8fdf-4690-8936-f14e820a46b0', '2024-04-04', '2024-04-10', 4, '94fabc30-c6e4-41c5-9a9e-e4159668a55a', 'KOLV', '5cd59786-8bad-4a31-ba4d-216fc6051c14');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('9a81a2aa-4ce5-49fa-956b-8c9ef41fb0fb', '2024-01-11', '2023-10-30', 5, '8825e674-2718-4ff2-b5bf-b37d027d97ad', 'MPDA', '5cd59786-8bad-4a31-ba4d-216fc6051c14');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('3f356a72-efc2-4e2e-974c-05ed35fc9f82', '2024-05-14', '2024-09-19', 6, '8825e674-2718-4ff2-b5bf-b37d027d97ad', 'MPDA', '5cd59786-8bad-4a31-ba4d-216fc6051c14');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('12d8f58e-4726-4be7-b01d-dcdc26df0870', '2024-09-16', '2024-05-19', 7, '5b8fd24a-0fca-4a4f-9aa4-82fd1f90a362', 'LPVR', '31f2eeec-bfc7-4c6f-bebd-37f3c8931abc');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('323d9b7f-3552-4b1c-8476-c9f6c4cc624e', '2024-01-10', '2024-01-27', 8, '5b8fd24a-0fca-4a4f-9aa4-82fd1f90a362', 'LPVR', '31f2eeec-bfc7-4c6f-bebd-37f3c8931abc');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('66264704-577d-4c8f-8e05-9fc99ac228da', '2023-12-29', '2023-10-27', 9, '8825e674-2718-4ff2-b5bf-b37d027d97ad', 'PAGN', '31f2eeec-bfc7-4c6f-bebd-37f3c8931abc');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('c8e0f95b-058b-4278-b515-41cc0de5f157', '2024-03-29', '2024-09-29', 10, '3bda41a4-55ee-46d8-a50b-1bab17c940fb', 'PAGN', '563828f7-75b4-427f-b268-d2ae482ab088');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('c7b124e7-3461-4af9-bdce-49a1eba2e221', '2023-11-14', '2023-12-22', 11, '94fabc30-c6e4-41c5-9a9e-e4159668a55a', 'PFKA', '563828f7-75b4-427f-b268-d2ae482ab088');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('0d8061dd-4938-425d-b967-7fc26b854a6e', '2023-10-24', '2024-01-02', 12, '5b8fd24a-0fca-4a4f-9aa4-82fd1f90a362', 'PFKA', '563828f7-75b4-427f-b268-d2ae482ab088');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('1864f7d6-abf6-42f1-93b5-ab2f6a95d7d9', '2023-10-28', '2024-08-13', 13, '8825e674-2718-4ff2-b5bf-b37d027d97ad', 'YDRH', 'de422fd5-7794-4713-9eee-6a52417ea791');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('6add2e05-f988-4936-bd7e-6591a39d66d2', '2024-04-19', '2024-08-26', 14, '94fabc30-c6e4-41c5-9a9e-e4159668a55a', 'YDRH', 'de422fd5-7794-4713-9eee-6a52417ea791');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('bb83c749-ac2f-418e-94f9-721ce456dd72', '2023-11-12', '2023-10-09', 15, '3bda41a4-55ee-46d8-a50b-1bab17c940fb', 'SEPT', 'de422fd5-7794-4713-9eee-6a52417ea791');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('981ed5d0-aa87-4ed0-b51c-1df56241ad05', '2024-02-11', '2023-10-26', 16, '94fabc30-c6e4-41c5-9a9e-e4159668a55a', 'SEPT', '05afe3b9-ad15-4d76-885a-821a625860cb');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('c524237a-ee38-4c65-8ca8-2013c0a11125', '2024-08-06', '2024-04-14', 17, '94fabc30-c6e4-41c5-9a9e-e4159668a55a', 'LIBC', '05afe3b9-ad15-4d76-885a-821a625860cb');
insert into TR_PEMBELIAN_VOUCHER (Id, TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar) values ('ac6d2ac4-2c3c-4d42-8eab-1f5f8b87817a', '2023-12-01', '2024-07-02', 18, '8de701f6-6ca1-4b1d-8576-4798e282b2c2', 'LIBC', '05afe3b9-ad15-4d76-885a-821a625860cb');

insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('b0b91e39-2f92-4099-812f-4d3245b10875', '2024-03-02', '2023-10-11', '2023-10-11 12:45:00', 196871.81, '8825e674-2718-4ff2-b5bf-b37d027d97ad', 'a516adcb-4c7a-4a0d-812d-ef5cce868cf8', '0a4c7b29-3017-423f-9640-a3b602feffdd', 1, 'DTTX', '823d701d-50e5-4041-ab9f-c0a51a5cdbd0');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('492fcf1c-1815-4827-b222-bb40fb0061f2', '2024-05-07', '2024-02-26', '2024-02-26 13:58:00', 389120.98, '8825e674-2718-4ff2-b5bf-b37d027d97ad', 'a516adcb-4c7a-4a0d-812d-ef5cce868cf8', '0a4c7b29-3017-423f-9640-a3b602feffdd', 1, 'DTTX', '823d701d-50e5-4041-ab9f-c0a51a5cdbd0');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('e1f2d655-0904-4413-9234-e8edf68bf39e', '2024-06-30', '2023-10-26', '2023-10-26 12:38:00', 626.12, '8825e674-2718-4ff2-b5bf-b37d027d97ad', 'a516adcb-4c7a-4a0d-812d-ef5cce868cf8', '0a4c7b29-3017-423f-9640-a3b602feffdd', 1, 'KOLV', '823d701d-50e5-4041-ab9f-c0a51a5cdbd0');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('9669b81f-0ca1-4f34-b410-1a05f7f3997c', '2023-10-17', '2023-10-27', '2023-10-27 13:22:00', 454277.29, '8825e674-2718-4ff2-b5bf-b37d027d97ad', 'a516adcb-4c7a-4a0d-812d-ef5cce868cf8', '0a4c7b29-3017-423f-9640-a3b602feffdd', 1, 'KOLV', '823d701d-50e5-4041-ab9f-c0a51a5cdbd0');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('75455835-91ff-44fb-a722-8b3526087f80', '2023-11-06', '2024-05-02', '2024-05-02 18:48:00', 214684.63, '8825e674-2718-4ff2-b5bf-b37d027d97ad', 'a516adcb-4c7a-4a0d-812d-ef5cce868cf8', '0a4c7b29-3017-423f-9640-a3b602feffdd', 1, 'MPDA', '823d701d-50e5-4041-ab9f-c0a51a5cdbd0');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('497f5c7e-7316-46ca-acdd-844be8961ad8', '2023-10-09', '2023-12-06', '2023-12-06 18:03:00', 27468.75, '94fabc30-c6e4-41c5-9a9e-e4159668a55a', 'b98af9fa-3a1d-4012-82fa-dd77fc59b8e0', 'e75a72eb-f3f8-4806-a0a1-fe7dfdd2b257', 2, 'MPDA', '5cd59786-8bad-4a31-ba4d-216fc6051c14');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('1b92e09b-0994-4108-9ebf-5e8b917dfe0c', '2024-02-28', '2024-08-06', '2024-08-06 14:22:00', 39639.40, '94fabc30-c6e4-41c5-9a9e-e4159668a55a', 'b98af9fa-3a1d-4012-82fa-dd77fc59b8e0', 'e75a72eb-f3f8-4806-a0a1-fe7dfdd2b257', 2, 'LPVR', '5cd59786-8bad-4a31-ba4d-216fc6051c14');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('96ef7924-ff17-446b-9a88-7a840c9255cf', '2023-11-24', '2023-11-21', '2023-11-21 10:09:00', 74959.71, '94fabc30-c6e4-41c5-9a9e-e4159668a55a', 'b98af9fa-3a1d-4012-82fa-dd77fc59b8e0', 'e75a72eb-f3f8-4806-a0a1-fe7dfdd2b257', 2, 'LPVR', '5cd59786-8bad-4a31-ba4d-216fc6051c14');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('7aa7d16a-0c6b-488a-bd2f-4891675276e1', '2024-10-08', '2024-07-15', '2024-07-15 15:00:00', 457475.46, '94fabc30-c6e4-41c5-9a9e-e4159668a55a', 'b98af9fa-3a1d-4012-82fa-dd77fc59b8e0', '37d1a2a1-43bd-4a5e-8508-22e734ccde64', 3, 'PAGN', '5cd59786-8bad-4a31-ba4d-216fc6051c14');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('fb7c08ca-fc74-4356-95dd-331e1e8301e8', '2024-04-28', '2024-01-15', '2024-01-15 12:23:00', 32337.84, '94fabc30-c6e4-41c5-9a9e-e4159668a55a', 'b98af9fa-3a1d-4012-82fa-dd77fc59b8e0', '37d1a2a1-43bd-4a5e-8508-22e734ccde64', 3, 'PAGN', '5cd59786-8bad-4a31-ba4d-216fc6051c14');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('d4120ea6-09ed-45a0-8461-d62cec35c3f6', '2023-12-28', '2024-06-28', '2024-06-28 11:38:00', 123919.68, '5b8fd24a-0fca-4a4f-9aa4-82fd1f90a362', 'd1850551-620e-4c16-b2f8-7fe07ffb84f4', '3502aa41-9120-41ee-9d41-0d19413438eb', 4, 'PFKA', '31f2eeec-bfc7-4c6f-bebd-37f3c8931abc');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('58598423-2026-449a-8d39-994a2a4b32b5', '2024-07-20', '2024-06-26', '2024-06-26 16:25:00', 341959.68, '5b8fd24a-0fca-4a4f-9aa4-82fd1f90a362', 'd1850551-620e-4c16-b2f8-7fe07ffb84f4', '37d1a2a1-43bd-4a5e-8508-22e734ccde64', 3, 'PFKA', '05afe3b9-ad15-4d76-885a-821a625860cb');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('b33e63cf-6b00-4442-9322-5755c0a34201', '2024-02-06', '2024-06-03', '2024-06-03 14:41:00', 227624.90, '5b8fd24a-0fca-4a4f-9aa4-82fd1f90a362', 'd1850551-620e-4c16-b2f8-7fe07ffb84f4', '3502aa41-9120-41ee-9d41-0d19413438eb', 4, 'YDRH', '05afe3b9-ad15-4d76-885a-821a625860cb');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('70fcb60d-3d13-4620-a763-6a957375b981', '2024-06-21', '2023-11-28', '2023-11-28 16:57:00', 258605.36, '5b8fd24a-0fca-4a4f-9aa4-82fd1f90a362', 'd1850551-620e-4c16-b2f8-7fe07ffb84f4', '3502aa41-9120-41ee-9d41-0d19413438eb', 4, 'YDRH', '31f2eeec-bfc7-4c6f-bebd-37f3c8931abc');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('821ac19c-8bb4-4a9c-a731-fd086039bf73', '2023-10-21', '2023-11-10', '2023-11-10 12:09:00', 414561.41, '5b8fd24a-0fca-4a4f-9aa4-82fd1f90a362', 'd1850551-620e-4c16-b2f8-7fe07ffb84f4', '181b26d2-ea54-471b-a0c4-8a4f33820d38', 5, 'SEPT', '31f2eeec-bfc7-4c6f-bebd-37f3c8931abc');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('1e8a5cdb-3147-4cfe-b473-c89800f2c47b', '2023-10-14', '2024-08-20', '2024-08-20 11:50:00', 83020.85, '3bda41a4-55ee-46d8-a50b-1bab17c940fb', '7b96634b-8697-4262-8b1c-610fd7f421e1', '181b26d2-ea54-471b-a0c4-8a4f33820d38', 5, 'SEPT', '563828f7-75b4-427f-b268-d2ae482ab088');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('ea5fabd6-9daf-4c78-82d9-316ebf3eb498', '2024-09-11', '2024-03-06', '2024-03-06 16:05:00', 341724.13, '3bda41a4-55ee-46d8-a50b-1bab17c940fb', '7b96634b-8697-4262-8b1c-610fd7f421e1', '181b26d2-ea54-471b-a0c4-8a4f33820d38', 5, 'LIBC', '563828f7-75b4-427f-b268-d2ae482ab088');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('cee5f076-3fee-437c-938b-175a7d5636c3', '2023-12-09', '2024-08-08', '2024-08-08 12:21:00', 289320.89, '3bda41a4-55ee-46d8-a50b-1bab17c940fb', '7b96634b-8697-4262-8b1c-610fd7f421e1', '5199a644-0ed8-4ab2-aa49-d0992c59604e', 6, 'LIBC', '563828f7-75b4-427f-b268-d2ae482ab088');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('f26cdb67-d0ed-4e58-829d-ae36c1d7e3ca', '2024-05-17', '2024-05-03', '2024-05-03 11:56:00', 366152.71, '3bda41a4-55ee-46d8-a50b-1bab17c940fb', '7b96634b-8697-4262-8b1c-610fd7f421e1', '5199a644-0ed8-4ab2-aa49-d0992c59604e', 6, 'LIQS', '563828f7-75b4-427f-b268-d2ae482ab088');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('58dd36c8-c670-4482-bedb-3b4e218a1b93', '2023-12-22', '2023-10-09', '2023-10-09 13:30:00', 281230.70, '3bda41a4-55ee-46d8-a50b-1bab17c940fb', '7b96634b-8697-4262-8b1c-610fd7f421e1', '5199a644-0ed8-4ab2-aa49-d0992c59604e', 6, 'PASK', '563828f7-75b4-427f-b268-d2ae482ab088');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('2fe33fd3-b766-41d0-9270-5d3f700d237a', '2024-05-19', '2024-07-29', '2024-07-29 12:13:00', 42111.85, '8de701f6-6ca1-4b1d-8576-4798e282b2c2', '560004c4-2382-45a2-9eac-1b45838267ac', '84e7dbae-b8ec-4cac-b3a9-44d47c30e056', 7, 'RJOW', 'de422fd5-7794-4713-9eee-6a52417ea791');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('9cf68212-c324-42b6-985b-2de764e35128', '2024-09-03', '2024-05-30', '2024-05-30 12:38:00', 96588.48, '8de701f6-6ca1-4b1d-8576-4798e282b2c2', '560004c4-2382-45a2-9eac-1b45838267ac', '84e7dbae-b8ec-4cac-b3a9-44d47c30e056', 7, 'BGIL', 'de422fd5-7794-4713-9eee-6a52417ea791');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('753c2c8f-a584-4dbe-b7cd-3b877978c74d', '2024-05-21', '2024-05-27', '2024-05-27 11:38:00', 319459.76, '8de701f6-6ca1-4b1d-8576-4798e282b2c2', '560004c4-2382-45a2-9eac-1b45838267ac', 'd1baa128-d531-4b0e-be5a-8d3e50250995', 8, 'BGIL', 'de422fd5-7794-4713-9eee-6a52417ea791');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('d870c87b-da60-47f8-987e-2dd1b86d8a6d', '2024-04-24', '2023-10-27', '2023-10-27 18:54:00', 159161.36, '8de701f6-6ca1-4b1d-8576-4798e282b2c2', '560004c4-2382-45a2-9eac-1b45838267ac', '90d8578e-f5a3-423f-b1b3-bec95ba6eab8', 9, 'PHTO', '05afe3b9-ad15-4d76-885a-821a625860cb');
insert into TR_PEMESANAN_JASA (Id, TglPemesanan, TglPekerjaan, WaktuPekerjaan, TotalBiaya, IdPelanggan, IdPekerja, IdKategoriJasa, Sesi, IdDiskon, IdMetodeBayar) values ('c628b899-ec42-4d69-9cf9-fae8f0994560', '2024-08-17', '2023-11-16', '2023-11-16 11:44:00', 26739.01, '8de701f6-6ca1-4b1d-8576-4798e282b2c2', '560004c4-2382-45a2-9eac-1b45838267ac', '90d8578e-f5a3-423f-b1b3-bec95ba6eab8', 9, 'KGSP', '05afe3b9-ad15-4d76-885a-821a625860cb');

insert into STATUS_PESANAN (Id, "Status") values ('4f7ddf1b-c1a1-49e0-ba9b-edee17e6687a', 'Menunggu Pembayaran');
insert into STATUS_PESANAN (Id, "Status") values ('f4d5ca38-33b4-42b8-84c1-c249dfc232f6', 'Mencari Pekerja Terdekat');
insert into STATUS_PESANAN (Id, "Status") values ('1ebd1aea-34ac-4594-9b15-8aff4cf316aa', 'Menunggu Pekerja Berangkat');
insert into STATUS_PESANAN (Id, "Status") values ('0e9d9a4b-a681-46ce-b78e-8760a6c6699e', 'Pekerja tiba di lokasi');
insert into STATUS_PESANAN (Id, "Status") values ('b7857027-3ea0-4bd1-988d-9ee717806e31', 'Pelayanan jasa sedang dilakukan');
insert into STATUS_PESANAN (Id, "Status") values ('3960d7da-1f2d-4da4-ad2d-ef872ee44c5b', 'Pesanan selesai');
insert into STATUS_PESANAN (Id, "Status") values ('d5d3c43c-3224-4ebd-94e8-b2b5df5b56d0', 'Pesanan dibatalkan');

insert into TR_PEMESANAN_STATUS (IdTrPemesanan, IdStatus, TglWaktu) values ('b0b91e39-2f92-4099-812f-4d3245b10875', '4f7ddf1b-c1a1-49e0-ba9b-edee17e6687a', '2023-10-11 12:45:00');
insert into TR_PEMESANAN_STATUS (IdTrPemesanan, IdStatus, TglWaktu) values ('492fcf1c-1815-4827-b222-bb40fb0061f2', 'f4d5ca38-33b4-42b8-84c1-c249dfc232f6', '2024-02-26 13:58:00');
insert into TR_PEMESANAN_STATUS (IdTrPemesanan, IdStatus, TglWaktu) values ('e1f2d655-0904-4413-9234-e8edf68bf39e', '1ebd1aea-34ac-4594-9b15-8aff4cf316aa', '2023-10-26 12:38:00');
insert into TR_PEMESANAN_STATUS (IdTrPemesanan, IdStatus, TglWaktu) values ('9669b81f-0ca1-4f34-b410-1a05f7f3997c', '0e9d9a4b-a681-46ce-b78e-8760a6c6699e', '2023-10-27 13:22:00');
insert into TR_PEMESANAN_STATUS (IdTrPemesanan, IdStatus, TglWaktu) values ('75455835-91ff-44fb-a722-8b3526087f80', 'b7857027-3ea0-4bd1-988d-9ee717806e31', '2024-05-02 18:48:00');
insert into TR_PEMESANAN_STATUS (IdTrPemesanan, IdStatus, TglWaktu) values ('497f5c7e-7316-46ca-acdd-844be8961ad8', '3960d7da-1f2d-4da4-ad2d-ef872ee44c5b', '2023-12-06 18:03:00');
insert into TR_PEMESANAN_STATUS (IdTrPemesanan, IdStatus, TglWaktu) values ('1b92e09b-0994-4108-9ebf-5e8b917dfe0c', 'd5d3c43c-3224-4ebd-94e8-b2b5df5b56d0', '2024-08-06 14:22:00');

insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('b0b91e39-2f92-4099-812f-4d3245b10875', '2024-01-02', 'architect one-to-one communities', 1);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('492fcf1c-1815-4827-b222-bb40fb0061f2', '2024-01-02', 'innovate real-time ROI', 2);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('e1f2d655-0904-4413-9234-e8edf68bf39e', '2024-01-02', 'exploit magnetic e-markets', 3);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('9669b81f-0ca1-4f34-b410-1a05f7f3997c', '2024-08-23', 'drive frictionless users', 4);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('75455835-91ff-44fb-a722-8b3526087f80', '2024-07-05', 'benchmark intuitive models', 5);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('497f5c7e-7316-46ca-acdd-844be8961ad8', '2024-06-03', 'enhance interactive technologies', 6);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('1b92e09b-0994-4108-9ebf-5e8b917dfe0c', '2024-06-28', 'embrace global functionalities', 7);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('96ef7924-ff17-446b-9a88-7a840c9255cf', '2024-07-28', 'innovate extensible schemas', 8);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('7aa7d16a-0c6b-488a-bd2f-4891675276e1', '2024-09-14', 'synthesize visionary e-services', 9);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('fb7c08ca-fc74-4356-95dd-331e1e8301e8', '2023-10-26', 'streamline visionary schemas', 10);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('d4120ea6-09ed-45a0-8461-d62cec35c3f6', '2024-06-21', 'generate rich experiences', 11);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('58598423-2026-449a-8d39-994a2a4b32b5', '2023-10-17', 'enhance end-to-end networks', 12);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('b33e63cf-6b00-4442-9322-5755c0a34201', '2023-11-25', 'leverage leading-edge supply-chains', 13);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('70fcb60d-3d13-4620-a763-6a957375b981', '2023-12-20', 'e-enable scalable convergence', 14);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('821ac19c-8bb4-4a9c-a731-fd086039bf73', '2023-12-22', 'innovate wireless content', 15);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('1e8a5cdb-3147-4cfe-b473-c89800f2c47b', '2024-04-21', 'architect enterprise metrics', 16);
insert into TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating) values ('ea5fabd6-9daf-4c78-82d9-316ebf3eb498', '2023-12-14', 'extend clicks-and-mortar channels', 17);