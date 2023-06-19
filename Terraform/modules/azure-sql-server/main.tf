resource "azurerm_sql_server" "example" {
  name                         = var.azure_sql_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.azure_sql_version  #"12.0"
  administrator_login          = var.azure_sql_login
  administrator_login_password = var.azure_sql_pass

  tags = var.tags
}
