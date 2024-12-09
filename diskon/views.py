from django.http import JsonResponse
from django.shortcuts import render
from django.db import connection
from datetime import datetime


def diskon_view(request):
    with connection.cursor() as cursor:
        # Ambil data voucher
        cursor.execute("""
            SELECT 
                v.Kode,
                d.Potongan,
                d.MinTrPemesanan,
                v.JmlHariBerlaku,
                v.KuotaPenggunaan,
                v.Harga
            FROM VOUCHER v
            JOIN DISKON d ON v.Kode = d.Kode
            ORDER BY v.Kode
        """)
        vouchers = [dict(zip([col[0] for col in cursor.description], row))
                    for row in cursor.fetchall()]

        # Ambil data promo
        cursor.execute("""
            SELECT 
                p.Kode,
                d.Potongan,
                d.MinTrPemesanan,
                p.TglAkhirBerlaku
            FROM PROMO p
            JOIN DISKON d ON p.Kode = d.Kode
            ORDER BY p.TglAkhirBerlaku DESC
        """)
        promos = [dict(zip([col[0] for col in cursor.description], row))
                  for row in cursor.fetchall()]

    return render(request, 'diskon/index.html', {
        'vouchers': vouchers,
        'promos': promos
    })


def beli_voucher_view(request, kode_voucher):
    if request.method == 'POST':
        with connection.cursor() as cursor:
            # Ambil data voucher
            cursor.execute("""
                SELECT 
                    v.Kode,
                    v.Harga,
                    v.JmlHariBerlaku,
                    v.KuotaPenggunaan
                FROM VOUCHER v
                WHERE v.Kode = %s
            """, [kode_voucher])

            voucher = dict(zip([col[0] for col in cursor.description], cursor.fetchone()))

            if not voucher:
                return JsonResponse({'status': 'error', 'message': 'Voucher tidak ditemukan'})

            # TODO: Implementasi pembelian voucher
            # 1. Cek saldo user
            # 2. Kurangi saldo
            # 3. Buat record pembelian voucher

            return JsonResponse({'status': 'success'})

    return JsonResponse({'status': 'error', 'message': 'Method not allowed'})