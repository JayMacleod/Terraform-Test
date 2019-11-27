resource "azurerm_virtual_machine" "front" {
  name                  = "${terraform.workspace}-front-vm"
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  network_interface_ids = ["${azurerm_network_interface.front.id}"]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${terraform.workspace}-front-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${terraform.workspace}-front-vm"
    admin_username = var.admin_user
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
	path = "/home/${var.admin_user}/.ssh/authorized_keys"
	key_data = file(pathexpand("~/.ssh/id_rsa.pub"))
	}
  }
  tags = {
    environment = terraform.workspace
  }
	connection {
		type = "ssh"
		user = var.admin_user
		private_key = file(pathexpand("~/.ssh/id_rsa"))
		host = azurerm_public_ip.front.fqdn
  }
  provisioner "remote-exec" {
	  inline = [
		  "sudo apt update",
		  "sudo apt install -y nginx",
      "sudo systemctl enable --now nginx"
	  ]
  } 
}

resource "azurerm_virtual_machine" "back" {
  name                  = "${terraform.workspace}-back-vm"
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  network_interface_ids = ["${azurerm_network_interface.back.id}"]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${terraform.workspace}-back-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${terraform.workspace}-back-vm"
    admin_username = var.admin_user
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
        path = "/home/${var.admin_user}/.ssh/authorized_keys"
        key_data = file(pathexpand("~/.ssh/id_rsa.pub"))
        }
  }
  tags = {
    environment = terraform.workspace
  }
 
}

resource "azurerm_virtual_machine" "manage" {
  name                  = "${terraform.workspace}-manage-vm"
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  network_interface_ids = ["${azurerm_network_interface.manage.id}"]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${terraform.workspace}-manage-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${terraform.workspace}-manage-vm"
    admin_username = var.admin_user
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
        path = "/home/${var.admin_user}/.ssh/authorized_keys"
        key_data = file(pathexpand("~/.ssh/id_rsa.pub"))
        }
  }
  tags = {
    environment = terraform.workspace
  }
        connection {
                type = "ssh"
                user = var.admin_user
                private_key = file(pathexpand("~/.ssh/id_rsa"))
                host = azurerm_public_ip.manage.fqdn
  }
  provisioner "remote-exec" {
          inline = [
                  "sudo apt update",
                  "sudo apt install -y nginx",
      "sudo systemctl enable --now nginx"
          ]
  }
}

resource "azurerm_virtual_machine" "data" {
  name                  = "${terraform.workspace}-data-vm"
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  network_interface_ids = ["${azurerm_network_interface.data.id}"]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${terraform.workspace}-data-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${terraform.workspace}-data-vm"
    admin_username = var.admin_user
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
        path = "/home/${var.admin_user}/.ssh/authorized_keys"
        key_data = file(pathexpand("~/.ssh/id_rsa.pub"))
        }
  }
  tags = {
    environment = terraform.workspace
  }

}
