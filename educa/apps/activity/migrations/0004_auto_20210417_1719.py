# Generated by Django 3.1.6 on 2021-04-17 17:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('activity', '0003_subscription'),
    ]

    operations = [
        migrations.AlterField(
            model_name='subscription',
            name='sub_end',
            field=models.DateField(blank=True, null=True),
        ),
    ]
