output "zone_name" {
    value = azurerm_private_dns_a_record.private_dns_record.zone_name
}

output "dns_entry_name" {
    value = azurerm_private_dns_a_record.private_dns_record.name
}