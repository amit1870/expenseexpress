# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('kharch', '0004_auto_20161001_0712'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='spent',
            name='reason',
        ),
        migrations.AddField(
            model_name='spent',
            name='paid',
            field=models.BooleanField(default=True),
        ),
    ]
