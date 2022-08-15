from django.db import models
from pegawaiadmin.models import Antrian, Pendaftaran
from akun.models import User
# Create your models here.

class Diagnosa(models.Model):
    code_diagnosa = models.CharField(max_length=200)
    nama_diagnosa = models.CharField(max_length=200)
    updated_on = models.DateTimeField(auto_now= True)
    created_on = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        ordering = ['-created_on']

    def __str__(self):
        return "{}. {}".format(self.code_diagnosa, self.nama_diagnosa)

class RawatInap(models.Model):
    idantrian = models.ForeignKey(Antrian,on_delete=models.CASCADE)
    iddokter = models.ForeignKey(User,blank = True, null = True,on_delete=models.CASCADE)
    idpendaftaran = models.ForeignKey(Pendaftaran, on_delete=models.CASCADE)
    tanggal_selesai = models.DateTimeField(blank = True, null = True)
    tanggal_masuk = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now= True)
    created_on = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_on']

class RekamMedis(models.Model):
    isRawatInap = (
        ('y', 'y'),
        ('t', 't'),
    )
    idantrian = models.ForeignKey(Antrian,on_delete=models.CASCADE)
    iddokter = models.ForeignKey(User,blank = True, null = True,on_delete=models.CASCADE)
    idRawatInap = models.ForeignKey(RawatInap, blank=True, null=True ,on_delete=models.CASCADE)
    idpendaftaran = models.ForeignKey(Pendaftaran, on_delete=models.CASCADE)
    id_diagnosa = models.ForeignKey(Diagnosa, blank=True, null=True ,on_delete=models.CASCADE)
    id_diagnosa2 = models.ForeignKey(Diagnosa, blank=True, null=True ,on_delete=models.CASCADE, related_name="diagnosa2")
    id_diagnosa3 = models.ForeignKey(Diagnosa, blank=True, null=True ,on_delete=models.CASCADE, related_name="diagnosa3")
    rawat_inap = models.CharField(max_length=1, choices=isRawatInap)
    updated_on = models.DateTimeField(auto_now= True)
    created_on = models.DateTimeField(auto_now_add=True)
    class Meta:
        ordering = ['-created_on']

    def __str__(self):
        return "{}. {}".format(self.idpendaftaran, self.diagnosa)

class Temp_Obat(models.Model):
    id_obat = models.IntegerField()
    nama_obat = models.TextField(blank = True, null = True,)
    jumlah_obat = models.BigIntegerField()
    harga_obat = models.BigIntegerField()
    url = models.TextField(blank = True, null = True,)
    updated_on = models.DateTimeField(auto_now= True)
    created_on = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        ordering = ['-created_on']

    def __str__(self):
        return self.nama_obat