from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    # Examples:
    # url(r'^$', 'expenseexpress.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^kharch/', include('kharch.urls', namespace="kharch")),
    url(r'^accounts/', include('accounts.urls', namespace="accounts")),
    url(r'^utils/', include('utils.urls', namespace="utils")),
    url(r'^admin/', include(admin.site.urls)),
]
