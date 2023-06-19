resource "azurerm_lb_backend_address_pool" "web_lb_backend_address_pool" {
  name                = var.backend_address_pool_name
  loadbalancer_id     = var.loadbalancer_id
}
