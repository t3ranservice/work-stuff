resource "azurerm_linux_virtual_machine" "vm" {
  name                             = var.vm_name
  resource_group_name              = var.resource_group_name
  location                         = var.location
  size                             = var.vm_size
  admin_username                   = var.vm_user
  admin_password                   = var.vm_password
  network_interface_ids            = var.nic_ids
  disable_password_authentication  = var.disable_password_authentication
  source_image_id                  = var.image_id
  zone                             = var.zone
  tags                             = var.tags

  os_disk {
    caching                        = var.os_caching
    storage_account_type           = var.os_disk_type
  }

  admin_ssh_key {
    username                       = var.vm_user
    public_key                     = var.public_key
  }
}