resource "azurerm_virtual_network" "vnet" {
  name                = var.avd_vnet_name
  address_space       = var.avd_vnet_range
  location            = var.deploy_location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "subnet" {
  for_each             = var.subnets
  name                 = each.value["name"]
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value["address_prefixes"]
  depends_on           = [azurerm_virtual_network.vnet]
}

