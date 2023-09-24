variable "vm_count" {
  description = "The number of network interfaces to create"
  type        = number
}


variable "nic_name" {
  description = "The name of the network interface"
  type        = string
}

variable "name_ip_configuration" {
  description = "The name of the IP configuration"
  type        = string
}

variable "location" {
  description = "The Azure Region in which the network interface should be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the network interface"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to which the network interface should be associated"
  type        = string
}

variable "private_ip_address_allocation" {
  description = "Defines how a private IP address is allocated"
  type        = string
}

variable "public_ip_address_ids" {
  description = "The IDs of the public IP addresses to associate with the network interfaces"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the network interface resources"
  type        = map(string)
}


variable "public_ip_addresses" {
  description = "The public IP addresses associated with the network interfaces"
  type        = list(string)
  default     = []
}
