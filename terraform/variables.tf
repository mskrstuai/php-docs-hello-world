variable "subscription_id" {
  type        = string
  description = "Azure subscription ID."
  sensitive   = true
}

variable "tenant_id" {
  type        = string
  description = "Azure AD tenant ID."
  sensitive   = true
}

variable "client_id" {
  type        = string
  description = "Client ID for OIDC (e.g. user-assigned managed identity) as in ARM_CLIENT_ID."
  sensitive   = true
}

variable "resource_group_name" {
  type        = string
  description = "Existing resource group to read (plan exercises ARM + OIDC)."
}

variable "location" {
  type        = string
  description = "Azure region (passed through for future resources; data sources use live RG/VNet)."
}

variable "vnet_name" {
  type        = string
  description = "Existing VNet name under the resource group."
}
