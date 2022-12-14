from django.urls import path
from . import views# SET THE NAMESPACE!
app_name = 'apoteker' # Be careful setting the name to just /login use userlogin instead!

urlpatterns=[
    path('index/',views.index,name='index_apoteker'),
    path('dtobat/',views.index_obat,name='index_obat'),
    path('historyobat/',views.history,name='history_obatnya'),
    path('tambahobat/',views.tambah_obat,name='tambah_obatnya'),
    path('antrianobat/',views.antrian,name='antrian_obat'),
    path('pesananobat/<int:id>',views.pesanan_obat,name='pesanan_obat'),
    path('editobat/<int:id>',views.edit_obat,name='edit_obatnya'),
    path('hapusobat/<int:id>',views.hapus_obat,name='hapus_obatnya'),

    # path('logout/',views.user_logout,name='user_logout'),
    # path('user_login/',views.user_login,name='user_login'),
    # url(r'^register/$',views.register,name='register'),
    # url(r'^user_login/$',views.user_login,name='user_login'),
]