from django.conf.urls import include, url
from django.contrib import admin
import kharch

urlpatterns = [
    # Examples:
    url(r'^$', 'kharch.views.index', name='home'),
    url(r'^kharch/', include('kharch.urls', namespace="kharch")),
    url(r'^accounts/', include('accounts.urls', namespace="accounts")),
    url(r'^utils/', include('utils.urls', namespace="utils")),
    url(r'^admin/', include(admin.site.urls)),
]
