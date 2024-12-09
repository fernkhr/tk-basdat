from django.shortcuts import render

def pekerjaan_view(request):
    """
    View untuk menampilkan daftar pekerjaan jasa.
    TODO: Implementasikan logika untuk mengambil data dari database.
    """
    # Dummy data untuk kategori dan subkategori
    kategori_data = ["Home Cleaning", "Massage", "AC Repair"]
    subkategori_data = {
        "Home Cleaning": ["Setrika", "Daily Cleaning", "Pembersihan Dapur"],
        "Massage": ["Full Body Massage", "Foot Massage"],
        "AC Repair": ["Cleaning AC", "Repair AC"],
    }

    # Dummy data untuk pekerjaan jasa
    pekerjaan_data = [
        {
            "subkategori": "Daily Cleaning",
            "pelanggan": "Budi",
            "total_biaya": "Rp 200.000",
            "tanggal_pemesanan": "2024-11-15",
            "tanggal_pekerjaan": "2024-11-18",
        },
        {
            "subkategori": "Setrika",
            "pelanggan": "Andi",
            "total_biaya": "Rp 150.000",
            "tanggal_pemesanan": "2024-11-16",
            "tanggal_pekerjaan": "2024-11-19",
        },
    ]

    context = {
        "kategori_data": kategori_data,
        "subkategori_data": subkategori_data,
        "pekerjaan_data": pekerjaan_data,
    }

    return render(request, 'pekerjaan/pekerjaan.html', context)
def status_pekerjaan_view(request):
    """
    View untuk menampilkan dan mengelola status pekerjaan jasa.
    TODO: Implementasikan logika untuk mengambil data dari database dan memperbarui status.
    """
    # Dummy data untuk pekerjaan jasa
    pekerjaan_data = [
        {
            "subkategori": "Daily Cleaning",
            "pelanggan": "Budi",
            "total_biaya": "Rp 200.000",
            "tanggal_pemesanan": "2024-11-15",
            "tanggal_pekerjaan": "2024-11-18",
            "status": "Menunggu Pekerja Berangkat",
        },
        {
            "subkategori": "Setrika",
            "pelanggan": "Andi",
            "total_biaya": "Rp 150.000",
            "tanggal_pemesanan": "2024-11-16",
            "tanggal_pekerjaan": "2024-11-19",
            "status": "Pekerja Tiba Di Lokasi",
        },
        {
            "subkategori": "Pembersihan Dapur",
            "pelanggan": "Cici",
            "total_biaya": "Rp 300.000",
            "tanggal_pemesanan": "2024-11-17",
            "tanggal_pekerjaan": "2024-11-20",
            "status": "Pesanan Selesai",
        },
    ]

    context = {
        "pekerjaan_data": pekerjaan_data,
    }

    return render(request, 'pekerjaan/status_pekerjaan.html', context)

