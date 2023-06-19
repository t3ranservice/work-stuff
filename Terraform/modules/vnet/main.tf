data "azurerm_virtual_network" "vnet" {
  resource_group_name = var.resource_group_name
  name                = var.vnet_name
}