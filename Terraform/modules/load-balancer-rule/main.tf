resource "azurerm_lb_rule" "production-inbound-rules" {
  loadbalancer_id                = var.loadbalancer_id
#  resource_group_name            = var.resource_group_name
  name                           = var.lb_rule_name
  protocol                       = var.lb_rule_protocol
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = var.lb_frontend_conf_name
  #probe_id                       = azurerm_lb_probe.ssh-inbound-probe.id
  backend_address_pool_ids        = [var.backend_address_pool_ids]
 

}
