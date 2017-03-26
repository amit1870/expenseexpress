# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
import utils.current_user


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Cash',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('capital', models.PositiveIntegerField(default=0)),
                ('date', models.DateField(auto_now=True)),
                ('form', models.CharField(default=b'CASH', max_length=4, choices=[(b'ELEC', b'Electronic'), (b'CASH', b'Cash')])),
                ('loaded_by', models.ForeignKey(default=utils.current_user.get_current_user, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(unique=True, max_length=10)),
                ('code', models.CharField(unique=True, max_length=2)),
            ],
        ),
        migrations.CreateModel(
            name='Item',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(unique=True, max_length=20)),
                ('cost', models.DecimalField(max_digits=5, decimal_places=1)),
                ('date', models.DateField(auto_now=True)),
                ('added_by', models.ForeignKey(default=utils.current_user.get_current_user, to=settings.AUTH_USER_MODEL)),
                ('category', models.ForeignKey(to='kharch.Category')),
                ('inherited_by', models.ManyToManyField(related_name='inherited', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(unique=True, max_length=10)),
                ('code', models.CharField(unique=True, max_length=2)),
            ],
        ),
        migrations.CreateModel(
            name='PaymentMethod',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('url', models.URLField(blank=True)),
                ('code', models.CharField(unique=True, max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Spent',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('price', models.DecimalField(max_digits=5, decimal_places=1)),
                ('date', models.DateField()),
                ('paid', models.BooleanField(default=True)),
                ('pay_date', models.DateField(blank=True)),
                ('validity', models.CharField(default=b'NA', max_length=5)),
                ('needed', models.BooleanField(default=True)),
                ('category', models.ForeignKey(to='kharch.Category')),
                ('item', models.ForeignKey(to='kharch.Item')),
                ('payment', models.ForeignKey(to='kharch.Payment')),
                ('spent_by', models.ForeignKey(default=utils.current_user.get_current_user, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
