from django.contrib import admin
from .models import Cash, Item, Spent

admin.site.register(Cash)
admin.site.register(Item)

class SpentAdmin(object):
	pass
	
		

admin.site.register(Spent)