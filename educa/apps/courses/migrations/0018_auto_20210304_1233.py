# Generated by Django 3.1.6 on 2021-03-04 12:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0017_auto_20210304_0820'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='slug',
            field=models.SlugField(max_length=200, null=True, unique=True),
        ),
    ]