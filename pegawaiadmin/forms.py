from pyexpat import model
from django import forms  
from pegawaiadmin.models import Antrian, Pendaftaran
from pasien.models import Lembaga

class AntrianForm(forms.ModelForm):  
    class Meta:  
        model = Antrian  
        fields = "__all__"  

class PendaftaranForm(forms.ModelForm):  
    class Meta:  
        model = Pendaftaran  
        fields = "__all__"   

class LembagaForm(forms.ModelForm):
    class Meta:
        model = Lembaga
        fields = "__all__"  