from django.contrib import admin
from .models import CustomUser, Profile

# @admin.register(Profile)
class ProfileAdmin(admin.StackedInline):
    model = Profile
    # list_display = ['photo', 'promocode', 'bonus', 'bill_number', 'geo', 'site']
    # list_filter = []
    # search_fields = ['username', 'company_name']
    # prepopulated_fields = {'slug': ('title',)}


@admin.register(CustomUser)
class CustomUserAdmin(admin.ModelAdmin):
    list_display = ['email', 'username', 'password']
    list_filter = ['username']
    search_fields = ['username', 'email']
    inlines=[ProfileAdmin]
    # prepopulated_fields = {'slug': ('title',)}


