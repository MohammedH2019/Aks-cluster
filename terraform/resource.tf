resource "azurerm_resource_group" "eks_resource_group" {
  name     = local.rg_name
  location = "West Europe"
}