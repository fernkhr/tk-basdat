"""tkbasdat URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include  # gunakan include untuk memasukkan urls aplikasi
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),  # URL untuk admin Django
    path('',include('authentication.urls')),
    path('dashboard/',include('dashboard.urls')),
    path('dashboard/', include('dashboard.urls')),  # URL untuk dashboard
    path('testimoni/', include('testimoni.urls')),  # URL untuk testimoni
    path('diskon/', include('diskon.urls')),  # URL untuk diskon
    path('mypay/', include('mypay.urls')),  # Tambahkan ini
    path('pekerjaan/', include('pekerjaan.urls')),  # Tambahkan ini

]