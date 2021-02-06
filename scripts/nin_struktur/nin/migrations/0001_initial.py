# Generated by Django 3.1.6 on 2021-02-06 17:25

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='NinDetail',
            fields=[
                ('field_id', models.TextField(db_column='_id', primary_key=True, serialize=False)),
                ('key', models.TextField()),
                ('value', models.TextField(blank=True, null=True)),
            ],
            options={
                'db_table': 'nin_Detail',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinElementarysegment',
            fields=[
                ('field_id', models.TextField(db_column='_id', primary_key=True, serialize=False)),
                ('value', models.TextField()),
                ('order', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'nin_ElementarySegment',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinElementarysegmentcombination',
            fields=[
                ('field_id', models.TextField(db_column='_id', primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'nin_ElementarySegmentCombination',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinElementarysegmentgroup',
            fields=[
                ('field_id', models.TextField(db_column='_id', primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'nin_ElementarySegmentGroup',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinGadscale',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('m7scale', models.IntegerField(db_column='m7Scale')),
                ('m3scale', models.IntegerField(blank=True, db_column='m3Scale', null=True)),
                ('constancy', models.TextField(blank=True, db_column='Constancy', null=True)),
            ],
            options={
                'db_table': 'nin_GadScale',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinGadvalue',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('valuem3scale', models.IntegerField(blank=True, db_column='valueM3Scale_id', null=True)),
            ],
            options={
                'db_table': 'nin_GadValue',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinLanguage',
            fields=[
                ('field_id', models.TextField(db_column='_id', primary_key=True, serialize=False)),
                ('name', models.TextField(blank=True, null=True)),
            ],
            options={
                'db_table': 'nin_Language',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinLec',
            fields=[
                ('field_id', models.TextField(db_column='_id', primary_key=True, serialize=False)),
                ('knowledgebaserelations', models.IntegerField(blank=True, db_column='knowledgeBaseRelations', null=True)),
                ('knowledgebasedivision', models.IntegerField(blank=True, db_column='knowledgeBaseDivision', null=True)),
                ('spatialscale', models.IntegerField(blank=True, db_column='spatialScale', null=True)),
            ],
            options={
                'db_table': 'nin_LEC',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinLectype',
            fields=[
                ('field_id', models.TextField(db_column='_id', primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'nin_LECType',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinMajortype',
            fields=[
                ('field_id', models.TextField(db_column='_id', primary_key=True, serialize=False)),
                ('order', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'nin_MajorType',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinMajortypegroup',
            fields=[
                ('field_id', models.TextField(db_column='_id', primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'nin_MajorTypeGroup',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinMajortypelec',
            fields=[
                ('field_id', models.TextField(db_column='_id', primary_key=True, serialize=False)),
                ('axis', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'nin_MajorTypeLEC',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinMappingscale',
            fields=[
                ('field_id', models.IntegerField(db_column='_id', primary_key=True, serialize=False)),
                ('name', models.TextField(blank=True, null=True)),
            ],
            options={
                'db_table': 'nin_MappingScale',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinMinortype',
            fields=[
                ('field_id', models.TextField(db_column='_id', primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'nin_MinorType',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinMinortypescaled',
            fields=[
                ('field_id', models.TextField(db_column='_id', primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'nin_MinorTypeScaled',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinMinortypestandardsegment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'db_table': 'nin_MinorTypeStandardSegment',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinPatternofvariation',
            fields=[
                ('field_id', models.TextField(db_column='_id', primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'nin_PatternOfVariation',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinSpecies',
            fields=[
                ('scientificnameid', models.IntegerField(db_column='scientificNameId', primary_key=True, serialize=False)),
                ('scientificname', models.TextField(blank=True, db_column='scientificName', null=True)),
                ('author', models.TextField(blank=True, null=True)),
                ('vernacularname', models.TextField(blank=True, db_column='vernacularName', null=True)),
            ],
            options={
                'db_table': 'nin_Species',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinStandardsegment',
            fields=[
                ('field_id', models.TextField(db_column='_id', primary_key=True, serialize=False)),
                ('order', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'nin_StandardSegment',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinStandardsegmentelement',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'db_table': 'nin_StandardSegmentElement',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinStructuringprocess',
            fields=[
                ('field_id', models.TextField(db_column='_id', primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'nin_StructuringProcess',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinElementarysegmentgroupdetail',
            fields=[
                ('elementarysegmentgroup', models.OneToOneField(db_column='elementarySegmentGroup_id', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='nin.ninelementarysegmentgroup')),
                ('value', models.TextField(blank=True, null=True)),
            ],
            options={
                'db_table': 'nin_ElementarySegmentGroupDetail',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NinGadmodifier',
            fields=[
                ('majortypelec', models.OneToOneField(db_column='majorTypeLEC_id', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='nin.ninmajortypelec')),
                ('value', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'nin_GadModifier',
                'managed': False,
            },
        ),
    ]