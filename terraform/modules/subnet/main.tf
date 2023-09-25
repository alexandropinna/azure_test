// Define a resource block for creating an Azure Subnet
resource "azurerm_subnet" "subnet" {
  // Set the name of the subnet from the subnet_name variable
  name                 = var.subnet_name
  // Set the resource group name for the subnet from the resource_group_name variable
  resource_group_name  = var.resource_group_name
  // Set the virtual network name to which the subnet should be associated from the virtual_network_name variable
  virtual_network_name = var.virtual_network_name
  // Set the address prefixes that are used by the subnet from the address_prefixes variable
  address_prefixes     = var.address_prefixes
}