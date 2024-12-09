from django.http import JsonResponse, HttpResponseRedirect
from django.shortcuts import render
from django.db import connection
from datetime import datetime
from decimal import Decimal
import json

def diskon_view(request):
    if not request.session.has_key("user"):
        return HttpResponseRedirect('/login')
    else:
        user_session = request.session["user"]
        role = user_session.get("role")

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

        cursor.execute("""
                    SELECT 
                        Id as id,
                        Nama as nama
                    FROM METODE_BAYAR
                    ORDER BY Nama
                """)
        metode_bayar = [dict(zip([col[0] for col in cursor.description], row))
                        for row in cursor.fetchall()]

    return render(request, 'diskon/index.html', {
        'vouchers': vouchers,
        'promos': promos,
        'metode_bayar': metode_bayar,
        'role': role,
        'authenticated': True
    })


class DecimalEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, Decimal):
            return float(obj)
        return super().default(obj)


def beli_voucher_view(request, kode_voucher):
    if not request.session.has_key("user"):
        return HttpResponseRedirect('/login')
    else:
        user_session = request.session["user"]
        role = user_session.get("role")

    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            metode_bayar_id = data.get('metode_bayar_id')

            if "user" not in request.session:
                return JsonResponse({'status': 'error', 'message': 'Silakan login terlebih dahulu'})

            current_user = request.session["user"]
            user_no_hp = current_user["no_hp"]

            with connection.cursor() as cursor:
                # Cek metode pembayaran
                cursor.execute("""
                   SELECT Nama FROM METODE_BAYAR WHERE Id = %s
               """, [metode_bayar_id])
                metode_result = cursor.fetchone()

                if not metode_result:
                    return JsonResponse({
                        'status': 'error',
                        'message': 'Metode pembayaran tidak valid'
                    })

                metode_nama = metode_result[0]

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

                voucher_result = cursor.fetchone()
                if not voucher_result:
                    return JsonResponse({'status': 'error', 'message': 'Voucher tidak ditemukan'})

                voucher = dict(zip([col[0] for col in cursor.description], voucher_result))

                # Ambil data user dan pelanggan ID
                cursor.execute("""
                   SELECT u.SaldoMyPay, p.Id as pelanggan_id
                   FROM "USER" u
                   JOIN PELANGGAN p ON u.Id = p.Id
                   WHERE u.NoHP = %s
               """, [user_no_hp])

                user_data = cursor.fetchone()
                if not user_data:
                    return JsonResponse({'status': 'error', 'message': 'User tidak ditemukan'})

                saldo = user_data[0] or Decimal('0')
                pelanggan_id = user_data[1]

                try:
                    cursor.execute("BEGIN")

                    # Jika menggunakan MyPay, cek dan kurangi saldo
                    if metode_nama == 'MyPay':
                        if saldo < voucher['harga']:
                            cursor.execute("ROLLBACK")
                            return JsonResponse({
                                'status': 'error',
                                'message': f'Saldo MyPay tidak mencukupi. Saldo Anda: Rp {float(saldo):,.0f}'
                            })

                        cursor.execute("""
                           UPDATE "USER"
                           SET SaldoMyPay = SaldoMyPay - %s
                           WHERE NoHP = %s
                           RETURNING SaldoMyPay
                       """, [voucher['harga'], user_no_hp])

                        new_saldo = float(cursor.fetchone()[0])

                        # Catat transaksi MyPay
                        cursor.execute("""
                           INSERT INTO TR_MYPAY (
                               UserId,
                               Tgl,
                               Nominal,
                               KategoriId
                           ) 
                           VALUES (
                               %s,
                               CURRENT_DATE,
                               %s,
                               (SELECT Id FROM KATEGORI_TR_MYPAY WHERE Nama = 'Pembelian Voucher' LIMIT 1)
                           )
                       """, [pelanggan_id, float(-voucher['harga'])])

                    # Insert record pembelian voucher
                    cursor.execute("""
                       INSERT INTO TR_PEMBELIAN_VOUCHER 
                       (TglAwal, TglAkhir, TelahDigunakan, IdPelanggan, IdVoucher, IdMetodeBayar)
                       VALUES (
                           CURRENT_DATE,
                           CURRENT_DATE + INTERVAL '%s days',
                           1,
                           %s,
                           %s,
                           %s
                       )
                       RETURNING Id
                   """, [voucher['jmlhariberlaku'], pelanggan_id, kode_voucher, metode_bayar_id])

                    cursor.execute("COMMIT")

                    response_data = {
                        'status': 'success',
                        'message': 'Voucher berhasil dibeli'
                    }

                    if metode_nama == 'MyPay':
                        response_data['saldo_baru'] = new_saldo
                        current_user = request.session["user"]
                        current_user["saldo"] = new_saldo
                        request.session.modified = True

                    return JsonResponse(response_data, encoder=DecimalEncoder)

                except Exception as e:
                    cursor.execute("ROLLBACK")
                    print(f"Error: {str(e)}")
                    return JsonResponse({
                        'status': 'error',
                        'message': f'Terjadi kesalahan: {str(e)}'
                    })

        except json.JSONDecodeError:
            return JsonResponse({
                'status': 'error',
                'message': 'Invalid request data'
            })

    return JsonResponse({'status': 'error', 'message': 'Method not allowed'})