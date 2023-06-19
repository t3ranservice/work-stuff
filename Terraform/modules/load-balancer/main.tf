resource "azurerm_lb" "load-balancer" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku = var.lb_sku

  frontend_ip_configuration {
    zones               = var.zone
    name                 = var.lb_frontend_conf_name
    subnet_id = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    private_ip_address_version = var.private_ip_address_version
  }
}
