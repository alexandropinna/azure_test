// Define a resource block for creating multiple Azure Network Interfaces
resource "azurerm_network_interface" "nic" {
  // Use count to create multiple instances based on the value of vm_count variable
  count               = var.vm_count
  // Construct the name of the network interface using a prefix from variable and the instance index
  name                = "${var.nic_name}-${count.index}"
  // Set the location of the network interface from the location variable
  location            = var.location
  // Set the resource group name for the network interface from the resource_group_name variable
  resource_group_name = var.resource_group_name

  // Define the IP configuration for the network interface
  ip_configuration {
    // Construct the name of the IP configuration using a prefix from variable and the instance index
    name                          = "${var.name_ip_configuration}-${count.index}"
    // Set the subnet ID for the IP configuration from the subnet_id variable
    subnet_id                     = var.subnet_id
    // Set the IP address allocation method for the IP configuration from the private_ip_address_allocation variable
    private_ip_address_allocation = var.private_ip_address_allocation
    // Assign the Public IP address to the network interface using the public_ip_address_ids variable and the instance index
    public_ip_address_id          = var.public_ip_address_ids[count.index]
  }

  // Assign tags to the network interface from the tags variable
  tags = var.tags
}
