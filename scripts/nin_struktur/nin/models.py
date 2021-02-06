# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class NinDetail(models.Model):
    field_id = models.TextField(db_column='_id')  # Field renamed because it started with '_'.
    language = models.ForeignKey('NinLanguage', models.DO_NOTHING)
    key = models.TextField()
    value = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nin_Detail'


class NinElementarysegment(models.Model):
    field_id = models.TextField(db_column='_id')  # Field renamed because it started with '_'.
    lec = models.ForeignKey('NinLec', models.DO_NOTHING, blank=True, null=True)
    value = models.TextField()
    order = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nin_ElementarySegment'


class NinElementarysegmentcombination(models.Model):
    field_id = models.TextField(db_column='_id')  # Field renamed because it started with '_'.
    elementarysegmentgroup = models.ForeignKey('NinElementarysegmentgroup', models.DO_NOTHING, db_column='elementarySegmentGroup_id')  # Field name made lowercase.
    majortypelec = models.ForeignKey('NinMajortypelec', models.DO_NOTHING, db_column='majorTypeLEC_id', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'nin_ElementarySegmentCombination'


class NinElementarysegmentgroup(models.Model):
    field_id = models.TextField(db_column='_id')  # Field renamed because it started with '_'.
    elementarysegment = models.ForeignKey(NinElementarysegment, models.DO_NOTHING, db_column='elementarySegment_id')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'nin_ElementarySegmentGroup'


class NinElementarysegmentgroupdetail(models.Model):
    elementarysegmentgroup = models.ForeignKey(NinElementarysegmentgroup, models.DO_NOTHING, db_column='elementarySegmentGroup_id')  # Field name made lowercase.
    lec = models.ForeignKey('NinLec', models.DO_NOTHING, blank=True, null=True)
    value = models.TextField(blank=True, null=True)
    detail = models.ForeignKey(NinDetail, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nin_ElementarySegmentGroupDetail'


class NinGadmodifier(models.Model):
    majortypelec = models.ForeignKey('NinMajortypelec', models.DO_NOTHING, db_column='majorTypeLEC_id')  # Field name made lowercase.
    majortype = models.ForeignKey('NinMajortype', models.DO_NOTHING, db_column='majorType_id', blank=True, null=True)  # Field name made lowercase.
    lec = models.ForeignKey('NinLec', models.DO_NOTHING, blank=True, null=True)
    species = models.ForeignKey('NinSpecies', models.DO_NOTHING)
    value = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nin_GadModifier'


class NinGadscale(models.Model):
    m7scale = models.AutoField(db_column='m7Scale')  # Field name made lowercase.
    m3scale = models.IntegerField(db_column='m3Scale', blank=True, null=True)  # Field name made lowercase.
    constancy = models.TextField(db_column='Constancy', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'nin_GadScale'


class NinGadvalue(models.Model):
    elementarysegmentcombination = models.ForeignKey(NinElementarysegmentcombination, models.DO_NOTHING, db_column='elementarySegmentCombination_id')  # Field name made lowercase.
    species = models.ForeignKey('NinSpecies', models.DO_NOTHING)
    majortype = models.ForeignKey('NinMajortype', models.DO_NOTHING, db_column='majorType_id', blank=True, null=True)  # Field name made lowercase.
    valuem7scale = models.ForeignKey(NinGadscale, models.DO_NOTHING, db_column='valueM7Scale_id', blank=True, null=True)  # Field name made lowercase.
    valuem3scale = models.ForeignKey(NinGadscale, models.DO_NOTHING, db_column='valueM3Scale_id', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'nin_GadValue'


class NinLec(models.Model):
    field_id = models.TextField(db_column='_id')  # Field renamed because it started with '_'.
    parentlec = models.ForeignKey('self', models.DO_NOTHING, db_column='parentLec_id', blank=True, null=True)  # Field name made lowercase.
    structuringprocess = models.ForeignKey('NinStructuringprocess', models.DO_NOTHING, db_column='structuringProcess_id', blank=True, null=True)  # Field name made lowercase.
    patternofvariation = models.ForeignKey('NinPatternofvariation', models.DO_NOTHING, db_column='patternOfVariation_id', blank=True, null=True)  # Field name made lowercase.
    knowledgebaserelations = models.IntegerField(db_column='knowledgeBaseRelations', blank=True, null=True)  # Field name made lowercase.
    knowledgebasedivision = models.IntegerField(db_column='knowledgeBaseDivision', blank=True, null=True)  # Field name made lowercase.
    spatialscale = models.IntegerField(db_column='spatialScale', blank=True, null=True)  # Field name made lowercase.
    detail = models.ForeignKey(NinDetail, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nin_LEC'


class NinLectype(models.Model):
    field_id = models.TextField(db_column='_id')  # Field renamed because it started with '_'.
    detail = models.ForeignKey(NinDetail, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nin_LECType'


class NinLanguage(models.Model):
    field_id = models.TextField(db_column='_id')  # Field renamed because it started with '_'.
    name = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nin_Language'


class NinMajortype(models.Model):
    field_id = models.TextField(db_column='_id')  # Field renamed because it started with '_'.
    majortypegroup = models.ForeignKey('NinMajortypegroup', models.DO_NOTHING, db_column='majorTypeGroup_id', blank=True, null=True)  # Field name made lowercase.
    order = models.IntegerField(blank=True, null=True)
    detail = models.ForeignKey(NinDetail, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nin_MajorType'


class NinMajortypegroup(models.Model):
    field_id = models.TextField(db_column='_id')  # Field renamed because it started with '_'.
    detail = models.ForeignKey(NinDetail, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nin_MajorTypeGroup'


class NinMajortypelec(models.Model):
    field_id = models.TextField(db_column='_id')  # Field renamed because it started with '_'.
    lec = models.ForeignKey(NinLec, models.DO_NOTHING, blank=True, null=True)
    majortype = models.ForeignKey(NinMajortype, models.DO_NOTHING, db_column='majorType_id', blank=True, null=True)  # Field name made lowercase.
    lectype = models.ForeignKey(NinLectype, models.DO_NOTHING, db_column='lecType_id', blank=True, null=True)  # Field name made lowercase.
    axis = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nin_MajorTypeLEC'


class NinMappingscale(models.Model):
    field_id = models.AutoField(db_column='_id')  # Field renamed because it started with '_'.
    name = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nin_MappingScale'


class NinMinortype(models.Model):
    field_id = models.TextField(db_column='_id')  # Field renamed because it started with '_'.
    majortype = models.ForeignKey(NinMajortype, models.DO_NOTHING, db_column='majorType_id', blank=True, null=True)  # Field name made lowercase.
    detail = models.ForeignKey(NinDetail, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nin_MinorType'


class NinMinortypescaled(models.Model):
    field_id = models.TextField(db_column='_id')  # Field renamed because it started with '_'.
    minortype = models.ForeignKey(NinMinortype, models.DO_NOTHING, db_column='minorType_id')  # Field name made lowercase.
    mappingscale = models.ForeignKey(NinMappingscale, models.DO_NOTHING, db_column='mappingScale_id', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'nin_MinorTypeScaled'


class NinMinortypestandardsegment(models.Model):
    minortype = models.ForeignKey(NinMinortype, models.DO_NOTHING, db_column='minorType_id')  # Field name made lowercase.
    standardsegment = models.ForeignKey('NinStandardsegment', models.DO_NOTHING, db_column='standardSegment_id')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'nin_MinorTypeStandardSegment'


class NinPatternofvariation(models.Model):
    field_id = models.TextField(db_column='_id')  # Field renamed because it started with '_'.
    detail = models.ForeignKey(NinDetail, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nin_PatternOfVariation'


class NinSpecies(models.Model):
    scientificnameid = models.AutoField(db_column='scientificNameId')  # Field name made lowercase.
    scientificname = models.TextField(db_column='scientificName', blank=True, null=True)  # Field name made lowercase.
    author = models.TextField(blank=True, null=True)
    vernacularname = models.TextField(db_column='vernacularName', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'nin_Species'


class NinStandardsegment(models.Model):
    field_id = models.TextField(db_column='_id')  # Field renamed because it started with '_'.
    majortypelec = models.ForeignKey(NinMajortypelec, models.DO_NOTHING, db_column='majorTypeLEC_id', blank=True, null=True)  # Field name made lowercase.
    order = models.IntegerField(blank=True, null=True)
    detail = models.ForeignKey(NinDetail, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nin_StandardSegment'


class NinStandardsegmentelement(models.Model):
    standardsegment = models.ForeignKey(NinStandardsegment, models.DO_NOTHING, db_column='standardSegment_id')  # Field name made lowercase.
    elementarysegment = models.ForeignKey(NinElementarysegment, models.DO_NOTHING, db_column='elementarySegment_id')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'nin_StandardSegmentElement'


class NinStructuringprocess(models.Model):
    field_id = models.TextField(db_column='_id')  # Field renamed because it started with '_'.
    detail = models.ForeignKey(NinDetail, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nin_StructuringProcess'
