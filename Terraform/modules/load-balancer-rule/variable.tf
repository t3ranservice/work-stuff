#variable "resource_group_name" {
#  type        = string
#  description = "Resource Group name"
#}


variable "loadbalancer_id" {
  type = string
  description = "ID of load balancer"
}

variable "lb_rule_name" {
  type = string
  description = "Name of the load balancer rule"
}

variable "lb_rule_protocol" {
  type = string
  description = "Protocol of the LB rule"
}

variable "frontend_port" {
  type = string
  description = "Port of load balancer to receive traffic on"
}

variable "backend_port" {
  type = string
  description = "Port to forward traffic to from load balancer"
}

variable "lb_frontend_conf_name" {
#  type = string
  description = "Name of frontend IP configuration of load balancer"
}

variable "backend_address_pool_ids" {
  type = string
  description = "IDs of backend pool"
}
