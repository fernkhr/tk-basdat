from django.shortcuts import render
from django.db import connection
from django.http import JsonResponse
from datetime import datetime


def index(request):
    with connection.cursor() as cursor:
        # Ambil semua testimoni dengan detail user dan pekerja
        cursor.execute("""
            SELECT 
                t.IdTrPemesanan,
                t.Tgl,
                t.Teks,
                t.Rating,
                u1.Nama as namapelanggan,
                u2.Nama as namapekerja,
                s.NamaSubkategori
            FROM TESTIMONI t
            JOIN TR_PEMESANAN_JASA tj ON t.IdTrPemesanan = tj.Id
            JOIN \"USER\" u1 ON tj.IdPelanggan = u1.Id
            JOIN \"USER\" u2 ON tj.IdPekerja = u2.Id
            JOIN SUBKATEGORI_JASA s ON tj.IdKategoriJasa = s.Id
            ORDER BY t.Tgl DESC
        """)
        testimoni = [dict(zip([col[0] for col in cursor.description], row))
                     for row in cursor.fetchall()]

    # Ambil daftar pesanan yang sudah selesai tapi belum ada testimoni
    with connection.cursor() as cursor:
        cursor.execute("""
            SELECT 
                tj.Id,
                tj.TglPemesanan,
                tj.TglPekerjaan,
                tj.TotalBiaya,
                u.Nama as nama_pekerja,
                s.NamaSubkategori,
                sp."Status"
            FROM TR_PEMESANAN_JASA tj
            JOIN \"USER\" u ON tj.IdPekerja = u.Id
            JOIN SUBKATEGORI_JASA s ON tj.IdKategoriJasa = s.Id
            JOIN TR_PEMESANAN_STATUS tps ON tj.Id = tps.IdTrPemesanan
            JOIN STATUS_PESANAN sp ON tps.IdStatus = sp.Id
            WHERE sp."Status" = 'Pesanan Selesai'
            AND tj.Id NOT IN (SELECT IdTrPemesanan FROM TESTIMONI)
            ORDER BY tj.TglPekerjaan DESC
        """)
        available_orders = [dict(zip([col[0] for col in cursor.description], row))
                            for row in cursor.fetchall()]

    return render(request, 'testimoni/index.html', {
        'testimoni': testimoni,
        'available_orders': available_orders
    })


# Update template create_testimoni
def create_testimoni(request):
    if request.method == 'POST':
        try:
            rating = request.POST.get('rating')
            komentar = request.POST.get('komentar')
            id_pemesanan = request.POST.get('id_pemesanan')

            with connection.cursor() as cursor:
                # Cek apakah pesanan sudah selesai
                cursor.execute("""
                    SELECT ts.IdStatus 
                    FROM TR_PEMESANAN_STATUS ts
                    JOIN STATUS_PESANAN sp ON ts.IdStatus = sp.Id
                    WHERE ts.IdTrPemesanan = %s 
                    AND sp."Status" = 'Pesanan Selesai'
                """, [id_pemesanan])

                if not cursor.fetchone():
                    return JsonResponse({
                        'success': False,
                        'message': 'Pesanan belum selesai'
                    }, status=400)

                # Cek apakah testimoni sudah ada
                cursor.execute("""
                    SELECT IdTrPemesanan FROM TESTIMONI 
                    WHERE IdTrPemesanan = %s
                """, [id_pemesanan])

                if cursor.fetchone():
                    return JsonResponse({
                        'success': False,
                        'message': 'Testimoni sudah ada untuk pesanan ini'
                    }, status=400)

                # Buat testimoni baru
                cursor.execute("""
                    INSERT INTO TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating)
                    VALUES (%s, %s, %s, %s)
                """, [id_pemesanan, datetime.now(), komentar, rating])

                return JsonResponse({
                    'success': True,
                    'message': 'Testimoni berhasil ditambahkan'
                })

        except Exception as e:
            return JsonResponse({
                'success': False,
                'message': str(e)
            }, status=500)

    # GET request
    id_pemesanan = request.GET.get('id_pemesanan')

    with connection.cursor() as cursor:
        cursor.execute("""
            SELECT 
                tj.Id,
                tj.TglPekerjaan,
                tj.TotalBiaya,
                u.Nama as nama_pekerja,
                s.NamaSubkategori as namasubkategori
            FROM TR_PEMESANAN_JASA tj
            JOIN \"USER\" u ON tj.IdPekerja = u.Id
            JOIN SUBKATEGORI_JASA s ON tj.IdKategoriJasa = s.Id
            WHERE tj.Id = %s
        """, [id_pemesanan])

        columns = [col[0] for col in cursor.description]
        row = cursor.fetchone()
        if row:
            order_detail = dict(zip(columns, row))
        else:
            order_detail = None

    return render(request, 'testimoni/create.html', {
        'id_pemesanan': id_pemesanan,
        'order_detail': order_detail
    })