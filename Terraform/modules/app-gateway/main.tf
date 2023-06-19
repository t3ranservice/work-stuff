resource "azurerm_application_gateway" "agw" {
  name                = var.app_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags 

  sku {
    name     = var.sku_name_agw
    tier     = var.sku_tier_agw
    capacity = var.capacity_sku_agw
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_configuration_name
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = var.frontend_port_name
    port = var.frontend_port_agw
  }

  frontend_ip_configuration {
    name                          = var.frontend_ip_configuration_name_agw
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.fe_private_ip_allocation_type
  }

  backend_address_pool {
    name = var.backend_address_pool_name
  }

  backend_http_settings {
    name                  = var.backend_http_setting_name_agw
    cookie_based_affinity = var.cookie_based_affinity
    port                  = var.backend_port_agw
    protocol              = var.backend_protocol_agw
    request_timeout       = var.request_timeout
  }

  http_listener {
    name                           = var.https_listener_name
    frontend_ip_configuration_name = var.frontend_ip_configuration_name_agw
    frontend_port_name             = var.frontend_port_name
    protocol                       = var.https_listener_protocol
    ssl_certificate_name           = var.ssl_certificate_name
  }

  request_routing_rule {
    name                       = var.request_routing_rule_name
    rule_type                  = var.routing_rule_type
    http_listener_name         = var.https_listener_name
    backend_address_pool_name  = var.backend_address_pool_name
    backend_http_settings_name = var.backend_http_setting_name_agw
  }

  ssl_certificate {
    name      = var.ssl_certificate_name
    password  = var.password_cert
    data      = var.cert_data
  }
}