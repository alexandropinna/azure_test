resource "azurerm_public_ip" "public_ip" {
  count               = var.number_of_ips
  name                = "${var.name_prefix}-public-ip-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method

  tags = var.tags
}
