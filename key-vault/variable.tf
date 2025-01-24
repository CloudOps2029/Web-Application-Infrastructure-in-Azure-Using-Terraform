# Variable for the resource group name
variable "resource_group_name" {
  description = "The name of the resource group where resources will be created"
  type        = string
  default     = "key-vault-resource-group" # Replace with your resource group name
}

# Variable for the Azure location
variable "location" {
  description = "The Azure location where resources will be created"
  type        = string
  default     = "canada central" # Replace with your preferred Azure region
}

# Variable for the Key Vault name
variable "key_vault_name" {
  description = "The name of the Azure Key Vault"
  type        = string
  default     = "key-vault-3131313123213" # Replace with your desired Key Vault name
}

# Variable for the Key Vault secret name
variable "secret_name" {
  description = "The name of the secret to be stored in the Key Vault"
  type        = string
  default     = "keyvault-password" # Replace with your desired secret name
}

# Variable for the Key Vault secret value
variable "secret_value" {
  description = "The value of the secret to be stored in the Key Vault"
  type        = string
  default     = "test123!" # Replace with your default secret value or leave blank for secure input
}

# Variable for environment tags
variable "environment" {
  description = "The environment tag for the resources (e.g., staging, production)"
  type        = string
  default     = "staging"
}
