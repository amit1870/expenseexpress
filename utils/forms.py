from django import forms
from .models import Country
from django.utils.translation import ugettext, ugettext_lazy as _


class CountryForm(forms.ModelForm):
	error_messages = {'country_match': _("Country already exists."),}

	class Meta:
		model = Country
		fields = ('name', 'abrcode', 'url', 'code')

		labels = {
            'name': _(''),
            'abrcode': _(''),
            'url':_(''),
            'code':_(''),
        }

	def __init__(self, *args, **kwargs):
		super(CountryForm, self).__init__(*args, **kwargs)
		self.fields['name'].widget.attrs.update({'class' : 'form-control'})
		self.fields['abrcode'].widget.attrs.update({'class' : 'form-control'})
		self.fields['url'].widget.attrs.update({'class' : 'form-control'})
		self.fields['code'].widget.attrs.update({'class' : 'form-control'})

		self.fields['name'].widget.attrs.update({'placeholder' : 'Country'})
		self.fields['abrcode'].widget.attrs.update({'placeholder' : 'Abrivation'})
		self.fields['url'].widget.attrs.update({'placeholder' : 'Url'})
		self.fields['code'].widget.attrs.update({'placeholder' : 'Code'})



	def clean_name(self):
		name = self.cleaned_data["name"]
		try:
			name = Country.objects.get(name=name)
		except Country.DoesNotExist:
			return name

		raise forms.ValidationError(u'Country "%s" already exists.' % name)


	def save(self, commit=True):
		country = super(CountryForm, self).save(commit=False)
		country.set_name(self.cleaned_name["name"])
		if commit:
			country.save()
		return country
