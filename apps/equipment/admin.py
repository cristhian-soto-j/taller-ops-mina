from django.contrib import admin
from .models import Equipment, DailyLog, Issue, WorkOrder


@admin.register(Equipment)
class EquipmentAdmin(admin.ModelAdmin):
    list_display = ("code", "name", "category", "status", "criticality", "is_active", "updated_at")
    list_filter = ("category", "status", "is_active")
    search_fields = ("code", "name")
    ordering = ("category", "name")


@admin.register(DailyLog)
class DailyLogAdmin(admin.ModelAdmin):
    list_display = ("date", "equipment", "shift", "operator_name", "hourmeter_start", "hourmeter_end", "status")
    list_filter = ("status", "shift", "date")
    search_fields = ("equipment__code", "equipment__name", "operator_name")
    autocomplete_fields = ("equipment",)
    date_hierarchy = "date"


@admin.register(Issue)
class IssueAdmin(admin.ModelAdmin):
    list_display = ("reported_at", "equipment", "title", "severity", "status", "reported_by")
    list_filter = ("severity", "status", "reported_at")
    search_fields = ("equipment__code", "equipment__name", "title")
    autocomplete_fields = ("equipment", "reported_by")


@admin.register(WorkOrder)
class WorkOrderAdmin(admin.ModelAdmin):
    list_display = ("id", "opened_at", "equipment", "type", "status", "downtime_hours", "repair_hours")
    list_filter = ("type", "status", "opened_at")
    search_fields = ("equipment__code", "equipment__name", "symptom")
    autocomplete_fields = ("equipment", "created_by", "issue")

