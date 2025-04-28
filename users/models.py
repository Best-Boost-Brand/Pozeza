from django.db import models

class User(models.Model):
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=255)
    # chastyna_id поки пропустимо (бо треба створити додаток chastyny окремо)

    def __str__(self):
        return self.username
