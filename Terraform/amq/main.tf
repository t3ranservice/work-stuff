data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "tf-secrets-vault" {
  name                                    = var.secrets_vault_name 
  resource_group_name                     = var.resource_group_name_app
}


data "azurerm_key_vault_secret" "vm_password" {
  name                                    = "vmpass"
  key_vault_id                            = data.azurerm_key_vault.tf-secrets-vault.id
}

data "azurerm_key_vault_secret" "vm_user" {
  name                                    = "vmuser"
  key_vault_id                            = data.azurerm_key_vault.tf-secrets-vault.id
}


module "vnet" {
  source                                  = "../dss-terraform-module/vnet"
  resource_group_name                     = var.resource_group_name_platform
  vnet_name                               = var.vnet_name
}


module "subnet" {
  source = "../dss-terraform-module/subnet"
  resource_group_name                     = var.resource_group_name_platform
  vnet_name                               = var.vnet_name
  subnet_name                             = var.subnet_name
}


resource "tls_private_key" "ssh" {
  algorithm                               = "RSA"
  rsa_bits                                = "4096"
}


resource "local_file" "private_key" {
  content                                 = tls_private_key.ssh.private_key_pem
  filename                                = "ansiblekey.pem"
  file_permission                         = "0600"
}


module "nic" {
  source                                  = "../dss-terraform-module/nic"
  count                                   = 2
  resource_group_name                     = var.resource_group_name_app
  location                                = var.location
  subnet_id                               = module.subnet.subnet_id
  nic_name                                = 
"${var.nic_name}-${var.location}-${var.cloud_provider}-${var.number}-${var.environment}-${var.project_name}-${count.index}"
  ip_configuration_name                   = var.ip_configuration_name
  ip_allocation_type                      = var.ip_allocation_type
  tags                                    = merge(var.tags, {})
}

module "managed-disk" {
  source                                  = "../dss-terraform-module/managed-disk"
  count                                   = 2
  resource_group_name                     = var.resource_group_name_app
  location                                = var.location
  managed_disk_name                       = 
"${var.managed_disk_name}-${var.location}-${var.cloud_provider}-${var.number}-${var.environment}-${var.project_name}-${count.index}"
  managed_disk_storage_account_type       = var.managed_disk_storage_account_type
  managed_disk_create_option              = var.managed_disk_create_option
  managed_disk_size                       = var.managed_disk_size
  network_access_policy                   = var.network_access_policy
  zone                                    = element(var.zones, count.index)
  disk_access_id                          = module.disk-access[0].disk_access_id
  tags                                    = merge(var.tags, {})
}


module "disk-access" {
  source                                  = "../dss-terraform-module//disk-access"
  count                                   = 1
  resource_group_name                     = var.resource_group_name_app
  location                                = var.location
  disk_access_name                        = 
"${var.disk_access_name}-${var.location}-${var.cloud_provider}-${var.number}-${var.environment}-${var.project_name}-${count.index}"
}


module "vm" {
  source                                  = "../dss-terraform-module/linux-vm"
  count                                   = 2
  resource_group_name                     = var.resource_group_name_app
  location                                = var.location
  vm_name                                 = 
"${var.vm_name}-${var.location}-${var.cloud_provider}-${var.number}-${var.environment}-${var.project_name}-${count.index}"
  zone                                    = element(var.zones, count.index)
  vm_size                                 = var.vm_size
  vm_user                                 = data.azurerm_key_vault_secret.vm_user.value
  vm_password                             = data.azurerm_key_vault_secret.vm_password.value
  os_disk_type                            = var.os_disk_type_linux
  os_caching                              = var.os_caching
  disable_password_authentication         = var.disable_password_authentication
  nic_ids                                 = ["${element(module.nic.*.nic_ids, count.index)}"]
  image_id                                = var.vm_linux_image_id
  public_key                              = tls_private_key.ssh.public_key_openssh
  tags                                    = merge(var.tags, {})
}


module "data-disk-attachment" {
  source                                  = "../dss-terraform-module/data-disk-attachment"
  count                                   = 2
  vm_id                                   = module.vm[count.index].vm_id
  managed_disk_id                         = module.managed-disk[count.index].managed_disk_id
  managed_disk_lun                        = var.managed_disk_lun
  managed_disk_caching                    = var.managed_disk_caching
}

module "load-balancer" {
  source                                  = "../dss-terraform-module/load-balancer"
  count                                   = 1
  location                                = var.location
  resource_group_name                     = var.resource_group_name_app
  zone                                    = var.zones
  lb_name                                 = 
"${var.lb_name}-${var.location}-${var.cloud_provider}-${var.number}-${var.environment}-${var.project_name}-${count.index}"
  lb_sku                                  = var.lb_sku
  subnet_id                               = module.subnet.subnet_id
  lb_frontend_conf_name                   = var.lb_frontend_conf_name
  private_ip_address_allocation           = var.private_ip_address_allocation
  private_ip_address_version              = var.private_ip_address_version
  tags                                    = merge(var.tags, {})

}

module "lb-backend-pool" {
  source                                  = "../dss-terraform-module/lb-backend-pool"
  backend_address_pool_name               = var.backend_address_pool_name
  loadbalancer_id                         = module.load-balancer[0].loadbalancer_id
}

module "load-balancer-rule" {
  source                                  = "../dss-terraform-module/load-balancer-rule"
  loadbalancer_id                         = module.load-balancer[0].loadbalancer_id
  lb_rule_name                            = var.lb_rule_name
  lb_rule_protocol                        = var.lb_rule_protocol
  frontend_port                           = var.frontend_port
  backend_port                            = var.backend_port
  lb_frontend_conf_name                   = var.lb_frontend_conf_name
  backend_address_pool_ids                = module.lb-backend-pool.backend_address_pool_ids
}

module "nic-backend-pool-association" {
  source                                  = "../dss-terraform-module/nic-backend-pool-association"
  count                                   = 2
  nic_ids                                 = module.nic[count.index].nic_ids   
  ip_conf_name                            = module.nic.*.ip_configuration.0.name[count.index]  
  backend_address_pool_id                 = module.lb-backend-pool.backend_address_pool_ids
}

module "storage-account" {
  source                                  = "../dss-terraform-module/storage-account"
  count                                   = 1
  resource_group_name                     = var.resource_group_name_app
  location                                = var.location
  storage_account_name                    = var.storage_account_name
  storage_account_tier                    = var.storage_account_tier
  storage_account_replication             = var.storage_account_replication
  account_kind                            = var.account_kind
  tags                                    = merge(var.tags, {})
}

module "storage-account-share" {
  source                                  = "../dss-terraform-module/storage-share"
  count                                   = 1
  storage_share_name                      = var.storage_share_name
  storage_account_name                    = module.storage-account[0].storage_account_name
  storage_share_quota                     = var.storage_share_quota
  share_access_tier                       = var.share_access_tier
  share_protocol                          = var.share_protocol
}

module "private-endpoint" {
  source                                  = "../dss-terraform-module/private-endpoint"
  count                                   = 1
  resource_group_name                     = var.resource_group_name_app
  location                                = var.location
  private_endpoint_name                   = 
"${var.private_endpoint_name}-${var.location}-${var.cloud_provider}-${var.number}-${var.environment}-${var.project_name}-${count.index}"
  subnet_id                               = module.subnet.subnet_id
  private_conn_resource_id                = module.storage-account[0].storage_account_id
  priv_serv_conn_name                     = var.priv_serv_conn_name
  subresource_names                       = var.subresource_names
  is_man_conn                             = var.is_man_conn
}


resource "local_file" "hosts_cfg" {
  content = templatefile("./inventory.yml",
    {
      active-mq-vms                       = module.vm.*.private_ip_address
    }
  )
  filename                                = "hosts.cfg"
}

module  "private-dns-record" {
  source                                  = "../dss-terraform-module/private-dns-zone-entry"
  resource_group_name                     = var.resource_group_name_platform
  dns_entry_name                          = var.dns_entry_name
  zone_name                               = var.zone_name
  ttl                                     = var.ttl
  dns_record_value                        = module.private-endpoint[0].private_endpoint_ip[0]
}

resource "local_file" "mount_cfg_dns" {
  content                                 = 
"${module.private-dns-record.dns_entry_name}.${module.private-dns-record.zone_name}"
  filename                                = "mount.cfg"
}


