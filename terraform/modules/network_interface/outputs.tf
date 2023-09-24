output "network_interface_ids" {
  value = azurerm_network_interface.nic[*].id
}

output "network_interface_names" {
  value = azurerm_network_interface.nic[*].name
}

output "network_interface_public_ips" {
  description = "The public IP addresses associated with the network interfaces"
  value       = var.public_ip_addresses
}
