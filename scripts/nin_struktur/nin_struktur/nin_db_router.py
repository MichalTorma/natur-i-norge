from django.db import models
from nin.models import *
import nin.models as M
...
class MyDBRouter(object):
    routed_models_list = [
        NinMajortype,
        NinMajortypegroup,
        NinDetail,
        NinMinortype,
        NinLanguage,
        NinLec,
        NinLectype,
        NinMajortypelec,
        NinMappingscale,
        NinElementarysegment,
        NinElementarysegmentgroup,
        NinElementarysegmentgroupdetail,
        NinElementarysegmentcombination,
        NinSpecies,
        NinGadmodifier,
        NinGadscale,
        NinGadvalue
    ]

    def db_for_read(self, model, **hints):
        """ reading SomeModel from otherdb """
        # print("request some model: " + str(model))

        if model in self.routed_models_list:
            # print('model in list')
            return 'nin'
        return None

    def db_for_write(self, model, **hints):
        """ writing SomeModel to otherdb """
        if model in self.routed_models_list:
            return 'nin'
        return None


# class NinDbManager(models.Manager):
#     def get_queryset(self):
#         qs = super().get_queryset()

#         # if `use_db` is set on model use that for choosing the DB
#         if hasattr(self.model, 'use_db'):
#             qs = qs.using(self.model.use_db)

#         return qs

# class NinModel(models.Model):
#     use_db = 'nin'
#     objects = NinDbManager()

#     class Meta:
#         abstract = True