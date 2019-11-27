

output "front_fqdn" {
  value = azurerm_public_ip.front.fqdn
}

output "manage_fqdn" {
  value = azurerm_public_ip.manage.fqdn
}

