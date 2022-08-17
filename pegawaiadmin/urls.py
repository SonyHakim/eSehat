from django.urls import path
from pasien import views as ps
from . import views# SET THE NAMESPACE!
app_name = 'pegawaiadmin' # Be careful setting the name to just /login use userlogin instead!

urlpatterns=[
    path('index/',views.index,name='index_pegawaiadmin'),
    path('dtpasien/',ps.index,name='index_pasien'),
    path('antrian/',views.antrian,name='index_antrian'),
    path('pembayaran/',views.pembayaran,name='pembayaran'),
    path('rekammedis/',views.history,name='history'),
    path('rekammedis/<int:id>',views.detailRekamMedis,name='history'),
    # path('pembayaran/<int:id>/bayar',views.detailbayar,name='detail_pembayaran'),
    path('tambahantrian/',views.tbantrian,name='tambahantrian'),
    path('anamnesa/<int:id>',views.edit_antrian,name='editantrian'),
    path('tambahpasien/',ps.tambah_pasien,name='tambahpasien'),
    # path('pdf/',views.generate_pdf,name='pdf2'),
    # path('print/<int:id>/pdf',views.generate_pdf,name='pdf'),
    path('hapuspasien/<int:id>',ps.hapus_pasien,name='hapuspasien'),
    path('editpasien/<int:id>',ps.edit_pasien,name='editpasien'),
    path('tambahdokter/', views.tambahdokter,name='tambahdokter'),

    path('pegawai/', views.getPegawai,name='pegawai'),
    path('tambahpegawai/', views.tambah_pegawai,name='tambahpegawai'),
    path('editpegawai/<int:id>', views.edit_pegawai,name='editpegawai'),
    path('hapuspegawai/<int:id>', views.hapus_pegawai,name='hapuspegawai'),

    path('lembaga/', views.get_lembaga,name='lembaga'),
    path('tambahlembaga/', views.tambah_lembaga,name='tambahlembaga'),
    path('editlembaga/<int:id>', views.edit_lembaga,name='editlembaga'),
    path('hapuslembaga/<int:id>', views.hapus_lembaga,name='hapuslembaga'),

    path('daerah/', views.get_daerah,name='daerah'),
    path('tambahdaerah/', views.tambah_daerah,name='tambahdaerah'),
    path('editdaerah/<int:id>', views.edit_daerah,name='editdaerah'),
    path('hapusdaerah/<int:id>', views.hapus_daerah,name='hapusdaerah'),

    path('diagnosa/', views.get_diagnosa,name='diagnosa'),
    path('tambahdiagnosa/', views.tambah_diagnosa,name='tambahdiagnosa'),
    path('editdiagnosa/<int:id>', views.edit_diagnosa,name='editdiagnosa'),
    path('hapusdiagnosa/<int:id>', views.hapus_diagnosa,name='hapusdiagnosa'),

    path('laporanpemeriksaan', views.view_laporanpemeriksaan,name='laporanpemeriksaan'),


    # path('logout/',views.user_logout,name='user_logout'),
    # path('user_login/',views.user_login,name='user_login'),
    # url(r'^register/$',views.register,name='register'),
    # url(r'^user_login/$',views.user_login,name='user_login'),
]