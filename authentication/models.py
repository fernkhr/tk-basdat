from django.db import models
from django.contrib.auth.models import User

class Pengguna(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)  # Menghubungkan ke model User Django
    nama = models.CharField(max_length=100)
    jenis_kelamin = models.CharField(max_length=10, choices=[('L', 'Laki-laki'), ('P', 'Perempuan')])
    no_hp = models.CharField(max_length=15, unique=True)  # Nomor HP unik
    tanggal_lahir = models.DateField()
    alamat = models.TextField()

    def __str__(self):
        return self.nama

class Pekerja(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)  # Menghubungkan ke model User Django
    nama = models.CharField(max_length=100)
    jenis_kelamin = models.CharField(max_length=10, choices=[('L', 'Laki-laki'), ('P', 'Perempuan')])
    no_hp = models.CharField(max_length=15, unique=True)  # Nomor HP unik
    tanggal_lahir = models.DateField()
    alamat = models.TextField()
    nama_bank = models.CharField(
        max_length=50,
        choices=[
            ('GoPay', 'GoPay'),
            ('OVO', 'OVO'),
            ('Virtual Account BCA', 'Virtual Account BCA'),
            ('Virtual Account BNI', 'Virtual Account BNI'),
            ('Virtual Account Mandiri', 'Virtual Account Mandiri')
        ]
    )
    no_rekening = models.CharField(max_length=30)
    npwp = models.CharField(max_length=20, unique=True)  # NPWP unik
    url_foto = models.URLField()

    class Meta:
        unique_together = ('nama_bank', 'no_rekening')  # Kombinasi nama_bank dan no_rekening harus unik

    def __str__(self):
        return self.nama

