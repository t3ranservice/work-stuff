data "azurerm_shared_image" "vm-image-linux" {
  name                  = var.vm_image_linux
  gallery_name          = var.gallery_name
  resource_group_name   = var.resource_group_name_image_gallery

  provider              = azurerm.golden_image
}