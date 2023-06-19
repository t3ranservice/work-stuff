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

variable "nic_name" {
  description = "Network interface name"
  type        = string
}

variable "ip_allocation_type" {
  description = "Allocation type of private IP"
  type        = string
}

variable "ip_configuration_name" {
  description = "Name of network interface IP configuration"
  type        = string
}

variable "subnet_id" {
  description = "Subnet identification number"
  type        = string
}