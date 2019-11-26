resource "azurerm_subnet" "front" {
  name                 = "front-net"
  resource_group_name  = "${azurerm_resource_group.default.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet" "back" {
  name                 = "back-net"
  resource_group_name  = "${azurerm_resource_group.default.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_subnet" "manage" {
  name                 = "manage-net"
  resource_group_name  = "${azurerm_resource_group.default.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "10.0.3.0/24"
}

resource "azurerm_subnet" "data" {
  name                 = "data-net"
  resource_group_name  = "${azurerm_resource_group.default.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "10.0.4.0/24"
}

