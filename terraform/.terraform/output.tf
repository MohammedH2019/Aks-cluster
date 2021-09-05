output "kube_config" {
  value = azurerm_kubernetes_cluster.mo_eks.kube_config_raw
  sensitive = true
}