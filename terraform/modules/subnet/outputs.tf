// Define an output to export the ID of the created Subnet
output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

// Define an output to export the name of the created Subnet
output "subnet_name" {
  value = azurerm_subnet.subnet.name
}