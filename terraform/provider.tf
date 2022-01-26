terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.46.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "~> 0.5"
    }
  }
}

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "tf-statefile"
    storage_account_name = "terraformstoarge2021"
    container_name       = "tfstatefile2021"
    key                  = "eks-nonprod.tfstate"
  }
}

data "sops_file" "secrets" {
  source_file = "account_secrets.yaml"
}
