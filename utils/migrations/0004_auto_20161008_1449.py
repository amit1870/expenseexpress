# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0003_country_scount'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='village',
            name='districtcode',
        ),
        migrations.RemoveField(
            model_name='village',
            name='statecode',
        ),
        migrations.RemoveField(
            model_name='village',
            name='tehsilcode',
        ),
        migrations.AlterField(
            model_name='district',
            name='abrcode',
            field=models.CharField(max_length=10, blank=True),
        ),
        migrations.AlterField(
            model_name='district',
            name='code',
            field=models.CharField(max_length=10, blank=True),
        ),
        migrations.AlterField(
            model_name='district',
            name='district',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='district',
            name='url',
            field=models.URLField(max_length=100, blank=True),
        ),
        migrations.AlterField(
            model_name='state',
            name='abrcode',
            field=models.CharField(max_length=10, blank=True),
        ),
        migrations.AlterField(
            model_name='state',
            name='code',
            field=models.CharField(max_length=10, blank=True),
        ),
        migrations.AlterField(
            model_name='state',
            name='state',
            field=models.CharField(max_length=70),
        ),
        migrations.AlterField(
            model_name='state',
            name='url',
            field=models.URLField(max_length=100, blank=True),
        ),
        migrations.AlterField(
            model_name='tehsil',
            name='abrcode',
            field=models.CharField(max_length=10, blank=True),
        ),
        migrations.AlterField(
            model_name='tehsil',
            name='code',
            field=models.CharField(max_length=10, blank=True),
        ),
        migrations.AlterField(
            model_name='tehsil',
            name='tehsil',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='tehsil',
            name='url',
            field=models.URLField(max_length=100, blank=True),
        ),
        migrations.AlterField(
            model_name='village',
            name='abrcode',
            field=models.CharField(max_length=10, blank=True),
        ),
        migrations.AlterField(
            model_name='village',
            name='pincode',
            field=models.PositiveIntegerField(blank=True),
        ),
        migrations.AlterField(
            model_name='village',
            name='url',
            field=models.URLField(max_length=100, blank=True),
        ),
        migrations.AlterField(
            model_name='village',
            name='village',
            field=models.CharField(max_length=100),
        ),
    ]
