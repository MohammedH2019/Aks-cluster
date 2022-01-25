locals {
  rg_name    = "eks_group"
  eks_name   = "non-prod-mo"
  node_name  = "dfnodem1"
  dns_prefix = "moakscluster2022"
  log_analytics_workspace_name = "MoLogAnalyticsWorkspaceName"
  agent_count = 1
  log_analytics_workspace_location = "West Europe"
}
