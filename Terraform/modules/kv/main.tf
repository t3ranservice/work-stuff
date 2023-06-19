data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  name                          = var.keyvault_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days    = var.soft_delete_days
  purge_protection_enabled      = var.purge_protection
  public_network_access_enabled = var.public_access
  tags                          = var.tags

  sku_name                      = "premium"

  network_acls {
    bypass                      = "AzureServices"
    default_action              = "Deny"
  }
}

resource "azurerm_key_vault_access_policy" "devops-access-kv-group" {
  key_vault_id  = azurerm_key_vault.keyvault.id
  tenant_id     = var.tenant_id_ad
  object_id     = var.obj_id_devops_access_kv_group

  key_permissions = [
    "Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", 
    "Encrypt", "Decrypt", "UnwrapKey", "WrapKey", "Sign", "Purge"
  ]

  secret_permissions = [
    "Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"
  ]

  certificate_permissions = [
    "Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore",
    "ManageContacts", "Purge"
  ]
}

resource "azurerm_key_vault_access_policy" "guest-access-kv-group" {
  key_vault_id  = azurerm_key_vault.keyvault.id
  tenant_id     = var.tenant_id_ad
  object_id     = var.obj_id_guest_access_kv_group

  key_permissions = [
    "Get", "List"
  ]

  secret_permissions = [
    "Get", "List"
  ]

  certificate_permissions = [
    "Get", "List"
  ]
}