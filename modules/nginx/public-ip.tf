resource "azurerm_public_ip" "front" {
    name                         = "${terraform.workspace}-front-pip"
    location                     = var.resource_group.location
    resource_group_name          = var.resource_group.name
    allocation_method            = "Dynamic"
    domain_name_label            = "${terraform.workspace}-front-net-6857"
}

resource "azurerm_public_ip" "manage" {
    name                         = "${terraform.workspace}-manage-pip"
    location                     = var.resource_group.location
    resource_group_name          = var.resource_group.name
    allocation_method            = "Dynamic"
    domain_name_label            = "${terraform.workspace}-manage-net-0629"
}

