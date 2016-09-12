from django.shortcuts import render
from .models import Cash, Item, PAYMENT_MODE, Spent
from django.http import HttpResponseRedirect, HttpResponse, Http404
from .forms import CapitalForm, ItemForm
from django.core import urlresolvers
from django.contrib.auth.decorators import login_required
from utils.current_user import get_current_user
from itertools import chain


def index(request):
	user_id = get_current_user()

	if request.method == "GET" and user_id is not None:
		cash = Cash.objects.filter(loaded_by=user_id)
		cash = sum(cash.values_list('capital',flat=True))

		items = list(chain(Item.objects.filter(added_by=user_id), Item.objects.filter(inherited_by=user_id) ))

		spent = Spent.objects.filter(spent_by=user_id)

		roti = spent.filter(category='RT')
		roti = int(sum(roti.values_list('price',flat=True)))

		kapda = spent.filter(category='KP')
		kapda = int(sum(kapda.values_list('price',flat=True)))

		makan = spent.filter(category='MK')
		makan = int(sum(makan.values_list('price',flat=True)))

		other = spent.filter(category='OT')
		other = int(sum(other.values_list('price',flat=True)))

		sex   = spent.filter(category="XX")
		sex = int(sum(sex.values_list('price',flat=True)))

		form1 = CapitalForm()
		if cash > 0 :
			remain = (cash - sum([roti, kapda, makan, other, sex]))*100/cash
			gayab = 100 - remain
		else:
			remain = 0
			gayab = 0
		cash = cash - sum([roti, kapda, makan, other, sex])
		
		
		context = {}
		context['cash'] = cash
		context['roti'] = roti
		context['kapda'] = kapda
		context['makan'] = makan
		context['other'] = other
		context['sex'] 	= sex
		context['form1'] = form1
		context['items'] = items
		context['remain'] = remain
		context['gayab'] = gayab
		context['meta_keywords'] = "Overrided Meta Keywords"
		return render(request, 'kharch/index.html', context)

	if request.method == "POST" and user_id is not None:

		if request.POST['hidden'] == 'Capital':
			form = CapitalForm(request.POST)
			if form.is_valid():
				capital = int(request.POST['capital'])
				if capital > 0 :
					Cash.objects.create(capital=capital)

		elif request.POST['hidden'] == 'Item':

			total = 0.0
			brought = request.POST.getlist('items[]')
			for item in brought:
				total += float(request.POST[item])

			cash = Cash.objects.filter(loaded_by=user_id)
			cash = sum(cash.values_list('capital',flat=True))

			spent = Spent.objects.filter(spent_by=user_id)

			roti = spent.filter(category='RT')
			roti = int(sum(roti.values_list('price',flat=True)))

			kapda = spent.filter(category='KP')
			kapda = int(sum(kapda.values_list('price',flat=True)))

			makan = spent.filter(category='MK')
			makan = int(sum(makan.values_list('price',flat=True)))

			other = spent.filter(category='OT')
			other = int(sum(other.values_list('price',flat=True)))

			sex   = spent.filter(category="XX")
			sex = int(sum(sex.values_list('price',flat=True)))

			if total > (cash - (roti + kapda + makan + other + sex) ):
				url = urlresolvers.reverse('kharch:buy_error')
				return HttpResponseRedirect(url)

			for item in brought:
				payment = request.POST[item+"_sel"]
				obj = Item.objects.get(name=item)
				category = obj.category
				added_by = obj.added_by
				append = request.POST.getlist('append[]')
				
				if item in append :
					print "append %s" %item
					obj.inherited_by.add(user_id)
					obj.save()
				
				Spent.objects.create(item=item, category=category, payment=payment, price=request.POST[item])

		return HttpResponseRedirect(".")

	else:
		url = urlresolvers.reverse('accounts:login')
		return HttpResponseRedirect(url)

@login_required
def add_item(request):
	form = ItemForm()
	if request.method == "GET":
		context = {}
		context['form'] = form
		return render(request, 'kharch/add_item.html', context)

	elif request.method == "POST":
		form = ItemForm(request.POST)
		if form.is_valid():
			name = request.POST['name']
			cost = request.POST['cost']
			category = request.POST['category']
			Item.objects.create(name=name.capitalize(), cost=cost, category=category)

			url = urlresolvers.reverse('kharch:add_item')
			return HttpResponseRedirect(url)
		else:
			context = {}
			form = ItemForm()
			context['form'] = form
			context['error'] = "Item already exists."
			return render(request, 'kharch/add_item.html', context)


@login_required
def edit_item(request):
	user_id = get_current_user()
	if request.method == "GET":
		form = ItemForm()
		items = Item.objects.filter(added_by=user_id)
		categories = Item.CATEGORY_CHOICES
		cat_code = [category[0] for category in categories]
		context = {}
		context['form'] = form
		context['items'] = items
		context['categories'] = categories
		context['cat_code'] = cat_code
		context['payment'] = PAYMENT_MODE
		return render(request, 'kharch/edit_item.html', context)

	elif request.method == "POST":
		edited = request.POST.getlist('items[]')
		for item in edited:
			obj = Item.objects.get(name=item)
			name = request.POST[item] 
			cost = request.POST[item+"_cost"]
			category = request.POST[item+"_sel"]
			obj.name = name
			obj.cost = cost
			obj.category = category
			obj.save()

		url = urlresolvers.reverse('kharch:edit_item')
		return HttpResponseRedirect(url)

@login_required
def delete_item(request):
	user_id = get_current_user()
	if request.method == "GET":
		form = ItemForm()
		items = Item.objects.filter(added_by=user_id)
		context = {}
		context['form'] = form
		context['items'] = items
		return render(request, 'kharch/delete_item.html', context)

	elif request.method == "POST":
		edited = request.POST.getlist('items[]')
		for item in edited:
			obj = Item.objects.get(name=item)
			obj.delete()

		url = urlresolvers.reverse('kharch:delete_item')
		return HttpResponseRedirect(url)
	
@login_required
def history(request):
	user_id = get_current_user()
	context = {}

	items = list(chain(Item.objects.filter(added_by=user_id), Item.objects.filter(inherited_by=user_id)))
	
	spent = Spent.objects.filter(spent_by=user_id)

	roti = spent.filter(category='RT')
	roti = int(sum(roti.values_list('price',flat=True)))

	kapda = spent.filter(category='KP')
	kapda = int(sum(kapda.values_list('price',flat=True)))

	makan = spent.filter(category='MK')
	makan = int(sum(makan.values_list('price',flat=True)))

	other = spent.filter(category='OT')
	other = int(sum(other.values_list('price',flat=True)))

	sex   = spent.filter(category="XX")
	sex = int(sum(sex.values_list('price',flat=True)))

	spent_dict = {'RT':roti, 'KP':kapda, 'MK':makan, 'OT':other, 'XX': sex}

	series = []
	for item in items:

		data = int(sum(spent.filter(item=item.name).values_list('price',flat=True)))
		
		series.append("%s-%s-%d" %(item.category,item.name,data))

	context['series'] = "<|>".join(series)

	return render(request, 'kharch/history.html', context)


def search_item(request):
	if request.method == "GET":
		chars = request.GET['chars'].capitalize()
		if len(chars):
			items = Item.objects.filter(name__startswith=chars)
			names = []
			for item in items:
				names.append(item.name)
			return HttpResponse(",".join(names))

@login_required
def show_items(request):
	context = {}
	if request.method == "POST":
		suggestion = request.POST['suggest'].capitalize()
		if len(suggestion):
			items = Item.objects.filter(name__startswith=suggestion)
			context['items'] = items
			if items == []:
				context['error'] = True
		return render(request, 'kharch/show_items.html', context)
	else:
		return render(request, 'kharch/show_items.html', context)		

@login_required
def buy_error(request):
	context = {}
	if request.method == "GET":
		return render(request, 'kharch/error.html', context)


def get_item(request,item_name):
	context = {}
	item = Item.objects.get(name=item_name)
	context['item'] = item
	if request.method == "GET":
		return render(request, 'kharch/item.html', context)


