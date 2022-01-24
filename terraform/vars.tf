variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}
variable log_analytics_workspace_sku {
    default = "PerGB2018"
}
variable "client_id" {}
variable "client_secret" {}
