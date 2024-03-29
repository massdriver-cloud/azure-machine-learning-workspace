locals {
  max_length        = 24
  alphanumeric_name = substr(replace(var.md_metadata.name_prefix, "/[^a-z0-9]/", ""), 0, local.max_length)
}

resource "azurerm_resource_group" "main" {
  name     = var.md_metadata.name_prefix
  location = var.workspace.location
  tags     = var.md_metadata.default_tags
}

resource "azurerm_machine_learning_workspace" "main" {
  name                          = var.md_metadata.name_prefix
  location                      = azurerm_resource_group.main.location
  resource_group_name           = azurerm_resource_group.main.name
  application_insights_id       = azurerm_application_insights.main.id
  key_vault_id                  = azurerm_key_vault.main.id
  storage_account_id            = azurerm_storage_account.main.id
  high_business_impact          = var.workspace.high_business_impact
  public_network_access_enabled = true
  tags                          = var.md_metadata.default_tags

  primary_user_assigned_identity = azurerm_user_assigned_identity.main.id
  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.main.id,
    ]
  }

  encryption {
    user_assigned_identity_id = azurerm_user_assigned_identity.main.id
    key_vault_id              = azurerm_key_vault.main.id
    key_id                    = azurerm_key_vault_key.main.id
  }

  depends_on = [
    azurerm_role_assignment.storage_account_data,
    azurerm_role_assignment.storage_account,
    azurerm_role_assignment.app_insights,
    azurerm_role_assignment.container,
    azurerm_role_assignment.key_vault,
  ]
}
