from django import forms
from .models import UserProfile, Document
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth.models import User
from django.utils.translation import ugettext, ugettext_lazy as _

class RegistrationForm(forms.ModelForm):
	error_messages = {'password_mismatch': _("The two password fields didn't match."),}
	password1 = forms.CharField(label=_(""),widget=forms.PasswordInput(attrs={'class':'form-control','placeholder':'Password'}))
	password2 = forms.CharField(label=_(""),widget=forms.PasswordInput(attrs={'class':'form-control','placeholder':'Confirm Password'}))
	
	class Meta:
		model = User
		fields = ('username', 'email')
		widgets = {
            'username': forms.TextInput(attrs={'class': 'form-control','placeholder':'Username',}),
            'email': forms.TextInput(attrs={'class': 'form-control','placeholder':'Email'}),
        }
		labels = {
            'username': _(''),
            'email': _('')
        }
        help_texts = {
        	'username': _(''),
        }

	def __init__(self, *args, **kwargs):
		super(RegistrationForm, self).__init__(*args, **kwargs)
		self.fields['username'].help_text = ''


	def clean_password2(self):
		password1 = self.cleaned_data.get("password1")
		password2 = self.cleaned_data.get("password2")
		if password1 and password2 and password1 != password2:
			raise forms.ValidationError(
				self.error_messages['password_mismatch'],
				code='password_mismatch',
			)
		return password2

	def save(self, commit=True):
		user = super(RegistrationForm, self).save(commit=False)
		user.set_password(self.cleaned_data["password1"])
		if commit:
			user.save()
		return user

class UploadFileForm(forms.Form):
	docfile = forms.FileField(help_text=".png, .jpg only")
	

class ModelFormWithFileField(forms.ModelForm):
	class Meta:
		model = Document
		fields = "__all__"
