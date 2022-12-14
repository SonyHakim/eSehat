from multiprocessing.sharedctypes import Value
from sqlite3 import Cursor
import requests
# import http.client
import json
from asyncio.windows_events import NULL
from django.shortcuts import render, redirect ,get_object_or_404
from django.template.context import RequestContext
from django.http import HttpResponseRedirect, HttpResponse
from dokter.decorators import dokter_area
from pasien.models import Pasien
from datetime import date
from dokter.models import RekamMedis, Temp_Obat, Diagnosa, RawatInap 
from pegawaiadmin.models import Antrian, Pendaftaran
from django.db.models import Q 
from django.db import connection
from django.contrib import messages

# Create your views here.
@dokter_area
def index(request):
    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai']
    }
    return render(request, 'hal_admin/dokter/home.html', data)

@dokter_area
def antrian(request):
    if request.session['jenis_akun'] == "dokter":
        hasil = RekamMedis.objects.all().select_related('idpendaftaran').filter(idantrian__is_dokterumum=True, idantrian__statusdokter="belum").order_by('created_on')
    elif request.session['jenis_akun'] == "dokter_gigi":
        hasil = RekamMedis.objects.all().select_related('idpendaftaran').filter(idantrian__is_doktergigi=True, idantrian__statusdokter="belum").order_by('created_on')
    elif request.session['jenis_akun'] == "dokter_kia":
        hasil = RekamMedis.objects.all().select_related('idpendaftaran').filter(idantrian__is_dokterkia=True, idantrian__statusdokter="belum").order_by('created_on')
    elif request.session['jenis_akun'] == "dokter_gizi":
        hasil = RekamMedis.objects.all().select_related('idpendaftaran').filter(idantrian__is_doktergizi=True, idantrian__statusdokter="belum").order_by('created_on')
        
    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'data': hasil
    }
        # print(hasil.get().idpendaftaran.norm.norm)
        # print(hasil.get().idantrian.noantrian)
    return render(request, 'hal_admin/dokter/antrian.html', data)

@dokter_area
def history(request):
    if request.session['jenis_akun'] == "dokter":
        hasil = RekamMedis.objects.all().select_related('idpendaftaran').filter(created_on__contains=date.today(), idantrian__is_dokterumum=True, idantrian__statusdokter="selesai").order_by('created_on')
    elif request.session['jenis_akun'] == "dokter_gigi":
        hasil = RekamMedis.objects.all().select_related('idpendaftaran').filter(created_on__contains=date.today(), idantrian__is_doktergigi=True, idantrian__statusdokter="selesai").order_by('created_on')
    elif request.session['jenis_akun'] == "dokter_kia":
        hasil = RekamMedis.objects.all().select_related('idpendaftaran').filter(created_on__contains=date.today(), idantrian__is_dokterkia=True, idantrian__statusdokter="selesai").order_by('created_on')
    elif request.session['jenis_akun'] == "dokter_gizi":
        hasil = RekamMedis.objects.all().select_related('idpendaftaran').filter(created_on__contains=date.today(), idantrian__is_doktergizi=True, idantrian__statusdokter="selesai").order_by('created_on')
    
    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'data': hasil
    }
    # print(hasil.get().idpendaftaran.norm.norm)
    # print(hasil.get().idantrian.noantrian)
    return render(request, 'hal_admin/dokter/history.html', data)

# @dokter_area
# def diagnosa(request):
#     hasil = Diagnosa.objects.all()

#     data = {
#         'sessionnya' : request.session['jenis_akun'],
#         'namaakun' : request.session['namapegawai'],
#         'data': hasil
#     }
#     return render(request, 'hal_admin/pegawaiadmin/pegawai.html', data)

@dokter_area
def rawatinap(request):
    hasil = RawatInap.objects.all().order_by('created_on')
    
    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'data': hasil
    }
    # print(hasil.get().idpendaftaran.norm.norm)
    # print(hasil.get().idantrian.noantrian)
    return render(request, 'hal_admin/dokter/rawatinap.html', data)

@dokter_area
def detail_rawatinap(request,id):
    rInap = get_object_or_404(RawatInap, id = id)
    
    if request.session['jenis_akun'] == "dokter":
        hasil = RekamMedis.objects.all().select_related('idpendaftaran').filter(idantrian__is_dokterumum=True, idRawatInap = id, idantrian__statusdokter="selesai").order_by('created_on')
    elif request.session['jenis_akun'] == "dokter_gigi":
        hasil = RekamMedis.objects.all().select_related('idpendaftaran').filter(idantrian__is_doktergigi=True, idRawatInap = id, idantrian__statusdokter="selesai").order_by('created_on')
    elif request.session['jenis_akun'] == "dokter_kia":
        hasil = RekamMedis.objects.all().select_related('idpendaftaran').filter(idantrian__is_dokterkia=True, idRawatInap = id, idantrian__statusdokter="selesai").order_by('created_on')
    elif request.session['jenis_akun'] == "dokter_gizi":
        hasil = RekamMedis.objects.all().select_related('idpendaftaran').filter(idantrian__is_doktergizi=True, idRawatInap = id, idantrian__statusdokter="selesai").order_by('created_on')
    
    if request.method == 'POST':
        rInap.tanggal_selesai = request.POST['tanggal_selesai']
        rInap.save()
        return redirect('/dokter/rawatinap/')

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'rInap': rInap,
        'rMedis': hasil
    }

    return render(request, 'hal_admin/dokter/detail_rawatinap.html', data)

@dokter_area
def rawatinap_rekam(request,id):
    rInap = get_object_or_404(RawatInap, id = id)
    if request.method == 'POST':
        rekamM = RekamMedis()
        rekamM.idantrian = rInap.idantrian
        rekamM.iddokter = rInap.iddokter
        rekamM.rawat_inap = 'y'
        rekamM.idpendaftaran = rInap.idpendaftaran
        rekamM.idRawatInap = get_object_or_404(RawatInap, id = id)
        rekamM.id_diagnosa = get_object_or_404(Diagnosa, id = request.POST['diagnosa'])
        if request.POST['diagnosa2']:
            rekamM.id_diagnosa2 = get_object_or_404(Diagnosa, id = request.POST['diagnosa2'])
        
        if request.POST['diagnosa3']:
            rekamM.id_diagnosa3 = get_object_or_404(Diagnosa, id = request.POST['diagnosa3'])
        # rekamM.id_diagnosa2 = get_object_or_404(Diagnosa, id = request.POST['diagnosa2'])
        # rekamM.id_diagnosa3 = get_object_or_404(Diagnosa, id = request.POST['diagnosa3'])
        rekamM.save()

        return redirect('/dokter/detail_rawatinap/' + str(id))

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'rInap': rInap,
        'listdiagnosa' : Diagnosa.objects.all(),
    }

    return render(request, 'hal_admin/dokter/rawatinap_rekammedis.html', data)


@dokter_area
def periksa(request , id):
    obj = get_object_or_404(RekamMedis, id = id)
    idpasien = "periksapasien/"+ str(id)
    pesanobat = Temp_Obat.objects.all().filter(created_on__contains=date.today(), url__contains=idpasien)
    if request.method == 'POST':

        obj.id_diagnosa = get_object_or_404(Diagnosa, id = request.POST['id_diagnosa'])
        if request.POST['id_diagnosa2']:
            obj.id_diagnosa2 = get_object_or_404(Diagnosa, id = request.POST['id_diagnosa2'])

        if request.POST['id_diagnosa3']:
            obj.id_diagnosa3 = get_object_or_404(Diagnosa, id = request.POST['id_diagnosa3'])


        # obj.id_diagnosa3 = get_object_or_404(Diagnosa, id = request.POST['id_diagnosa3'])
        obj.rawat_inap = request.POST['rawat_inap']
        if request.POST['rawat_inap'] == "y":
            inapRawat = RawatInap()
            inapRawat.idantrian = obj.idantrian
            inapRawat.iddokter = obj.iddokter
            inapRawat.idpendaftaran = obj.idpendaftaran
            inapRawat.save()
            # print(request.POST['rawat_inap'])
        # print(request.POST['id_diagnosa'])
        # obj.iddokter = request.session['pegawai_id'],
        obj.save()

        with connection.cursor() as cursor:
            cursor.execute('SELECT pp.norm, pp.namapasien, pp.notelp, pgp.gejalaawal, dgd1.nama_diagnosa AS diagnosa1, dgd2.nama_diagnosa AS diagnosa2, dgd3.nama_diagnosa AS diagnosa3, CONCAT(DAY(dgd1.updated_on), " ", MONTH(dgd1.updated_on), " ", YEAR(dgd1.updated_on)) FROM dokter_rekammedis AS drm LEFT JOIN pegawaiadmin_pendaftaran AS pgp ON pgp.id = drm.idantrian_id LEFT JOIN pasien_pasien AS pp ON pp.id = pgp.norm_id LEFT JOIN dokter_diagnosa AS dgd1 ON dgd1.id = drm.id_diagnosa_id LEFT JOIN dokter_diagnosa AS dgd2 ON dgd2.id = drm.id_diagnosa2_id LEFT JOIN dokter_diagnosa AS dgd3 ON dgd3.id = drm.id_diagnosa3_id WHERE drm.id = %s', [id])
            # 1 norm, 2. nama_pasien 3. no_telp 4. gejala_awal, 5. diagnosa1 6. diagnosa2, 7. diagnosa3 8. tanggal
            result = cursor.fetchall()[0]
            message = """Assalamualaikum {}\nIni hasil pemeriksaan dari Klinik Az-Zainiyah | Pondok Pesantren Nurul Jadid\nNomor Rekam Medis : {}\nTanggal Pemeriksaan : {}\nNama Pasien : {}\nGejala : {}\nDiagnosa Pertama : {}\nDiagnosa Kedua : {}\nDiagnosa Ketiga : {}""".format(result[1], result[0], result[7], result[1], result[3], result[4], result[5], result[6])
            # print(cursor.fetchall()[0])
            data = { "text": message, "to": result[2] }
            encoded_data = json.dumps(data).encode('utf-8')

            r = requests.post('https://demo.maxchat.id/demo2/api/messages/push', data=encoded_data, headers={
                'Content-Type': 'application/json', 'Authorization': 'bearer VjZDHQfLR2HMfLbKwuE7AZ'})
            print (r.text)

        return redirect('/dokter/antrianpasien/')
        # print(request.META.get('HTTP_REFERER'))
    else:
        data = {
            'sessionnya' : request.session['jenis_akun'],
            'namaakun' : request.session['namapegawai'],
            'id_petugas' : request.session['pegawai_id'],
            'data': obj,
            'pesanan': pesanobat,
            'listdiagnosa' : Diagnosa.objects.all(),
        }
        return render(request, 'hal_admin/dokter/periksa.html', data)

@dokter_area
def kirim_notifikasi(request, id):
    with connection.cursor() as cursor:
        cursor.execute('SELECT pp.norm, pp.namapasien, pp.notelp, pgp.gejalaawal FROM dokter_rekammedis AS drm INNER JOIN pegawaiadmin_pendaftaran AS pgp ON pgp.id = drm.idantrian_id INNER JOIN pasien_pasien AS pp ON pp.id = pgp.norm_id WHERE drm.id = %s', [id])
        result = cursor.fetchall()[0]
        message = """Nomor Rekam Medis : {}\nNama Pasien {}\nGejala {}""".format(result[0], result[1], result[3])
        # print(cursor.fetchall()[0])
        data = { "text": message, "to": result[2] }
        encoded_data = json.dumps(data).encode('utf-8')

        r = requests.post('https://demo.maxchat.id/demo2/api/messages/push', data=encoded_data, headers={
            'Content-Type': 'application/json', 'Authorization': 'bearer VjZDHQfLR2HMfLbKwuE7AZ'})
        print (r.text)
        
    return redirect('/dokter/antrianpasien/')

    # data = {"text": "Coba kirim pesan", "to": "{{notelp}}"}

    # data = {
    #     'sessionnya' : request.session['jenis_akun'],
    #     'namaakun' : request.session['namapegawai'],
    #     'id_petugas' : request.session['pegawai_id'],
    #     'data': obj + pesan, 
    #     'listdiagnosa' : Diagnosa.objects.all(),
    # }
    # return render(request, 'hal_admin/dokter/periksa.html', data)
        # data = {"text": "Coba kirim pesan", "to": "081357422458"}
        # encoded_data = json.dumps(data).encode('utf-8')

        # r = requests.post('https://demo.maxchat.id/demo2/api/messages/push', data=encoded_data, headers={
        #     'Content-Type': 'application/json', 'Authorization': 'bearer VjZDHQfLR2HMfLbKwuE7AZ'})
        # print (r.text)


        # return redirect('/dokter/antrianpasien/')
        # data = {"text": "Coba kirim pesan", "to": "081357422458"}

        # http = urllib3.PoolManager()

        # encoded_data = json.dumps(data).encode('utf-8')

        # r = http.request(
        #     'POST',
        #     'https://demo.maxchat.id/demo2/api/messages/push',
        #     body=data,
        #     headers={'Content-Type': 'application/json', 'Authorization': 'bearer VjZDHQfLR2HMfLbKwuE7AZ'}
        # )

@dokter_area
def view_rawatinap(request, id):
    obj = get_object_or_404(RekamMedis, id = id)
    print(obj.idpendaftaran.norm.norm)
    idpasien = "periksapasien/"+ str(id)
    pesanobat = Temp_Obat.objects.all().filter(created_on__contains=date.today(), url__contains=idpasien)
    if request.method == 'POST':
        # tempobt = Temp_Obat.objects.all().filter(created_on__contains=date.today(),url__contains=request.META.get('HTTP_REFERER')) 
        # ant = get_object_or_404(Antrian, id = id)
          
        # for obt in tempobt:
        #     psnobat = PemesananObat()
        #     psnobat.idobat = Obat.objects.get(id = obt.id_obat)
        #     psnobat.jumlah_obat = obt.jumlah_obat
        #     psnobat.subtotal_obat = obt.jumlah_obat * obt.harga_obat
        #     psnobat.idrm = RekamMedis.objects.get(id = id)
        #     psnobat.save()
        #     obat = get_object_or_404(Obat, id = obt.id_obat)
        #     obat.stok_obat = obat.stok_obat - obt.jumlah_obat
        #     obat.save()
            
        # tempobt.delete()
        # ant.statusdokter = "selesai"
           
        # ant.save()
        # if request.method == "POST":
        #     if request.method.POST.get(''):
        #         saveresults = Diagnosa()
        #         saveresults.nama_diagnosa = request.method.POST.get('')
        #         saveresults.save()
        #         messages.success(request, "Sukses Menyimpan Data" + request.method.POST.get('')+"Sukses...!")
        #         return render(request, 'hal_admin/dokter/periksa.html')
        # else:
        #     return render(request, 'hal_admin/dokter/periksa.html')

        # print(request.POST['rawat_inap'] | "ok")
        obj.id_diagnosa = get_object_or_404(Diagnosa, id = request.POST['id_diagnosa'])
        if request.POST['id_diagnosa2']:
            obj.id_diagnosa2 = get_object_or_404(Diagnosa, id = request.POST['id_diagnosa2'])

        if request.POST['id_diagnosa3']:
            obj.id_diagnosa3 = get_object_or_404(Diagnosa, id = request.POST['id_diagnosa3'])


        # obj.id_diagnosa3 = get_object_or_404(Diagnosa, id = request.POST['id_diagnosa3'])
        obj.rawat_inap = request.POST['rawat_inap']
        if request.POST['rawat_inap'] == "y":
            inapRawat = RawatInap()
            inapRawat.idantrian = obj.idantrian
            inapRawat.iddokter = obj.iddokter
            inapRawat.idpendaftaran = obj.idpendaftaran
            inapRawat.save()
            # print(request.POST['rawat_inap'])
        # print(request.POST['id_diagnosa'])
        # obj.iddokter = request.session['pegawai_id'],
        obj.save()
        return redirect('/dokter/antrianpasien/')
        # print(request.META.get('HTTP_REFERER'))

    data = {
        'sessionnya' : request.session['jenis_akun'],
        'namaakun' : request.session['namapegawai'],
        'id_petugas' : request.session['pegawai_id'],
        'data': obj,
        'pesanan': pesanobat,
        'listdiagnosa' : Diagnosa.objects.all(),
    }
    return render(request, 'hal_admin/dokter/view_rawatinap.html', data)


# def cariobat(request):
#     # if request.is_ajax():
#     #     q = request.GET.get('q')
#     #     if q is not None:            
#     #         results = Obat.objects.filter(  
#     #         	Q( nama_obat__contains = q ) )          
#     #         # print(results)
#     #         return render(request,'hal_admin/dokter/cariobat.html', {'results': results})

# def tambahobat(request, id):
#     results = Obat.objects.filter(id=id)
#     print(results.get().nama_obat)
#     print(request.META.get('HTTP_REFERER'))
#     temp = Temp_Obat()
#     temp.id_obat = id
#     temp.nama_obat = results.get().nama_obat
#     temp.jumlah_obat = 1
#     temp.harga_obat = results.get().harga_obat
#     temp.url = request.META.get('HTTP_REFERER')
#     temp.save()

#     return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

def hapusobat(request, id):
    dt = Temp_Obat.objects.get(id=id)
    dt.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

