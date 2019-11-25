resource "azurerm_public_ip" "nginx" {
    name                         = "nginx-pip"
    location                     = "${azurerm_resource_group.default.location}"
    resource_group_name          = "${azurerm_resource_group.default.name}"
    allocation_method            = "Dynamic"
    domain_name_label = "nginx-${formatdate("DDMMYYhhmmss", timestamp())}"
}

