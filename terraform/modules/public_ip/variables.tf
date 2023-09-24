variable "number_of_ips" {
  description = "The number of public IPs to create"
  type        = number
}

variable "name_prefix" {
  description = "The name prefix for the public IP resources"
  type        = string
}

variable "location" {
  description = "The Azure Region in which the public IP should be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the public IP"
  type        = string
}

variable "allocation_method" {
  description = "The allocation method for the public IP"
  default     = "Dynamic"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the public IP resources"
  type        = map(string)
}
