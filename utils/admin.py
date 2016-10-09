from django.contrib import admin

from .models import Country, State, District, Village, Tehsil

admin.site.register(Country)
admin.site.register(State)
admin.site.register(District)
admin.site.register(Tehsil)
admin.site.register(Village)
