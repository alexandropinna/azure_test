// Define a resource block for creating an Azure Resource Group
resource "azurerm_resource_group" "rg" {
  // Set the name of the resource group from the resource_group_name variable
  name     = var.resource_group_name
  // Set the location of the resource group from the location variable
  location = var.location

  // Assign tags to the resource group from the tags variable
  tags = var.tags
}
