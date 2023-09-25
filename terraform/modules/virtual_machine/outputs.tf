// Define an output to export the IDs of the created Virtual Machines
output "virtual_machine_ids" {
  value = azurerm_linux_virtual_machine.vm[*].id
}

// Define an output to export the names of the created Virtual Machines
output "virtual_machine_names" {
  value = azurerm_linux_virtual_machine.vm[*].name
}