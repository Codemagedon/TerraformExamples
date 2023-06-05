resource_group_location = "uksouth"
rg_name                 = "canary-avd"
deploy_location         = "ukwest"
workspace               = "prod-avd-workspace"
hostpool                = "prod-avd-hostpool"
prefix                  = "canary"
load_balancer_type      = "BreadthFirst"
avd_vnet_name           = "canary-uk-vnet-avd"
avd_vnet_range          = ["10.1.0.0/16"]
subnets = {
  "host_subnet" = {
    name             = "Hosts"
    address_prefixes = ["10.1.0.0/24"]
  }
  "staging_subnet" = {
    name             = "Staging"
    address_prefixes = ["10.1.1.0/24"]
  }
}
avdsh_count          = 2
vm_size              = "Standard_D2as_v5"
local_admin_username = "tempuser"
local_admin_password = "ChangeMe123!"
