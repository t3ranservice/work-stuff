variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "dns_entry_name" {
    description = "Name of DNS zone entry (domain)"
    type        = string
}

variable "zone_name" {
    description = "Name of Private DNS zone to add entry to"
    type        = string
}

variable "ttl" {
    description = "TTL for DNS propagation"
    type        = string
}

variable "dns_record_value" {
    description = "Value of DNS record"
    type        = list
}