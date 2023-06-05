resource_group_location = "uksouth"
rg_name                 = "prod-avd"
deploy_location         = "uksouth"
workspace               = "prod-avd-workspace"
hostpool                = "prod-avd-hostpool"
prefix                  = "avd"
load_balancer_type      = "BreadthFirst"
avd_vnet_name           = "prod-uks-vnet-avd"
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
avdsh_count          = 4
vm_size              = "Standard_D4as_v5"
local_admin_username = "tempuser"
local_admin_password = "ChangeMe123!"
