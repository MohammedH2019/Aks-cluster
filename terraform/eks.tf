resource "azurerm_kubernetes_cluster" "mo_eks" {
  name                = local.eks_name
  location            = "West Europe"
  resource_group_name = local.rg_name
  dns_prefix          = local.dns_prefix

  default_node_pool {
    name       = local.node_name
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "kubenet"
  }
}

