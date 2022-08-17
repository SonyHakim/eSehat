from email import message
from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponseRedirect, HttpResponse
from pymysql import NULL
from pegawaiadmin.decorators import pegawaiadmin_area
from pegawaiadmin.models import Pendaftaran, Antrian, BiayaPemeriksaan, Pembayaran
from dokter.models import RekamMedis, RawatInap, Diagnosa
from datetime import date
from pasien.models import Pasien, Lembaga, Daerah
from akun.models import DataPegawai, Akun
from akun.forms import DataPegawaiForm, UserForm
from pegawaiadmin.forms import AntrianForm, PendaftaranForm, LembagaForm, DaerahForm
from dokter.forms import DiagnosaForm
from django.utils import timezone
import datetime
# from apoteker.models import PemesananObat
from .utils import render_to_pdf
from django.template.loader import render_to_string
from weasyprint import HTML
import tempfile
from django.core.files.storage import FileSystemStorage

@pegawaiadmin_area
def getPegawai(request):
    hasil = DataPegawai.objects.all()

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'data': hasil
    }
    return render(request, 'hal_admin/pegawaiadmin/pegawai.html', data)

@pegawaiadmin_area
def tambah_pegawai(request):
    form = DataPegawaiForm(request.POST or None, request.FILES or None)
    
    if request.method == 'POST':
        if form.is_valid():
            # ps = Pasien()
            # ps.namapasien = request.POST['namapasien']
            # ps.save()
            # print(request.POST['namapasien'])
            form.save()
            # print("suksessssssssssssssssssssss")
            return redirect("/pegawaiadmin/pegawai/")
        pass

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'form':DataPegawaiForm(),
    }
    return render(request, 'hal_admin/pegawaiadmin/tambahpegawai.html', data)

@pegawaiadmin_area
def edit_pegawai(request, id):
    obj = get_object_or_404(DataPegawai, id = id) 
    form = DataPegawaiForm(request.POST or None, instance = obj)
    # save the data from the form and 
    # redirect to detail_view 
    # obj.status = request.POST['status'],
    if form.is_valid(): 
        form.save() 
        return redirect("/pegawaiadmin/pegawai/")  

    data = {
        'data':obj,
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'form': DataPegawaiForm(),
    }
    return render(request, 'hal_admin/pegawaiadmin/editpegawai.html', data)

@pegawaiadmin_area
def hapus_pegawai(request, id):
    dt = DataPegawai.objects.get(id=id)
    dt.delete()
    return redirect("/pegawaiadmin/pegawai/")

@pegawaiadmin_area
def get_diagnosa(request):
    hasil = Diagnosa.objects.all()

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'data': hasil
    }
    return render(request, 'hal_admin/master_data/diagnosa.html', data)

@pegawaiadmin_area
def tambah_diagnosa(request):
    form = DiagnosaForm(request.POST or None, request.FILES or None)
    
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            return redirect("/pegawaiadmin/diagnosa/")
    pass

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'form':DiagnosaForm(),
    }
    return render(request, 'hal_admin/master_data/diagnosa_tambah.html', data)

@pegawaiadmin_area
def edit_diagnosa(request, id):
    obj = get_object_or_404(Diagnosa, id = id)
    form = DiagnosaForm(request.POST or None, instance = obj)
    
    if form.is_valid(): 
        form.save() 
        return redirect("/pegawaiadmin/diagnosa/")

    data = {
        'data' : obj,
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
    }
    return render(request, 'hal_admin/master_data/diagnosa_edit.html', data)


@pegawaiadmin_area
def hapus_diagnosa(request, id):
    dt = Diagnosa.objects.get(id=id)
    dt.delete()
    return redirect("/pegawaiadmin/diagnosa/")

@pegawaiadmin_area
def get_daerah(request):
    hasil = Daerah.objects.all()

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'data': hasil
    }
    return render(request, 'hal_admin/master_data/daerah.html', data)

@pegawaiadmin_area
def view_laporanpemeriksaan(request):
    hasil = RekamMedis.objects.all()

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'data': hasil
    }
    return render(request, 'hal_admin/pegawaiadmin/laporan_pemeriksaan.html', data)


@pegawaiadmin_area
def tambah_daerah(request):
    form = DaerahForm(request.POST or None, request.FILES or None)
    
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            return redirect("/pegawaiadmin/daerah/")
        pass

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'form':DaerahForm(),
    }
    return render(request, 'hal_admin/master_data/daerah_tambah.html', data)

@pegawaiadmin_area
def edit_daerah(request, id):
    obj = get_object_or_404(Daerah, id = id)
    form = DaerahForm(request.POST or None, instance = obj)
    
    if form.is_valid(): 
        form.save() 
        return redirect("/pegawaiadmin/daerah/")

    data = {
        'data' : obj,
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
    }
    return render(request, 'hal_admin/master_data/daerah_edit.html', data)



@pegawaiadmin_area
def hapus_daerah(request, id):
    dt = Daerah.objects.get(id=id)
    dt.delete()
    return redirect("/pegawaiadmin/daerah/")

@pegawaiadmin_area
def get_lembaga(request):
    hasil = Lembaga.objects.all()

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'data': hasil
    }
    return render(request, 'hal_admin/master_data/lembaga.html', data)

@pegawaiadmin_area
def tambah_lembaga(request):
    form = LembagaForm(request.POST or None, request.FILES or None)
    
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            return redirect("/pegawaiadmin/lembaga/")
        pass

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'form':LembagaForm(),
    }
    return render(request, 'hal_admin/master_data/lembaga_tambah.html', data)

@pegawaiadmin_area
def edit_lembaga(request, id):
    obj = get_object_or_404(Lembaga, id = id)
    form = LembagaForm(request.POST or None, instance = obj)
    
    if form.is_valid(): 
        form.save() 
        return redirect("/pegawaiadmin/lembaga/")

    data = {
        'data' : obj,
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
    }
    return render(request, 'hal_admin/master_data/lembaga_edit.html', data)

@pegawaiadmin_area
def hapus_lembaga(request, id):
    dt = Lembaga.objects.get(id=id)
    dt.delete()
    return redirect("/pegawaiadmin/lembaga/")

@pegawaiadmin_area
def tambah_user(request):
    form = UserForm(request.POST or None, request.FILES or None)
    
    if request.method == 'POST':
        if form.is_valid():
            # ps = Pasien()
            # ps.namapasien = request.POST['namapasien']
            # ps.save()
            # print(request.POST['namapasien'])
            form.save()
            # print("suksessssssssssssssssssssss")
            return redirect("/pegawaiadmin/datapegawai/")
        pass

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'form':UserForm(),
    }
    return render(request, 'hal_admin/pegawaiadmin/tambahuser.html', data)

@pegawaiadmin_area
def edit_user(request, id):
    obj = get_object_or_404(Akun, id = id)
    form = UserForm(request.POST or None, instance = obj)
    
    if form.is_valid(): 
        form.save() 
        return redirect("/pegawaiadmin/datapegawai/")

    data = {
        'data' : obj,
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
    }
    return render(request, 'hal_admin/pegawaiadmin/edituser.html', data)

@pegawaiadmin_area
def hapus_user(request, id):
    dt = Akun.objects.get(id=id)
    dt.delete()
    return redirect("/pegawaiadmin/datapegawai/")

@pegawaiadmin_area
def index(request):
    print(request.session['username'])
    all_pasien = Pasien.objects.all()
    all_pegawai = DataPegawai.objects.all()
    all_akun = Akun.objects.all()
    all_rawatinap = RawatInap.objects.all()
    total_pasien = all_pasien.count()
    total_pegawai = all_pegawai.count()
    total_akun = all_akun.count()
    total_rawatinap = all_rawatinap.count()

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'total_pasien': total_pasien,
        'total_pegawai': total_pegawai,
        'total_akun': total_akun,
        'total_rawatinap' : total_rawatinap, 
    }
    return render(request, 'hal_admin/pegawaiadmin/home.html', data)

@pegawaiadmin_area
def antrian(request):
    hasil = Pendaftaran.objects.all().select_related('norm','antrian').filter(tglantrian__contains=date.today()).order_by('created_on')    

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'data': hasil
    }
    print(hasil.query)
    return render(request, 'hal_admin/pegawaiadmin/antrian.html', data)

@pegawaiadmin_area
def tbantrian(request):
    hasil = Pasien.objects.all().order_by('-created_on')
    formdaftar = PendaftaranForm(request.POST or None, request.FILES or None)
    df = Pendaftaran.objects.all().select_related('norm','antrian').filter(tglantrian__contains=date.today()).order_by('-created_on')

    if request.method == 'POST':
        daftar = Pendaftaran()
        daftar.norm=Pasien.objects.get(id=request.POST['norm rekammedik'])
        daftar.tujuanpoli=request.POST['tujuanpoli']
        # daftar.gejalaawal= request.POST['gejalaawal']
        daftar.tglantrian = datetime.datetime.now()
        if df.count() == 0 :
            print("Kosong")
            counter = 1
            daftar.save()
            ant = Antrian(idpendaftaran=daftar, noantrian=counter)

            if  daftar.tujuanpoli == "Poli Umum":
                ant.is_dokterumum=True
                ant.statusdokter="belum"
                # ant.statusapoteker="belum"
            elif daftar.tujuanpoli == "Poli Gigi":
                ant.is_doktergigi=True
                ant.statusdokter="belum"
                # ant.statusapoteker="belum"
            elif daftar.tujuanpoli == "Poli KIA":
                ant.is_dokterkia=True
                ant.statusdokter="belum"
                # ant.statusapoteker="belum"
            elif daftar.tujuanpoli == "Poli Gizi":
                ant.is_doktergizi=True
                ant.statusdokter="belum"
                # ant.statusapoteker="belum"
            ant.save()
            rm = RekamMedis(idpendaftaran=daftar, idantrian=ant)
            rm.save()
        else:
            daftar.save()
            if  daftar.tujuanpoli == "Poli Umum":
                nolama = Antrian.objects.all().filter(created_on__contains=date.today(),is_dokterumum=True).order_by('-created_on')
            elif daftar.tujuanpoli == "Poli Gigi":
                nolama = Antrian.objects.all().filter(created_on__contains=date.today(),is_doktergigi=True).order_by('-created_on')
            elif daftar.tujuanpoli == "Poli KIA":
                nolama = Antrian.objects.all().filter(created_on__contains=date.today(),is_dokterkia=True).order_by('-created_on')
            elif daftar.tujuanpoli == "Poli Gizi":
                nolama = Antrian.objects.all().filter(created_on__contains=date.today(),is_doktergizi=True).order_by('-created_on')
            print(nolama.first())
            ant = Antrian(idpendaftaran=daftar)
            if  daftar.tujuanpoli == "Poli Umum" :
                if nolama.count() == 0:
                    counter=1
                elif nolama.count() > 0:
                    counter = nolama.first().noantrian + 1
                ant.noantrian=counter
                ant.is_dokterumum=True
                ant.statusdokter="belum"
                # ant.statusapoteker="belum"
            elif daftar.tujuanpoli == "Poli Gigi" :
                if nolama.count() == 0:
                    counter=1
                elif nolama.count() > 0:
                    counter = nolama.first().noantrian + 1
                ant.noantrian=counter
                ant.is_doktergigi=True
                ant.statusdokter="belum"
                # ant.statusapoteker="belum"
            elif daftar.tujuanpoli == "Poli KIA" :
                if nolama.count() == 0:
                    counter=1
                elif nolama.count() > 0:
                    counter = nolama.first().noantrian + 1
                ant.noantrian=counter
                ant.is_dokterkia=True
                ant.statusdokter="belum"
                # ant.statusapoteker="belum"
            elif daftar.tujuanpoli == "Poli Gizi" :
                if nolama.count() == 0:
                    counter=1
                elif nolama.count() > 0:
                    counter = nolama.first().noantrian + 1
                ant.noantrian=counter
                ant.is_doktergizi=True
                ant.statusdokter="belum"
                # ant.statusapoteker="belum"
            ant.save()
            rm = RekamMedis(idpendaftaran=daftar, idantrian=ant)
            rm.save()
        # print(daftar.tujuanpoli)
        return redirect("/pegawaiadmin/antrian/")
        
    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'data' : hasil,
    }
    return render(request, 'hal_admin/pegawaiadmin/tambahantrian.html', data)

@pegawaiadmin_area
def edit_antrian(request, id):
    obj = get_object_or_404(Pendaftaran, id = id)
    hasil = Pasien.objects.all().order_by('-created_on')
    print(obj.norm_id)
    
    if request.method == 'POST':
        # obj.tujuanpoli=request.POST['tujuanpoli']
        obj.gejalaawal=request.POST['gejalaawal']
        obj.save()
        return redirect("/pegawaiadmin/antrian/")
    data = {
        'data':hasil,
        'dataDetail': obj,
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
    }
    return render(request, 'hal_admin/pegawaiadmin/tambahantrian.html',data)

@pegawaiadmin_area
def pembayaran(request):
    hasil = RekamMedis.objects.all().select_related('idpendaftaran', 'idantrian').filter(created_on__contains=date.today(),idantrian__statusdokter="selesai").order_by('created_on')
    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'data': hasil
    }
    # print(hasil.get().idpendaftaran.norm.norm)
    # print(hasil.get().idantrian.noantrian)
    return render(request, 'hal_admin/pegawaiadmin/listpembayaran.html', data)

@pegawaiadmin_area
def history(request):
    hasil = RekamMedis.objects.all().select_related('idpendaftaran', 'idantrian').order_by('created_on')
    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'data': hasil
    }
    # print(hasil.get().idpendaftaran.norm.norm)
    # print(hasil.get().idantrian.noantrian)
    return render(request, 'hal_admin/pegawaiadmin/history.html', data)

@pegawaiadmin_area
def detailRekamMedis(request , id):
    obj = get_object_or_404(RekamMedis, id = id)

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'data': obj
    }
    return render(request, 'hal_admin/pegawaiadmin/detailRekamMedis.html', data)

# @pegawaiadmin_area
# def detailbayar(request , id):
#     obj = get_object_or_404(RekamMedis, id = id)
#     # pesanobat = PemesananObat.objects.all().filter(created_on__contains=date.today(), idrm=id)
#     biayadokter = BiayaPemeriksaan.objects.all()[:1].get()
#     totalobat=0
#     for i in pesanobat:
#         totalobat += i.subtotal_obat 
#         # print(i.subtotal_obat) 
#     # print(totalobat)
#     harusbayar = biayadokter.biaya_pemeriksaan+totalobat
#     if request.method == 'POST':
#         ant = get_object_or_404(Antrian, idpendaftaran = id)
#         pemb = Pembayaran()
#         pemb.statusbayar = request.POST['statusbayar']
#         pemb.total_harga = harusbayar
#         pemb.uang_dibayarkan = request.POST['uang_dibayarkan']
#         pemb.idpendaftaran = Pendaftaran.objects.get(id = id)
#         # ant.statusapoteker = request.POST['statusapoteker']
#         ant.save()
#         pemb.save()
#         # print(request.POST['statusapoteker'])
#         return redirect('/pegawaiadmin/pembayaran/')

#     data = {
#         'sessionnya' : request.session['jenis_akun'],
#         'namaakun' : request.session['namapegawai'],
#         'data': obj,
#         # 'pesanan': pesanobat,
#         'totalobat': totalobat,
#         'biayadokter': biayadokter.biaya_pemeriksaan,
#         # 'total' : harusbayar
#     }
#     return render(request, 'hal_admin/pegawaiadmin/pesanan.html', data)

def tambahdokter(request):
    return render(request, 'tambahdokter.html')

def pdf(request):
    return render(request, 'hal_admin/pegawaiadmin/pdf/bayar.html')

# def generate_pdf(request, id):
#     hasil = RekamMedis.objects.all().select_related('idpendaftaran', 'idantrian').filter(id=id).order_by('created_on')
#     print(hasil.get().idpendaftaran.norm.norm)
#     pesanobat = PemesananObat.objects.all().filter(idrm=id)
#     biayadokter = BiayaPemeriksaan.objects.all()[:1].get()
#     totalobat=0
#     for i in pesanobat:
#         totalobat += i.subtotal_obat
#     harusbayar = biayadokter.biaya_pemeriksaan+totalobat
#     uangnya = Pembayaran.objects.all().filter(idpendaftaran=id).get()
#     data = {
#         'totalobat': totalobat,
#         'biayadokter': biayadokter.biaya_pemeriksaan,
#         'pesanan': pesanobat,
#         'nonota' : id,
#         'data' : hasil.get(),
#         'namaakun' : request.session['namapegawai'],
#         'total' : harusbayar,
#         'uang' : uangnya,
#         'kembalian' : uangnya.uang_dibayarkan - harusbayar
#     }
#     html_string = render_to_string('hal_admin/pegawaiadmin/pdf/bayar.html', data)

#     html = HTML(string=html_string)
#     html.write_pdf(target='/tmp/mypdf.pdf');

#     fs = FileSystemStorage('/tmp')
#     with fs.open('mypdf.pdf') as pdf:
#         response = HttpResponse(pdf, content_type='application/pdf')
#         # response['Content-Disposition'] = 'attachment; filename="mypdf.pdf"'
#         return response

#     return response