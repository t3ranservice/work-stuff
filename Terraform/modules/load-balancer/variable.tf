variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure subscription location"
}

variable "zone" {
  type        = list
  description = "Availability zone"
}

variable "tags" {
  description = "Resource tags"
  type = map
}

variable "lb_name" {
  description = "Name of load balancer"
  type = string
}

variable "lb_frontend_conf_name" {
  description = "Name of frontend IP configuration"
  type = string
}


variable "lb_sku" {
  description = "SKU of load balancer: Basic, Standard, Gateway"
  type = string
}


variable "private_ip_address_allocation" {
  description = "IP address allocation type: Static, Dynamic"
  type = string
}

variable "private_ip_address_version" {
  description = "IP address type: IPv4, IPv6"
  type = string
}

variable "subnet_id" {
    description = "Subnet ID"
    type = string
}
