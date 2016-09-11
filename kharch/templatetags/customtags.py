from django import template
from kharch.models import Item
register = template.Library()


def inherited_by(item):
	item = Item.objects.get(name=item)
	print item
	try:
		inherit = item.inherited_by.get()
	except:
		return None
	
	return inherit

register.filter('inherited_by', inherited_by)

def get_category(categories):
	print [code for code,name in categories if code != "SL"]
	return [code for code,name in categories if code != "SL"]



register.filter('get_category', get_category)