variable "resource_group_location" {
  default     = "uksouth"
  description = "Location of the resource group."
}

variable "rg_name" {
  type        = string
  description = "Name of the Resource group in which to deploy service objects"
}

variable "deploy_location" {
  default     = "uksouth"
  description = "Location of the deployed resources."
}

variable "workspace" {
  type        = string
  description = "Name of the Azure Virtual Desktop workspace"
}

variable "hostpool" {
  type        = string
  description = "Name of the Azure Virtual Desktop host pool"
}

variable "prefix" {
  type        = string
  description = "Prefix of the name of the AVD machine(s)"
}

variable "load_balancer_type" {
  type        = string
  description = "Load balancing algorithm to be used ['BreadthFirst', 'DepthFirst']"
}

variable "avd_vnet_name" {
  type        = string
  description = "Name of avd vnet"
}

variable "avd_vnet_range" {
  type        = list(string)
  description = "Address range for deployment VNet"
}

variable "subnets" {
  type        = map(any)
  description = "Configuration parameters for Subnets in the AVD deployment"
}

variable "avdsh_count" {
  type        = number
  description = "The number of session hosts to deploy"
}

variable "vm_size" {
  type        = string
  description = "The size of the virtual machine to be deployed"
}
variable "local_admin_username" {
  type        = string
  description = "local admin username for virtual machines"
}
variable "local_admin_password" {
  type        = string
  description = "local admin password for virtual machines"
}
