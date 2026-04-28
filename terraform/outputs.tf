output "resource_group_id" {
  description = "ID of the looked-up resource group."
  value       = data.azurerm_resource_group.this.id
}

output "virtual_network_id" {
  description = "ID of the looked-up VNet."
  value       = data.azurerm_virtual_network.this.id
}
