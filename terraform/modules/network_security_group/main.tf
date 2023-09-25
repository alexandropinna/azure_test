// Define a resource block for creating an Azure Network Security Group (NSG)
resource "azurerm_network_security_group" "nsg" {
  // Set the name of the network security group from the nsg_name variable
  name                = var.nsg_name
  // Set the location of the network security group from the location variable
  location            = var.location
  // Set the resource group name for the network security group from the resource_group_name variable
  resource_group_name = var.resource_group_name

  // Assign tags to the network security group from the tags variable
  tags = var.tags
}
