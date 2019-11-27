resource "azurerm_network_security_group" "front" {
    name                = "front-door"
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name
    
    security_rule {
        name                       = "SSH1"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "HTTP1"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}
resource "azurerm_network_security_group" "back" {
    name                = "back-door"
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name

    security_rule {
        name                       = "SSH2"
        priority                   = 1003
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.10.1.0/24"
        destination_address_prefix = "*"
    }
   security_rule {
        name                       = "SSH4"
        priority                   = 1004
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.10.3.0/24"
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "SSH5"
        priority                   = 1005
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.10.4.0/24"
        destination_address_prefix = "*"
    }


}
resource "azurerm_network_security_group" "data" {
    name                = "data-door"
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name

    security_rule {
        name                       = "SSH6"
        priority                   = 1006
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.10.2.0/24"
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "SSH7"
        priority                   = 1007
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.10.3.0/24"
        destination_address_prefix = "*"
    }

} 
resource "azurerm_network_security_group" "manage" {
    name                = "manage-door"
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name

    security_rule {
        name                       = "SSH8"
        priority                   = 1008
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "HTTP2"
        priority                   = 1009
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

}
