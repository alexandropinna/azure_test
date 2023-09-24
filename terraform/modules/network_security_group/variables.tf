variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}

variable "location" {
  description = "The Azure Region in which the network security group should be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the network security group"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the network security group resources"
  type        = map(string)
}
