from django.shortcuts import render
from .models import Cash, Spent, Category, Payment, Item
from utils.models import Village
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
		form = CapitalForm()

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
			sex   = int(sum(sex.values_list('price',flat=True)))

		else:
			roti = kapda = makan = other = sex = 0
			spent = 0

		
		if cash > 0 :
			remain = cash - sum([roti, kapda, makan, other, sex])
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
		context['form'] = form
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
				date = datetime.datetime.strptime(date, '%d/%m/%Y').strftime('%Y-%m-%d')
				if item in append :
					obj.inherited_by.add(user_id)
					obj.save()
				paid = False if payment == "CR" else True
				Spent.objects.create(item=obj, paid=paid, category=Category.objects.get(id=obj.category_id), payment=Payment.objects.get(code=payment), price=request.POST[item], date=date)

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

			Item.objects.create(name=name, cost=cost, category=Category.objects.get(id=category))
			
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
def edit_spent(request):
	user_id = get_current_user()
	if request.method == "GET":
		context = {}
		return render(request,'kharch/mobile.html',context)

	else:
		print request.POST
		if "dashboard" in request.POST:
			spent_id = int(request.POST['dashboard'])
			spent = Spent.objects.get(pk=spent_id)
			spent_date = request.POST['spent_date_%s' %request.POST['dashboard']].split("-")
			year,month,day = [int(part) for part in spent_date]
			spent.date = datetime.date(year,month,day)
			spent.validity = int(request.POST['validity']) if request.POST['validity'] != "NA" else "NA"
			spent.cost = float(request.POST['cost'])
			spent.payment = Payment.objects.get(code=request.POST['%d_sel' % spent_id])
			spent.save()
			url = urlresolvers.reverse('accounts:dashboard')
			return HttpResponseRedirect(url)
		else:
			spent_id = int(request.POST['hidden'])
			spent = Spent.objects.get(pk=spent_id)
			spent_date = request.POST['spent_date_%s' %request.POST['hidden']].split("-")
			year,month,day = [int(part) for part in spent_date]
			spent.date = datetime.date(year,month,day)
			print spent.date
			spent.validity = int(request.POST['validity']) if request.POST['validity'] != "NA" else "NA"
			spent.cost = float(request.POST['cost'])
			spent.payment = Payment.objects.get(code=request.POST['%d_sel' % spent_id])
			spent.save()
			url = urlresolvers.reverse('kharch:mobile')
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
		flag = False
		for item in edited:
			spent = Spent.objects.filter(item=Item.objects.get(name=item))
			if len(spent) < 1:
				obj = Item.objects.get(name=item)
				obj.delete()
			else:
				flag = True

		if flag:
			form = ItemForm()
			items = Item.objects.filter(added_by=user_id)
			context = {}
			context['form'] = form
			context['error'] = "Already purchased items cannot be deleted. Contact Admin"
			context['items'] = items
			return render(request, 'kharch/delete_item.html', context)
		else:
			url = urlresolvers.reverse('kharch:delete_item')
			return HttpResponseRedirect(url)
	
@login_required
def history(request):
	user_id = get_current_user()
	context = {}

	items = list(chain(Item.objects.filter(added_by=user_id), Item.objects.filter(inherited_by=user_id)))
	
	spent = Spent.objects.filter(spent_by=user_id)

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

	spent_dict = {'RT':roti, 'KP':kapda, 'MK':makan, 'OT':other, 'XX': sex}

	series = []
	for item in items:

		data = int(sum(spent.filter(item=Item.objects.get(name=item.name)).values_list('price',flat=True)))
		
		series.append("%s-%s-%d" %(item.category.code,item.name,data))

	context['series'] = "<|>".join(series)
	print context['series']
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

def get_item(request,item_name):
	context = {}
	item = Item.objects.get(name=item_name)
	context['item'] = item
	if request.method == "GET":
		return render(request, 'kharch/item.html', context)

@login_required
def show_mobile(request):
	user_id = get_current_user()
	context = {}
	spents = Spent.objects.filter(spent_by=user_id).filter(category=Category.objects.get(code="OT"))
	print spents
	spents = spents.filter(item__name__istartswith="MR")
	context['spents'] = spents.order_by('-id')[:5]
	status = []
	valids = []
	for spent in context['spents'] :
		delta = datetime.date.today() - spent.date
		validity = 0 if spent.validity == "NA" else int(spent.validity)
		
		diff = validity - delta.days
		if diff  > 3 :
			status.append("Green")
			valids.append(diff)
		elif diff in range(1,4):
			status.append("Yellow")
			valids.append(diff)			
		else:
			status.append("Red")
			valids.append(0)

	context['status'] = status
	context['valid'] = valids
	print context
	if request.method == "GET":
		return render(request, 'kharch/mobile.html', context)


def pay_due(request):
	context = {}

	if request.method == "GET":
		return render(request, 'kharch/pay_due.html', context)

def buy_error(request):
	context = {}
	if request.method == "GET":
		return render(request, 'kharch/error.html', context)