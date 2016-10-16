from django.db import models

class Country(models.Model):
	name = models.CharField(blank=False,max_length=50, unique=True)
	abrcode = models.CharField(blank=False,max_length=10, unique=True)
	url = models.URLField(max_length=100, unique=True, blank=True)
	code = models.CharField(blank=False, max_length=10, unique=True)
	scount = models.PositiveIntegerField(default=0)

	def __str__(self):
		return "%s" % self.name

class State(models.Model):
	country = models.ForeignKey(Country)
	state = models.CharField(blank=False, max_length=70)
	abrcode = models.CharField(blank=True, max_length=10)
	url = models.URLField(max_length=100, blank=True)
	vcount = models.PositiveIntegerField(default=0)
	code = models.CharField(blank=True, max_length=10)

	def __str__(self):
		return "%s" % self.state

class District(models.Model):
	state = models.ForeignKey(State)
	district = models.CharField(blank=False, max_length=100)
	abrcode = models.CharField(blank=True, max_length=10)
	url = models.URLField(max_length=100, blank=True)
	vcount = models.PositiveIntegerField(default=0)
	code = models.CharField(blank=True, max_length=10)
	hq = models.CharField(blank=True, max_length=100)
	population = models.PositiveIntegerField(default=0)
	area = models.PositiveIntegerField(default=0)
	density = models.PositiveIntegerField(default=0)

	def __str__(self):
		return "%s" % self.district

class Tehsil(models.Model):
	district = models.ForeignKey(District)
	tehsil =  models.CharField(blank=False, max_length=100)
	abrcode = models.CharField(blank=True, max_length=10)
	url = models.URLField(max_length=100, blank=True)
	vcount = models.PositiveIntegerField(default=0)
	code = models.CharField(blank=True, max_length=10)

	def __str__(self):
		return "%s" % self.tehsil

class Village(models.Model):
	tehsil = models.ForeignKey(Tehsil)
	village =  models.CharField(blank=False, max_length=100)
	abrcode = models.CharField(blank=True, max_length=10)
	url = models.URLField(max_length=100, blank=True)
	pincode = models.PositiveIntegerField(blank=True)
	
	def __str__(self):
		return "%s" % self.village

