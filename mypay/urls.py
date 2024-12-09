from django.urls import path
from . import views

urlpatterns = [
    path('', views.mypay_view, name='mypay'),  # Root URL untuk MyPay
    path('transaksi/', views.transaksi_view, name='transaksi'),  # URL untuk transaksi
]
