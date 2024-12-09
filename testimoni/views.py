from django.shortcuts import render, redirect
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
                u1.Nama as NamaPelanggan,
                u2.Nama as NamaPekerja,
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

    return render(request, 'testimoni/index.html', {'testimoni': testimoni})


def create_testimoni(request):
    if request.method == 'POST':
        rating = request.POST.get('rating')
        teks = request.POST.get('komentar')
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
                return JsonResponse({'error': 'Pesanan belum selesai'}, status=400)

            # Cek apakah testimoni sudah ada
            cursor.execute("""
                SELECT IdTrPemesanan FROM TESTIMONI 
                WHERE IdTrPemesanan = %s
            """, [id_pemesanan])

            if cursor.fetchone():
                return JsonResponse({'error': 'Testimoni sudah ada'}, status=400)

            # Buat testimoni baru
            cursor.execute("""
                INSERT INTO TESTIMONI (IdTrPemesanan, Tgl, Teks, Rating)
                VALUES (%s, %s, %s, %s)
            """, [id_pemesanan, datetime.now(), teks, rating])

        return JsonResponse({'success': True})

    # GET request - tampilkan form
    id_pemesanan = request.GET.get('id_pemesanan')
    return render(request, 'testimoni/create.html', {'id_pemesanan': id_pemesanan})