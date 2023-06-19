resource "azurerm_windows_virtual_machine_scale_set" "windows-vmss" {
  name                = var.windows_vmss_name
  computer_name_prefix = var.windows_vmss_computer_name_prefix 
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.windows_vmss_sku
  instances           = var.windows_vmss_instance_count
  admin_password      = var.windows_vmss_password
  admin_username      = var.windows_vmss_user
  source_image_id     = var.windows_source_image_id
  upgrade_mode        = var.windows_upgrade_mode
  zone_balance        = var.zone_balance
  zones               = var.zones
  #encryption_at_host_enabled = true


  os_disk {
    storage_account_type      = var.windows_vmss_os_disk_storage_type
    caching                   = var.windows_vmss_os_disk_caching
  }
  
  winrm_listener {
    protocol                  = var.winrm_listener_protocol
  }
  
  data_disk {
    #name                      = var.windows_vmss_data_disk_name
    caching                   = var.windows_vmss_data_disk_caching
    create_option             = var.windows_vmss_data_disk_create_option
    disk_size_gb              = var.windows_vmss_data_disk_size
    lun                       = var.windows_vmss_data_disk_lun
    storage_account_type      = var.windows_vmss_data_disk_storage_type
  }

  network_interface {
    name                      = var.windows_vmss_nic_name
    primary                   = var.windows_vmss_nic_primary

    ip_configuration {
      name                    = var.windows_vmss_ip_conf_name
      primary                 = var.windows_vmss_ip_conf_primary
      subnet_id               = var.subnet_id
    }
  }
}