resource "azurerm_windows_virtual_machine" "vm-windows" {
  name                              = var.vm_name
  computer_name                     = var.computer_name
  resource_group_name               = var.resource_group_name
  location                          = var.location
  size                              = var.vm_size
  admin_username                    = var.vm_user
  admin_password                    = var.vm_password
  network_interface_ids             = var.nic_ids
  source_image_id                   = var.image_id
  tags                              = var.tags

  os_disk {
    caching                         = var.os_caching
    storage_account_type            = var.os_disk_type_windows
  }

  winrm_listener {
    protocol = var.winrm_protocol
  }
}