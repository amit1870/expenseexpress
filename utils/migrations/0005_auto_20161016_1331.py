# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0004_auto_20161008_1449'),
    ]

    operations = [
        migrations.AddField(
            model_name='district',
            name='area',
            field=models.PositiveIntegerField(default=0),
        ),
        migrations.AddField(
            model_name='district',
            name='density',
            field=models.PositiveIntegerField(default=0),
        ),
        migrations.AddField(
            model_name='district',
            name='hq',
            field=models.CharField(max_length=100, blank=True),
        ),
        migrations.AddField(
            model_name='district',
            name='population',
            field=models.PositiveIntegerField(default=0),
        ),
    ]
