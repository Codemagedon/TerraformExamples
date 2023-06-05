output "azure_virtual_desktop_host_pool" {
  description = "Name of the Azure Virtual Desktop host pool"
  value       = azurerm_virtual_desktop_host_pool.hostpool.name
}

output "azurerm_virtual_desktop_application_group" {
  description = "Name of the Azure Virtual Desktop DAG"
  value       = azurerm_virtual_desktop_application_group.dag.name
}

output "azurerm_virtual_desktop_workspace" {
  description = "Name of the Azure Virtual Desktop workspace"
  value       = azurerm_virtual_desktop_workspace.workspace.name
}

output "AVD_session_token" {
  description = "The session token for adding new virtual machines to host pool"
  value       = azurerm_virtual_desktop_host_pool_registration_info.registrationinfo.token
}
