from django.urls import path
from . import views

urlpatterns = [
    path('', views.diskon_view, name='diskon'),
    path('beli/<str:kode_voucher>/', views.beli_voucher_view, name='beli_voucher'),
]
