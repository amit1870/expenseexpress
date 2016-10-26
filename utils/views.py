from django.shortcuts import render
from .models import Country, State, District, Tehsil, Village
from django.http import HttpResponseRedirect, HttpResponse, Http404
from .forms import CountryForm
from django.core import urlresolvers
from django.contrib.auth.decorators import login_required
from utils.current_user import get_current_user
from itertools import chain
import datetime
import bharat as bh
import data
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
from utils.serializers import DistrictSerializer

class JSONResponse(HttpResponse):
	def __init__(self, data, **kwargs):
		content = JSONRenderer().render(data)
		kwargs['content_type'] = 'application/json'
		super(JSONResponse, self).__init__(content, **kwargs)

@csrf_exempt
def district_list(request,country, state):
	if request.method == "GET":
		country_obj = Country.objects.get(abrcode=country)
		state_obj = [st for st in State.objects.filter(country=country_obj) if st.abrcode == state][0]
		districts = District.objects.all().filter(state=state_obj)
		serializer = DistrictSerializer(districts, many=True)
		return JSONResponse(serializer.data)

	elif request.method == 'POST':
		data = JSONParser().parse(request)
		serializer = DistrictSerializer(data=data)
		if serializer.is_valid():
			serializer.save()
			return JSONResponse(serializer.data, status=201)
		return JSONResponse(serializer.errors, status=400)


def add_country(request):
	if request.method == "GET":
		context = {}
		context['form'] = CountryForm()
		return render(request, 'utils/add_country.html', context)

	else:
		country = request.POST['name']
		abrcode = request.POST['abrcode']
		url = request.POST['url']
		code = request.POST['code']
		Country.objects.create(name=country, abrcode=abrcode, url=url, code=code)
		url = urlresolvers.reverse('utils:add_country')
		return HttpResponseRedirect(url)

def get_countries(request):
	if request.method == "GET":
		context = {}
		context['countries'] = Country.objects.all()
		return render(request, 'utils/country.html', context)


def get_states(request,country):
	country = Country.objects.get(abrcode=country)
	if request.method == "GET":
		context = {}
		states = State.objects.all().filter(country=country)
		context['states'] = states
		context['country'] = country
		return render(request, 'utils/states.html', context)

	else:
		country_url = "http://vlist.in/"
		try:
			states = bh.get_states(country_url)
		except:
			states = []

		for state in states:
			name, link, count = state
			st = State.objects.create(country=country, state=name, url=link, vcount=count, abrcode=data.states_dict[name][0])

		country.scount = State.objects.filter(country=country).count()
		country.save()

		url = urlresolvers.reverse('utils:get_states', kwargs={'country': country.abrcode})
		return HttpResponseRedirect(url)

def update_states(request, country):
	country_obj = Country.objects.get(abrcode=country)
	if request.method == "POST":
		states = State.objects.all().filter(country=country_obj)
		for state in states:
			state.abrcode = data.states_dict[state.state][0]
			state.save()

		url = urlresolvers.reverse('utils:get_states', kwargs={'country': country})
		return HttpResponseRedirect(url)



def get_districts(request,country,state):
	state = str(state)
	country_obj = Country.objects.get(abrcode=country)
	state_obj = [st for st in State.objects.all().filter(country=country_obj) if st.abrcode == state][0]
	if request.method == "GET":
		context = {}
		districts = [district for district in District.objects.all().filter(state=state_obj)]
		context['districts'] = districts
		context['country'] = country_obj
		context['state'] = state_obj
		return render(request, 'utils/district.html', context)

	else:
		try:
			districts = data.dist_dict[state]
		except:
			districts = bh.get_districts(state_obj.url)

		for district in districts:
			abrcode, name, hq, population, area, density, link = district
			dt = District.objects.create(state=state_obj, district=name, url=link, abrcode=abrcode, hq=hq,\
										population=population, area=area, density=density)

		url = urlresolvers.reverse('utils:get_districts', kwargs={'country': country ,'state': state })
		return HttpResponseRedirect(url)



def get_tehsils(request,country,state,district):
	state = str(state)
	district = str(district)
	country_obj = Country.objects.get(abrcode=country)
	state_obj = [st for st in State.objects.all().filter(country=country_obj) if st.abrcode == state][0]
	dist_obj = [dt for dt in District.objects.all().filter(state=state_obj) if dt.abrcode == district][0]
	if request.method == "GET":
		context = {}
		tehsils = [tehsil for tehsil in Tehsil.objects.all().filter(district=dist_obj)]
		context['tehsils'] = tehsils
		context['country'] = country_obj
		context['state'] = state_obj
		context['district'] = dist_obj
		return render(request, 'utils/tehsils.html', context)

	else:
		try:
			tehsils = bh.get_tehsils(dist_obj.url)
		except:
			tehsils = []

		for tehsil in tehsils:
			name, link, count = tehsil
			th = Tehsil.objects.create(district=dist_obj, tehsil=name, url=link, vcount=count)
			th.abrcode = th.id
			th.save()

		url = urlresolvers.reverse('utils:get_tehsils', kwargs={'country': country, 'state': state, 'district': district})
		return HttpResponseRedirect(url)

def get_gaons(request,country,state,district, tehsil):
	country = str(country)
	state = str(state)
	district = str(district)
	tehsil = str(tehsil)
	country_obj = Country.objects.get(abrcode=country)
	state_obj = [st for st in State.objects.all().filter(country=country_obj) if st.abrcode == state][0]
	dist_obj = [dt for dt in District.objects.all().filter(state=state_obj) if dt.abrcode == district][0]
	tehsil_obj = [th for th in Tehsil.objects.all().filter(district=dist_obj) if th.abrcode == tehsil][0]

	if request.method == "GET":
		gaons = [gaon for gaon in Village.objects.all().filter(tehsil=tehsil_obj)]
		context = {}
		context['district'] = dist_obj
		context['country'] = country_obj
		context['state'] = state_obj
		context['tehsil'] = tehsil_obj
		context['gaons'] = gaons
		return render(request, 'utils/gaons.html', context)

	else:
		try:
			gaons = bh.get_gaons(tehsil_obj.url)
		except:
			gaons = []

		for gaon in gaons:
			name, link, pincode = gaon
			vg = Village.objects.create(tehsil=tehsil_obj, village=name, url=link, pincode=pincode)
			vg.abrcode = vg.id
			vg.save()

		url = urlresolvers.reverse('utils:get_gaons', kwargs={'country': country, 'state': state, 'district': district, 'tehsil':tehsil })
		return HttpResponseRedirect(url)


def get_villa(request,country,state,district, tehsil, gaon):
	country_obj = Country.objects.get(abrcode=country)
	state_obj = [st for st in State.objects.all().filter(country=country_obj) if st.abrcode == state][0]
	dist_obj = [dt for dt in District.objects.all().filter(state=state_obj) if dt.abrcode == district][0]
	tehsil_obj = [th for th in Tehsil.objects.all().filter(district=dist_obj) if th.abrcode == tehsil][0]
	villa = [villa for villa in Village.objects.all().filter(tehsil=tehsil_obj) if villa.abrcode == gaon][0]
	if request.method == "GET":
		context = {}
		context['villa'] = villa
		context['country'] = country_obj
		context['state'] = state_obj
		context['district'] = dist_obj
		context['tehsil'] = tehsil_obj
		return render(request, 'utils/villa.html', context)







