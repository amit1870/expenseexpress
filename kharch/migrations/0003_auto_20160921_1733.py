# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('kharch', '0002_auto_20160921_1349'),
    ]

    operations = [
        migrations.AlterField(
            model_name='spent',
            name='payment',
            field=models.ForeignKey(to='kharch.Payment'),
        ),
    ]
