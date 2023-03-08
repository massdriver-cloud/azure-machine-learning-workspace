data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "main" {
  name                            = var.md_metadata.name_prefix
  location                        = azurerm_resource_group.main.location
  resource_group_name             = azurerm_resource_group.main.name
  tenant_id                       = var.azure_service_principal.data.tenant_id
  sku_name                        = "standard"
  purge_protection_enabled        = true
  enabled_for_template_deployment = true
  tags                            = var.md_metadata.default_tags

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "List",
      "Get",
      "Create",
      "Update",
      "Recover",
      "Delete",
      "Purge",
      "Rotate",
      "GetRotationPolicy",
      "SetRotationPolicy",
    ]
  }

  access_policy {
    tenant_id = azurerm_user_assigned_identity.main.tenant_id
    object_id = azurerm_user_assigned_identity.main.principal_id

    key_permissions = [
      "List",
      "Get",
      "WrapKey",
      "UnwrapKey",
      "Create",
      "Update",
      "Recover",
      "Delete",
      "Rotate",
      "GetRotationPolicy",
      "SetRotationPolicy",
    ]

    secret_permissions = [
      "List",
      "Get",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
    ]
  }
}

# resource "azurerm_key_vault_access_policy" "main-identity" {
#   key_vault_id = azurerm_key_vault.main.id
#   tenant_id    = var.azure_service_principal.data.tenant_id
#   object_id    = azurerm_user_assigned_identity.main.principal_id

#   key_permissions = [
#     "WrapKey",
#     "UnwrapKey",
#     "Get",
#     "Recover",
#   ]

#   secret_permissions = [
#     "Get",
#     "List",
#     "Set",
#     "Delete",
#     "Recover",
#     "Backup",
#     "Restore",
#   ]
# }

resource "azurerm_key_vault_key" "main" {
  name            = "${var.md_metadata.name_prefix}key"
  key_vault_id    = azurerm_key_vault.main.id
  expiration_date = timeadd(timestamp(), "4380h")
  key_type        = "RSA"
  key_size        = 2048
  tags            = var.md_metadata.default_tags

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}
