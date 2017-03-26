from django.shortcuts import render, get_object_or_404
from django.contrib.auth.forms import UserCreationForm
from django.core import urlresolvers
from django.http import HttpResponseRedirect, HttpResponse
from django.contrib.auth.decorators import login_required
from .forms import RegistrationForm, UploadFileForm, ModelFormWithFileField
from . import profile
from .models import Document
from kharch.models import Cash, Item, Spent, Category, Payment
from utils.current_user import get_current_user


def register(request, template_name="accounts/registration/register.html"):
	if request.method == "POST":
		postdata = request.POST.copy()
		form = RegistrationForm(postdata)
		if form.is_valid():
			form.save()
			un = postdata.get('username','')
			pw = postdata.get('password1','')
			from django.contrib.auth import login, authenticate
			new_user = authenticate(username=un, password=pw)
			if new_user and new_user.is_active:
				login(request,new_user)
				url = urlresolvers.reverse('accounts:dashboard')
				return HttpResponseRedirect(url)

	else:
		form = RegistrationForm()

	page_title = 'User Registration'
	context = {'page_title':page_title,'form':form}
	return render(request, template_name, context)

@login_required
def dashboard(request, template_name="accounts/registration/dashboard.html"):
	user_id = get_current_user()
	context = {}
	cash = Cash.objects.filter(loaded_by=user_id)
	cash = sum(cash.values_list('capital',flat=True))
	context['total'] = cash
	spent = Spent.objects.filter(spent_by=user_id)
	context['spent_on'] = spent

	roti = spent.filter(category=Category.objects.get(code='RT'))
	roti = int(sum(roti.values_list('price',flat=True)))
	
	kapda = spent.filter(category=Category.objects.get(code='KP'))
	kapda = int(sum(kapda.values_list('price',flat=True)))
	
	makan = spent.filter(category=Category.objects.get(code='MK'))
	makan = int(sum(makan.values_list('price',flat=True)))
	
	other = spent.filter(category=Category.objects.get(code='OT'))
	other = int(sum(other.values_list('price',flat=True)))
	
	mobile   = spent.filter(category=Category.objects.get(code='MB'))
	mobile = int(sum(mobile.values_list('price',flat=True)))
	
	context['spent'] = sum([roti,kapda,makan,other,mobile])
	
	credit = spent.filter(payment=Payment.objects.get(code="CR")).filter(paid=False)
	credit = int(sum(credit.values_list('price',flat=True)))
	
	online = spent.filter(payment=Payment.objects.get(code="DB")).filter(paid=True)
	online  = int(sum(online.values_list('price',flat=True)))
	
	context['online'] = online
	context['credit'] = credit
	context['remain'] = context['total'] - context['spent'] + context['credit'] + context['online']

	return render(request, template_name, context)

def login(request,template_name="accounts/registration/login.html"):
	
	if request.method == "GET":
		context = {}
		return render(request, template_name, context)

	else:
		postdata = request.POST.copy()
		un = postdata.get('username','')
		pw = postdata.get('password','')
		from django.contrib.auth import login, authenticate
		user = authenticate(username=un, password=pw)
		if user and user.is_active:
			login(request,user)
			url = urlresolvers.reverse('kharch:home')
			return HttpResponseRedirect(url)
		else:
			context = {}
			context['error'] = "Username and Password does not match any."
			return render(request, template_name, context)

@login_required
def upload_file(request):
	if request.method == "POST":
		form = ModelFormWithFileField(request.POST, request.FILES)
		if form.is_valid():
			profile.handle_uploaded_file(request,request.FILES['docfile'])
			form.save()
			url = urlresolvers.reverse('accounts:dashboard')
			return HttpResponseRedirect(url)
		else:
			form = ModelFormWithFileField()
			context = {}
			context['form'] = form
			context['error'] = "Please select a file."
			return render(request, 'registration/upload.html', context)

	else:
		form = ModelFormWithFileField()
		return render(request, 'registration/upload.html', {'form': form})

def logging_error(request):
	context = {}
	if request.method == "GET":
		return render(request, 'registration/login_error.html', context)

