resource "azurerm_container_registry" "acr" {
  name                = "mocontainers2022"
  resource_group_name = azurerm_resource_group.eks_resource_group.name
  location            = azurerm_resource_group.eks_resource_group.location
  sku                 = "Basic"
  admin_enabled       = false
}
