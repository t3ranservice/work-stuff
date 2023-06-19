resource "azurerm_linux_virtual_machine_scale_set" "linux-vmss" {
  name                        = var.linux_vmss_name
  resource_group_name         = var.resource_group_name
  computer_name_prefix        = var.linux_vmss_computer_name_prefix
  location                    = var.location
  sku                         = var.linux_vmss_sku
  instances                   = var.linux_vmss_instance_count
  admin_username              = var.linux_vmss_user
  admin_password              = var.linux_vmss_password
  disable_password_authentication = false
  zone_balance                = var.zone_balance
  zones                       = var.zones
  #encryption_at_host_enabled = true


  admin_ssh_key {
    username                  = var.linux_vmss_user
    public_key                = var.public_key
  }
  
  custom_data = base64encode("${file("${var.custom_data_file}")}")

  source_image_id             = var.linux_source_image_id
  upgrade_mode                = var.linux_vmss_upgrade_mode

  os_disk {
    storage_account_type      = var.linux_vmss_os_disk_storage_type
    caching                   = var.linux_vmss_os_disk_caching
  }

  data_disk {
    caching                   = var.linux_vmss_data_disk_caching
    create_option             = var.linux_vmss_data_disk_create_option
    disk_size_gb              = var.linux_vmss_data_disk_size
    lun                       = var.linux_vmss_data_disk_lun
    storage_account_type      = var.linux_vmss_data_disk_storage_type
  }

  network_interface {
    name                      = var.linux_vmss_nic_name
    primary                   = var.linux_vmss_nic_primary

    ip_configuration {
      name                    = var.linux_vmss_ip_conf_name
      primary                 = var.linux_vmss_ip_conf_primary
      subnet_id               = var.subnet_id
    }
  }
}