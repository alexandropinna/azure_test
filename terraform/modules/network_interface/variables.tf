// Define a variable for the tags to be assigned to the network interface resources
variable "tags" {
  description = "A map of tags to assign to the network interface resources"
  type        = map(string)
}

// Define a variable for the number of network interfaces to create
variable "vm_count" {
  description = "The number of network interfaces to create"
  type        = number
}

// Define a variable for the name of the network interface
variable "nic_name" {
  description = "The name of the network interface"
  type        = string
}

// Define a variable for the name of the IP configuration
variable "name_ip_configuration" {
  description = "The name of the IP configuration"
  type        = string
}

// Define a variable for the Azure Region where the network interface should be created
variable "location" {
  description = "The Azure Region in which the network interface should be created"
  type        = string
}

// Define a variable for the name of the resource group in which to create the network interface
variable "resource_group_name" {
  description = "The name of the resource group in which to create the network interface"
  type        = string
}

// Define a variable for the ID of the subnet to which the network interface should be associated
variable "subnet_id" {
  description = "The ID of the subnet to which the network interface should be associated"
  type        = string
}

// Define a variable for the method of private IP address allocation
variable "private_ip_address_allocation" {
  description = "Defines how a private IP address is allocated"
  type        = string
}

// Define a variable for the IDs of the public IP addresses to associate with the network interfaces
variable "public_ip_address_ids" {
  description = "The IDs of the public IP addresses to associate with the network interfaces"
  type        = list(string)
}

// Define a variable for the public IP addresses associated with the network interfaces, with a default value of an empty list
variable "public_ip_addresses" {
  description = "The public IP addresses associated with the network interfaces"
  type        = list(string)
  default     = []
}
