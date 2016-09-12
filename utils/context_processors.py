from kharch.models import Item, PAYMENT_MODE
from expenseexpress import settings

def expenseexpress(request):
	return {
		'request': request,
		'site_name' : settings.SITE_NAME,
		'meta_keywords' : settings.META_KEYWORDS,
		'meta_description' : settings.META_DESCRIPTION,
		'cat_code': [category[0] for category in Item.CATEGORY_CHOICES],
		'categories': Item.CATEGORY_CHOICES,
		'payment': PAYMENT_MODE,
	}
	