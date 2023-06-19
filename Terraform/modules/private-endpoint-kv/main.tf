resource "azurerm_private_endpoint" "private-endpoint-kv" {
  name                = var.private_endpoint_name_kv
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_dns_zone_group {
    name                 = var.private_dns_zone_name
    private_dns_zone_ids = [var.private_dns_zone_id]
  }
  
  private_service_connection {
    name                            = var.priv_serv_conn_name
    private_connection_resource_id  = var.resource_id
    is_manual_connection            = false
    subresource_names               = ["vault"]
  }
}