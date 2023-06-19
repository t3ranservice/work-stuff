resource "azurerm_network_interface" "vmnic" {
  name                              = var.nic_name
  location                          = var.location
  resource_group_name               = var.resource_group_name
  tags                              = var.tags 

  ip_configuration {
    name                            = var.ip_configuration_name
    subnet_id                       = var.subnet_id
    private_ip_address_allocation   = var.ip_allocation_type
  }
}