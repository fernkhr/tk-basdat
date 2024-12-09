from django.urls import path
from . import views

app_name = 'subkategori_jasa'

urlpatterns = [
    path('user/<int:subkategori_id>/', views.subkategori_jasa_user, name='subkategori_jasa_user'),
    path('pekerja/<int:subkategori_id>/', views.subkategori_jasa_pekerja, name='subkategori_jasa_pekerja'),
    path('pekerja/profil/<int:pekerja_id>/', views.profil_pekerja, name='profil_pekerja'),
]

