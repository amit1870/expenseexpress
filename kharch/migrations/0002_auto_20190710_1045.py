# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('kharch', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='name',
            field=models.CharField(default=b'RT', unique=True, max_length=10, choices=[(b'RT', b'Khana'), (b'KP', b'Vastra'), (b'MK', b'Ghar')]),
        ),
    ]
