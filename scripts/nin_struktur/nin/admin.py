from django.contrib import admin
# from nin.models import NinDetail
from nin.models import NinMinortype
from nin.models import NinMajortype
import easy
# from django import forms


# Register your models here.
# @admin.register(NinLanguage)
# class NinLanguageAdmin(admin.ModelAdmin):
#     pass

# admin.register(NinDetail)

# # admin.autodiscover()
# @admin.register(NinMajortype)
# class NinDetailAdmin(admin.ModelAdmin):
#     # pass
#     fields = ('field_id', 'majortypegroup', 'order')

#     list_display = ['get_detail_id']
#     # fieldsets = (
#     #     (None, {
#     #         'fields': ('field_id', 'order')
#     #     }),
#     #     ('Advanced options', {
#     #         'classes': ('collapse',),
#     #         'fields': ('detail', 'majortypegroup'),
#     #     }),
#     # )

#     def get_detail_id(self, obj):
#         return obj.field_id
#     # get_author.short_description = 'Author'
#     # get_author.admin_order_field = 'book__author'

@admin.register(NinMinortype)
class NinMinorTypeAdmin(admin.ModelAdmin):
    list_fields = ('field_id', 'order')
    simple1 = easy.ForeignKeyAdminField('detail')
