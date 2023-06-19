resource "azurerm_disk_access" "disk-access" {
  name                 = var.disk_access_name
  location             = var.location
  resource_group_name  = var.resource_group_name
}