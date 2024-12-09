# app/management/commands/create_accounts.py
from django.core.management.base import BaseCommand
from django.db import connection
from utils.dummy_data import create_dummy_accounts

class Command(BaseCommand):
    help = 'Create dummy accounts'

    def handle(self, *args, **options):
        # Panggil fungsi register_user atau create_dummy_accounts
        result = create_dummy_accounts()
        self.stdout.write(self.style.SUCCESS(result))


# Jalankan dengan:
# python manage.py create_accounts


