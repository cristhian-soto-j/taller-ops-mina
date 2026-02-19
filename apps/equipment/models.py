from __future__ import annotations

from django.conf import settings
from django.core.exceptions import ValidationError
from django.db import models
from django.utils import timezone


# =========================
# Choices
# =========================
class EquipmentCategory(models.TextChoices):
    JUMBO = "JUMBO", "Jumbo"
    COMPRESSOR = "COMPRESSOR", "Compresor"
    GENERATOR = "GENERATOR", "Generador"
    LOADER = "LOADER", "Cargador Frontal"
    TRUCK = "TRUCK", "Camión"
    SCOOP = "SCOOP", "Scoop"
    TELEHANDLER = "TELEHANDLER", "Telescópico"
    PICKUP = "PICKUP", "Camioneta"
    DRILL = "DRILL", "Perforadora/Track drill"
    OTHER = "OTHER", "Otro"


class EquipmentStatus(models.TextChoices):
    OPERATIVO = "OPERATIVO", "Operativo"
    DETENIDO = "DETENIDO", "Detenido"
    MANTENCION = "MANTENCION", "Mantención"
    STANDBY = "STANDBY", "Standby"


class Shift(models.TextChoices):
    A = "A", "Turno A"
    B = "B", "Turno B"
    DIA = "DIA", "Día"
    NOCHE = "NOCHE", "Noche"


class Severity(models.TextChoices):
    BAJA = "BAJA", "Baja"
    MEDIA = "MEDIA", "Media"
    ALTA = "ALTA", "Alta"
    CRITICA = "CRITICA", "Crítica"


class IssueStatus(models.TextChoices):
    ABIERTO = "ABIERTO", "Abierto"
    EN_REVISION = "EN_REVISION", "En revisión"
    CERRADO = "CERRADO", "Cerrado"


class WorkOrderType(models.TextChoices):
    CORRECTIVA = "CORRECTIVA", "Correctiva"
    PREVENTIVA = "PREVENTIVA", "Preventiva"
    INSPECCION = "INSPECCION", "Inspección"


class WorkOrderStatus(models.TextChoices):
    ABIERTA = "ABIERTA", "Abierta"
    EN_PROCESO = "EN_PROCESO", "En proceso"
    CERRADA = "CERRADA", "Cerrada"
    PLANIFICADA = "PLANIFICADA", "Planificada"


# =========================
# Models
# =========================
class Equipment(models.Model):
    """
    Equipo físico.
    code: identificador único (código interno, patente, o ID operacional).
    name: nombre visible.
    status: estado base/manual (la "verdad" operativa la calcularemos en services.py).
    """
    code = models.CharField(max_length=50, unique=True)
    name = models.CharField(max_length=120)
    category = models.CharField(max_length=30, choices=EquipmentCategory.choices, default=EquipmentCategory.OTHER)

    status = models.CharField(max_length=30, choices=EquipmentStatus.choices, default=EquipmentStatus.OPERATIVO)
    criticality = models.PositiveSmallIntegerField(default=3)  # 1 alta ... 5 baja
    is_active = models.BooleanField(default=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        indexes = [
            models.Index(fields=["category", "is_active"]),
            models.Index(fields=["status"]),
        ]

    def __str__(self) -> str:
        return f"{self.name} ({self.code})"


class DailyLog(models.Model):
    """
    Registro diario/turno: horómetro ini/fin, operador, estado, comentario.
    """
    date = models.DateField()
    equipment = models.ForeignKey(Equipment, on_delete=models.PROTECT, related_name="daily_logs")

    shift = models.CharField(max_length=10, choices=Shift.choices, default=Shift.A)
    operator_name = models.CharField(max_length=120, blank=True, default="")

    hourmeter_start = models.FloatField(null=True, blank=True)
    hourmeter_end = models.FloatField(null=True, blank=True)

    status = models.CharField(max_length=30, choices=EquipmentStatus.choices, default=EquipmentStatus.OPERATIVO)
    comment = models.TextField(blank=True, default="")

    created_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="created_daily_logs",
    )
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = [("date", "equipment", "shift")]
        indexes = [
            models.Index(fields=["equipment", "date"]),
            models.Index(fields=["date", "shift"]),
        ]
        ordering = ["-date", "equipment_id"]

    def clean(self):
        if self.hourmeter_start is not None and self.hourmeter_end is not None:
            if self.hourmeter_end < self.hourmeter_start:
                raise ValidationError("hourmeter_end no puede ser menor que hourmeter_start.")

    @property
    def delta_hours(self) -> float | None:
        if self.hourmeter_start is None or self.hourmeter_end is None:
            return None
        return self.hourmeter_end - self.hourmeter_start

    def __str__(self) -> str:
        return f"{self.date} {self.equipment.code} {self.shift}"


class Issue(models.Model):
    """
    Aviso rápido (ticket liviano): alguien reporta un problema.
    Puede luego convertirse en WorkOrder.
    """
    equipment = models.ForeignKey(Equipment, on_delete=models.PROTECT, related_name="issues")
    reported_at = models.DateTimeField(default=timezone.now)

    title = models.CharField(max_length=120)
    description = models.TextField(blank=True, default="")
    severity = models.CharField(max_length=10, choices=Severity.choices, default=Severity.MEDIA)
    status = models.CharField(max_length=20, choices=IssueStatus.choices, default=IssueStatus.ABIERTO)

    reported_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="reported_issues",
    )

    class Meta:
        indexes = [
            models.Index(fields=["equipment", "status"]),
            models.Index(fields=["reported_at"]),
        ]
        ordering = ["-reported_at"]

    def __str__(self) -> str:
        return f"{self.equipment.code} - {self.title}"


class WorkOrder(models.Model):
    """
    Orden de trabajo: base para MTTR/MTBF y estado operacional real.
    entered_shop_at / returned_service_at:
      - si taller entrega hora exacta, estos campos son perfectos.
      - downtime_hours se autocalcula si ambos existen (igual puedes sobreescribirlo manualmente).
    """
    equipment = models.ForeignKey(Equipment, on_delete=models.PROTECT, related_name="work_orders")

    type = models.CharField(max_length=20, choices=WorkOrderType.choices, default=WorkOrderType.CORRECTIVA)
    status = models.CharField(max_length=20, choices=WorkOrderStatus.choices, default=WorkOrderStatus.ABIERTA)

    opened_at = models.DateTimeField(default=timezone.now)
    closed_at = models.DateTimeField(null=True, blank=True)

    symptom = models.TextField(blank=True, default="")
    cause = models.TextField(blank=True, default="")
    action_taken = models.TextField(blank=True, default="")

    entered_shop_at = models.DateTimeField(null=True, blank=True)
    returned_service_at = models.DateTimeField(null=True, blank=True)

    # KPIs
    downtime_hours = models.FloatField(null=True, blank=True)  # horas detenido (si no hay timestamps, se puede llenar manual)
    repair_hours = models.FloatField(null=True, blank=True)    # hh / horas reparación

    created_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="created_work_orders",
    )

    # vínculo opcional a Issue
    issue = models.OneToOneField(Issue, on_delete=models.SET_NULL, null=True, blank=True, related_name="work_order")

    class Meta:
        indexes = [
            models.Index(fields=["equipment", "status"]),
            models.Index(fields=["opened_at"]),
            models.Index(fields=["type", "status"]),
        ]
        ordering = ["-opened_at"]

    def clean(self):
        # coherencia cierre
        if self.status == WorkOrderStatus.CERRADA and self.closed_at is None:
            raise ValidationError("Si la OT está CERRADA, debe tener closed_at.")
        if self.closed_at is not None and self.closed_at < self.opened_at:
            raise ValidationError("closed_at no puede ser anterior a opened_at.")

        # coherencia taller
        if self.entered_shop_at and self.returned_service_at:
            if self.returned_service_at < self.entered_shop_at:
                raise ValidationError("returned_service_at no puede ser anterior a entered_shop_at.")

    def save(self, *args, **kwargs):
        # Autocalcular downtime si hay timestamps de taller
        if self.entered_shop_at and self.returned_service_at:
            delta = self.returned_service_at - self.entered_shop_at
            self.downtime_hours = round(delta.total_seconds() / 3600, 2)

        # Si se cierra y no hay closed_at, lo seteamos
        if self.status == WorkOrderStatus.CERRADA and self.closed_at is None:
            self.closed_at = timezone.now()

        super().save(*args, **kwargs)

    def __str__(self) -> str:
        return f"OT #{self.id} {self.equipment.code} ({self.status})"


