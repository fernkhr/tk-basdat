from django.db import connection
import uuid

def get_pengguna_data(no_hp):
    with connection.cursor() as cursor:
        cursor.execute('SELECT "nama", "jeniskelamin", "nohp", "tgllahir", "alamat", "saldomypay", "pelanggan"."Level" FROM "USER" JOIN "pelanggan" ON "USER"."id" = "pelanggan"."id" WHERE "USER"."nohp" = %s', [no_hp])
        result = cursor.fetchone()
        if result:
            return {
                'nama': result[0],
                'jenis_kelamin': result[1],
                'no_hp': result[2],
                'tanggal_lahir': result[3],
                'alamat': result[4],
                'saldo': result[5],
                'level': result[6]
            }
        return None

def get_pekerja_data(no_hp):
    with connection.cursor() as cursor:
        cursor.execute('SELECT "nama", "jeniskelamin", "nohp", "tgllahir", "alamat", "saldomypay", "namabank", "nomorrekening", "npwp", "rating", "jmlpsananselesai", "namakategori", "linkfoto" FROM "USER" JOIN "pekerja" ON "USER"."id" = "pekerja"."id" JOIN "pekerja_kategori_jasa" ON "USER"."id" = "pekerjaid" JOIN "kategori_jasa" ON "pekerja_kategori_jasa"."kategorijasaid" = "kategori_jasa"."id" WHERE "USER"."nohp" = %s', [no_hp])
        result = cursor.fetchone()
        if result:
            return {
                'nama': result[0],
                'jenis_kelamin': result[1],
                'no_hp': result[2],
                'tanggal_lahir': result[3],
                'alamat': result[4],
                'saldo': result[5],
                'nama_bank': result[6],
                'no_rekening': result[7],
                'npwp': result[8],
                'rating': result[9],
                'jumlah_pesanan_selesai': result[10],
                'kategori_pekerjaan': result[11],
                'link_foto': result[12],
            }
        return None

def update_pengguna_data(data, no_hp):
    with connection.cursor() as cursor:
        cursor.execute("""
            UPDATE "USER" 
            SET "nama" = %s, "jeniskelamin" = %s, "tgllahir" = %s, "alamat" = %s
            WHERE "nohp" = %s
        """, [data['nama'], data['jenis_kelamin'], data['tanggal_lahir'], data['alamat'], no_hp])

def update_pekerja_data(data, no_hp):
    with connection.cursor() as cursor:
        cursor.execute("""
            UPDATE "USER" 
            SET "nama" = %s, "jeniskelamin" = %s, "tgllahir" = %s, "alamat" = %s
            WHERE "nohp" = %s
        """, [data['nama'], data['jenis_kelamin'], data['tanggal_lahir'], data['alamat'], no_hp])

        cursor.execute("""
            UPDATE "pekerja"
            SET "namabank" = %s, "nomorrekening" = %s, "npwp" = %s
            WHERE "id" = (SELECT "id" FROM "USER" WHERE "nohp" = %s)
        """, [data['nama_bank'], data['no_rekening'], data['npwp'], no_hp])
