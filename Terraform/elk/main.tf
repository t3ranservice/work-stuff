data "azurerm_client_config" "current" {}

module "vnet" {
  source                        = "../dss-terraform-module//vnet"
  
  vnet_name                     = var.vnet_name
  resource_group_name           = var.resource_group_name_platform
}

module "subnet" {
  source                        = "../dss-terraform-module//subnet"
  
  vnet_name                     = var.vnet_name
  subnet_name                   = var.subnet_name
  resource_group_name           = var.resource_group_name_platform
}

module "subnet-app-gateway" {
  source                        = "../dss-terraform-module//subnet"
  
  vnet_name                     = var.vnet_name
  subnet_name                   = var.subnet_name_app_gateway
  resource_group_name           = var.resource_group_name_platform
}

module "nic-master" {
  source                    = "../dss-terraform-module//nic"
  count                     = 2

  nic_name                  = "${var.nic_name_master}-${var.opensearch_service_name}-${var.env}-${count.index}"
  resource_group_name       = var.resource_group_name_app
  location                  = var.location
  ip_configuration_name     = var.ip_configuration_name
  ip_allocation_type        = var.ip_allocation_type
  subnet_id                 = module.subnet.subnet_id
  tags                      = var.tags
}

module "nic-data" {
  source                    = "../dss-terraform-module//nic"
  count                     = 3

  nic_name                  = "${var.nic_name_data}-${var.opensearch_service_name}-${var.env}-${count.index}"
  resource_group_name       = var.resource_group_name_app
  location                  = var.location
  ip_configuration_name     = var.ip_configuration_name
  ip_allocation_type        = var.ip_allocation_type
  subnet_id                 = module.subnet.subnet_id
  tags                      = var.tags
}

module "linux-vm-master" {
  source                          = "../dss-terraform-module//linux-vm"
  count                           = 2

  vm_name                         = 
"${var.vm_name_opensearch_master}-${var.opensearch_service_name}-${var.env}-${count.index}"
  vm_size                         = var.vm_size_opensearch_master
  vm_user                         = var.vm_user
  vm_password                     = var.vm_password
  os_disk_type                    = var.os_disk_type_opensearch_master
  disable_password_authentication = var.disable_password_authentication
  resource_group_name             = var.resource_group_name_app
  location                        = var.location
  nic_ids                         = [module.nic-master[count.index].nic_ids]
  image_id                        = module.vm-image-linux.image_id
  os_caching                      = var.os_caching
  availability_set_id             = module.availability-set-master[0].availability_set_id
  zone                            = element(var.zones, count.index)
  tags                            = var.tags
}

module "linux-vm-data" {
  source                          = "../dss-terraform-module//linux-vm"
  count                           = 3

  vm_name                         = 
"${var.vm_name_opensearch_data}-${var.opensearch_service_name}-${var.env}-${count.index}"
  vm_size                         = var.vm_size_opensearch_data
  vm_user                         = var.vm_user
  vm_password                     = var.vm_password
  os_disk_type                    = var.os_disk_type_opensearch_data
  disable_password_authentication = var.disable_password_authentication
  resource_group_name             = var.resource_group_name_app
  location                        = var.location
  nic_ids                         = [module.nic-data[count.index].nic_ids]
  image_id                        = module.vm-image-linux.image_id
  os_caching                      = var.os_caching
  availability_set_id             = module.availability-set-data[0].availability_set_id
  zone                            = element(var.zones, count.index)
  tags                            = var.tags
}

module "vm-image-linux" {
  source                            = "../dss-terraform-module//vm-image-linux"

  vm_image_linux                    = var.vm_image_linux
  gallery_name                      = var.gallery_name
  resource_group_name_image_gallery = var.resource_group_name_image_gallery
  resource_id_image_linux           = var.resource_id_image_linux
  subscr_id_devrft-development-1-n  = var.subscr_id_devrft-development-1-n
}

module "managed-disks-master" {
  source                                = "../dss-terraform-module//managed-disk"
  count                                 = 2

  managed_disk_name                     = 
"${var.managed_disk_name_master}-${var.opensearch_service_name}-${var.env}-${count.index}"
  location                              = var.location
  managed_disk_storage_account_type     = var.managed_disk_storage_account_type
  managed_disk_create_option            = var.managed_disk_create_option
  managed_disk_size                     = var.managed_disk_size_master
  resource_group_name                   = var.resource_group_name_app
  network_access_policy                 = var.network_access_policy
  disk_access_id                        = module.disk-access.disk_access_id
  zone                                  = element(var.zones, count.index)
  tags                                  = var.tags
}

module "managed-disks-data" {
  source                                = "../dss-terraform-module//managed-disk"
  count                                 = 3

  managed_disk_name                     = 
"${var.managed_disk_name_data}-${var.opensearch_service_name}-${var.env}-${count.index}"
  location                              = var.location
  managed_disk_storage_account_type     = var.managed_disk_storage_account_type
  managed_disk_create_option            = var.managed_disk_create_option
  managed_disk_size                     = var.managed_disk_size_data
  resource_group_name                   = var.resource_group_name_app
  network_access_policy                 = var.network_access_policy
  disk_access_id                        = module.disk-access.disk_access_id
  zone                                  = element(var.zones, count.index)
  tags                                  = var.tags
}

module "data-disk-attachment-master" {
  source                = "../dss-terraform-module//data-disk-attachment"
  count                 = 2

  vm_id                 = module.linux-vm-master[count.index].vm_id
  managed_disk_id       = module.managed-disks-master[count.index].managed_disk_id
  managed_disk_lun      = var.managed_disk_lun
  managed_disk_caching  = var.managed_disk_caching
}

module "data-disk-attachment-data" {
  source                = "../dss-terraform-module//data-disk-attachment"
  count                 = 3

  vm_id                 = module.linux-vm-data[count.index].vm_id
  managed_disk_id       = module.managed-disks-data[count.index].managed_disk_id
  managed_disk_lun      = var.managed_disk_lun
  managed_disk_caching  = var.managed_disk_caching
}

module "app-gateway" {
  source                              = "../dss-terraform-module//app-gateway"

  app_gateway_name                    = "${var.app_gateway_name}-${var.opensearch_service_name}-${var.env}"
  resource_group_name                 = var.resource_group_name_app
  location                            = var.location
  sku_name_agw                        = var.sku_name_agw
  sku_tier_agw                        = var.sku_tier_agw
  capacity_sku_agw                    = var.capacity_sku_agw
  gateway_ip_configuration_name       = var.gateway_ip_configuration_name
  subnet_id                           = module.subnet-app-gateway.subnet_id
  frontend_port_name                  = var.frontend_port_name
  frontend_port_agw                   = var.frontend_port_agw
  frontend_ip_configuration_name_agw  = var.frontend_ip_configuration_name_agw
  fe_private_ip_allocation_type       = var.ip_allocation_type
  backend_address_pool_name           = var.backend_address_pool_name
  backend_http_setting_name_agw       = var.backend_http_setting_name_agw
  cookie_based_affinity               = var.cookie_based_affinity
  backend_port_agw                    = var.backend_port_agw
  backend_protocol_agw                = var.backend_protocol_agw
  request_timeout                     = var.request_timeout
  https_listener_name                 = var.https_listener_name
  https_listener_protocol             = var.https_listener_protocol
  request_routing_rule_name           = var.request_routing_rule_name
  routing_rule_type                   = var.routing_rule_type
  ssl_certificate_name                = var.ssl_certificate_name
  password_cert                       = var.password_cert
  check_if_backend_pool_name          = var.check_if_backend_pool_name
  cert_data                           = filebase64("${path.module}/${var.source_sens_file}")
  tags                                = var.tags
}

module "local-sensitive-file" {
  source            = "../dss-terraform-module//local-sensitive-file"

  source_sens_file  = var.source_sens_file
  filename          = var.filename
}

module "nic-agw-backend-pool-association-data" {
  source                    = "../dss-terraform-module//nic-agw-backend-pool-association"
  count                     = 3

  nic_ids                   = module.nic-data[count.index].nic_ids
  ip_conf_name              = module.nic-data.*.ip_configuration.0.name[count.index]
  backend_address_pool_id   = module.app-gateway.backend_address_pool_id
}


module "availability-set-master" {
  source                = "../dss-terraform-module//az-set"
  count                 = 1

  az_set_name           = "${var.az_set_name_master}-${var.opensearch_service_name}-${var.env}-${count.index}"
  location              = var.location
  resource_group_name   = var.resource_group_name_app
  update_domain_count   = var.update_domain_count
  fault_domain_count    = var.fault_domain_count
  tags                  = var.tags
}

module "availability-set-data" {
  source                = "../dss-terraform-module//az-set"
  count                 = 1

  az_set_name           = "${var.az_set_name_data}-${var.opensearch_service_name}-${var.env}-${count.index}"
  location              = var.location
  resource_group_name   = var.resource_group_name_app
  update_domain_count   = var.update_domain_count
  fault_domain_count    = var.fault_domain_count
  tags                  = var.tags
}

module "private-endpoint" {
  source                    = "../dss-terraform-module//private-endpoint"
  count                     = 1

  private_endpoint_name     = "${var.private_endpoint_name}-${var.opensearch_service_name}-${var.env}-${count.index}"
  resource_group_name       = var.resource_group_name_app
  location                  = var.location
  subnet_id                 = module.subnet.subnet_id
  private_conn_resource_id  = module.disk-access.disk_access_id
  priv_serv_conn_name       = var.priv_serv_conn_name_master
  subresource_names         = var.subresource_names
  is_man_conn               = var.is_man_conn
}

module "disk-access" {
  source                    = "../dss-terraform-module//disk-access"

  disk_access_name          = "${var.disk_access_name}-${var.opensearch_service_name}-${var.env}"
  location                  = var.location
  resource_group_name       = var.resource_group_name_app
}

module  "private-dns-record-a" {
  source              = "../dss-terraform-module//private-dns-zone-entry"

  resource_group_name = var.resource_group_name_platform
  dns_entry_name      = var.dns_entry_name
  zone_name           = var.zone_name
  ttl                 = var.ttl
  dns_record_value    = module.private-endpoint[0].private_endpoint_ip[0]
}

