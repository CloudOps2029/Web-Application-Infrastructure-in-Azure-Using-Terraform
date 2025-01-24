
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
 
  features {}
}

module "keyvault" {
  source = "./key-vault"
  
}

module "vm" {
  source = "./vm"
  
}

module "backend" {
  source = "./backend"
  
}
