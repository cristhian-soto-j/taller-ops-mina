from django.urls import path
from .views import dashboard, equipment_detail

urlpatterns = [
    path("", dashboard, name="dashboard"),
    path("eq/<int:equipment_id>/", equipment_detail, name="equipment_detail"),
]
