from .models import UserProfile
from .forms import RegistrationForm

def retrieve(request):
	''' note that this requires an authenticated user before we try calling it '''
	try:
		profile = request.user.userprofile
	except UserProfile.DoesNotExist:
		profile = UserProfile(user=request.user)
		profile.save()

	return profile

def set(request):
	profile = retrieve(request)
	profile_form = RegistrationForm(request.POST, instance=profile)
	profile_form.save()


def handle_uploaded_file(request,f):
	profile_name = request.user.username
	with open('/home/amit/gitcode/expenseexpress/kharch/static/kharch/img/' + profile_name, 'wb+') as destination:
		for chunk in f.chunks():
			destination.write(chunk)