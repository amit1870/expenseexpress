from django.contrib import admin
from .models import Cash, Item, Spent, Category, Payment

admin.site.register(Category)
admin.site.register(Cash)
admin.site.register(Item)
admin.site.register(Payment)


class SpentAdmin(object):
	list_display = ('spent_by', 'item', 'category', 'price', 'date','payment')
	
		

admin.site.register(Spent)