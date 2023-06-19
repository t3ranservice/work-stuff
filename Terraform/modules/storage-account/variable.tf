variable "storage_account_name" {
  description = "Name of storage account"
  type = string
}

variable "tags" {
  description = "Resource tags"
  type = map 
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure subscription location"  
}

variable "storage_account_tier" {
  type = string
  description = "Tier of storage account"
}

variable "storage_account_replication" {
  type = string
  description = "Replication of storage account"
}

variable "account_kind" {
   type = string
   description = "Kind of storage account"
}