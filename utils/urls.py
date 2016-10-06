from django.conf.urls import include, url
from . import views

urlpatterns = [
    # Examples:
    url(r'^$', views.index, name='home'),
    
    # url(r'^pay-due/$', views.pay_due, name='pay_due'),


]