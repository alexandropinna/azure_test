// Define a resource block for creating multiple Azure Public IP addresses
resource "azurerm_public_ip" "public_ip" {
  // Use count to create multiple instances based on the value of number_of_ips variable
  count               = var.number_of_ips
  // Construct the name of the public IP using a prefix from the name_prefix variable, a fixed string, and the instance index
  name                = "${var.name_prefix}-public-ip-${count.index}"
  // Set the location of the public IP from the location variable
  location            = var.location
  // Set the resource group name for the public IP from the resource_group_name variable
  resource_group_name = var.resource_group_name
  // Set the allocation method for the public IP from the allocation_method variable
  allocation_method   = var.allocation_method

  // Assign tags to the public IP from the tags variable
  tags = var.tags
}
