locals {

  vm_instances = {
    for idx, instance in azurerm_linux_virtual_machine.azure-beta :
    idx => {
      name      = instance.name
      public_ip = azurerm_public_ip.azure-beta[idx].ip_address
    }
  }

  maquinas_ini_content = <<-EOT
    [azure]
    ${join("\n", [for instance in values(local.vm_instances) : instance.name])}
  EOT

  ssh_key_path = var.ssh_priv_key_path

  vm_host_vars_content = {
    for idx, instance in local.vm_instances :
    instance.name => "ansible_host: ${azurerm_linux_virtual_machine.azure-beta[idx].public_ip_addresses[0]}\nansible_user: ${var.admin_username}\nansible_ssh_private_key_file: ${local.ssh_key_path}"
  }


  host_vars_commands = join("\n", [
    for host, content in local.vm_host_vars_content : "printf '%s' '${content}' > ../ansible/host_vars/${host}.yml"
  ])
}

resource "local_file" "maquinas_ini" {
  content  = local.maquinas_ini_content
  filename = "../ansible/maquinas.ini"

  provisioner "local-exec" {
    when    = destroy
    command = "rm -f ../ansible/maquinas.ini"
  }

  depends_on = [azurerm_linux_virtual_machine.azure-beta]
}

resource "null_resource" "host_vars" {
  triggers = {
    instance_ids = join(",", [for instance in values(local.vm_instances) : instance.name])
  }

  provisioner "local-exec" {
    command = <<-EOT
      mkdir -p ../ansible/host_vars
      ${local.host_vars_commands}
    EOT
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm -rf ../ansible/host_vars"
  }

  depends_on = [azurerm_linux_virtual_machine.azure-beta]
}
