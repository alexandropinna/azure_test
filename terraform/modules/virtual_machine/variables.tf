variable "vm_count" {
  description = "The number of virtual machines to create"
  type        = number
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "computer_name" {
  description = "The computer name for the virtual machine"
  type        = string
}

variable "location" {
  description = "The Azure Region in which the virtual machine should be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual machine"
  type        = string
}

variable "network_interface_ids" {
  description = "The IDs of the network interfaces to associate with the virtual machines"
  type        = list(string)
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The username of the admin user for the virtual machine"
  type        = string
}

variable "os_disk_caching" {
  description = "The caching type for the OS disk"
  type        = string
}

variable "os_disk_storage_account_type" {
  description = "The storage account type for the OS disk"
  type        = string
}

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

variable "ssh_public_key_path" {
  description = "The file path to the SSH public key for the virtual machine"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the virtual machine resources"
  type        = map(string)
}
