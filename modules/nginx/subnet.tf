resource "azurerm_subnet" "front" {
  name                 = "front-net"
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.virtual_network.name
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet" "back" {
  name                 = "back-net"
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.virtual_network.name
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_subnet" "manage" {
  name                 = "manage-net"
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.virtual_network.name
  address_prefix       = "10.0.3.0/24"
}

resource "azurerm_subnet" "data" {
  name                 = "data-net"
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.virtual_network.name
  address_prefix       = "10.0.4.0/24"
}

