// Define a variable for the tags to be assigned to the Public IP resources
variable "tags" {
  description = "A map of tags to assign to the public IP resources"
  type        = map(string)
}

// Define a variable for the number of Public IPs to create
variable "number_of_ips" {
  description = "The number of public IPs to create"
  type        = number
}

// Define a variable for the name prefix for the Public IP resources
variable "name_prefix" {
  description = "The name prefix for the public IP resources"
  type        = string
}

// Define a variable for the Azure Region where the Public IP should be created
variable "location" {
  description = "The Azure Region in which the public IP should be created"
  type        = string
}

// Define a variable for the name of the resource group in which to create the Public IP
variable "resource_group_name" {
  description = "The name of the resource group in which to create the public IP"
  type        = string
}

// Define a variable for the allocation method for the Public IP with a default value of "Dynamic"
variable "allocation_method" {
  description = "The allocation method for the public IP"
  default     = "Dynamic"
  type        = string
}