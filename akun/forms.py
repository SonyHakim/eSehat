from django import forms  
from akun.models import DataPegawai, User

class DataPegawaiForm(forms.ModelForm):  
    class Meta:  
        model = DataPegawai  
        fields = "__all__"  

class UserForm(forms.ModelForm):  
    class Meta:  
        model = User  
        fields = "__all__"  