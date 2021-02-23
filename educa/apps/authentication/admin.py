from django.contrib import admin
from .models import CustomUser, Profile

@admin.register(CustomUser)
class CustomUserAdmin(admin.ModelAdmin):
    list_display = ['username', 'email', 'password']
    list_filter = ['username']
    search_fields = ['username', 'email']
    # prepopulated_fields = {'slug': ('title',)}


@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):
    list_display = ['photo', 'promocode', 'bonus', 'bill_number', 'geo', 'site']
    # list_filter = []
    # search_fields = ['username', 'company_name']
    # prepopulated_fields = {'slug': ('title',)}
