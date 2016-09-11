# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('kharch', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cash',
            name='capital',
            field=models.PositiveIntegerField(default=0),
        ),
    ]
