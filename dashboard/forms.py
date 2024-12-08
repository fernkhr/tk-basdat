from django import forms
# from authentication.models import Pengguna, Pekerja
from django.contrib.auth.forms import UserChangeForm
from django.contrib.auth.models import User

class PenggunaForm(forms.Form):
    nama = forms.CharField(max_length=100)
    jenis_kelamin = forms.ChoiceField(choices=[('L', 'L'), ('P', 'P')])
    no_hp = forms.CharField(max_length=15)
    tanggal_lahir = forms.DateField(
        widget=forms.TextInput(attrs={'type': 'date'})
    )
    alamat = forms.CharField(widget=forms.Textarea)

class PekerjaForm(forms.Form):
    BANK_CHOICES = [
        ('GoPay', 'GoPay'),
        ('OVO', 'OVO'),
        ('Virtual Account BCA', 'Virtual Account BCA'),
        ('Virtual Account BNI', 'Virtual Account BNI'),
        ('Virtual Account Mandiri', 'Virtual Account Mandiri'),
    ]
    nama = forms.CharField(max_length=100)
    jenis_kelamin = forms.ChoiceField(choices=[('L', 'L'), ('P', 'P')])
    no_hp = forms.CharField(max_length=15)
    tanggal_lahir = forms.DateField(
        widget=forms.TextInput(attrs={'type': 'date'})
    )
    alamat = forms.CharField(widget=forms.Textarea)
    nama_bank = forms.ChoiceField(choices=BANK_CHOICES)
    no_rekening = forms.CharField(max_length=20)
    npwp = forms.CharField(max_length=20, required=False)
    link_foto = forms.URLField(required=False)
