variable "resource_group_name" {
  description   = "Resource group name"
  type          = string
}

variable "location" {
  description   = "Azure subscription location"
  type          = string
}

variable "app_gateway_name" {
  description   = "Initial name of application load balancer"
  type          = string
}

variable "tags" {
  description   = "Resource tags"
  type          = map
}
variable "gateway_ip_configuration_name" {
    description = "Name of application gateway ip configuration"
    type        = string
}

variable "subnet_id" {
  description = "Subnet identification number"
  type        = string
}

variable "frontend_port_name" {
    description = "Name of application gateway frontend port"
    type        = string
}

variable "frontend_port_agw" {
    description = "Frontend port of application gateway"
    type        = string
}

variable "sku_name_agw" {
    description = "Name of SKU to use application gateway"
    type        = string
}

variable "sku_tier_agw" {
    description = "Tier of SKU to use application gateway"
    type        = string
}

variable "capacity_sku_agw" {
    description = "Capacity of SKU to use application gateway"
    type        = string
}

variable "frontend_ip_configuration_name_agw" {
    description = "Name of frontend ip configuration of application gateway"
    type        = string
}

variable "fe_private_ip_allocation_type" {
  description = "Allocation type of frontend private IP for application gateway"
  type        = string
}

variable "backend_address_pool_name" {
  description = "Name of backend pool"
  type        = string
}

variable "backend_http_setting_name_agw" {
    description = "Name of backend http setting of application gateway"
    type        = string
}

variable "cookie_based_affinity" {
    description = "Enabling/disabling of gateway-managed cookies for maintaining user sessions"
    type        = string
}

variable "backend_port_agw" {
    description = "Backend port of application gateway"
    type        = string
}

variable "backend_protocol_agw" {
    description = "Backend protocol of application gateway"
    type        = string
}

variable "request_timeout" {
    description = "The request timeout in seconds, which must be between 1 and 86400 seconds"
    type        = string
}

variable "https_listener_name" {
    description = "Name of the HTTPS Listener"
    type        = string
}

variable "https_listener_protocol" {
    description = "Protocol of the HTTPS Listener"
    type        = string
}

variable "request_routing_rule_name" {
    description = "Name of this Request Routing Rule"
    type        = string
}

variable "routing_rule_type" {
    description = "Name of Routing Rule type"
    type        = string
}

variable "ssl_certificate_name" {
    description = "Name of generated self-signed certificate for AGW of OpenSearch"
    type        = string
}

variable "password_cert" {
    description = "Password of generated self-signed certificate for AGW of OpenSearch"
    type        = string
}

variable "cert_data" {
    description = "Data of generated self-signed certificate for AGW of OpenSearch"
    type        = string
}

variable "check_if_backend_pool_name" {
    description = "Name of packend pool name for if checking"
    type        = string
}