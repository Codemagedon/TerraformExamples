output "subnet_ids" {
  value = {
    for id in keys(var.subnets) : id => azurerm_subnet.subnet[id].id
  }
}
