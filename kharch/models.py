from django.db import models
from django.contrib.auth.models import User
from utils.current_user import get_current_user
from django.db.models import signals
from django.dispatch import receiver

class Payment(models.Model):
	name = models.CharField(max_length=10,blank=False, unique=True)
	code = models.CharField(max_length=2, blank=False, unique=True)

	def __str__(self):
		return "%s" % self.name

class PaymentMethod(models.Model):
	url = models.URLField(max_length=200,blank=True)
	code = models.CharField(max_length=10,blank=False,unique=True)

	def __str__(self):
		return self.code


class Cash(models.Model):
	MONEY_TYPE = (
			("ELEC","Electronic"),
			("CASH","Cash"),
		)
	loaded_by = models.ForeignKey(User, default=get_current_user)
	capital = models.PositiveIntegerField(default=0)
	date = models.DateField(auto_now=True)
	form = models.CharField(max_length=4, choices=MONEY_TYPE,default="CASH")

	def __str__(self):
		return "%s" % self.capital

class Category(models.Model):
	name = models.CharField(max_length=10,blank=False, unique=True)
	code = models.CharField(max_length=2, blank=False, unique=True)

	def __str__(self):
		return "%s" % (self.name)


class Item(models.Model):
	added_by = models.ForeignKey(User, default=get_current_user)
	inherited_by = models.ManyToManyField(User,related_name="inherited")
	name = models.CharField(blank=False,max_length=20,unique=True)
	cost = models.DecimalField(max_digits=5,decimal_places=1)
	category = models.ForeignKey(Category)
	date = models.DateField(auto_now=True)

	def __str__(self):
		return "%s" % (self.name)

class Spent(models.Model):
	spent_by = models.ForeignKey(User, default=get_current_user)
	item 	= models.ForeignKey(Item)
	category = models.ForeignKey(Category)
	price 	= models.DecimalField(max_digits=5,decimal_places=1)
	date 	= models.DateField(blank=False)
	paid 	= models.BooleanField(default=True)
	pay_date = models.DateField(blank=True)
	payment	= models.ForeignKey(Payment)
	validity = models.CharField(max_length=5,default="NA")
	needed 	= models.BooleanField(default=True)

	def __str__(self):
		return "%s %s" % (self.item, self.price)