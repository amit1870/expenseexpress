# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('kharch', '0003_auto_20160921_1733'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='spent',
            name='where',
        ),
        migrations.AddField(
            model_name='spent',
            name='validity',
            field=models.CharField(default=b'NA', max_length=5),
        ),
    ]
