from django.shortcuts import render
from .models import Cash, Spent, Category, Payment, Item
from django.http import HttpResponseRedirect, HttpResponse, Http404
from .forms import CapitalForm, ItemForm
from django.core import urlresolvers
from django.contrib.auth.decorators import login_required
from utils.current_user import get_current_user
from itertools import chain
import datetime


def index(request):
	user_id = get_current_user()

	if request.method == "GET" and user_id is not None:
		cash = Cash.objects.filter(loaded_by=user_id)
		cash = sum(cash.values_list('capital',flat=True))

		items = list(chain(Item.objects.filter(added_by=user_id), Item.objects.filter(inherited_by=user_id) ))

		spent = Spent.objects.filter(spent_by=user_id)

		if len(spent):
			roti = spent.filter(category=Category.objects.get(code="RT"))
			roti = int(sum(roti.values_list('price',flat=True)))

			kapda = spent.filter(category=Category.objects.get(code="KP"))
			kapda = int(sum(kapda.values_list('price',flat=True)))

			makan = spent.filter(category=Category.objects.get(code="MK"))
			makan = int(sum(makan.values_list('price',flat=True)))

			other = spent.filter(category=Category.objects.get(code="OT"))
			other = int(sum(other.values_list('price',flat=True)))

			sex   = spent.filter(category=Category.objects.get(code="XX"))
			sex = int(sum(sex.values_list('price',flat=True)))

		else:
			roti = kapda = makan = other = sex = 0

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
			
			if len(spent):
				roti = spent.filter(category=Category.objects.get(code="RT"))
				roti = int(sum(roti.values_list('price',flat=True)))

				kapda = spent.filter(category=Category.objects.get(code="KP"))
				kapda = int(sum(kapda.values_list('price',flat=True)))

				makan = spent.filter(category=Category.objects.get(code="MK"))
				makan = int(sum(makan.values_list('price',flat=True)))

				other = spent.filter(category=Category.objects.get(code="OT"))
				other = int(sum(other.values_list('price',flat=True)))

				sex   = spent.filter(category=Category.objects.get(code="XX"))
				sex = int(sum(sex.values_list('price',flat=True)))

			else:
				roti = kapda = makan = other = sex = 0

			if total > (cash - (roti + kapda + makan + other + sex) ):
				url = urlresolvers.reverse('kharch:buy_error')
				return HttpResponseRedirect(url)

			for item in brought:
				payment = request.POST[item+"_sel"]
				obj = Item.objects.get(name=item)
				category = obj.category
				added_by = obj.added_by
				append = request.POST.getlist('append[]')
				date = request.POST["buy_date_"+item]
				date = datetime.datetime.strptime(date, '%m/%d/%Y').strftime('%Y-%m-%d')
				if item in append :
					obj.inherited_by.add(user_id)
					obj.save()
				
				Spent.objects.create(item=obj, category=Category.objects.get(id=obj.category_id), payment=Payment.objects.get(code=payment), price=request.POST[item], date=date)

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

			Item.objects.create(name=name.capitalize(), cost=cost, category=Category.objects.get(id=category))
			
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
		context = {}
		context['form'] = form
		context['items'] = items
		return render(request, 'kharch/edit_item.html', context)

	elif request.method == "POST":
		edited = request.POST.getlist('items[]')
		for item in edited:
			obj = Item.objects.get(name=item)
			name = request.POST[item] 
			cost = request.POST[item+"_cost"]
			category = request.POST[item+"_sel"]
			try :
				exists = Item.objects.get(name=name)
				exists = True
			except:
				exists = False
			if not exists:
				obj.name = name
				obj.cost = cost
				obj.category = Category.objects.get(code=category)
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

@login_required
def show_mobile(request):
	context = {}
	spents = Spent.objects.filter(category=Category.objects.get(code="OT"))
	spents = spents.filter(item__startswith="MR")
	context['spents'] = spents.order_by('-id')[:5]
	status = []
	for spent in context['spents'] :
		delta = datetime.date.today() - spent.date
		if delta.days < 25 :
			status.append("Green")
		elif delta.days in range(25,29):
			status.append("Yellow")
		else:
			status.append("Red")

	context['status'] = status
	context['today'] = datetime.date.today()

	if request.method == "GET":
		return render(request, 'kharch/mobile.html', context)




