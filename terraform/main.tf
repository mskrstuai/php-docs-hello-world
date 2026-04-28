terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.114"
    }
  }
}

# -----------------------------------------------------------------------------
# Provider: GitHub Actions sets ARM_USE_OIDC=true and OIDC token; Terraform
# requests an access token. AADSTS501661 appears when federated credential /
# issuer / subject does not match GitHub's OIDC token (External OIDC failed).
# -----------------------------------------------------------------------------
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id

  use_oidc = true
}

# Read existing RG + VNet so plan hits Azure Resource Manager (same auth path
# as the error: building account → access token → claims).

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.this.name
}
