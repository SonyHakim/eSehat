from django.contrib import admin
from django.urls import path,include, re_path
from pelayanan_klinik import views as pkl
from django.views.static import serve 
from django.conf import settings

admin.site.site_header="e Sehat"
admin.site.site_title="Admin Portal | e-Sehat"
admin.site.index_title="Selamat datang di Aplikasi e-Sehat"


urlpatterns = [
    path('',pkl.index,name='index_klinik'),
    path('admin/', admin.site.urls),
    path('akun/', include('akun.urls',namespace="akun")),
    path('pegawaiadmin/', include('pegawaiadmin.urls',namespace="pegawaiadmin")),
    path('dokter/', include('dokter.urls',namespace="dokter")),
    # path('perawat/', include('perawat.urls',namespace="perawat")),
    # path('apoteker/', include('apoteker.urls',namespace="apoteker")),
    re_path(r'^media/(?P<path>.*)$', serve,{'document_root': settings.MEDIA_ROOT}), 
    re_path(r'^static/(?P<path>.*)$', serve,{'document_root': settings.STATIC_DIR}), 

]
