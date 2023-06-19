data "azurerm_shared_image" "vm-image-windows" {
  name                  = var.vm_image_windows
  gallery_name          = var.gallery_name
  resource_group_name   = var.resource_group_name

  provider              = azurerm.golden_image
}