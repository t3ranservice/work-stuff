output "agw_id" {
  value = azurerm_application_gateway.agw.id
}

output "agw_frontend_conf" {
  value = azurerm_application_gateway.agw.frontend_ip_configuration
}

output "backend_address_pool_id" {
  value = [for value in azurerm_application_gateway.agw.backend_address_pool.*.id : value if var.backend_address_pool_name == var.check_if_backend_pool_name][0]
}