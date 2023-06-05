variable "rg_name" {
  type        = string
  default     = "rg-avd-resources"
  description = "Name of the Resource group in which to deploy service objects"
}

variable "deploy_location" {
  type        = string
  default     = "eastus"
  description = "The Azure Region in which all resources in this example should be created."
}

variable "avd_vnet_name" {
  type        = string
  default     = "vnet-avd"
  description = "Name of avd vnet"
}

variable "avd_vnet_range" {
  type        = list(string)
  default     = ["10.200.0.0/16"]
  description = "Address range for deployment VNet"
}

variable "subnets" {
  type = map(any)
  default = {
    "Subnet_1" = {
      name             = "Hosts"
      address_prefixes = ["10.2.0.0/24"]
    }
    "Subnet_2" = {
      name             = "Staging"
      address_prefixes = ["10.2.1.0/24"]
    }
  }
}
