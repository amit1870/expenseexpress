from django import template
from kharch.models import Item
register = template.Library()


def inherited_by(item):
	item = Item.objects.get(name=item)
	try:
		inherit = item.inherited_by.get()
	except:
		return None
	
	return inherit

register.filter('inherited_by', inherited_by)

def get_category(categories):
	return [code for code,name in categories if code != "SL"]

register.filter('get_category', get_category)


def status(stats,idx):
	return stats[idx]

register.filter('status', status)
