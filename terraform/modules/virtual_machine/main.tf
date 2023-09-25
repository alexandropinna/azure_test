// Define a resource block for creating multiple Azure Linux Virtual Machines
resource "azurerm_linux_virtual_machine" "vm" {
  // Use count to create multiple instances based on the value of vm_count variable
  count               = var.vm_count
  // Construct the name of the virtual machine using vm_name variable and the instance index
  name                = "${var.vm_name}-${count.index}"
  // Set the resource group name for the virtual machine from the resource_group_name variable
  resource_group_name = var.resource_group_name
  // Set the location of the virtual machine from the location variable
  location            = var.location
  // Set the size of the virtual machine from the vm_size variable
  size                = var.vm_size
  // Set the admin username for the virtual machine from the admin_username variable
  admin_username      = var.admin_username
  // Construct the computer name for the virtual machine using computer_name variable and the instance index
  computer_name       = "${var.computer_name}-${count.index}"
  // Associate the network interface with the virtual machine using network_interface_ids variable
  network_interface_ids = [var.network_interface_ids[count.index]]

  // Configure the OS disk for the virtual machine
  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  // Configure the source image reference for the virtual machine
  source_image_reference {
    publisher = var.source_image_reference_publisher
    offer     = var.source_image_reference_offer
    sku       = var.source_image_reference_sku
    version   = var.source_image_reference_version
  }

  // Configure the admin SSH key for the virtual machine
  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  // Disable password authentication for the virtual machine
  disable_password_authentication = true

  // Assign tags to the virtual machine from the tags variable
  tags = var.tags
}