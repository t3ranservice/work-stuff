variable "resource_group_name_app" {
  type        = string
  description = "Resource Group name"
  default = ""
}

variable "resource_group_name_platform" {
  type        = string
  description = "Resource Group name"
  default = ""
}

variable "location" {
  type        = string
  description = "Azure subscription location"
  default     = ""
}

variable "secrets_vault_name" {
  type        = string
  description = "Name of Key Vault to retrieve variables from"
  default     = ""
}

variable "zones" {
  type        = list
  description = "Availability zones"
  default     = []
}

variable "disable_password_authentication" {
  type        = string
  description = "Whether or not disable password authentication"
  default     = ""
}

variable "network_access_policy" {
  type        = string
  description = "Network policy for managed disk"
  default     = ""
}

variable "disk_access_name" {
  type        = string
  description = "Disk access name"
  default     = ""
}

variable "tags" {
  description = "Resource tags"
  type = map
  default = {}
}

variable "address_space" {
  type        = list(string)
  description = "Azure vnet address space"
  default = []
}
variable "dns_servers" {
  type        = list(string)
  description = "Azure vnet dns servers"
  default = []
}

variable "vnet_name" {
  type        = string
  default     = ""
  description = "Virtual network name"
}

variable "subnet_name" {
  type        = string
  default     = ""
  description = "Subnet name"
}

variable "ip_allocation_type" {
  description = "Allocation type of private IP"
  type = string
  default = ""
}

variable "computer_name" {
  description = "Hostname for VM"
  type        = string
  default = ""
}

variable "ip_configuration_name" {
  description = "Name of network interface IP configuration"
  type = string
  default = ""
}

variable "nic_name" {
  description = "Network interface name"
  type = string
  default = ""
}

variable "vm_name" {
  description = "Virtual machine name"
  type = string
  default = ""
}

variable "os_caching" {
  description = "Caching type"
  type        = string
  default     = ""
}

variable "nic_ids" {
  description = "Network interface ID"
  type = list
  default = []
}

variable "os_disk_type_windows" {
  description = "Type of OS disk"
  type = string
  default = ""
}

variable "os_disk_type_linux" {
  description = "Type of OS disk"
  type = string
  default = ""
}

variable project_name {
  type        = string
  default     = ""
  description = "This is the name of the project"
}

variable environment {
  type        = string
  default     = ""
  description = "This is the name of the environment the code will be deploy"
}

variable increment {
  type        = string
  default     = ""
  description = "This is the increment number"
}

variable "vm_size" {
  description = "Size of VM"
  type = string
  default = ""
}

variable "private_endpoint_name" {
  type = string
  description = "Name of private endpoint"
  default = ""
}

variable "private_conn_resource_id" {
    type = string
    description = "ID of resource to connect PE to"
    default = ""
}

variable "os_version" {
  description = "version number"
  type = string
  default = ""
}

variable "vm_linux_image_id" {
  description = "Name of golden image"
  type        = string
  default     = ""
}


variable "account_kind" {
   type = string
   description = "Kind of storage account"
   default = ""
}


variable "managed_disk_storage_account_type" {
  description = "Storage account type for managed disk"
  type = string
  default = ""
}

variable "managed_disk_create_option" {
  description = "Create option for managed disk"
  type = string
  default = ""
}

variable "managed_disk_size" {
  description = "Size of managed disk"
  type = number
  default = 0
}

variable "managed_disk_name" {
  description = "Name of managed disk"
  type = string
  default = ""
}

variable "managed_disk_id" {
  description = "ID of managed disk"
  type = string
  default = ""
}

variable "vm_id" {
  description = "ID of virtual machine"
  type = string
  default = ""
}

variable "managed_disk_lun" {
  description = "The Logical Unit Number of the Data Disk"
  type = string
  default = ""
}

variable "managed_disk_caching" {
  description = "The caching of managed disk"
  type = string
  default = ""
}

variable "storage_account_name" {
  description = "Name of storage account"
  type = string
  default = ""
}

variable "storage_account_tier" {
  type = string
  description = "Tier of storage account"
  default = ""
}

variable "storage_account_replication" {
  type = string
  description = "Replication of storage account"
  default = ""
}

variable "storage_share_name" {
  description = "Name of the Azure File Share"
  type = string
  default = ""
}

variable "storage_share_quota" {
  description = "Quota of the File Share"
  type = number
  default = 0
}

variable "share_access_tier" {
  description = "Access tier of File Share"
  type = string
  default = ""
}

variable "share_protocol" {
  description = "Used protocol for mounting File Share"
  type = string
  default = ""
}

variable number {
  type        = string
  default     = ""
  description = "environment number"
}

variable cloud_provider {
  type        = string
  default     = ""
  description = "cloud provider name"
}

variable "azure_sql_login" {
  type = string
  description = "Username of Azure SQL admin"
  default = ""
}

variable "azure_sql_pass" {
  type = string
  description = "Password of Azure SQL admin"
  default = ""
}

variable "azure_sql_name" {
  type = string
  description = "Name of Azure SQL server"
  default = ""
}

variable "azure_sql_version" {
  type = string
  description = "Version of Azure SQL server: 2.0 or 12.0"
  default = ""
}

variable "mssql_version" {
  type = string
  description = "Microsoft SQL server version: 2.0 or 12.0"
  default = ""
}

variable "mssql_login" {
  type = string
  description = "Microsoft SQL server admin"
  default = ""
}

variable "mssql_pass" {
  type = string
  description = "Miscrosoft SQL server admin password"
  default = ""
}

variable "mssql_name" {
  type = string
  description = "Microsoft SQL server name"
  default = ""
}

variable "mssql_min_tls_version" {
  type = string
  description = "Minimun Microsoft SQL TLS version"
  default = ""
}

variable "lb_name" {
  description = "Name of load balancer"
  type = string
  default = ""
}

variable "public_ip_address_id" {
  description = "Public IP address ID"
  type = string
  default = ""
}

variable "lb_sku" {
  description = "SKU of load balancer: Basic, Standard, Gateway"
  type = string
  default = ""
}


variable "public_ip_alloc_method" {
  description = "Allocation method for Public IP: Static, Dynamic"
  type = string
  default = ""
}

variable "public_ip_name" {
  description = "Public IP name"
  type = string
  default = ""
}

variable "public_ip_sku" {
  description = "Public IP SKU: Standard, Basic"
  type = string
  default = ""
}

variable "backend_address_pool_name" {
  description = "Name of backend pool"
  type = string
  default = ""
}

variable "lb_rule_name" {
  type = string
  description = "Name of the load balancer rule"
  default = ""
}

variable "lb_rule_protocol" {
  type = string
  description = "Protocol of the LB rule"
  default = ""
}

variable "frontend_port" {
  type = number
  description = "Port of load balancer to receive traffic on"
  default = 0
}


variable "backend_port" {
  type = number
  description = "Port to forward traffic to from load balancer"
  default = 0
}

variable "lb_frontend_conf_name" {
  type = string
  description = "Name of frontend IP configuration of load balancer"
  default = ""
}

variable "private_ip_address_allocation" {
  description = "IP address allocation type: Static, Dynamic"
  type = string
  default = ""
}

variable "private_ip_address_version" {
  description = "IP address type: IPv4, IPv6"
  type = string
  default = ""
}

variable "public_key" {
  description = "Public SSH key"
  type = string
  default = ""
}

variable "dns_entry_name" {
    description = "Name of DNS zone entry (domain)"
    type = string
    default = ""
}

variable "zone_name" {
    description = "Name of Private DNS zone to add entry to"
    type = string
    default = ""
}

variable "ttl" {
    description = "TTL for DNS propagation"
    type = string
    default = ""
}

variable "dns_record_value" {
    description = "Value of DNS record"
    type = list
    default = []
}

variable "priv_serv_conn_name" {
    type = string
    description = "Name of private service connection"
    default = ""
}

variable "subresource_names" {
  type = list
  description = "List of subresources to attach PE to"
  default = []
}

variable "is_man_conn" {
  type = bool
  description = "Manual or not manual connection"
  default = false
}

