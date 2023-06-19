data "azurerm_subnet" "subnet" {
  virtual_network_name  = var.vnet_name
  resource_group_name   = var.resource_group_name
  name                  = var.subnet_name
}