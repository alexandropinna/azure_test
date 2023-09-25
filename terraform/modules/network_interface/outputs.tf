// Define an output to export the IDs of the created network interfaces
output "network_interface_ids" {
  value = azurerm_network_interface.nic[*].id
}

// Define an output to export the names of the created network interfaces
output "network_interface_names" {
  value = azurerm_network_interface.nic[*].name
}

// Define an output to export the public IP addresses associated with the network interfaces
output "network_interface_public_ips" {
  description = "The public IP addresses associated with the network interfaces"
  value       = var.public_ip_addresses
}
