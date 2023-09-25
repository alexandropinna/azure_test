// Define an output to export the ID of the created Network Security Group
output "network_security_group_id" {
  value = azurerm_network_security_group.nsg.id
}

// Define an output to export the name of the created Network Security Group
output "network_security_group_name" {
  value = azurerm_network_security_group.nsg.name
}
