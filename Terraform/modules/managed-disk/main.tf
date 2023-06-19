resource "azurerm_managed_disk" "disk" {
  name                  = var.managed_disk_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  storage_account_type  = var.managed_disk_storage_account_type
  create_option         = var.managed_disk_create_option
  disk_size_gb          = var.managed_disk_size
  network_access_policy = var.network_access_policy
  zone                  = var.zone
  disk_access_id        = var.disk_access_id
  tags                  = var.tags
}