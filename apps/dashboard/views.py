from django.shortcuts import get_object_or_404, render
from apps.equipment.models import Equipment, DailyLog, Issue, WorkOrder, WorkOrderStatus, IssueStatus
from django.db import models
from apps.equipment.services import compute_display_status, status_badge_class




def dashboard(request):
    equipments = Equipment.objects.filter(is_active=True).order_by("category", "name")

    # contadores simples
    open_wo = WorkOrder.objects.filter(status__in=[WorkOrderStatus.ABIERTA, WorkOrderStatus.EN_PROCESO])
    open_issue = Issue.objects.filter(status__in=[IssueStatus.ABIERTO, IssueStatus.EN_REVISION])

    open_wo_map = {}
    for row in open_wo.values("equipment_id").annotate(n=models.Count("id")):
        open_wo_map[row["equipment_id"]] = row["n"]

    open_issue_map = {}
    for row in open_issue.values("equipment_id").annotate(n=models.Count("id")):
        open_issue_map[row["equipment_id"]] = row["n"]

    # última lectura (DailyLog más reciente)
    last_log_map = {}
    latest_logs = (
        DailyLog.objects.select_related("equipment")
        .order_by("equipment_id", "-date")
    )
    for dl in latest_logs:
        if dl.equipment_id not in last_log_map:
            last_log_map[dl.equipment_id] = dl

    cards = []
    for e in equipments:
        dl = last_log_map.get(e.id)

        display_status = compute_display_status(e.id)
        cards.append({
            "id": e.id,
            "code": e.code,
            "name": e.name,
            "category": e.category,
            "status": display_status,
            "badge": status_badge_class(display_status),
            "last_date": dl.date if dl else None,
            "hourmeter_end": dl.hourmeter_end if dl else None,
            "open_wos": open_wo_map.get(e.id, 0),
            "open_issues": open_issue_map.get(e.id, 0),
        })
   

    return render(request, "dashboard/dashboard.html", {"cards": cards})


def equipment_detail(request, equipment_id: int):
    e = get_object_or_404(Equipment, pk=equipment_id)
    logs = DailyLog.objects.filter(equipment=e).order_by("-date")[:30]
    issues = Issue.objects.filter(equipment=e).order_by("-reported_at")[:20]
    wos = WorkOrder.objects.filter(equipment=e).order_by("-opened_at")[:20]

    return render(request, "dashboard/equipment_detail.html", {
        "e": e, "logs": logs, "issues": issues, "wos": wos
    })

