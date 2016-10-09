# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='district',
            name='abrcode',
            field=models.CharField(unique=True, max_length=10, blank=True),
        ),
        migrations.AlterField(
            model_name='district',
            name='code',
            field=models.CharField(unique=True, max_length=10, blank=True),
        ),
        migrations.AlterField(
            model_name='state',
            name='abrcode',
            field=models.CharField(unique=True, max_length=10, blank=True),
        ),
        migrations.AlterField(
            model_name='state',
            name='code',
            field=models.CharField(unique=True, max_length=10, blank=True),
        ),
        migrations.AlterField(
            model_name='tehsil',
            name='abrcode',
            field=models.CharField(unique=True, max_length=10, blank=True),
        ),
        migrations.AlterField(
            model_name='tehsil',
            name='code',
            field=models.CharField(unique=True, max_length=10, blank=True),
        ),
        migrations.AlterField(
            model_name='village',
            name='abrcode',
            field=models.CharField(unique=True, max_length=10, blank=True),
        ),
    ]
