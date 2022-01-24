resource "random_id" "log_analytics_workspace_name_suffix" {
    byte_length = 8
}

resource "azurerm_log_analytics_workspace" "mo_test" {
    # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
    name                = "${local.log_analytics_workspace_name}-${random_id.log_analytics_workspace_name_suffix.dec}"
    location            = local.log_analytics_workspace_location
    resource_group_name = azurerm_resource_group.eks_resource_group.name
    sku                 = var.log_analytics_workspace_sku
}

resource "azurerm_log_analytics_solution" "mo_test_solution" {
    solution_name         = "ContainerInsights"
    location              = azurerm_log_analytics_workspace.mo_test.location
    resource_group_name   = azurerm_resource_group.eks_resource_group.name
    workspace_resource_id = azurerm_log_analytics_workspace.mo_test.id
    workspace_name        = azurerm_log_analytics_workspace.mo_test.name

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}
