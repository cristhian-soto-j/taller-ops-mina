from apps.equipment.models import (
    DailyLog, EquipmentStatus,
    WorkOrder, WorkOrderStatus, WorkOrderType
)

def compute_display_status(equipment_id: int) -> str:
    # 1) Correctiva abierta/en proceso => detenido
    if WorkOrder.objects.filter(
        equipment_id=equipment_id,
        status__in=[WorkOrderStatus.ABIERTA, WorkOrderStatus.EN_PROCESO],
        type=WorkOrderType.CORRECTIVA,
    ).exists():
        return EquipmentStatus.DETENIDO

    # 2) Preventiva abierta/en proceso => mantención
    if WorkOrder.objects.filter(
        equipment_id=equipment_id,
        status__in=[WorkOrderStatus.ABIERTA, WorkOrderStatus.EN_PROCESO],
        type=WorkOrderType.PREVENTIVA,
    ).exists():
        return EquipmentStatus.MANTENCION

    # 3) Si no hay OT activa, usar el último DailyLog
    last_log = DailyLog.objects.filter(equipment_id=equipment_id).order_by("-date", "-id").first()
    if last_log:
        return last_log.status

    return EquipmentStatus.STANDBY


def status_badge_class(status: str) -> str:
    s = (status or "").upper()
    if s == "OPERATIVO":
        return "success"
    if s == "MANTENCION":
        return "warning"
    if s == "DETENIDO":
        return "danger"
    return "secondary"
