variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure subscription location"
  type        = string
}

variable "keyvault_name" {
  description = "Name of Azure Key Vault"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map 
}

variable "obj_id_devops_access_kv_group" {
  description = "Object ID number of devops-dss2azure-kv security group in Azure"
  type        = string
}

variable "tenant_id_ad" {
  description = "Tenant ID number of subscription DEVRFT in Active Directory"
  type        = string
}

variable "obj_id_guest_access_kv_group" {
  description = "Object ID number of list-access-kv-group security group in Azure"
  type        = string
}

variable "subnet_id" {
  description = "Subnet identification number"
  type        = string
}

variable "soft_delete_days" {
  description = "The number of days that items should be retained for once soft-deleted"
  type        = string
}

variable "purge_protection" {
  description = "Enforce a retention period for soft deleted key vaults when enabled"
  type        = bool
}

variable "public_access" {
  description = "Key for enabling public network access"
  type        = bool
}