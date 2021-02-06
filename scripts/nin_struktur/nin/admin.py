from django.contrib import admin
from nin.models import NinLanguage


# Register your models here.
@admin.register(NinLanguage)
class NinLanguageAdmin(admin.ModelAdmin):
    pass