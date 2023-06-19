variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure subscription location"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map 
}

variable "managed_disk_storage_account_type" {
  description = "Storage account type for managed disk"
  type        = string
}

variable "managed_disk_create_option" {
  description = "Create option for managed disk"
  type        = string
}

variable "managed_disk_size" {
  description = "Size of managed disk"
  type        = number
}

variable "managed_disk_name" {
  description = "Name of managed disk"
  type        = string
}

variable "network_access_policy" {
  description = "Policy for accessing the disk via network"
  type        = string
}

variable "disk_access_id" {
  description = "ID number of disk access resource"
  type        = string
}

variable "zone" {
    description = "Identification number of availability zone"
    type        = string
}