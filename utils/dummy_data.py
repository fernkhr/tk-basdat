
from django.db import connection


def create_dummy_accounts():
    with connection.cursor() as cursor:
        try:
            # Mulai transaksi
            cursor.execute("BEGIN")

            # Registrasi Pengguna (User Biasa)
            cursor.execute("""
                INSERT INTO "USER" (Nama, JenisKelamin, NoHP, Pwd, TglLahir, Alamat, SaldoMyPay)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
                RETURNING Id
            """, ["John Doe", "L", "081234567890", "password123", "1990-01-01", "Jakarta", 1000000])

            user1_id = cursor.fetchone()[0]

            # Insert ke tabel PELANGGAN
            cursor.execute("""
                INSERT INTO PELANGGAN (Id, "Level")
                VALUES (%s, %s)
            """, [user1_id, "Silver"])

            # Registrasi Pekerja
            cursor.execute("""
                INSERT INTO "USER" (Nama, JenisKelamin, NoHP, Pwd, TglLahir, Alamat)
                VALUES (%s, %s, %s, %s, %s, %s)
                RETURNING Id
            """, ["Jane Worker", "P", "081234567891", "password123", "1992-02-02", "Bandung"])

            user2_id = cursor.fetchone()[0]

            # Insert ke tabel PEKERJA
            cursor.execute("""
                INSERT INTO PEKERJA (Id, NamaBank, NomorRekening, NPWP, LinkFoto, Rating, JmlPsananSelesai)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
            """, [user2_id, "BCA", "1234567890", "123.456.789.0-123.000", "foto.jpg", 0, 0])

            cursor.execute("COMMIT")
            return "Berhasil membuat akun dummy"

        except Exception as e:
            cursor.execute("ROLLBACK")
            return f"Error: {str(e)}"