resource "azurerm_key_vault" "example" {
  name = "mo-key-vault-dev"
  location = azurerm_resource_group.eks_resource_group.location
  resource_group_name = azurerm_resource_group.eks_resource_group.name
  enabled_for_disk_encryption = true
  soft_delete_retention_days = 7
  purge_protection_enabled = false
  sku_name = "standard"
  tenant_id = data.azurerm_client_config.current.tenant_id
}

data "azurerm_client_config" "current" {}
