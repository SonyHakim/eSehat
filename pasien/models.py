from django.db import models

class Daerah(models.Model):
    nama_daerah = models.CharField(max_length=200)
    updated_on = models.DateTimeField(auto_now= True)
    created_on = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        ordering = ['-created_on']

    def __str__(self):
        return self.nama_daerah

class Lembaga(models.Model):
    nama_lembaga = models.CharField(max_length=200)
    updated_on = models.DateTimeField(auto_now= True)
    created_on = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        ordering = ['-created_on']

    def __str__(self):
        return self.nama_lembaga

# Create your models here.
class Pasien(models.Model):
    JENIS_KELAMIN_CHOICES = (
        ('pria', 'Pria'),
        ('wanita', 'Wanita'),
    )
    GOLDAR_CHOICES = (
        ('A', 'A'),
        ('B', 'B'),
        ('AB', 'AB'),
        ('O', 'O'),
    )
    STATUS_CHOICES = (
        ('UMUM', 'Umum'),
        ('BPJS', 'BPJS'),
        ('Santri', 'Santri'),
    )
    norm = models.CharField(max_length=25, unique=True)
    namapasien = models.CharField(max_length=200)
    ttl = models.DateField()
    jenis_kelamin = models.CharField(max_length=10, choices=JENIS_KELAMIN_CHOICES)
    golongan_darah = models.CharField(max_length=10, choices=GOLDAR_CHOICES)
    alamat = models.TextField(blank = True)
    notelp = models.CharField(max_length=15)
    daerah = models.ForeignKey(Daerah, on_delete=models.CASCADE)
    lembaga = models.ForeignKey(Lembaga, on_delete=models.CASCADE)
    status = models.CharField(max_length=10, choices=STATUS_CHOICES)
    updated_on = models.DateTimeField(auto_now= True)
    created_on = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_on']

    def __str__(self):
        return self.namapasien