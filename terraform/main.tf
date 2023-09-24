module "resource_group" {
  source = "./modules/resource_group"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "virtual_network" {
  source = "./modules/virtual_network"

  virtual_network_name = var.virtual_network_name
  address_space        = var.address_space
  location             = module.resource_group.location
  resource_group_name  = module.resource_group.resource_group_name
  tags                 = var.tags
}

module "subnet" {
  source = "./modules/subnet"

  subnet_name          = var.subnet_name
  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = module.virtual_network.virtual_network_name
  address_prefixes     = var.address_prefixes
}

module "network_security_group" {
  source = "./modules/network_security_group"

  nsg_name            = var.nsg_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  tags                = var.tags
}

module "network_interface" {
  source = "./modules/network_interface"

  vm_count                      = var.vm_count
  nic_name                      = var.nic_name
  name_ip_configuration         = var.name_ip_configuration
  location                      = module.resource_group.location
  resource_group_name           = module.resource_group.resource_group_name
  subnet_id                     = module.subnet.subnet_id
  private_ip_address_allocation = var.private_ip_address_allocation
  public_ip_address_ids         = module.public_ip.public_ip_ids
  public_ip_addresses           = module.public_ip.public_ip_addresses
  tags                          = var.tags
}

module "virtual_machine" {
  source = "./modules/virtual_machine"

  vm_count            = var.vm_count
  vm_name             = var.vm_name
  computer_name       = var.computer_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  network_interface_ids            = module.network_interface.network_interface_ids
  vm_size                          = var.vm_size
  admin_username                   = var.admin_username
  os_disk_caching                  = var.os_disk_caching
  os_disk_storage_account_type     = var.os_disk_storage_account_type
  source_image_reference_publisher = var.source_image_reference_publisher
  source_image_reference_offer     = var.source_image_reference_offer
  source_image_reference_sku       = var.source_image_reference_sku
  source_image_reference_version   = var.source_image_reference_version
  ssh_public_key_path              = var.ssh_public_key_path
  tags                             = var.tags
}

module "public_ip" {
  source = "./modules/public_ip"

  number_of_ips       = var.vm_count
  name_prefix         = var.vm_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  tags                = var.tags
}

