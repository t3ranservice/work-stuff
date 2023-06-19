resource "azurerm_storage_share" "storage-share" {
  name                 = var.storage_share_name
  storage_account_name = var.storage_account_name
  quota                = var.storage_share_quota
  access_tier = var.share_access_tier
  enabled_protocol = var.share_protocol
}
