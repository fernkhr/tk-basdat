from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .forms import PenggunaForm, PekerjaForm
from authentication.models import Pengguna, Pekerja

@login_required
def dashboard(request):
    # Cek apakah pengguna adalah `Pengguna` atau `Pekerja`
    try:
        profile = request.user.pengguna
        is_pengguna = True
    except Pengguna.DoesNotExist:
        profile = request.user.pekerja
        is_pengguna = False

    # Pilih form yang sesuai
    if is_pengguna:
        form = PenggunaForm(instance=profile)
    else:
        form = PekerjaForm(instance=profile)

    # Proses form jika metode POST
    if request.method == 'POST':
        if is_pengguna:
            form = PenggunaForm(request.POST, instance=profile)
        else:
            form = PekerjaForm(request.POST, instance=profile)
        
        if form.is_valid():
            form.save()
            return redirect('dashboard:dashboard')  # Redirect ke dashboard setelah berhasil update

    # Kirim data ke template
    return render(request, 'dashboard.html', {'form': form, 'profile': profile, 'is_pengguna': is_pengguna})
