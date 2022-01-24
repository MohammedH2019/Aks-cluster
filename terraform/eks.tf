resource "azurerm_kubernetes_cluster" "mo_eks" {
  name                = local.eks_name
  location            = "West Europe"
  resource_group_name = local.rg_name
  dns_prefix          = local.dns_prefix

    default_node_pool {
        name            = "agentpool"
        node_count      = local.agent_count
        vm_size         = "Standard_D2_v2"
    }

    service_principal {
        client_id     = "711ebf59-54c1-4d6d-aedf-dfe186abc1f5"
        client_secret = "sXHgDVfR2mrGV3XTiM.sg4EM-KbGHjH-N3"
    }

    addon_profile {
        oms_agent {
        enabled                    = true
        log_analytics_workspace_id = azurerm_log_analytics_workspace.mo_test.id
        }
    }

    network_profile {
        load_balancer_sku = "Standard"
        network_plugin = "kubenet"
    }

    tags = {
        Environment = "Development"
    }
}

