resource "azurerm_container_registry" "main" {
  # Azure Container Registry must be Premium version.
  # https://learn.microsoft.com/en-us/azure/machine-learning/how-to-secure-workspace-vnet?tabs=required%2Cpe%2Ccli#azure-container-registry
  count               = var.registry.create_registry ? 1 : 0
  name                = local.alphanumeric_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "Premium"
  tags                = var.md_metadata.default_tags
}
