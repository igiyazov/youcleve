# Generated by Django 3.1.6 on 2021-03-04 08:20

from django.db import migrations, models
import educa.apps.courses.services


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0016_auto_20210228_2229'),
    ]

    operations = [
        migrations.AddField(
            model_name='lesson',
            name='number',
            field=models.IntegerField(default=-1),
        ),
        migrations.AlterField(
            model_name='lesson',
            name='photo',
            field=models.ImageField(blank=True, null=True, upload_to='photo/'),
        ),
        migrations.AlterField(
            model_name='lesson',
            name='slug',
            field=models.SlugField(max_length=1000, null=True, unique=True),
        ),
        migrations.AlterField(
            model_name='lesson',
            name='title',
            field=models.CharField(max_length=1000),
        ),
        migrations.AlterField(
            model_name='lesson',
            name='video',
            field=models.FileField(blank=True, upload_to=educa.apps.courses.services.get_upload_video_path),
        ),
    ]
