output "loadbalancer_id" {
  value = azurerm_lb.load-balancer.id
}

output "lb_frontend_conf" {
  value = azurerm_lb.load-balancer.frontend_ip_configuration
}
