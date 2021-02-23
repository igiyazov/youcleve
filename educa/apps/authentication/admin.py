from django.contrib import admin
from .models import Profile

@admin.register(Profile)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['username', 'company_name', 'photo', 'promocode', 'bonus', 'bill_number', 'geo', 'site']
    list_filter = ['username']
    search_fields = ['username', 'company_name']
    # prepopulated_fields = {'slug': ('title',)}
