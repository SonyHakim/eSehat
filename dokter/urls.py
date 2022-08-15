from django.urls import path
from . import views# SET THE NAMESPACE!
app_name = 'dokter' # Be careful setting the name to just /login use userlogin instead!

urlpatterns=[
    path('index/',views.index,name='index_dokter'),
    path('antrianpasien/',views.antrian,name='antrian_pasien'),
    path('rawatinap/',views.rawatinap,name='rawatinap'),
    path('rekamrawatinap/<int:id>',views.rawatinap_rekam,name='rekamrawatinap'),
    path('detail_rawatinap/<int:id>',views.detail_rawatinap,name='detail_rawatinap'),
    path('historyperiksapasien/',views.history,name='history_pasien'),
    path('periksapasien/<int:id>',views.periksa,name='periksa_pasien'),
    path('view_rawatinap/<int:id>',views.view_rawatinap,name='view_rawatinap'),
    # path('cariobat/',views.cariobat,name='cari_obat'),
    # path('tambahobat/<int:id>',views.tambahobat,name='tambah_obat'),
    path('hapusobat/<int:id>',views.hapusobat,name='hapus_obat'),

    # path('diagnosa/', views.diagnosa, name='diagnosa'),


    # path('logout/',views.user_logout,name='user_logout'),
    # path('user_login/',views.user_login,name='user_login'),
    # url(r'^register/$',views.register,name='register'),
    # url(r'^user_login/$',views.user_login,name='user_login'),
]