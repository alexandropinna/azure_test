output "public_ip_ids" {
  value = azurerm_public_ip.public_ip[*].id
}

output "public_ip_addresses" {
  description = "The IP addresses of the Public IPs"
  value       = azurerm_public_ip.public_ip[*].ip_address
}

