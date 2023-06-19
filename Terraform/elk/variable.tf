variable "resource_group_name_app" {
  description = "Resource Group name"
  type        = string
  default     = ""
}

variable "resource_group_name_platform" {
  description = "Resource Group name"
  type        = string
  default     = ""
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = ""
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = ""
}

variable "location" {
  description = "Azure subscription location"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Resource tags"
  type        = map 
  default     = {}
}

variable "env" {
  description = "Environment for deployed resource"
  type        = string
  default     = ""
}

variable "opensearch_service_name" {
  description = "Initial name of Opensearch service"
  type        = string
  default     = ""
}

variable "vm_name_opensearch_master" {
  description = "Common/initial name of Opensearch master virtual machines"
  type        = string
  default     = ""
}

variable "vm_name_opensearch_data" {
  description = "Common/initial name of Opensearch data virtual machines"
  type        = string
  default     = ""
}

variable "vm_user" {
  description = "User for VM"
  type        = string
  default     = ""
}

variable "vm_password" {
  description = "Password for VM"
  type        = string
  default     = ""
}

variable "keyvault_name" {
  description = "Name of Azure Key Vault"
  type        = string
  default     = ""
}

variable "project_name" {
  description = "Name of DSS project"
  type        = string
  default     = ""
}

variable "private_endpoint_name_kv" {
  description = "Default name of private endpoint"
  type        = string
  default     = ""
}

variable "obj_id_devops_access_kv_group" {
  description = "Object ID number of devops-dss2azure-kv security group in Azure"
  type        = string
  default     = ""
}

variable "tenant_id_ad" {
  description = "Tenant ID number of subscription DEVRFT in Active Directory"
  type        = string
  default     = ""
}

variable "obj_id_guest_access_kv_group" {
  description = "Object ID number of read-access-kv-group security group in Azure"
  type        = string
  default     = ""
}

variable "private_dns_zone_name" {
  description = "Name of private DNS zone in Azure"
  type        = string
  default     = ""
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted"
  type        = string
  default     = ""
}

variable "purge_protection_enabled" {
  description = "Enforce a retention period for soft deleted key vaults when enabled"
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Key for enabling public network access"
  type        = bool
  default     = false
}

variable "ip_allocation_type" {
  description = "Allocation type of private IP"
  type        = string
  default     = ""
}

variable "ip_configuration_name" {
  description = "Name of network interface IP configuration"
  type        = string
  default     = ""
}

variable "vm_size_opensearch_master" {
  description = "Size of Linux VM for Opensearch master nodes"
  type        = string
  default     = ""
}

variable "vm_size_opensearch_data" {
  description = "Size of Linux VM for Opensearch data nodes"
  type        = string
  default     = ""
}

variable "nic_ids" {
  description = "Identification number of managed disk"
  type        = list
  default     = []
}

variable "os_caching" {
  description = "Caching type"
  type        = string
  default     = ""
}

variable "os_disk_type_opensearch_master" {
  description = "Type of storage account for OS disk"
  type        = string
  default     = ""
}

variable "os_disk_type_opensearch_data" {
  description = "Type of storage account for OS disk"
  type        = string
  default     = ""
}

variable "gallery_name" {
  description = "Name of Golden Image gallery"
  type        = string
  default     = ""
}

variable "vm_image_linux" {
  description = "Name of golden image"
  type        = string
  default     = ""
}

variable "resource_group_name_image_gallery" {
  description = "Name of resource group name with gallery of Golden images"
  type        = string
  default     = ""
}

variable "resource_id_image_linux" {
  description = "Resource ID of Golden image Linux"
  type        = string
  default     = ""
}

variable "subscr_id_devrft-development-1-n" {
  description = "ID of subcription which includes gallery of Golden images"
  type        = string
  default     = ""
}

variable "nic_name_master" {
  description = "Network interface name for master nodes Opensearch"
  type        = string
  default     = ""
}

variable "nic_name_data" {
  description = "Network interface name for data nodes Opensearch"
  type        = string
  default     = ""
}

variable "managed_disk_storage_account_type" {
  description = "Storage account type for managed disk"
  type        = string
  default     = ""
}

variable "managed_disk_create_option" {
  description = "Create option for managed disk"
  type        = string
  default     = ""
}

variable "managed_disk_size_master" {
  description = "Size of master managed disk"
  type        = number
  default     = 0
}

variable "managed_disk_size_data" {
  description = "Size of data managed disk"
  type        = number
  default     = 0
}

variable "managed_disk_name_master" {
  description = "Name of managed disks for master Opensearch nodes"
  type        = string
  default     = ""
}

variable "managed_disk_name_data" {
  description = "Name of managed disks for data Opensearch nodes"
  type        = string
  default     = ""
}

variable "managed_disk_lun" {
  description = "Lun value of managed disk"
  type        = string
  default     = ""
}

variable "managed_disk_caching" {
  description = "Caching value of managed disk"
  type        = string
  default     = ""
}

variable "priv_serv_conn_name" {
  description = "Name of private service connection"
  type        = string
  default     = ""
}

variable "backend_address_pool_name" {
  description = "Name of backend pool"
  type        = string
  default     = ""
}

variable "lb_rule_name" {
  type        = string
  description = "Name of the load balancer rule"
  default     = ""
}

variable "lb_rule_protocol" {
  type        = string
  description = "Protocol of the LB rule"
  default     = ""
}

variable "frontend_port" {
  type        = number
  description = "Port of load balancer to receive traffic on"
  default     = 0
}

variable "backend_port" {
  type        = number
  description = "Port to forward traffic to from load balancer"
  default     = 0
}

variable "lb_frontend_conf_name" {
  type        = string
  description = "Name of frontend IP configuration of load balancer"
  default     = ""
}

variable "private_ip_address_allocation" {
  description = "IP address allocation type: Static, Dynamic"
  type        = string
  default     = ""
}

variable "private_ip_address_version" {
  description = "IP address type: IPv4, IPv6"
  type        = string
  default     = ""
}
variable "lb_name" {
  description = "Name of load balancer"
  type        = string
  default     = ""
}

variable "lb_sku" {
  description = "SKU of load balancer: Basic, Standard, Gateway"
  type        = string
  default     = ""
}

variable "az_set_name_master" {
  description = "Name of availability set"
  type        = string
  default     = ""
}

variable "az_set_name_data" {
  description = "Name of availability set"
  type        = string
  default     = ""
}

variable "update_domain_count" {
  description = "Amount of update domains in availability set"
  type        = number
  default     = 0
}

variable "fault_domain_count" {
  description = "Amount of fault domains in availability set"
  type        = number
  default     = 0
}

variable "network_access_policy" {
  description = "Policy for accessing the disk via network"
  type        = string
  default     = ""
}

variable "private_endpoint_name" {
  description = "Name of private endpoint for managed disks"
  type        = string
  default     = ""
}

variable "priv_serv_conn_name_master" {
  description = "Name of private service conection for master managed disks"
  type        = string
  default     = ""
}

variable "priv_serv_conn_name_data" {
  description = "Name of private service conection for data managed disks"
  type        = string
  default     = ""
}

variable "subresource_names" {
  type        = list
  description = "List of subresources to attach PE to"
  default     = []
}

variable "is_man_conn" {
  type        = bool
  description = "Manual or not manual connection"
  default     = false
}

variable "disk_access_name" {
  description = "Name of disk access for private connection to managed disks"
  type        = string
  default     = ""
}

variable "dns_entry_name" {
  description = "Name of DNS zone entry (domain) for disks"
  type        = string
  default     = ""
}

variable "zone_name" {
    description = "Name of Private DNS zone to add entry"
    type        = string
    default     = ""
}

variable "ttl" {
    description = "TTL for DNS propagation"
    type        = string
    default     = ""
}

variable "dns_record_value" {
    description = "Value of DNS record"
    type        = list
    default     = []
}

variable "app_gateway_name" {
    description = "Name of application gateway"
    type        = string
    default     = ""
}

variable "gateway_ip_configuration_name" {
    description = "Name of application gateway ip configuration"
    type        = string
    default     = ""
}

variable "frontend_port_name" {
    description = "Name of application gateway frontend port"
    type        = string
    default     = ""
}

variable "frontend_port_agw" {
    description = "Frontend port of application gateway"
    type        = string
    default     = ""
}

variable "sku_name_agw" {
    description = "Name of SKU to use application gateway"
    type        = string
    default     = ""
}

variable "sku_tier_agw" {
    description = "Tier of SKU to use application gateway"
    type        = string
    default     = ""
}

variable "capacity_sku_agw" {
    description = "Capacity of SKU to use application gateway"
    type        = string
    default     = ""
}

variable "frontend_ip_configuration_name_agw" {
    description = "Name of frontend ip configuration of application gateway"
    type        = string
    default     = ""
}

variable "backend_http_setting_name_agw" {
    description = "Name of backend http setting of application gateway"
    type        = string
    default     = ""
}

variable "cookie_based_affinity" {
    description = "Enabling/disabling of gateway-managed cookies for maintaining user sessions"
    type        = string
    default     = ""
}

variable "backend_port_agw" {
    description = "Backend port of application gateway"
    type        = string
    default     = ""
}

variable "backend_protocol_agw" {
    description = "Backend protocol of application gateway"
    type        = string
    default     = ""
}

variable "request_timeout" {
    description = "The request timeout in seconds, which must be between 1 and 86400 seconds"
    type        = string
    default     = ""
}

variable "https_listener_name" {
    description = "Name of the HTTPS Listener"
    type        = string
    default     = ""
}

variable "https_listener_protocol" {
    description = "Protocol of the HTTPS Listener"
    type        = string
    default     = ""
}

variable "request_routing_rule_name" {
    description = "Name of this Request Routing Rule"
    type        = string
    default     = ""
}

variable "routing_rule_type" {
    description = "Name of this Request Routing Rule"
    type        = string
    default     = ""
}

variable "subnet_name_app_gateway" {
    description = "Name of subnet for application gateway"
    type        = string
    default     = ""
}

variable "zones" {
    description = "List of identification numbers of availability zones"
    type        = list
    default     = []
}

variable "zone" {
    description = "Identification number of availability zone"
    type        = string
    default     = ""
}

variable "disable_password_authentication" {
  description = "Disabling or enabling password authentication in VM"
  type        = bool
  default     = false
}

variable "kv_cert_name" {
    description = "Name of Key Vault certificate for AGW of OpenSearch"
    type        = string
    default     = ""
}

variable "ssl_certificate_name" {
    description = "Name of generated self-signed certificate for AGW of OpenSearch"
    type        = string
    default     = ""
}

variable "password_cert" {
    description = "Password of generated self-signed certificate for AGW of OpenSearch"
    type        = string
    default     = ""
}

variable "source_sens_file" {
    description = "Source of location generated self-signed certificate for AGW of OpenSearch"
    type        = string
    default     = ""
}

variable "filename" {
    description = "Path for creation new sensitive file for AGW resource using"
    type        = string
    default     = ""
}

variable "check_if_backend_pool_name" {
    description = "Name of packend pool name for if checking"
    type        = string
    default     = ""
}

