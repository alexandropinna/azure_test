// Define an output to export the name of the created Resource Group
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

// Define an output to export the location of the created Resource Group
output "location" {
  value = azurerm_resource_group.rg.location
}