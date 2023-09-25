// Define a resource block for creating an Azure Virtual Network
resource "azurerm_virtual_network" "vnet" {
  // Set the name of the virtual network from the virtual_network_name variable
  name                = var.virtual_network_name
  // Set the address space of the virtual network from the address_space variable
  address_space       = var.address_space
  // Set the location of the virtual network from the location variable
  location            = var.location
  // Set the resource group name for the virtual network from the resource_group_name variable
  resource_group_name = var.resource_group_name

  // Assign tags to the virtual network from the tags variable
  tags = var.tags
}