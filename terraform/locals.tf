// Define local values
locals {
  // Create a map of VM instances with their name and public IP, indexed by the instance index
  vm_instances = {
    for idx, id in module.virtual_machine.virtual_machine_ids :
    idx => {
      name      = module.virtual_machine.virtual_machine_names[idx]
      public_ip = module.network_interface.network_interface_public_ips[idx]
    }
  }
  
  // Create the content for the maquinas.ini file, listing all VM names under the [azure] section
  maquinas_ini_content = <<-EOT
    [azure]
    ${join("\n", [for instance in values(local.vm_instances) : instance.name])}
  EOT

  // Define the path to the SSH private key
  ssh_key_path = var.ssh_priv_key_path

  // Create host variable content for each VM instance for Ansible
  vm_host_vars_content = {
    for idx, instance in local.vm_instances :
    instance.name => "ansible_host: ${instance.public_ip}\nansible_user: ${var.admin_username}\nansible_ssh_private_key_file: ${local.ssh_key_path}"
  }

  // Generate commands to create Ansible host variable files for each VM instance
  host_vars_commands = join("\n", [
    for host, content in local.vm_host_vars_content : "printf '%s' '${content}' > ../ansible/host_vars/${host}.yml"
  ])
}

// Create a local file resource for maquinas.ini
resource "local_file" "maquinas_ini" {
  content  = local.maquinas_ini_content
  filename = "../ansible/maquinas.ini"

  // Define a provisioner to remove the maquinas.ini file upon resource destruction
  provisioner "local-exec" {
    when    = destroy
    command = "rm -f ../ansible/maquinas.ini"
  }

  // Define a dependency on the virtual_machine module
  depends_on = [module.virtual_machine]
}

// Create a null resource to manage Ansible host variable files
resource "null_resource" "host_vars" {
  // Use the names of VM instances as triggers to detect changes
  triggers = {
    instance_ids = join(",", [for instance in values(local.vm_instances) : instance.name])
  }

  // Define a provisioner to create the Ansible host variable files
  provisioner "local-exec" {
    command = <<-EOT
      mkdir -p ../ansible/host_vars
      ${local.host_vars_commands}
    EOT
  }

  // Define a provisioner to remove the Ansible host variable files upon resource destruction
  provisioner "local-exec" {
    when    = destroy
    command = "rm -rf ../ansible/host_vars"
  }

  // Define a dependency on the virtual_machine module
  depends_on = [module.virtual_machine]
}
