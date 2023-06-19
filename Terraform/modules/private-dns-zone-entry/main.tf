resource "azurerm_private_dns_a_record" "private_dns_record" {
  name                = var.dns_entry_name
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = var.ttl
  records             = var.dns_record_value
}