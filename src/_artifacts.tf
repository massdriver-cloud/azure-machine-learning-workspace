resource "massdriver_artifact" "azure_machine_learning_workspace" {
  field                = "azure_machine_learning_workspace"
  provider_resource_id = azurerm_machine_learning_workspace.main.id
  name                 = "Machine Learning Workspace"
  artifact = jsonencode(
    {
      data = {
        infrastructure = {
          ari           = azurerm_machine_learning_workspace.main.id
          discovery_url = azurerm_machine_learning_workspace.main.discovery_url
        }
        security = {
          iam = {
            "ml_read_write" = {
              role  = "AzureML Data Scientist"
              scope = azurerm_machine_learning_workspace.main.id
            }
          }
        }
      }
      specs = {
        azure = {
          region = azurerm_resource_group.main.location
        }
      }
    }
  )
}
