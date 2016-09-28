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
            name='Spent',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('item', models.CharField(max_length=20)),
                ('price', models.DecimalField(max_digits=5, decimal_places=1)),
                ('date', models.DateField()),
                ('reason', models.CharField(max_length=255, blank=True)),
                ('payment', models.CharField(max_length=2)),
                ('where', models.CharField(max_length=100, blank=True)),
                ('needed', models.BooleanField(default=True)),
                ('category', models.ForeignKey(to='kharch.Category')),
                ('spent_by', models.ForeignKey(default=utils.current_user.get_current_user, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
