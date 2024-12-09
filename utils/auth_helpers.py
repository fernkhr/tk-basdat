
from django.db import connection

def register_user(role, data):
    with connection.cursor() as cursor:
        try:
            cursor.execute("BEGIN")

            # Insert ke tabel USER
            cursor.execute("""
                INSERT INTO "USER" (Nama, JenisKelamin, NoHP, Pwd, TglLahir, Alamat)
                VALUES (%(nama)s, %(jenis_kelamin)s, %(no_hp)s, %(password)s, %(tgl_lahir)s, %(alamat)s)
                RETURNING Id
            """, data)

            user_id = cursor.fetchone()[0]

            if role == 'pengguna':
                cursor.execute("""
                    INSERT INTO PELANGGAN (Id, "Level")
                    VALUES (%s, %s)
                """, [user_id, data.get('level', 'Silver')])

            elif role == 'pekerja':
                cursor.execute("""
                    INSERT INTO PEKERJA (Id, NamaBank, NomorRekening, NPWP, LinkFoto)
                    VALUES (%s, %s, %s, %s, %s)
                """, [user_id, data['nama_bank'], data['no_rekening'], data['npwp'], data['link_foto']])

            cursor.execute("COMMIT")
            return True, user_id

        except Exception as e:
            cursor.execute("ROLLBACK")
            return False, str(e)


# Penggunaan:
# Registrasi Pengguna
data_pengguna = {
    'nama': 'John Doe',
    'jenis_kelamin': 'L',
    'no_hp': '081234567890',
    'password': 'password123',
    'tgl_lahir': '1990-01-01',
    'alamat': 'Jakarta',
    'level': 'Silver'
}

success, result = register_user('pengguna', data_pengguna)

# Registrasi Pekerja
data_pekerja = {
    'nama': 'Jane Worker',
    'jenis_kelamin': 'P',
    'no_hp': '081234567891',
    'password': 'password123',
    'tgl_lahir': '1992-02-02',
    'alamat': 'Bandung',
    'nama_bank': 'BCA',
    'no_rekening': '1234567890',
    'npwp': '123.456.789.0-123.000',
    'link_foto': 'foto.jpg'
}

success, result = register_user('pekerja', data_pekerja)