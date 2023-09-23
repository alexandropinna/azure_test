resource "azurerm_resource_group" "azure-beta" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_virtual_network" "azure-beta" {
  name                = var.virtual_network_name
  address_space       = var.address_space
  location            = azurerm_resource_group.azure-beta.location
  resource_group_name = azurerm_resource_group.azure-beta.name

  tags = var.tags
}

resource "azurerm_subnet" "azure-beta" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.azure-beta.name
  virtual_network_name = azurerm_virtual_network.azure-beta.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_network_security_group" "azure-beta" {
  name                = var.nsg_name
  location            = azurerm_resource_group.azure-beta.location
  resource_group_name = azurerm_resource_group.azure-beta.name

  tags = var.tags
}

resource "azurerm_network_interface" "azure-beta" {
  count               = var.vm_count
  name                = "${var.nic_name}-${count.index}"
  location            = azurerm_resource_group.azure-beta.location
  resource_group_name = azurerm_resource_group.azure-beta.name

  ip_configuration {
    name                          = "${var.name_ip_configuration}-${count.index}"
    subnet_id                     = azurerm_subnet.azure-beta.id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.azure-beta[count.index].id
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "azure-beta" {
  count               = var.vm_count
  name                = "${var.vm_name}-${count.index}"
  resource_group_name = azurerm_resource_group.azure-beta.name
  location            = azurerm_resource_group.azure-beta.location
  size                = var.vm_size
  admin_username      = var.admin_username

  computer_name = "${var.computer_name}-${count.index}"

  network_interface_ids = [
    azurerm_network_interface.azure-beta[count.index].id,
  ]

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.source_image_reference_publisher
    offer     = var.source_image_reference_offer
    sku       = var.source_image_reference_sku
    version   = var.source_image_reference_version
  }


  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  disable_password_authentication = true

  tags = var.tags
}

resource "azurerm_public_ip" "azure-beta" {
  count               = var.vm_count
  name                = "${var.vm_name}-public-ip-${count.index}"
  location            = azurerm_resource_group.azure-beta.location
  resource_group_name = azurerm_resource_group.azure-beta.name
  allocation_method   = "Dynamic"

  tags = var.tags
}
