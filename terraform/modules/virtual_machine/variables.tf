// Declare a variable for specifying the number of virtual machines to be created.
// This allows for creating multiple VM instances with similar configurations in a single run.
variable "vm_count" {
  description = "The number of virtual machines to create"
  type        = number
}

// Declare a variable for specifying the base name of the virtual machine.
// The actual name of each VM instance may have additional identifiers appended to ensure uniqueness.
variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

// Declare a variable for specifying the computer name within the virtual machine's OS.
// This name is used to identify the machine within its network.
variable "computer_name" {
  description = "The computer name for the virtual machine"
  type        = string
}

// Declare a variable for specifying the Azure Region where the virtual machine will be created.
// The Azure Region represents the geographical location of the Azure datacenter hosting the VM.
variable "location" {
  description = "The Azure Region in which the virtual machine should be created"
  type        = string
}

// Declare a variable to specify the name of the resource group in which to create the virtual machine
variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual machine"
  type        = string
}

// Declare a variable to specify the IDs of the network interfaces to be associated with the virtual machines
variable "network_interface_ids" {
  description = "The IDs of the network interfaces to associate with the virtual machines"
  type        = list(string)
}

// Declare a variable to specify the size of the virtual machine
variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

// Declare a variable to specify the username of the admin user for the virtual machine
variable "admin_username" {
  description = "The username of the admin user for the virtual machine"
  type        = string
}

// Declare a variable to specify the caching type for the Operating System disk.
// This value affects the performance and cost of the VM. 
variable "os_disk_caching" {
  description = "The caching type for the OS disk"
  type        = string
}

// Declare a variable to specify the storage account type for the Operating System disk.
// This value affects the durability, availability, and cost of the disk storage.
variable "os_disk_storage_account_type" {
  description = "The storage account type for the OS disk"
  type        = string
}

// Declare a variable to specify the publisher of the source image for the VM.
// This is typically the organization that created the image.
variable "source_image_reference_publisher" {
  description = "The publisher of the source image"
  type        = string
}

// Declare a variable to specify the offer of the source image for the VM.
// The offer represents the specific software or OS configuration of the image.
variable "source_image_reference_offer" {
  description = "The offer of the source image"
  type        = string
}

// Declare a variable to specify the Stock Keeping Unit (SKU) of the source image for the VM.
// The SKU represents a specific version or variant of the image.
variable "source_image_reference_sku" {
  description = "The SKU of the source image"
  type        = string
}

// Declare a variable to specify the version of the source image for the VM.
// This can be a specific version number or 'latest' for the most recent version.
variable "source_image_reference_version" {
  description = "The version of the source image"
  type        = string
}

// Declare a variable for specifying the SSH public key path for the virtual machine.
// This path points to the SSH public key used for authenticating with the VM.
variable "ssh_public_key_path" {
  description = "The file path to the SSH public key for the virtual machine"
  type        = string
}

// Declare a variable to specify a map of tags to be assigned to the virtual machine resources.
// Tags are key-value pairs that can help in categorizing and organizing Azure resources.
variable "tags" {
  description = "A map of tags to assign to the virtual machine resources"
  type        = map(string)
}
