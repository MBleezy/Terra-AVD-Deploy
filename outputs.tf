output "azure_virtual_desktop_host_pool" {
  description = "Name of the Azure Virtual Desktop host pool"
  value       = azurerm_virtual_desktop_host_pool.AVD_hostpool.name
}

output "azurerm_virtual_desktop_application_group" {
  description = "Name of the Azure Virtual Desktop DAG"
  value       = azurerm_virtual_desktop_application_group.dag.name
}

output "azurerm_virtual_desktop_workspace" {
  description = "Name of the Azure Virtual Desktop workspace"
  value       = azurerm_virtual_desktop_workspace.AVD_workspace.name
}

output "location" {
  description = "The Azure region"
  value       = data.azurerm_resource_group.sandbox-rg.location
}

#output "AVD_user_groupname" {
#  description = "Azure Active Directory Group for AVD users"
#  value       = azuread_group.aad_group.display_name
#}