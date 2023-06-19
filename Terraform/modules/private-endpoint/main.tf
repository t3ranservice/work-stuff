resource "azurerm_private_endpoint" "endpoint" {
  name                = var.private_endpoint_name
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = var.priv_serv_conn_name
    private_connection_resource_id = var.private_conn_resource_id
    is_manual_connection           = var.is_man_conn
    subresource_names              = var.subresource_names
  }

}