from django.core.management.base import BaseCommand
from apps.equipment.models import Equipment, EquipmentCategory

EQUIPMENTS = [
    ("GE-21", "Generador Pramac 500", EquipmentCategory.GENERATOR),
    ("MP-27", "Jumbo Cannon", EquipmentCategory.JUMBO),
    ("MP-30", "Jumbo Sandvik DD-321", EquipmentCategory.JUMBO),
    ("COM-01", "Compresor Atlas 800 CFM", EquipmentCategory.COMPRESSOR),
    ("PW-5000", "Track drill - PW-5000", EquipmentCategory.DRILL),
    ("N-30", "Compresor Doosan", EquipmentCategory.COMPRESSOR),
    ("CF-44", "Cargador Frontal", EquipmentCategory.LOADER),
    ("CM-185", "Camion Extraccion", EquipmentCategory.TRUCK),
    ("SP-04", "Scoop", EquipmentCategory.SCOOP),
    ("MA-03", "O. Telescopico ", EquipmentCategory.TELEHANDLER),
    ("CA_208", "Camioneta Hilux", EquipmentCategory.PICKUP),
    ("CA_231", "Camioneta Hilux", EquipmentCategory.PICKUP),
    ("CA_246", "Camioneta Hilux", EquipmentCategory.PICKUP),
    ("CA_224", "Camioneta Hilux", EquipmentCategory.PICKUP),
]

class Command(BaseCommand):
    help = "Crea equipos iniciales"

    def handle(self, *args, **options):
        created = 0
        updated = 0

        for code, name, category in EQUIPMENTS:
            obj, was_created = Equipment.objects.update_or_create(
                code=code,
                defaults={"name": name, "category": category, "is_active": True},
            )
            if was_created:
                created += 1
            else:
                updated += 1

        self.stdout.write(self.style.SUCCESS(f"Seed listo. Creados: {created}, Actualizados: {updated}"))
