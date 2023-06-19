resource "azurerm_virtual_machine_data_disk_attachment" "disk-attachment" {
  managed_disk_id    = var.managed_disk_id
  virtual_machine_id = var.vm_id
  lun                = var.managed_disk_lun
  caching            = var.managed_disk_caching
}