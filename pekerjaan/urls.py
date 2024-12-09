from django.urls import path
from . import views

urlpatterns = [
    path('', views.pekerjaan_view, name='pekerjaan'),  # URL untuk daftar pekerjaan jasa
    path('status/', views.status_pekerjaan_view, name='status_pekerjaan'),  # URL untuk status pekerjaan jasa
]
