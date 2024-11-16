from django import forms
from authentication.models import Pengguna, Pekerja
from django.contrib.auth.forms import UserChangeForm
from django.contrib.auth.models import User

# Form untuk Pengguna
class PenggunaForm(forms.ModelForm):
    class Meta:
        model = Pengguna
        exclude = ['user', 'saldo_mypay', 'level']  # Jangan izinkan mengedit saldo dan level

# Form untuk Pekerja
class PekerjaForm(forms.ModelForm):
    class Meta:
        model = Pekerja
        exclude = ['user', 'saldo_mypay', 'rating', 'jumlah_pesanan_selesai', 'kategori_pekerjaan']
