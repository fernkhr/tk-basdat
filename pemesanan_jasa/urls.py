from django.urls import path
from . import views

app_name = 'pemesanan_jasa'

urlpatterns = [
    path('create/', views.create_pesanan, name='create_pesanan'),
    path('view/', views.view_pesanan, name='view_pesanan'),
    path('cancel/<int:pesanan_id>/', views.cancel_pesanan, name='cancel_pesanan'),
]
