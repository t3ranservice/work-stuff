resource "azurerm_public_ip" "web_lbpublicip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.public_ip_alloc_method
  sku = var.public_ip_sku
  tags = var.tags
}
