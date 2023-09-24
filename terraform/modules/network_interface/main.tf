resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.nic_name}-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.name_ip_configuration}-${count.index}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_address_ids[count.index]
  }

  tags = var.tags
}
