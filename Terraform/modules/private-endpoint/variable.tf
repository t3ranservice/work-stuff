variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure subscription location"
}

variable "private_endpoint_name" {
  type        = string
  description = "Name of private endpoint"
}

variable "private_conn_resource_id" {
    type        = string
    description = "ID of resource to connect PE to"
}

variable "subnet_id" {
    type        = string
    description = "ID of subnet"
}

variable "priv_serv_conn_name" {
    type        = string
    description = "Name of private service connection"
}

variable "subresource_names" {
  type        = list
  description = "List of subresources to attach PE to"
}

variable "is_man_conn" {
  type        = bool
  description = "Manual or not manual connection"
}