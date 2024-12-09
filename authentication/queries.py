from django.db import connection
import psycopg2.extras
import uuid

def check_user_exists(no_hp, role):
    with connection.cursor() as cursor:
        cursor.execute('SELECT id, "nama" FROM "USER" WHERE "nohp" = %s', [no_hp]) 
        result = cursor.fetchone()
        return result if result else None

def check_role(id):
    with connection.cursor() as cursor:
        cursor.execute('SELECT id FROM "pelanggan" WHERE "id" = %s', [id]) 
        result = cursor.fetchone()
        if result:
            return "pengguna"
        else:
            return "pekerja"

def create_user_pengguna(nama, jenis_kelamin, no_hp, password, tanggal_lahir, alamat):
    user_id = uuid.uuid4()
    with connection.cursor() as cursor:
        cursor.execute("""
            INSERT INTO "USER" VALUES (%s, %s, %s, %s, %s, %s, %s, 0)
        """, [user_id, nama, jenis_kelamin, no_hp, password, tanggal_lahir, alamat])
        cursor.execute("""
            INSERT INTO pelanggan VALUES (%s, 'Basic')
        """, [user_id])

def create_user_pekerja(nama, jenis_kelamin, no_hp, password, tanggal_lahir, alamat, nama_bank, no_rekening, npwp, link_foto):
    user_id = uuid.uuid4()
    with connection.cursor() as cursor:
        cursor.execute("""
            INSERT INTO "USER" VALUES (%s, %s, %s, %s, %s, %s, %s, 0)
        """, [user_id, nama, jenis_kelamin, no_hp, password, tanggal_lahir, alamat])
        cursor.execute("""
            INSERT INTO pekerja VALUES (%s, %s, %s, %s, %s, 0, 0)
        """, [user_id, nama_bank, no_rekening, npwp, link_foto])

def check_pekerja_exists(nama_bank=None, no_rekening=None, npwp=None):
    with connection.cursor() as cursor:
        if nama_bank and no_rekening:
            cursor.execute("SELECT 1 FROM pekerja WHERE NamaBank = %s AND NomorRekening = %s", [nama_bank, no_rekening])
        elif npwp:
            cursor.execute("SELECT 1 FROM pekerja WHERE NPWP = %s", [npwp])
        result = cursor.fetchone()
        return result is not None
