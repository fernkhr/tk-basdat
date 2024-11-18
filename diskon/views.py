from django.shortcuts import render

def diskon_view(request):
    """
    View untuk menampilkan daftar diskon (voucher dan promo).
    """
    # Dummy data untuk voucher
    voucher_data = [
        {"kode": "VCR001", "potongan": "20%", "harga": "Rp 50.000", "hari_berlaku": 30, "kuota": 100},
        {"kode": "VCR002", "potongan": "10%", "harga": "Rp 25.000", "hari_berlaku": 15, "kuota": 50},
    ]

    # Dummy data untuk promo
    promo_data = [
        {"kode": "PRM001", "tanggal_berlaku": "2024-12-31"},
        {"kode": "PRM002", "tanggal_berlaku": "2024-11-30"},
    ]

    context = {
        "voucher_data": voucher_data,
        "promo_data": promo_data,
    }
    return render(request, 'diskon.html', context)

def beli_voucher_view(request, kode_voucher):
    """
    View untuk halaman pembelian voucher.
    TODO: Tambahkan logic backend untuk memvalidasi saldo pengguna.
    """
    # Dummy data sukses/gagal (hard-coded untuk sementara)
    saldo_cukup = True  # Ubah ke False untuk melihat pesan gagal

    if saldo_cukup:
        context = {
            "status": "gagal",
            "kode_voucher": kode_voucher,
            "hari_berlaku": "30",  # Dummy
            "kuota": "100",       # Dummy
        }
    else:
        context = {
            "status": "gagal",
        }

    return render(request, 'beli_voucher.html', context)
