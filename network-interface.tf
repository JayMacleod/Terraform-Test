resource "azurerm_network_interface" "front" {
  name                = "${var.prefix}-front-nic"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  network_security_group_id = "${azurerm_network_security_group.front.id}"


  ip_configuration {
    name                          = "front"
    subnet_id                     = "${azurerm_subnet.front.id}"
    private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.front.id}"
  }
}

resource "azurerm_network_interface" "back" {
  name                = "${var.prefix}-back-nic"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  network_security_group_id = "${azurerm_network_security_group.back.id}"


  ip_configuration {
    name                          = "front"
    subnet_id                     = "${azurerm_subnet.back.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "manage" {
  name                = "${var.prefix}-manage-nic"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  network_security_group_id = "${azurerm_network_security_group.manage.id}"


  ip_configuration {
    name                          = "manage"
    subnet_id                     = "${azurerm_subnet.manage.id}"
    private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.manage.id}"
  }
}

resource "azurerm_network_interface" "data" {
  name                = "${var.prefix}-data-nic"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  network_security_group_id = "${azurerm_network_security_group.data.id}"


  ip_configuration {
    name                          = "data"
    subnet_id                     = "${azurerm_subnet.data.id}"
    private_ip_address_allocation = "Dynamic"
  }
}
