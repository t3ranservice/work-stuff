variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure subscription location"
  type        = string
}

variable "subnet_id" {
  description = "Subnet identification number"
  type        = string
}

variable "private_endpoint_name_kv" {
  description = "Default name of private endpoint"
  type        = string
}

variable "resource_id" {
  description = "Output variable of keyvault module: ID of Key Vault resource"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map 
}

variable "private_dns_zone_id" {
  description = "ID number of private dns zone"
  type        = string
}

variable "private_dns_zone_name" {
  description = "Name of private DNS zone in Azure"
  type        = string
}


variable "priv_serv_conn_name" {
  description = "Name of private service connection"
  type        = string
}
