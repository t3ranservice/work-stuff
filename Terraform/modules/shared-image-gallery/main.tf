resource "azurerm_shared_image_gallery" "shared_image_gallery" {
  name                = var.shared_gallery_name
  resource_group_name = var.resource_group_name
  location            = var.location
  description         = var.description
  tags = var.tags
}