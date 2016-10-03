from django import forms
from .models import Cash, Item
from django.utils.translation import ugettext, ugettext_lazy as _

class CapitalForm(forms.Form):
	capital = forms.IntegerField(label='' )
	hidden = forms.CharField(widget = forms.HiddenInput(attrs={'value':'Capital'}), required = False)

	def __init__(self, *args, **kwargs):
		super(CapitalForm, self).__init__(*args, **kwargs)
		self.fields['capital'].widget.attrs.update({'class' : 'form-control'})

	
class ItemForm(forms.ModelForm):
	error_messages = {'item_match': _("Item already exists."),}

	class Meta:
		model = Item
		fields = ['name', 'cost', 'category']

		labels = {
            'name': _(''),
            'cost': _(''),
            'category':_(''),
        }

	def __init__(self, *args, **kwargs):
		super(ItemForm, self).__init__(*args, **kwargs)
		self.fields['name'].widget.attrs.update({'class' : 'form-control'})
		self.fields['cost'].widget.attrs.update({'class' : 'form-control'})
		self.fields['category'].widget.attrs.update({'class' : 'form-control'})
		self.fields['name'].widget.attrs.update({'placeholder' : 'Item'})
		self.fields['cost'].widget.attrs.update({'placeholder' : 'Cost'})


	def clean_name(self):
		name = self.cleaned_data["name"]
		try:
			name = Item.objects.get(name=name)
		except Item.DoesNotExist:
			return name

		raise forms.ValidationError(u'Item "%s" already exists.' % name)


	def save(self, commit=True):
		item = super(ItemForm, self).save(commit=False)
		item.set_name(self.cleaned_name["name"])
		if commit:
			item.save()
		return item