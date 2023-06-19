output "private_endpoint_ip" {
    value = [azurerm_private_endpoint.endpoint.private_service_connection[*].private_ip_address]
}