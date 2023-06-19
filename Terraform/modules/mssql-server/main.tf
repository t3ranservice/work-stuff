resource "azurerm_mssql_server" "example" {
  name                         = var.mssql_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.mssql_version
  administrator_login          = var.mssql_login
  administrator_login_password = var.mssql_pass
  minimum_tls_version          = var.mssql_min_tls_version

  tags = var.tags
}
