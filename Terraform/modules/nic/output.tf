output "nic_ids" {
  value = azurerm_network_interface.vmnic.id
}

output "ip_configuration" {
  value = azurerm_network_interface.vmnic.ip_configuration
}