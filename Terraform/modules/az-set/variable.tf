variable "location" {
  description = "Azure subscription location"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "az_set_name" {
  description = "Name of availability set"
  type        = string
}

variable "update_domain_count" {
  description = "Amount of update domains in availability set"
  type        = number
}

variable "fault_domain_count" {
  description = "Amount of fault domains in availability set"
  type        = number
}