data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_key_vault" "keyvault" {
  name                        = var.key_vault_name
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  soft_delete_retention_days  = 90
  purge_protection_enabled    = true

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id


    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Purge",
    ]
  }

  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_secret" "keyvault_password" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "example_password" {
  name         = azurerm_key_vault_secret.keyvault_password.name
  key_vault_id = azurerm_key_vault.keyvault.id
}

output "retrieved_secret" {
  value = data.azurerm_key_vault_secret.example_password.value
}
