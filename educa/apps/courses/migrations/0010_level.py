# Generated by Django 3.1.6 on 2021-02-18 12:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0009_subcategory_slug'),
    ]

    operations = [
        migrations.CreateModel(
            name='Level',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('key', models.CharField(max_length=5)),
                ('body', models.CharField(max_length=50)),
            ],
        ),
    ]