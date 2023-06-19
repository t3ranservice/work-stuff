resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "backend-pool-association" {
  network_interface_id    = var.nic_ids
  ip_configuration_name   = var.ip_conf_name
  backend_address_pool_id = var.backend_address_pool_id
}