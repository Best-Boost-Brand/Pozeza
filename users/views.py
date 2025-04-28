from django.http import JsonResponse
from .models import User

def user_list(request):
    users = User.objects.all()
    data = [{"id": user.id, "username": user.username} for user in users]
    return JsonResponse(data, safe=False)
