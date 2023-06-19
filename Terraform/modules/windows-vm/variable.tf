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

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
}

variable "computer_name" {
  description = "Hostname for VM"
  type        = string
}

variable "vm_size" {
  description = "Size of VM"
  type        = string
}

variable "vm_user" {
  description = "Virtual machine administrator username"
  type        = string
}

variable "vm_password" {
  description = "Virtual machine administrator password"
  type        = string
}

variable "os_disk_type_windows" {
  description = "Type of storage account for OS disk"
  type        = string
}

variable "nic_ids" {
  description = "Identification number of network interface"
  type        = list
}

variable "image_id" {
  description = "ID of custom image as output variable from vm-image module"
  type        = string
}

variable "os_caching" {
  description = "Caching type"
  type        = string
}

variable "winrm_protocol" {
  description = "Protocol of Winrm connection"
  type        = string
}