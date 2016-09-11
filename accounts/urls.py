from django.conf.urls import url,include
from . import views
from expenseexpress import settings
from django.contrib.auth import views as auth_views

from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
	
	url(r'^register/$', views.register,{ 'template_name':'registration/register.html'},name="register"),
	url(r'^dashboard/$', views.dashboard,{ 'template_name':'registration/dashboard.html'},name="dashboard"),
	url(r'^login/$', views.login,{ 'template_name':"registration/login.html"},name="login"),
	url(r'^logout/$', auth_views.logout,{ 'template_name':"registration/logout.html"},name="logout"),
	url(r'^upload-file/$', views.upload_file,name="upload_file"),

] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

