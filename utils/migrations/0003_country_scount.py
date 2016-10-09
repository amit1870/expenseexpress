# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('utils', '0002_auto_20161006_1249'),
    ]

    operations = [
        migrations.AddField(
            model_name='country',
            name='scount',
            field=models.PositiveIntegerField(default=0),
        ),
    ]
