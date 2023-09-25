// Define the Terraform configuration block
// This block specifies which Terraform and provider versions are to be used
terraform {
  // Define the required providers and their versions
  // In this case, the azurerm provider is required
  required_providers {
    azurerm = {
      // Specify the source and version of the azurerm provider
      source  = "hashicorp/azurerm"
      version = "3.73.0"
    }
  }
}

// Configure the Azure Resource Manager (azurerm) provider
// This provider allows Terraform to create, manage, and manipulate resources in Microsoft Azure
provider "azurerm" {
  // The features block is used to define feature flags
  // An empty features block is currently required to use the azurerm provider
  features {}
}
