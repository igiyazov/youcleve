# Generated by Django 3.1.6 on 2021-02-12 14:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0002_auto_20210209_1019'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='description',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='category',
            name='photo',
            field=models.ImageField(null=True, upload_to=''),
        ),
    ]
