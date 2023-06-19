variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure subscription location"  
}

variable "tags" {
  description = "Resource tags"
  type = map 
}

variable "public_ip_alloc_method" {
  description = "Allocation method for Public IP: Static, Dynamic"
  type = string
}

variable "public_ip_name" {
  description = "Public IP name"
  type = string
}

variable "public_ip_sku" {
  description = "Public IP SKU: Standard, Basic"
  type = string
}


