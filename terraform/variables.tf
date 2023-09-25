# Define a variable for tags to be assigned to resources, with its type specified as a map of strings
variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
}

# Azure Resource Group variables
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "location" {
  description = "The Azure Region in which resources should be created"
  type        = string
}

# Azure Virtual Network variables
variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}
variable "address_space" {
  description = "The address space that is used by the virtual network"
  type        = list(string)
}

# Azure Subnet variables
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}
variable "address_prefixes" {
  description = "The address prefixes that are used by the subnet"
  type        = list(string)
}

# Azure Network Security Group variable
variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}

# Azure Network Interface variables
variable "nic_name" {
  description = "The name of the network interface"
  type        = string
}
variable "name_ip_configuration" {
  description = "The name of the IP configuration"
  type        = string
}
variable "private_ip_address_allocation" {
  description = "Defines how a private IP address is allocated"
  type        = string
}

# Azure Linux Virtual Machine variables
variable "vm_count" {
  description = "The number of virtual machines to create"
  type        = number
}
variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}
variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}
variable "admin_username" {
  description = "The username of the admin user for the virtual machine"
  type        = string
}
variable "computer_name" {
  description = "The computer name for the virtual machine"
  type        = string
}

# VM OS disk variables
variable "os_disk_caching" {
  description = "The caching type for the OS disk"
  type        = string
}
variable "os_disk_storage_account_type" {
  description = "The storage account type for the OS disk"
  type        = string
}

# VM source image reference variables
variable "source_image_reference_publisher" {
  description = "The publisher of the source image"
  type        = string
}
variable "source_image_reference_offer" {
  description = "The offer of the source image"
  type        = string
}
variable "source_image_reference_sku" {
  description = "The SKU of the source image"
  type        = string
}
variable "source_image_reference_version" {
  description = "The version of the source image"
  type        = string
}

# VM admin SSH key variables
variable "ssh_public_key_path" {
  description = "The file path to the SSH public key for the virtual machine"
  type        = string
}
variable "ssh_priv_key_path" {
  description = "The file path to the SSH private key for the virtual machine"
  type        = string
}
