from django.contrib import admin
from pasien.models import Pasien
from pasien.models import Daerah
from pasien.models import Lembaga
from dokter.models  import Diagnosa

# Register your models here.
admin.site.register(Pasien)
admin.site.register(Daerah)
admin.site.register(Lembaga)
admin.site.register(Diagnosa)
