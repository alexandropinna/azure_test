// Define a variable for the name of the Network Security Group
variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}

// Define a variable for the Azure Region where the Network Security Group should be created
variable "location" {
  description = "The Azure Region in which the network security group should be created"
  type        = string
}

// Define a variable for the name of the resource group in which to create the Network Security Group
variable "resource_group_name" {
  description = "The name of the resource group in which to create the network security group"
  type        = string
}

// Define a variable for the tags to be assigned to the Network Security Group resources
variable "tags" {
  description = "A map of tags to assign to the network security group resources"
  type        = map(string)
}
