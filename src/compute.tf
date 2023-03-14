resource "azurerm_machine_learning_compute_cluster" "main" {
  for_each                      = { for c in var.compute.cluster : c.name => c }
  name                          = each.value.name
  location                      = azurerm_resource_group.main.location
  machine_learning_workspace_id = azurerm_machine_learning_workspace.main.id
  vm_priority                   = "Dedicated"
  vm_size                       = each.value.size
  tags                          = var.md_metadata.default_tags

  scale_settings {
    min_node_count                       = each.value.min_nodes
    max_node_count                       = each.value.max_nodes
    scale_down_nodes_after_idle_duration = each.value.idle_duration
  }

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.main.id,
    ]
  }
}

resource "azurerm_machine_learning_compute_instance" "main" {
  for_each                      = { for i in var.compute.instance : i.name => i }
  name                          = each.value.name
  location                      = azurerm_resource_group.main.location
  machine_learning_workspace_id = azurerm_machine_learning_workspace.main.id
  virtual_machine_size          = each.value.size
  authorization_type            = "personal"
  tags                          = var.md_metadata.default_tags

  assign_to_user {
    tenant_id = var.azure_service_principal.data.tenant_id
    object_id = each.value.user # needs to be the object ID of a user that is allowed to access the compute instance. this can vary per compute instance
  }

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.main.id,
    ]
  }
}
