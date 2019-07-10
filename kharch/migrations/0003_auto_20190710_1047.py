# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('kharch', '0002_auto_20190710_1045'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='code',
            field=models.CharField(default=b'Khana', unique=True, max_length=2, choices=[(b'RT', b'Khana'), (b'KP', b'Vastra'), (b'MK', b'Ghar')]),
        ),
    ]
