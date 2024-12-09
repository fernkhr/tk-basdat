import psycopg2
from django.shortcuts import render, redirect
from django.conf import settings
from django.utils.timezone import now

def create_pesanan(request):
    if request.method == 'POST':
        # Ambil data dari form
        tanggal_pemesanan = now().date()
        kode_diskon = request.POST.get('diskon')
        metode_bayar = request.POST.get('metode_pembayaran')
        total_pembayaran = request.POST.get('total_pembayaran')  # Hitung secara dinamis
        
        # Koneksi ke database
        conn = psycopg2.connect(
            dbname=settings.DATABASES['default']['NAME'],
            user=settings.DATABASES['default']['USER'],
            password=settings.DATABASES['default']['PASSWORD'],
            host=settings.DATABASES['default']['HOST'],
            port=settings.DATABASES['default']['PORT']
        )
        cursor = conn.cursor()

        # Simpan pesanan ke database
        cursor.execute("""
            INSERT INTO pesanan (tanggal_pemesanan, kode_diskon, total_pembayaran, metode_pembayaran, status)
            VALUES (%s, %s, %s, %s, %s)
        """, (tanggal_pemesanan, kode_diskon, total_pembayaran, metode_bayar, 'Menunggu Pembayaran'))

        conn.commit()
        cursor.close()
        conn.close()

        # Redirect ke halaman view pesanan
        return redirect('pesanan:view_pesanan')

    # Render form pemesanan
    return render(request, 'pemesanan_jasa/create_pesanan.html')

def view_pesanan(request):
    # Koneksi ke database
    conn = psycopg2.connect(
        dbname=settings.DATABASES['default']['NAME'],
        user=settings.DATABASES['default']['USER'],
        password=settings.DATABASES['default']['PASSWORD'],
        host=settings.DATABASES['default']['HOST'],
        port=settings.DATABASES['default']['PORT']
    )
    cursor = conn.cursor()

    # Ambil data pesanan
    cursor.execute("SELECT id, subkategori, sesi_layanan, harga, pekerja, status FROM pesanan WHERE pengguna_id = %s", [request.user.id])
    pesanan_list = cursor.fetchall()

    cursor.close()
    conn.close()

    # Render data ke template
    context = {
        'pesanan_list': pesanan_list
    }
    return render(request, 'view_pesanan.html', context)

def cancel_pesanan(request, pesanan_id):
    conn = psycopg2.connect(
        dbname=settings.DATABASES['default']['NAME'],
        user=settings.DATABASES['default']['USER'],
        password=settings.DATABASES['default']['PASSWORD'],
        host=settings.DATABASES['default']['HOST'],
        port=settings.DATABASES['default']['PORT']
    )
    cursor = conn.cursor()

    # Update status pesanan menjadi "Dibatalkan"
    cursor.execute("UPDATE pesanan SET status = 'Dibatalkan' WHERE id = %s", [pesanan_id])
    conn.commit()

    cursor.close()
    conn.close()

    return redirect('pesanan:view_pesanan')
