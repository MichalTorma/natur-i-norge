from django.db import models

class NinDbManager(models.Manager):
    def get_queryset(self):
        qs = super().get_queryset()

        # if `use_db` is set on model use that for choosing the DB
        if hasattr(self.model, 'use_db'):
            qs = qs.using(self.model.use_db)

        return qs

class NinModel(models.Model):
    use_db = 'nin'
    objects = NinDbManager()

    class Meta:
        abstract = True