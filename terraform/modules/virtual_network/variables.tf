// Declare a variable to specify the name of the Azure Virtual Network to be created
variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

// Declare a variable to specify the address space for the Azure Virtual Network
// The address space is a list of IP address ranges specified in CIDR notation
variable "address_space" {
  description = "The address space that is used by the virtual network"
  type        = list(string)
}

// Declare a variable to specify the Azure Region where the Virtual Network will be created
// The location represents the datacenter region of Microsoft Azure
variable "location" {
  description = "The Azure Region in which the virtual network should be created"
  type        = string
}

// Declare a variable to specify the name of the Resource Group that will contain the Virtual Network
// Resource Groups in Azure provide a way to manage and organize related Azure resources
variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network"
  type        = string
}

// Declare a variable to specify a map of tags to be assigned to the Virtual Network resources
// Tags are key-value pairs that help in categorizing and organizing Azure resources
variable "tags" {
  description = "A map of tags to assign to the virtual network resources"
  type        = map(string)
}
