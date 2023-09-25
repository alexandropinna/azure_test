// Define a variable for the name of the Subnet
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

// Define a variable for the name of the resource group in which to create the Subnet
variable "resource_group_name" {
  description = "The name of the resource group in which to create the subnet"
  type        = string
}

// Define a variable for the name of the virtual network to which the Subnet should be associated
variable "virtual_network_name" {
  description = "The name of the virtual network to which the subnet should be associated"
  type        = string
}

// Define a variable for the address prefixes that are used by the Subnet
variable "address_prefixes" {
  description = "The address prefixes that are used by the subnet"
  type        = list(string)
}