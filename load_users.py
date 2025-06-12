import os
import django

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "backend.settings")
django.setup()

from users.models import User

user_list = [
    {"username": "admin", "password": "admin123"},
    {"username": "maria", "password": "testpass"},
    {"username": "denys", "password": "supersecret"},
    {"username": "roman", "password": "supersecret"},
    {"username": "andry", "password": "supersecret"},
    {"username": "anton", "password": "supersecret"},
    {"username": "dmytro", "password": "supersecret"},
    {"username": "ievgeniy", "password": "supersecret"},
    {"username": "yaroslav", "password": "supersecret"},
    {"username": "denys", "password": "supersecret"},
    {"username": "denys", "password": "supersecret"},
]

for data in user_list:
    User.objects.create(**data)

print("Users added.")
