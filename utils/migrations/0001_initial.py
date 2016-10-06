# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Country',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(unique=True, max_length=50)),
                ('abrcode', models.CharField(unique=True, max_length=10)),
                ('url', models.URLField(unique=True, max_length=100, blank=True)),
                ('code', models.CharField(unique=True, max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='District',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('district', models.CharField(unique=True, max_length=100)),
                ('abrcode', models.CharField(unique=True, max_length=10)),
                ('url', models.URLField(unique=True, max_length=100, blank=True)),
                ('vcount', models.PositiveIntegerField(default=0)),
                ('code', models.CharField(unique=True, max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='State',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('state', models.CharField(unique=True, max_length=70)),
                ('abrcode', models.CharField(unique=True, max_length=10)),
                ('url', models.URLField(unique=True, max_length=100, blank=True)),
                ('vcount', models.PositiveIntegerField(default=0)),
                ('code', models.CharField(unique=True, max_length=10)),
                ('country', models.ForeignKey(to='utils.Country')),
            ],
        ),
        migrations.CreateModel(
            name='Tehsil',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('tehsil', models.CharField(unique=True, max_length=100)),
                ('abrcode', models.CharField(unique=True, max_length=10)),
                ('url', models.URLField(unique=True, max_length=100, blank=True)),
                ('vcount', models.PositiveIntegerField(default=0)),
                ('code', models.CharField(unique=True, max_length=10)),
                ('district', models.ForeignKey(to='utils.District')),
            ],
        ),
        migrations.CreateModel(
            name='Village',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('village', models.CharField(unique=True, max_length=100)),
                ('abrcode', models.CharField(unique=True, max_length=10)),
                ('url', models.URLField(unique=True, max_length=100, blank=True)),
                ('pincode', models.PositiveIntegerField(unique=True)),
                ('districtcode', models.ForeignKey(to='utils.District')),
                ('statecode', models.ForeignKey(to='utils.State')),
                ('tehsil', models.ForeignKey(to='utils.Tehsil')),
                ('tehsilcode', models.ForeignKey(related_name='tehsilcode', to='utils.Tehsil')),
            ],
        ),
        migrations.AddField(
            model_name='district',
            name='state',
            field=models.ForeignKey(to='utils.State'),
        ),
    ]
