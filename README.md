# Azure Infrastructure as Code (IaC) Project

This project uses Terraform to provision and manage Azure resources, including Virtual Networks, Subnets, Virtual Machines, Network Interfaces, Public IPs, and Network Security Groups.

## Project Structure

- **Main Configuration Files**: The root of the project contains the main Terraform configuration files that define and configure the Azure resources.

- **Modules**: The project is organized into modules, each responsible for creating a specific Azure resource. The modules are located in the `./modules/` directory.

- **Variables**: Each Terraform configuration file and module has associated variable declaration files. These files define the input variables used to customize the resource configurations.

- **Outputs**: The project defines outputs to display important information about the created resources, such as IDs, names, and IP addresses.

## Prerequisites

- **Terraform**: Ensure that Terraform is installed on your machine. Follow the [official installation guide](https://learn.hashicorp.com/tutorials/terraform/install-cli) for instructions.

- **Azure CLI**: Ensure that the Azure CLI is installed and configured with the necessary credentials. Follow the [official installation guide](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) for instructions.

## Usage

1. **Initialize Terraform**:
   ```sh
   terraform init
   ```
   This command initializes Terraform and downloads the required providers.

2. **Plan the Deployment**:
   ```sh
   terraform plan
   ```
   This command shows a plan of the resources that Terraform will create, modify, or destroy.

3. **Apply the Changes**:
   ```sh
   terraform apply
   ```
   This command applies the changes and creates the Azure resources. You will be prompted to confirm the actions before they are executed.

4. **Destroy the Resources** (Optional):
   ```sh
   terraform destroy
   ```
   This command destroys the created resources. Use it with caution, as it will remove all the resources created by Terraform in the configured Azure subscription.

## Customization

You can customize the resource configurations by modifying the variable declaration files. Refer to the comments in the variable files for descriptions of each variable and its purpose.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
```