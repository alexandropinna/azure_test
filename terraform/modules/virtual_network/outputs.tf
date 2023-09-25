// Define an output to export the ID of the created Virtual Network
output "virtual_network_id" {
  value = azurerm_virtual_network.vnet.id
}

// Define an output to export the name of the created Virtual Network
output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}