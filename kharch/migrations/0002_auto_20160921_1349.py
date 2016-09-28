# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('kharch', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(unique=True, max_length=10)),
                ('code', models.CharField(unique=True, max_length=2)),
            ],
        ),
        migrations.AlterField(
            model_name='spent',
            name='item',
            field=models.ForeignKey(to='kharch.Item'),
        ),
    ]
