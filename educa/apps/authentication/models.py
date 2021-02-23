from django.db import models
from django.contrib.auth.models import (
    BaseUserManager, AbstractBaseUser
)
# from educa.apps.courses.models import Course


class CustomUserManager(BaseUserManager):
    def create_user(self, email, password=None):
        """
        Creates and saves a User with the given email, date of
        birth and password.
        """
        if not email:
            raise ValueError('Users must have an email address')

        user = self.model(
            email=self.normalize_email(email),
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None):
        """
        Creates and saves a superuser with the given email, date of
        birth and password.
        """
        user = self.create_user(
            email,
            password=password,
        )
        user.is_admin = True
        user.save(using=self._db)
        return user


class CustomUser(AbstractBaseUser):
    username = models.CharField(max_length=100, blank=True)
    email = models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique=True,
    )
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)

    objects = CustomUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        # Simplest possible answer: All admins are staff
        return self.is_admin

class Profile(models.Model):
    custom_user = models.OneToOneField(CustomUser,
                                        related_name='profile',
                                        on_delete=models.CASCADE)
    # username = models.CharField(max_length=100)
    # company_name = models.CharField(max_length=200)
    photo = models.ImageField(upload_to='profile/', null=True)
    promocode = models.CharField(max_length=20, blank=True, default='')
    bonus = models.PositiveIntegerField(default=0)
    bill_number = models.CharField(max_length=50, default='', blank=True)
    geo = models.TextField(blank=True, null=True)
    site = models.TextField(blank=True, null=True)
    follow_end = models.DateTimeField(blank=True, null=True)

    saved = models.ManyToManyField(to='courses.Course', related_name="saved_by")
    followings = models.ManyToManyField("self", related_name="followers", symmetrical=False)


