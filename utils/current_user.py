from threading import local

_user = local()

class CurrentUserMiddleware(object):
    def process_request(self, request):
    	_user.value = request.user
    	


def get_current_user():
	if _user.value.id:
		return _user.value
	else:
		return None

