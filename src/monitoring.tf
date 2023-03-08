resource "azurerm_application_insights" "main" {
  name                = var.md_metadata.name_prefix
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  application_type    = "other"
  tags                = var.md_metadata.default_tags
}
