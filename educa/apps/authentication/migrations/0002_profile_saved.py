# Generated by Django 3.1.6 on 2021-03-31 07:00

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('courses', '0001_initial'),
        ('authentication', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='saved',
            field=models.ManyToManyField(blank=True, null=True, related_name='saved_by', to='courses.Course'),
        ),
    ]
