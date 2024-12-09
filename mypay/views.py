from django.shortcuts import render

def mypay_view(request):
    """
    View untuk menampilkan halaman MyPay.
    TODO: Implementasikan data dinamis menggunakan database.
    """
    # Dummy data
    user_data = {
        "no_hp": "081234567890",
        "saldo": "Rp 1.500.000",
    }

    riwayat_transaksi = [
        {"nominal": "+Rp 500.000", "tanggal": "2024-11-01", "kategori": "Top-Up"},
        {"nominal": "-Rp 200.000", "tanggal": "2024-11-02", "kategori": "Pembelian Voucher"},
        {"nominal": "+Rp 150.000", "tanggal": "2024-11-05", "kategori": "Penerimaan Pembayaran"},
    ]

    context = {
        "user_data": user_data,
        "riwayat_transaksi": riwayat_transaksi,
    }

    return render(request, 'mypay/mypay.html', context)

def transaksi_view(request):
    """
    View untuk halaman form transaksi MyPay.
    TODO: Implementasikan logika backend untuk menangani transaksi.
    """
    # Dummy data
    user_data = {
        "nama_user": "Budi",
        "saldo": "Rp 1.500.000",
        "tanggal_transaksi": "2024-11-18",
    }

    # Dummy pesanan jasa (State 2)
    pesanan_jasa = [
        {"id": 1, "nama": "Pembersihan Rumah", "harga": "Rp 200.000"},
        {"id": 2, "nama": "Perbaikan AC", "harga": "Rp 300.000"},
    ]

    # Dummy nama bank (State 4)
    nama_bank = ["BCA", "Mandiri", "BNI", "OVO", "GoPay"]

    context = {
        "user_data": user_data,
        "pesanan_jasa": pesanan_jasa,
        "nama_bank": nama_bank,
    }

    return render(request, 'mypay/transaksi.html', context)
