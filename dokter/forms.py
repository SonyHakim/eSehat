from django import forms  
from dokter.models import Diagnosa

class DiagnosaForm(forms.ModelForm):
    class Meta:  
        model = Diagnosa  
        fields = "__all__"