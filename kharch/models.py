from django.db import models
from django.contrib.auth.models import User
from utils.current_user import get_current_user

PAYMENT_MODE = (
	('CA','Rokra'),
	('DB','Online'),
	('CR','Credit')
	)


class Cash(models.Model):
	loaded_by = models.ForeignKey(User, default=get_current_user)
	capital = models.PositiveIntegerField(default=0)
	date = models.DateField(auto_now=True)

	def __str__(self):
		return "%s" % self.capital

class Item(models.Model):
	SELECT 	= "SL"
	EDIBLE 	= "RT"
	WEAR 	= "KP"
	LIVE 	= "MK"
	SEX 	= "XX"
	OTHER 	= "OT"

	CATEGORY_CHOICES = (
		(SELECT, 'Select any category'),
		(EDIBLE, 'Roti'),
		(WEAR, 'Kapda'),
		(LIVE, 'Makan'),
		(SEX, 'Sex'),
		(OTHER, 'Other')
	)
	added_by = models.ForeignKey(User, default=get_current_user)
	inherited_by = models.ManyToManyField(User,related_name="inherited")
	name = models.CharField(blank=False,max_length=20,unique=True)
	cost = models.DecimalField(max_digits=5,decimal_places=1)
	category = models.CharField(max_length=2,choices=CATEGORY_CHOICES,default=EDIBLE)
	date = models.DateField(auto_now=True)

	def __str__(self):
		return "%s" % (self.name)

class Spent(models.Model):
	spent_by = models.ForeignKey(User, default=get_current_user)
	item 	= models.CharField(blank=False,max_length=20)
	category = models.CharField(max_length=2,default=Item.EDIBLE)
	price 	= models.DecimalField(max_digits=5,decimal_places=1)
	date 	= models.DateField(auto_now=True)
	reason 	= models.CharField(max_length=255, blank=True)
	payment	= models.CharField(max_length=2)
	where 	= models.CharField(max_length=100, blank=True)
	needed 	= models.BooleanField(default=True)

	def __str__(self):
		return "%s %s" % (self.item, self.price)



