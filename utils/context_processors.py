from kharch.models import Item, Payment, Category
from expenseexpress import settings

def expenseexpress(request):
	return {
		'request': request,
		'site_name' : settings.SITE_NAME,
		'meta_keywords' : settings.META_KEYWORDS,
		'meta_description' : settings.META_DESCRIPTION,
		'cat_code': [str(category.code) for category in Category.objects.all()],
		'categories': [category for category in Category.objects.all()],
		'payment': [payment for payment in Payment.objects.all()],
	}
	