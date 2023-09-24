output "virtual_machine_ids" {
  value = azurerm_linux_virtual_machine.vm[*].id
}

output "virtual_machine_names" {
  value = azurerm_linux_virtual_machine.vm[*].name
}
