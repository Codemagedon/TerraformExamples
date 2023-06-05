# Resource group name is output when execution plan is applied.
resource "azurerm_resource_group" "avd_rg" {
  name     = var.rg_name
  location = var.resource_group_location
}

module "AVD" {
  source     = "./Modules/AVD"
  depends_on = [azurerm_resource_group.avd_rg]
  #parameters
  deploy_location    = var.deploy_location
  rg_name            = azurerm_resource_group.avd_rg.name
  workspace          = var.workspace
  hostpool           = var.hostpool
  rfc3339            = timeadd(timestamp(), "2h")
  prefix             = var.prefix
  load_balancer_type = var.load_balancer_type
}

module "network" {
  source     = "./Modules/network"
  depends_on = [module.AVD]
  #parameters
  rg_name         = azurerm_resource_group.avd_rg.name
  deploy_location = var.deploy_location
  avd_vnet_name   = var.avd_vnet_name
  avd_vnet_range  = var.avd_vnet_range
  subnets         = var.subnets
}

module "hosts" {
  source     = "./Modules/SessionHosts"
  depends_on = [module.network]
  #parameters
  avdsh_count          = var.avdsh_count
  prefix               = var.prefix
  rg_name              = azurerm_resource_group.avd_rg.name
  deploy_location      = var.deploy_location
  vm_size              = var.vm_size
  local_admin_username = var.local_admin_username
  local_admin_password = var.local_admin_password
  host_pool_name       = module.AVD.azure_virtual_desktop_host_pool
  session_host_token   = module.AVD.AVD_session_token
  subnetId             = module.network.subnet_ids["host_subnet"]
}
