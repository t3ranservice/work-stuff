resource "azurerm_shared_image" "shared_image" {
  name                = var.shared_image_name
  gallery_name        = var.shared_gallery_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type

  identifier {
    publisher = var.shared_image_publisher
    offer     = var.shared_image_offer
    sku       = var.shared_image_sku
  }
}