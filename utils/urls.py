from django.conf.urls import include, url
from . import views

urlpatterns = [
    # Examples:
    url(r'^add-country/$', views.add_country, name='add_country'),
    url(r'^country/$', views.get_countries, name='get_countries'),
    url(r'^(?P<country>[-\w]+)/update-states/$', views.update_states, name='update_states'),
    url(r'^(?P<country>[-\w]+)/states/$', views.get_states, name='get_states'),
    url(r'^(?P<country>[-\w]+)/(?P<state>[-\w]+)/districts/$', views.get_districts, name='get_districts'),
    url(r'^(?P<country>[-\w]+)/(?P<state>[-\w]+)/(?P<district>[-\w]+)/tehsils/$', views.get_tehsils, name='get_tehsils'),
    url(r'^(?P<country>[-\w]+)/(?P<state>[-\w]+)/(?P<district>[-\w]+)/(?P<tehsil>[-\w]+)/gaons/$', views.get_gaons, name='get_gaons'),
    url(r'^(?P<country>[-\w]+)/(?P<state>[-\w]+)/(?P<district>[-\w]+)/(?P<tehsil>[-\w]+)/(?P<gaon>[-\w]+)/$', views.get_villa, name='get_villa'),
    
]