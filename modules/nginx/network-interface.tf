resource "azurerm_network_interface" "front" {
  name                = "${terraform.workspace}-front-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.front.id


  ip_configuration {
    name                          = "${terraform.workspace}-front"
    subnet_id                     = azurerm_subnet.front.id
    private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.front.id
  }
}

resource "azurerm_network_interface" "back" {
  name                = "${terraform.workspace}-back-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.back.id


  ip_configuration {
    name                          = "${terraform.workspace}-back"
    subnet_id                     = azurerm_subnet.back.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "manage" {
  name                = "${terraform.workspace}-manage-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.manage.id


  ip_configuration {
    name                          = "${terraform.workspace}-manage"
    subnet_id                     = azurerm_subnet.manage.id
    private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.manage.id
  }
}

resource "azurerm_network_interface" "data" {
  name                = "${terraform.workspace}-data-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.data.id


  ip_configuration {
    name                          = "${terraform.workspace}-data"
    subnet_id                     = azurerm_subnet.data.id
    private_ip_address_allocation = "Dynamic"
  }
}
