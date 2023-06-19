resource "azurerm_storage_account" "storage-account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication
  account_kind = var.account_kind
  enable_https_traffic_only = false
  tags = var.tags
}
