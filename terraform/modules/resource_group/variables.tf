// Define a variable for the name of the Resource Group
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

// Define a variable for the Azure Region where resources should be created
variable "location" {
  description = "The Azure Region in which resources should be created"
  type        = string
}

// Define a variable for the tags to be assigned to the resources
variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
}